package Zpravostroj::TopThemes;

use strict;
use warnings;

use Zpravostroj::Other;

use base 'Exporter';
our @EXPORT = qw(top_themes);

sub theme_rate{
	my $theme=shift;
	my $appearances_ref=shift;
	
	my $count = scalar @{$appearances_ref->{$theme}};
	my $size = split_size($theme);
	
	return $count ** (2*$size);
}

sub top_themes{
	my @articles = @_;
	
	#my %scores;	
		#this hash wouldnt be 100% needed  (it can be counted from %appearences VERY easily)
		#but it makes things easier
		
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
	
	#so basically, I am done
	
	my @results;
	for my $lemma (sort {theme_rate($b, \%appearances) <=> theme_rate($a, \%appearances)} keys %appearances) {
		my %result;
		$result{lemma} = $lemma;
		$result{score} = theme_rate($lemma, \%appearances);
		#$result{articles} = $appearances{$lemma};
		$result{best_form} = most_frequent(@{$all_forms{$lemma}});
		push (@results, \%result);# if (length $lemma <= 3); #;
	}
	
	return @results;
}

1;