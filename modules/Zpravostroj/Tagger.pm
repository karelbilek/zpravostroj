package Zpravostroj::Counter;
use 5.008;
use strict;
use warnings;

use Zpravostroj::Other;



use base 'Exporter';
our @EXPORT = qw( count_themes);

my $max_length=read_option("max_theme_length");						#10
	#max. length of THEME in WORDS
	#longer = more memory

my $max_first_named = read_option("counter_first_named"); 			#30
my $max_first_themes = read_option("counter_first_themes");			#15
	#number of named entities/themes that get it to final keys
	#BUT! this is BEFORE the subthemes cleaning!
	#number of entities should be high - this is actually just a safety catch if the NE recogniser goes wild¨
	#(which usually happens with longer texts in other than Czech language)
	
sub clean_subthemes {
	
	my $hash_ref = shift;

	foreach my $theme (keys %$hash_ref) {
			#keys are generated in the beginning, so it has to test existence again
			#because I can come across something already deleted
		if ($hash_ref->{$theme}) {
			foreach(all_subthemes(" ",$theme)) {
				delete $hash_ref->{$_};
			}
		}
	}
}

sub just_first {
	#take just first N stuff, based on score
	my $themes_ref = shift;
	my $n = shift;
	
	my @keys_to_delete = sort {$themes_ref->{$b}<=>$themes_ref->{$a}} keys %$themes_ref;
	splice (@keys_to_delete, 0, $n);
				#just n+1 and bigger are kept there
	
	map ((delete $themes_ref->{$_}), @keys_to_delete);
	
}



sub count_themes {
	
	my %read_corrections = %{read_information("corrections")};
	my %corrections;

	foreach my $correct_lemma (keys %read_corrections) {
		foreach my $correct_form (@{$read_corrections{$correct_lemma}}) {
			$corrections{$correct_form} = $correct_lemma;
		}
	}
	
	my $hash_ref = shift;
	my %all_hash = %$hash_ref;
	
	
	my %scores;
		#hashes with scores of entites
		#lemma=>score	
			
	my %joined_forms;
		#hash, used to retrieve form from lemma	
			
	my @last_words;
	
	my $unused_forms="";
	
	foreach my $word (@{$hash_ref->{words}}) {
		
		if (is_banned($word->{lemma})) {
			$unused_forms=$unused_forms.($word->{form})."_";
		} else {
			
			my %word_copy = %$word;
			
			if ($corrections{$word->{form}}){
				$word_copy{lemma} = $corrections{$word->{form}};
			}
			
			$word_copy{form}=$unused_forms.$word_copy{form};
						#I will probably no longer need $word but who knows
						
			$unused_forms="";
			
			push(@last_words, \%word_copy);
			
			if (@last_words > $max_length) {
				shift @last_words;
			}
			
			my @last_words_copy = @last_words;
			while (@last_words_copy) {
				my $joined_lemma = join(" ", map($_->{lemma}, @last_words_copy));
				my $joined_form = join(" ", map($_->{form}, @last_words_copy)); 
				$joined_forms{$joined_lemma} = $joined_form unless defined $joined_forms{$joined_lemma};
			
				my $length = split_size($joined_form);
												#why this and NOT just scalar (@last wors)?
												#because there can be "_" in $joined_form
				$length = 1 unless $length;
			
				$scores{$joined_lemma}=0 if (!exists $scores{$joined_lemma});
			
				$scores{$joined_lemma}+=2-(1/$length);
			
				shift @last_words_copy;
			}
		}
	
	}
	
	my %named_scores;
	
	foreach my $entity (@{$hash_ref->{named}}) {
		$named_scores{$entity} = 0 if (!exists $scores{$entity});
		$named_scores{$entity}+=split_size($entity);
			#again, here, it's not so important, it's just a safety-catch
	}
	
	
	
	just_first(\%named_scores, $max_first_named);
	
	just_first(\%scores, $max_first_themes);
    

	my %superhash = (%scores, %named_scores);
	clean_subthemes(\%superhash);
	
	my @res = map ({lemma=>$_, form=>($joined_forms{$_}?$joined_forms{$_}:$_), score=>($scores{$_}?$scores{$_}:0)}, keys %superhash);
    return \@res;
}

1;