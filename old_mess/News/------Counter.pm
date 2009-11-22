package News::Counter;
use 5.008;
use strict;
use warnings;

use TectoMT::Document;
use TectoMT::Bundle;
use News::Other;




use Encode;

my %entities;
my %surnames;
my %names;

my %themes;
my @lastwords;

my %forms;
my @lastforms;

my $lostforms="";

use base 'Exporter';
our @EXPORT = qw( countTMT);



sub rememberForms {
        #will remember all original forms, based on the global variables
        #see addTo comments
    my @l_lastforms = @lastforms;
    my @l_lastwords = @lastwords;
    while (@l_lastwords) {
        my $joined = join(" ", @l_lastwords);
        $forms{$joined} = join("_", @l_lastforms) unless defined $forms{$joined};
        shift @l_lastwords;
        shift @l_lastforms;
    }
}

sub addTo{
	my $hashref = shift;   
    my @normalwords = @_;

    while (@normalwords) {
        #why this?

		#for every word, I am sending the "last X words before" in @normalwords.
		#So, if I am sending "B C D E F G H", I want to count "C D E F G H" too, up to "H".
		#I am not taking from the other side, like "B C D E F G", because that group will be added
		#when looking at G.
		
		#It works with names, too, probably not too well, but who cares
		my $joined = join (" ", @normalwords);
		
		my $length;
		if ($forms{$joined}){
			$length=splitSize($forms{$joined});
			$length = 1 unless $length;
		} else {
			$length = @normalwords;
		}
                
        ($hashref->{$joined})+=2-(1/$length);
        
        shift @normalwords;
    }
  
}

sub countNamed {
    my $node = shift;
    
    if ($node->get_deref_attr('m.rf')) {
        if (my $type=($node->get_attr('ne_type'))) { 
            my $name = $node->get_attr('normalized_name');
            
			if (length $name > 3) {
           	 #addTo(0, \%entities, $name) if ($type =~ /^(g|i|m|q)/);
				addTo(\%entities, $name) if ($type =~ /^(g|m|q)/);
	                #not a person's name
                
	            addTo(\%names, $name) if ($type =~ /^P/);
	                #this is not super-clean, but basically, it adds only two names in a row, like "Miloš Zeman"
            
	            addTo(\%surnames, $name) if ($type =~ /^ps$/);
	                #only surnames! 
			}
        }
    }  
    if (my @children = ($node->get_children)) {
        map (countNamed($_), @children);
    }
}

sub countWords {
	#the "main" sub for counting THEMES.
	my $node = shift;
	
	if (my $lemma = ($node->get_attr('lemma'))) {
		
		#addTo(\%words, $lemma); 
		
		if (my $lemma_b = (makeNormalWord($lemma))) { 
			
			
			my $form = ($node->get_attr('form'));
			
			#last WORDS = last LEMMAS, not last FORMS.
			
			push (@lastwords, $lemma_b) ;   
			
			push (@lastforms, $lostforms.$form) ;    
			$lostforms = "";
			
			if (@lastwords > 10) {
				shift @lastwords;
				shift @lastforms; 
			}
			rememberForms;
			addTo(\%themes, @lastwords);
		} else {
			if (isWord($node->get_attr('form'))) {
				$lostforms=$lostforms.$node->get_attr('form')." ";		
			}
		}
	}
	if (my @children = ($node->get_children)) {
		map (countWords($_), @children);
	}
}

sub cleanSmallCounts {
	#delete most of the "themes" that didnt get it past Count mentions
	my $count = shift;
	my $hashref = shift;
	foreach (keys %{$hashref}) {
        delete $hashref->{$_} if $hashref->{$_} < $count;    
    }
	return %themes;
}



sub justFirst{
	#take just first N stuff, based on score
	my $n = shift;
	my $hashref = shift;
	my $it = 0;
	foreach my $key (sort {$hashref->{$b}<=>$hashref->{$a}} keys %{$hashref}) {
		$it++;
		if ($it > $n) {
			delete ($hashref->{$key});
		}
	}
}


sub cleanSubthemes {
	#clean all subthemes from the final hash
	#so all "Hasici zvitezili Praze" and "Hasici zvitezili" and "zvitezili Praze" don't get counted
	my $hashref = shift;
	my %wtfshitman = %$hashref;
	# foreach my $theme (sort {splitsize($b)<=>splitsize($a)} keys %{$hashref}) {
	foreach my $theme (keys %$hashref) {
			#keys are generated in the beginning, so it has to test existence again
		if ($hashref->{$theme}) {
			foreach(allSubThemes(" ",$theme)) {
				delete $hashref->{$_};
			}

		}
	}
}


sub countTMT {
	
	%entities = %surnames = %names = %themes = @lastwords = %forms = @lastforms = ();
	
	
	my $fileName  = shift;
	
	my $document = TectoMT::Document->new( { 'filename' => $fileName } );
    
    # read entities
    foreach my $bundle ( $document->get_bundles() ) {
        
        Report::fatal("Evaluated bundle does not have SCzechN tree") unless ($bundle->contains_tree('SCzechN'));
        Report::fatal("Evaluated bundle does not have SCzechM tree") unless ($bundle->contains_tree('SCzechM'));
        my $n_root = $bundle->get_tree('SCzechN');
        my $m_root = $bundle->get_tree('SCzechM');
        
        countWords ($m_root);
        countNamed ($n_root);
        
    }
    
	cleanSmallCounts (2, \%themes);
	justFirst(15, \%names);
	justFirst(30, \%themes);
    


    
	my %superhash = (%themes, %names, %entities, %surnames);
	cleanSubthemes(\%superhash);
	my @res = map (($_."|".($forms{$_}?($forms{$_}):($_))), keys %superhash);
    return join ("\n", @res);
}
