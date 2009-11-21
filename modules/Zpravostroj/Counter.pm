package Zpravostroj::Counter;
use 5.008;
use strict;
use warnings;

use Zpravostroj::Other;



use base 'Exporter';
our @EXPORT = qw( count_themes);
use utf8;
# use Clone::Fast qw( clone );



my $max_first_named = read_option("counter_first_named"); 			#30
my $max_first_themes = read_option("counter_first_themes");			#15
	#number of named entities/themes that get it to final keys
	#BUT! this is BEFORE the subthemes cleaning!
	#number of entities should be high - this is actually just a safety catch if the NE recogniser goes wild¨
	#(which usually happens with longer texts in other than Czech language)
	
	
	#phase, that counts ALL max_length - long strings
sub first_counting_phase {
	my $max_length = shift;
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
	my $min_score;
	my $max_length = shift;
	my $number_of_articles = shift;
	my $count_bottom_ref = shift;
	
	my $all_counts_ref = shift;
	my $article_ref = shift;
	
	my @all_words = @{$article_ref->{all_words_copy}};
	
	
	
	my %keys_count;
	my %score;
	my %forms;
	
	while (@all_words) {
		my $smaller_i = ($#all_words < ($max_length-1))?($#all_words):($max_length-1);
		
		my @sub_words = @all_words[0..$smaller_i];
		
		
		while (@sub_words) {
			my $forms_joined = join (" ", map {$_->{form}} @sub_words);
			my $lemmas_joined = join (" ", map {$_->{lemma}} @sub_words);
			push (@{$forms{$lemmas_joined}}, $forms_joined);
			$keys_count{$lemmas_joined}++;#=log($number_of_articles / $all_counts_ref->{$lemmas_joined});
			pop @sub_words;
			
			
		}
		
		shift @all_words;
	}
	%score = map {$_ => ((2 - 1/ split_size($_))*($keys_count{$_})*log($number_of_articles / (2*$all_counts_ref->{$_})))} keys %keys_count;
	
	my @all_lemmas_sorted= (sort {$score{$b}<=>$score{$a}} (keys %score));
	my @res_lemmas;
	
	# verze A - u prvniho s jednickou se zastavim
	push (@res_lemmas, shift @all_lemmas_sorted) while ($keys_count{$all_lemmas_sorted[0]}>1);
	
	# verze B - vezmi vse co je >1
	# @res_lemmas = map {if ($keys_count{$_}>1){$_}else{()}} @all_lemmas_sorted;
	
	my %res_lemmas_hash;
	@res_lemmas_hash{@res_lemmas}=();
	
	my @named = grep {!($_=~/^\s*\d*\s*$/) and exists $keys_count{$_}} @{$article_ref->{all_named}};
	@res_lemmas_hash{@named}=();
	
	for my $lemma (sort {split_size($b) <=> split_size($a)} keys %res_lemmas_hash) {
		for my $sublemma (all_subthemes(" ", $lemma)) {
			delete $res_lemmas_hash{$sublemma};
		}
	}
	
	my @res;
	for my $lemma (sort {$score{$b}<=>$score{$a}} keys %res_lemmas_hash) {
		my %form_vote;
		for my $form (@{$forms{$lemma}}) {
			$form_vote{$form}++;
		}
		my @sorted = sort {$form_vote{$b}<=>$form_vote{$a}} keys %form_vote;
		push (@res, {lemma=>$lemma, best_form=>$sorted[0],all_forms=>\@sorted, score=>$score{$lemma}, count=>$keys_count{$lemma}, reverse=>($all_counts_ref->{$lemma})});
	}
	
	return \@res;
	
}

sub connect_bottom {
	my $article_ref = shift;
	my $count_bottom_ref = shift;
	
	my @corrected;
	my $pre="";
	for my $word (@{$article_ref->{all_words}}) {
		if (exists $count_bottom_ref->{$word->{lemma}}) {
			$pre.=$word->{form}."_";
		} else {
			push (@corrected, {form => $pre.($word->{form}), lemma => $word->{lemma}});
			$pre="";
		}
	}
	
	$article_ref->{all_words_copy} = \@corrected;
			# I will HAVE to delete this from article hash later!
	
}

sub make_corrections {
	my $article_ref = shift;
	
	for my $length (1..longest_correction) {
		for my $i (0..(scalar @{$article_ref->{all_words}})-$length){
			my $joined_form = join (" ", map {$_->{form}} @{$article_ref->{all_words}}[$i..$i+length]);
			if (my $correction = get_correction($joined_form)) {
				# my @correction_split = split (" ", $correction);
				@{$article_ref->{all_words}}[$i..$i+length] = split (" ", $correction);
			}
		}
	}
}


sub count_themes {
	my @articles = @_;
	
	my %all_counts;
	
	foreach (@articles) {make_corrections($_)};
	
	foreach (@articles) {first_counting_phase(1, \%all_counts,map{$_->{lemma}} @{$_->{all_words}})};
	
	my @counts_bottom = sort {$all_counts{$b} <=> $all_counts{$a}} keys %all_counts;
	splice (@counts_bottom, @counts_bottom/44);
	
	
	print (join ("\n", @counts_bottom));
	
	my %count_bottom_hash;
	@count_bottom_hash{@counts_bottom}=();
		
	# foreach (@articles) {$_->{all_words_clone} = clone ($_->{all_words})};
	foreach (@articles) {connect_bottom($_, \%count_bottom_hash)};
	
	
	
	my $max_length=read_option("max_theme_length");
	
	
	# counting IDF AGAIN!!!! with different words!!
	%all_counts=();
	foreach (@articles) {first_counting_phase($max_length, \%all_counts,map{$_->{lemma}} @{$_->{all_words_copy}})};
	
	
	foreach (@articles) { $_->{top_keys}=second_counting_phase($max_length, scalar @articles,\%count_bottom_hash, \%all_counts,$_) };
	
	foreach (@articles) { delete $_->{all_words_copy} };
	
	
	
	return @articles;
}

1;