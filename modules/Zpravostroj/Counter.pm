package Zpravostroj::Counter;
use 5.008;
use strict;
use warnings;

use Zpravostroj::Other;



use base 'Exporter';
our @EXPORT = qw( count_themes);
use utf8;

my $longest_correction=0;
my %corrections;
{
	my %read_corrections = %{read_information("corrections")};

	foreach my $correct_lemma (keys %read_corrections) {
		my $length = split_size($correct_lemma);
		$length = $longest_correction if ($length > $longest_correction);
		
		foreach my $correct_form (@{$read_corrections{$correct_lemma}}) {
			$corrections{$correct_form} = $correct_lemma;
		}
	}
}
		#this IS global - but it does make sense!!!!!!!!§§§!! really!!
		#why would I read this thing every time again and again?
		#on the other hand, I will 100% need it!



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

sub clean_small {
	#clean those really small ones
	#really small = <2 = less than 1 mention
	my $themes_ref = shift;
	foreach my $theme (keys %$themes_ref) {
		delete $themes_ref->{$theme} if ($themes_ref->{$theme}<2);
	}
}



sub count_themes_document {
	
	
	my %corrected_names;
	
	my $article_ref = shift;
	my %article = %$article_ref;

	
	
	my %scores;
		#hashes with scores of entites
		#lemma=>score	
			
	my %joined_forms;
		#hash, used to retrieve form from lemma	
			
	my @last_words;
	
	my $unused_forms="";
	
	foreach my $word (@{$article{all_words}}) {
		
		if (is_banned($word->{lemma})) {
			$unused_forms=$unused_forms.($word->{form})."_";
		} else {
			
			my %word_copy = %$word;
			
			$word_copy{form}=$unused_forms.$word_copy{form};
						#I will probably no longer need $word but who knows
						
			$unused_forms="";
			
			push(@last_words, \%word_copy);
			
			if (@last_words > $max_length) {
				shift @last_words;
			}
			
			my @last_words_copy = @last_words;
					#corrections are, sadly, not 1-word-only
					
			if (scalar @last_words_copy > $longest_correction) {
				@last_words_copy = splice(@last_words_copy, -$longest_correction);
			}
					
			do {
				
				my $joined_form = join(" ", map($_->{form}, @last_words_copy));
				
				if (exists $corrections{$joined_form}) {
					
					# if (scalar @last_words_copy >= 2) {
					# 	print "correcting $joined_form from ".join(" ", map($_->{lemma}, @last_words_copy))." to $corrections{$joined_form}\n";
					# }
					
					my %correct_lemmas_hash;
					my @correct_lemmas = split (" ", $corrections{$joined_form});
					@correct_lemmas_hash{@last_words_copy} = @correct_lemmas;
						#the keys are references 
						#this would be possible without this hash too probably
					
					foreach (@last_words_copy) {
						$_->{lemma}=$correct_lemmas_hash{$_};
						$corrected_names{$_->{lemma}}=$correct_lemmas_hash{$_};
						print "corrected names ".($_->{lemma})."=".($correct_lemmas_hash{$_})."\n";
					}
					map ($_->{lemma}=$correct_lemmas_hash{$_}, @last_words_copy);
				} 
			} while (shift @last_words_copy);
			
			@last_words_copy = @last_words;
			do {
				my $joined_lemma = join(" ", map($_->{lemma}, @last_words_copy));
				my $joined_form = join(" ", map($_->{form}, @last_words_copy)); 
				
				
				push (@{$joined_forms{$joined_lemma}}, $joined_form);
					#example: joined_forms{"Petr Kalousek"} = ["Petra Kalouska", "Petra Kalouska", "s_Petrem Kalouskem"]
			
				my $length = split_size($joined_form);
												#why this and NOT just scalar (@last wors)?
												#because there can be "_" in $joined_form
				$length = 1 unless $length;
			
				$scores{$joined_lemma}=0 if (!exists $scores{$joined_lemma});
			
				$scores{$joined_lemma}+=2-(1/$length);
			
			} while (shift @last_words_copy);
		}
	
	}
	
	my %named_scores;
	
	my $correct_entity = sub {
		my $what = shift;
		$what =~ s/^\W*(\w*)\W*$/$1/;
		
		return "" if ($what eq "");
		return "" if is_banned($what);
		return $corrected_names{$what}." " if ($corrected_names{$what});
		return $what." ";
	};
	
	foreach my $entity (@{$article{all_named}}) {
		my $right_entity = join ("", (map ($correct_entity->($_) , (split (" ", $entity)))));
		
		$right_entity =~ s/ +$//; #trailing space
		
		$named_scores{$right_entity} = 0 if (!exists $scores{$right_entity});
		$named_scores{$right_entity}+=split_size($right_entity);
			#again, here, it's not so important, it's just a safety-catch
	}
	
	
	
	just_first(\%named_scores, $max_first_named);
	
	just_first(\%scores, $max_first_themes);
	clean_small(\%scores);
    

	my %superhash = (%scores, %named_scores);
	clean_subthemes(\%superhash);
	
	my @res;
	
	foreach my $lemma (keys %superhash) {
		my $form;
		my @all_forms;
		if (my $all_forms_ref = $joined_forms{$lemma}) {
			
			@all_forms = @$all_forms_ref;
			
			$form = most_frequent(@all_forms);
		} else {
			$form = $lemma;
			@all_forms = ($form);
		}
		push (@res, {lemma=>$lemma, best_form=>$form, all_forms=>\@all_forms, score=>($scores{$lemma}?$scores{$lemma}:"NAMED")});
	}
	
	
	$article{keys} = \@res;
    return \%article;
}



sub count_themes {
	return map(count_themes_document($_), @_);
}

1;