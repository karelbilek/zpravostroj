package News::Bulk_walker;

use strict;
use warnings;

use News::Stopwords;
use News::Other;
use News::RSS_walker;
use News::Tagger;
use News::Extractor;
use News::Counter;
use News::Today_analyzer;
use News::Database qw(getPoolCount addNewArticles transformPool);

use File::Slurp;
use File::Touch;

use base 'Exporter';
our @EXPORT = qw(walkAll countAgain extractAgain tagAndCountAgain tagAgain analyzeToday tagAndCountAgainn getStopwordsToday);


sub getStopwordsToday {
	transformPool(0, \&getStopWords, "keys", "stopwords", (DUMP=>1));
}

sub walkAll{
	print "zacinam...\n";
	my @newArticleLinks = NewFromRSS;
	my $c = getPoolCount;
	
	
	for (@newArticleLinks) {
		my %hh = (link=>$_);
		addNewArticles(\%hh);
	}
	
	
	print "stahuji..\n";
	transformPool($c, \&readFromWeb, "link", "html");
	
	print "extrahuji...\n";
	transformPool($c, \&extractFromText, "html", ["title", "extracted"], (HASH=>1));
	
	print "taguji...\n";
	transformPool($c, \&tagTexts, "extracted", "tmt", (AT_ONCE=>1));
	
	print "pocitam...\n";
	transformPool($c, \&countTMT, "tmt", "keys", (FILE=>1));
	
	print "analyzuji vse dnesni...\n";
	transformPool(0, \&analyze, "keys", "all_keys", (DUMP=>1));
	
	print "hotovo!\n"
}

sub analyzeToday{
	transformPool(0, \&analyze, "keys", "all_keys", (DUMP=>1));
}

sub tagAndCountAgain{
	transformPool(0, \&tagTexts, "extracted", "tmt", (AT_ONCE=>1));	
	transformPool(0, \&countTMT, "tmt", "keys", (FILE=>1));
}

sub tagAndCountAgainn{
	transformPool(294, \&tagTexts, "extracted", "tmt", (AT_ONCE=>1));	
	transformPool(294, \&countTMT, "tmt", "keys", (FILE=>1));
}

sub tagAgain{
	transformPool(0, \&tagTexts, "extracted", "tmt", (AT_ONCE=>1));	
}

sub countAgain{
	transformPool(0, \&countTMT, "tmt", "keys", (FILE=>1));
}

sub extractAgain{
	transformPool(0, \&extractFromText, "html", ["title", "extracted"], (HASH=>1));
}

1;