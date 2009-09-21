package Zpravostroj::Counter;
use 5.008;
use strict;
use warnings;

use Zpravostroj::Other;
use TectoMT::Document;
use TectoMT::Bundle;

use Encode;



use base 'Exporter';
our @EXPORT = qw( countTMT);

my $max_length=10;
	#max. length of THEME
	#longer = more memory

my $max_first_entities = 15;
my $max_first_themes = 15;
	#number of entities/themes that get it to final keys
	#BUT! this is BEFORE the subthemes cleaning!
	
sub clean_subthemes {
	
	my $hashref = shift;

	foreach my $theme (keys %$hashref) {
			#keys are generated in the beginning, so it has to test existence again
		if ($hashref->{$theme}) {
			foreach(allSubThemes(" ",$theme)) {
				delete $hashref->{$_};
			}

		}
	}
}

sub just_first{
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

sub add {
	my $formsref = shift;
	my $hashref = shift;
	my @normal_words = @_;
	
	while (@normal_words) {
        #every subset ending on the "right" end of normal_words

		my $joined = join (" ", @normal_words);
		
		my $length;
		if ($forms{$joined}){
			$length = split_size($forms{$joined});
			$length = 1 unless $length;
		} else {
			$length = @normal_words;
		}

        ($hashref->{$joined})+=2-(1/$length);

        shift @normal_words;
    }

}

sub count_TMT {

	
	my %named_entities;

	my %themes;
		#hashes with scores of entites
		#lemma=>score
		
	my %forms;
		#hash, used to retrieve form from lemma
		
	my @last_words;


	my $unused_forms="";
		#forms, that had not been used
	
	my $text = shift;
	my $document = TectoMT::Document->new;
	$document->set_attr("czech_source_text", $text);

	my $add = sub {
		my $hashref = shift;
		my @normal_words = @_;
		
		while (@normal_words) {
	        #every subset ending on the "right" end of normal_words
	
			my $joined = join (" ", @normal_words);
			
			my $length;
			if ($forms{$joined}){
				$length = split_size($forms{$joined});
				$length = 1 unless $length;
			} else {
				$length = @normal_words;
			}

	        ($hashref->{$joined})+=2-(1/$length);

	        shift @normal_words;
	    }

	};
	
	my $remember_forms = sub {
	        #will remember all original forms, based on the global variables
	    my @last_words_copy = @last_words;
	    while (@last_words_copy) {
	        my $joined = join(" ", map($_->[0], @last_words_copy));
	        $forms{$joined} = join("_", map($_->[1], @last_words_copy)) unless defined $forms{$joined};
	        shift @last_words_copy
	    }
	};

	my $count_node = sub {
		my $node = shift;
			
		if ($node->get_deref_attr('m.rf')) {
			#it is a named entity.
			my $type;
			if (($type=($node->get_attr('ne_type'))) and (length(my $name = $node->get_attr('normalized_name'))>3) and ($type =~ /^(g|m|q|P|ps)/)) {
				&$add(\%named_entities, $name); 
			}
		} elsif (my $lemma = ($node->get_attr('lemma'))) {
			#it is a word
			
			if (my $lemma_b = (make_normal_word($lemma))) { 
				#the one that I like
				my $form = ($node->get_attr('form'));

				push (@last_words, [$lemma_b, $unused_forms.$form]);
				$unused_forms = "";
						
				if (@last_words > $max_length) {
					shift @last_words;
				}
				
				&$remember_forms;
				&$add(\%themes, map($_->[0], @last_words));
			} else {
				if (is_word($node->get_attr('form'))) {
					#"a", "nebo", "který" ...
					$unused_forms=$unused_forms.$node->get_attr('form')." ";		
				}
			}
		}
	    if (my @children = ($node->get_children)) {
	        map (&$count_node($_), @children);
	    }
	}
	
	foreach my $bundle ( $document->get_bundles() ) {
		
		Report::fatal("Evaluated bundle does not have SCzechN tree") unless ($bundle->contains_tree('SCzechN'));
		Report::fatal("Evaluated bundle does not have SCzechM tree") unless ($bundle->contains_tree('SCzechM'));
		my $n_root = $bundle->get_tree('SCzechN');
		my $m_root = $bundle->get_tree('SCzechM');
		
		&$count_node($m_root);
		&$count_node($m_root);
	
	}
	

	
	just_first($max_first_entities, \%named_entities);
	just_first($max_first_themes, \%themes);
    

	my %superhash = (%themes, %named_entities);
	clean_subthemes(\%superhash);
	
	my @res = map (($_."|".($forms{$_}?($forms{$_}):($_))), keys %superhash);
    return join ("\n", @res);
}

1;