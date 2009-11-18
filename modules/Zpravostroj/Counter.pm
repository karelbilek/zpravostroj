package Zpravostroj::Counter;
use 5.008;
use strict;
use warnings;

use Zpravostroj::Other;



use base 'Exporter';
our @EXPORT = qw( count_themes);
use utf8;
# use Clone::Fast qw( clone );




my $max_length=read_option("max_theme_length");						#10
	#max. length of THEME in WORDS
	#longer = more memory

my $max_first_named = read_option("counter_first_named"); 			#30
my $max_first_themes = read_option("counter_first_themes");			#15
	#number of named entities/themes that get it to final keys
	#BUT! this is BEFORE the subthemes cleaning!
	#number of entities should be high - this is actually just a safety catch if the NE recogniser goes wild¨
	#(which usually happens with longer texts in other than Czech language)
	
	
	#phase, that counts ALL max_length - long strings
sub first_counting_phase {
	my $all_counts_ref = shift;
	my @lemmas = @_;
	
	
	my %local_words; #I need every word-group, that appears here, to show up in the result just ONCE
					 #therefore, I need a helping hash
					
	while (@lemmas) {
		my $smaller_i = ($#lemmas < ($max_length-1)) ? ($#lemmas):($max_length-1);
		my @subgroup = @lemmas[0..$smaller_i];
		while (@subgroup) {
			
			$local_words{join (" ", @subgroup)}=undef;
			
			pop @subgroup;
		}
		shift @lemmas;
	}
	
	for (keys %local_words) {
		$all_counts_ref->{$_}++;
			#just once for every lemma/document!
	}
}

sub second_counting_phase {
	my $number_of_articles = shift;
	my $count_bottom_ref = shift;
	
	my $all_counts_ref = shift;
	
	my @all_words = @_;


	my %keys_count;
	my %score;
	my %forms;
	
	while (@all_words) {
		my $smaller_i = ($#all_words < ($max_length-1))?($#all_words):($max_length-1);
		
		my @sub_words = @all_words[0..$smaller_i];

		while (@sub_words) {
			my $forms_joined = join (" ", map {$_->{form}} @sub_words);
			my $lemmas_joined = join (" ", map {$_->{lemma}} @sub_words);
			$forms{$lemmas_joined} = $forms_joined;
			$keys_count{$lemmas_joined}++;#=log($number_of_articles / $all_counts_ref->{$lemmas_joined});
			pop @sub_words;
			
			
		}
		
		shift @all_words;
	}
	%score = map {$_ => ((2 - 1/ split_size($_))*($keys_count{$_})*log($number_of_articles / (2*$all_counts_ref->{$_})))} keys %keys_count;
	
	my @all_lemmas_sorted= (sort {$score{$b}<=>$score{$a}} (keys %score));
		
	my @res=map {{form=>$forms{$_}, lemma=>$_, keys_count=>$keys_count{$_},score=>$score{$_}, inverse_count=>$all_counts_ref->{$_}}} @all_lemmas_sorted;
	
	return \@res;
	
}

sub connect_bottom {
	my $article_ref = shift;
	my $count_bottom_ref = shift;
	
	my @corrected;
	my $pre="";
	for my $word (@{$article_ref->{all_words}}) {
		if (exists $count_bottom_ref->{$word->{form}}) {
			$pre.=$word->{form}."_";
		} else {
			push (@corrected, {form => $pre.($word->{form}), lemma => $word->{lemma}});
			$pre="";
		}
	}
	
	$article_ref->{all_words_copy} = \@corrected;
			# I will HAVE to delete this from article hash later!
	
}


sub count_themes {
	my @articles = @_;
	
	my %all_counts;
	
	foreach (@articles) {first_counting_phase(\%all_counts,map{$_->{lemma}} @{$_->{all_words}})};
	
	my @counts_bottom = sort {$all_counts{$b} <=> $all_counts{$a}} keys %all_counts;
	splice (@counts_bottom, @counts_bottom/10);
	
	print (join ("\n", @counts_bottom));
	
	my %count_bottom_hash;
	@count_bottom_hash{@counts_bottom}=();
		
	# foreach (@articles) {$_->{all_words_clone} = clone ($_->{all_words})};
	foreach (@articles) {connect_bottom($_, \%count_bottom_hash)};
		
	# counting IDF AGAIN!!!! with different words!!
	%all_counts=();
	foreach (@articles) {first_counting_phase(\%all_counts,map{$_->{lemma}} @{$_->{all_words_copy}})};
	
	
	foreach (@articles) { $_->{top_keys}=second_counting_phase(scalar @articles,\%count_bottom_hash, \%all_counts,@{$_->{all_words_copy}}) };
	
	foreach (@articles) { delete $_->{all_words_copy} };
	
	
	
	return @articles;
}

1;