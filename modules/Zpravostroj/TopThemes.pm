package Zpravostroj::TopThemes;

use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw();

sub top_themes{
	my @articles = @_;
	
	#my %scores;
	my %appearances;
	my %all_forms;
		#every lemma should have all of those
		
	my $i=0;
	foreach my $article (@articles){
		
		my @keys = $article->{keys};
		for my $key (@keys) {
			my @sub_lemmas = ($key->{lemma}, all_subthemes(" ", $key->{lemma}));
			
			for my $sub_lemma (@sub_lemmas) {push(@{$appearances{$sub_lemma}}, $i)}
			
			for my $form ($key->{all_forms}) {
				my @sub_forms = ($form, all_substhemes(" ", $form));
				
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
	
}