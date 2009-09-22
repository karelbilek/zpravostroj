package Zpravostroj::Counter;
use 5.008;
use strict;
use warnings;

use Zpravostroj::Other;
use TectoMT::Document;
use TectoMT::Bundle;
use File::Temp;

use Encode;



use base 'Exporter';
our @EXPORT = qw( count_TMT);

my $max_length=10;
	#max. length of THEME
	#longer = more memory

my $max_first_entities = 15;
my $max_first_themes = 15;
	#number of entities/themes that get it to final keys
	#BUT! this is BEFORE the subthemes cleaning!
	
sub clean_subthemes {
	
	my $hash_ref = shift;

	foreach my $theme (keys %$hash_ref) {
			#keys are generated in the beginning, so it has to test existence again
		if ($hash_ref->{$theme}) {
			foreach(allSubThemes(" ",$theme)) {
				delete $hash_ref->{$_};
			}

		}
	}
}

sub remember_forms {
	my $forms_ref = shift;
	
	my @last_words_copy = @_;
	
	while (@last_words_copy) {
		my $joined = join(" ", map($_->{lemma}, @last_words_copy));
		$forms_ref->{$joined} = join("_", map($_->{form}, @last_words_copy)) unless defined $forms_ref->{$joined};
		shift @last_words_copy;
	}
}

sub just_first {
	#take just first N stuff, based on score
	my $themes_ref = shift;
	
	my $n = shift;
	
	my $it = 0;
	foreach my $key (sort {$themes_ref->{$b}<=>$themes_ref->{$a}} keys %$themes_ref) {
		$it++;
		if ($it > $n) {
			delete ($themes_ref->{$key});
		}
	}
}

sub add {
	my $forms_ref = shift;
	
	my $themes_ref = shift;
	
	my @normal_words = @_;
	
	while (@normal_words) {
        #every subset ending on the "right" end of normal_words

		my $joined = join (" ", @normal_words);
		
		my $length;
		if ($forms_ref->{$joined}){
				#!!!!! pozor pozor!! achtung bitte!
				# the length of the WHOLE FORM - with all those "lost forms" before - gets counted
				# but it gets counted to the LEMMA version in %themes hash!
			$length = split_size($forms_ref->{$joined});
			$length = 1 unless $length;
		} else {
			$length = @normal_words;
		}
				#here - $joined is LEMMA!!
        ($themes_ref->{$joined})+=2-(1/$length);

        shift @normal_words;
    }

}

sub count_node {
	my $named_entities_ref = shift;
	
	my $themes_ref = shift;
	
	my $forms_ref = shift;
	
	my $last_words_ref = shift;
	
	my $unused_forms_ref = shift;
	
	my $node = shift;
		
	if ($node->get_de_ref_attr('m.rf')) {
		#it is a named entity.
		my $type;
		if (($type=($node->get_attr('ne_type'))) and (length(my $name = $node->get_attr('normalized_name'))>3) and ($type =~ /^(g|m|q|P|ps)/)) {
			add($forms_ref, $named_entities_ref, $name); 
		}
	} elsif (my $lemma = ($node->get_attr('lemma'))) {
		#it is a word
		
		if (my $lemma_b = (make_normal_word($lemma))) { 
			#the one that I like
			my $form = ($node->get_attr('form'));

			push (@$last_words_ref, {lemma=>$lemma_b, form=>$unused_forms_ref.$form});
			$$unused_forms_ref = "";
					
			if (@$last_words_ref > $max_length) {
				shift @$last_words_ref;
			}
			
			remember_forms($forms_ref, @$last_words_ref);
			add($forms_ref, $themes_ref, map($_->{lemma}, @$last_words_ref));
				#theoretically, I can rewrite this to work on the whole @last_words
				# BUT... I use the same procedure on entities and it would probably not work
				# I will try it maybe someday, but not today
				# you will start to like it, eventually
			
		} else {
			if (is_word($node->get_attr('form'))) {
				#"a", "nebo", "který" ...
				$unused_forms_ref=$$unused_forms_ref.$node->get_attr('form')." ";		
			}
		}
	}
    if (my @children = ($node->get_children)) {
        map (count_node($named_entities_ref, $themes_ref, $forms_ref, $last_words_ref, $unused_forms_ref, $_), @children);
    }
}

sub count_TMT {
	
	my $text = shift;
	
	my $tmp = File::Temp->new( UNLINK => 1);
	print $tmp $text;
	close $tmp;
		#this is quite stupid but that's the way TectoMT is ;_°
	
	my $document = TectoMT::Document->new( { 'filename' => $tmp->filename } );
	$document->set_attr("czech_source_text", $text);
	
	
	
	my %named_entities;

	my %themes;
		#hashes with scores of entites
		#lemma=>score	
			
	my %forms;
		#hash, used to retrieve form from lemma	
			
	my @last_words;
	my $unused_forms="";
		#forms, that had not been used	
		
	
	
	
	
	foreach my $bundle ( $document->get_bundles() ) {
		
		Report::fatal("Evaluated bundle does not have SCzechN tree") unless ($bundle->contains_tree('SCzechN'));
		Report::fatal("Evaluated bundle does not have SCzechM tree") unless ($bundle->contains_tree('SCzechM'));
		my $n_root = $bundle->get_tree('SCzechN');
		my $m_root = $bundle->get_tree('SCzechM');
		
		count_node(\%named_entities, \%themes, \%forms, \@last_words, \$unused_forms, $n_root);
		count_node(\%named_entities, \%themes, \%forms, \@last_words, \$unused_forms, $m_root);
	
	}
	
	just_first(\%named_entities, $max_first_entities);
	just_first(\%themes, $max_first_themes);
    

	my %superhash = (%themes, %named_entities);
	clean_subthemes(\%superhash);
	
	my @res = map (($_."|".($forms{$_}?($forms{$_}):($_))), keys %superhash);
    return join ("\n", @res);
}

1;