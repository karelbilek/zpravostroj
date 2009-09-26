package Zpravostroj::StopWords;

#What is a stopword?

#stopword is a word, that is VIRTUALLY IN EVERYTHING.
#But, it actually isn't in EVERYTHING

#so, first, I take some granularity, for example 5, and I will try to find words, that are in EVERY 5-long group at least once

# (or, almost every, but we will see about that)

use strict;
use warnings;

use Zpravostroj::Other;

use base 'Exporter';
our @EXPORT = qw(get_stopwords);

sub get_stopwords {
	my $granularity = shift;
	my $tolerance = shift;
	my @articles = @_;


	# my $granularity=10;
	# my $tolerance = 0.75;
	
	my %words_count;
	
	while (@articles) {
		my @part = splice (@articles, 0, $granularity);
		my @all_words = map (map ($_->{lemma} , @{$_->{all_words}}), @part);
		
		my %existence;
		@existence{@all_words} = ();
		
		map($words_count{$_}++, keys %existence);
	}
	
	my @everything = grep ($words_count{$_}>=($tolerance*get_pool_count()/($granularity)), keys %words_count);
	@everything = grep (!is_banned($_), @everything);
	
	return @everything;
}


1;