package Zpravostroj::TopThemes;

use strict;
use warnings;

use Zpravostroj::Other;
use Zpravostroj::StopWords;

use Test::Deep qw(eq_deeply);

use base 'Exporter';
our @EXPORT = qw(top_themes);

sub theme_rate{
	my $theme=shift;
	my $appearances_ref=shift;
	my $stopwords = shift;
	
	my $count = scalar @{$appearances_ref->{$theme}};

	my $size = stop_size($stopwords, $theme);
	
	return $count ** (2*$size); #original
#	return (2* $size) ** ($count);
}

sub stop_size {
	my $stopwords = shift;
	my $word = shift;
	return scalar grep(!exists $stopwords->{$_}, split(" ",$word));
}

sub top_themes{
	my @articles = @_;
	
	my %stopwords; 
	#@stopwords{get_stopwords(10, 0.8, @articles)}=();
	
	# {use YAML::XS;
	# my @wa = keys %stopwords;
	# print Dump(\@wa);}
		
	my %appearances;
	my %all_forms;
		#every lemma should have all of those
		
	my $i=0;
	foreach my $article (@articles){
		
		my @keys = @{$article->{keys}};
		for my $key (@keys) {
			
			my @sub_lemmas = ($key->{lemma}, all_subthemes(" ", $key->{lemma}));
			
			for my $sub_lemma (@sub_lemmas) {
				push(@{$appearances{$sub_lemma}}, $i);
			}
	
			
			for my $form (@{$key->{all_forms}}) {
				my @sub_forms = ($form, all_subthemes(" ", $form));
				
				die "HORRIBLE DEATH! ".$form."!=".$key->{lemma} if ((scalar @sub_forms) != (scalar @sub_lemmas));
				
				for my $sub_lemma (@sub_lemmas) {
					
					push (@{$all_forms{$sub_lemma}}, $sub_forms[0]);
					shift @sub_forms;
					#this is a little ugly but I find no better (easy!) way
					#I can do it through helper hash but screw that
				}
			}
		}
		
		++$i;
	}
	
	#remove redundant subthemes
	
	for my $lemma (sort {split_size($b)<=>split_size($a)} keys %appearances) {
		
		#I can delete the appearance so I have to test again
		if (exists $appearances{$lemma}) {
			
			my @lemma_appearances = @{$appearances{$lemma}};
			for my $sub_lemma (all_subthemes(" ",$lemma)) {
				
				my @sub_lemma_appearances = @{$appearances{$sub_lemma}};
				if (eq_deeply(\@lemma_appearances, \@sub_lemma_appearances)) {
					delete $appearances{$sub_lemma};
					delete $all_forms{$sub_lemma};
				} 
			}
		} 
	}
	
	#so basically, I am done
	
	my @results;
	for my $lemma (sort {theme_rate($b, \%appearances, \%stopwords) <=> theme_rate($a, \%appearances, \%stopwords)} keys %appearances) {
		my %result;
		$result{lemma} = $lemma;
		# $result{score} = theme_rate($lemma, \%appearances);
		$result{articles} = $appearances{$lemma};
		# $result{articles_count} = scalar (@{$appearances{$lemma}});
		# $result{stop_size} = stop_size(\%stopwords, $lemma);
		$result{best_form} = most_frequent(@{$all_forms{$lemma}});
		# $result{all_forms} = $all_forms{$lemma};
		push (@results, \%result);# if (length $lemma <= 3); #;
	}
	
	splice (@results, 250);
	
	return @results;
}

1;