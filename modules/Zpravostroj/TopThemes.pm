package Zpravostroj::TopThemes;

use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw();

sub top_themes{
	my @articles = @_;
	
	my %scores;
	my %appearances;
	my %forms;
		#every lemma should have all of those
		
	my $i=0;
	foreach my $article (@articles){
		++$i;
		my @keys = $article->{keys};
		for my $key (@keys) {
			my @sub_lemmas = ($key->{lemma}, all_subthemes(" ", $key->{lemma}));
			
		}
	}
	
}