package Zpravostroj::Walker;

use strict;
use warnings;
use Zpravostroj::Other;
use Zpravostroj::WebReader;
use Zpravostroj::RSS;
use Zpravostroj::Database;
use Zpravostroj::Extractor;
use Zpravostroj::Tagger;
use Zpravostroj::Counter;

use base 'Exporter';
our @EXPORT = qw(download_articles);

sub download_articles {
	my $start = get_pool_count;
	
	my @articles = get_all_links;
	add_new_articles(@articles);	
	print "wrote all URLs.\n";
	
	@articles = read_from_webs(@articles);
	print "downloaded all webs.\n";
	
	update_articles($start, @articles);
	print "wrote all webs.\n";
	
	@articles = extract_texts(@articles);
	print "extracted all.\n";
	
	update_articles($start, @articles);
	print "wrote all extracted.\n";
	
	@articles = tag_texts(@articles);
	print "tagged all.\n";
		
	update_articles($start, @articles);
	print "wrote all tagged.\n";
	
	@articles = count_themes(@articles);
	print "counted all.\n";
	
	update_articles($start, @articles);
	print "wrote all counted. end.\n";
	
	return $start;
}