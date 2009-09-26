package Zpravostroj::StopWords;

#What is a stopword?

#stopword is a word, that is VIRTUALLY IN EVERYTHING.
#But, it actually isn't in EVERYTHING

#so, first, I take some granularity, for example 5, and I will try to find words, that are in EVERY 5-long group at least once

# (or, almost every, but we will see about that)

use strict;
use warnings;

use Zpravostroj::Database;
use Zpravostroj::Other;

use base 'Exporter';
our @EXPORT = qw( );

sub get_stopwords {
	my $granularity=5;
	my %words_count;
	
	my @articles = read_articles();
	while (@articles) {
		my @part = splice (@articles, 0, $granularity);
		my @all_words = map (map ($_->{lemma} , @{$_->{all_words}}), @articles);
		
		my %existence;
		@existence{@all_words} = ();
		
		map($words_count++, keys %existence);
	}
	
	my @everything = grep ($words_count{$_}>=(get_pool_count()/(2*$granularity)), keys %existence);
	
	return @everything;
}


1;