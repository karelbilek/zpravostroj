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
	my_log("get_stopwords - entering");
	my $granularity = shift;
	my $tolerance = shift;
	my @articles = @_;
	my $size = @articles;

	# my $granularity=10;
	# my $tolerance = 0.75;
	
	my %words_count;
	
	my_log("get_stopwords - lets do it for each one...");
	while (@articles) {
		my @part = splice (@articles, 0, $granularity);
		my @all_words = map (map ($_->{lemma} , @{$_->{all_words}}), @part);
		
		my %existence;
		@existence{@all_words} = ();
		
		map($words_count{$_}++, keys %existence);
	}
	
	my_log("get_stopwords - done. Let's count stopwords...");
	
	my @everything = grep ($words_count{$_}>=($tolerance*$size/($granularity)), keys %words_count);
	@everything = grep (!is_banned($_), @everything);
	
	my_log("get_stopwords - ...done. exiting.");
	
	return @everything;
}


1;