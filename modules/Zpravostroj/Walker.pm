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
	update_articles($start, @articles);
	print "read all files.\n";
	
	@articles = extract_texts(@articles);
	update_articles($start, @articles);
	print "extracted all files.\n";
	
	@articles = tag_texts(@articles);
	update_articles($start, @articles);
	print "tagged all files.\n";
	
	@articles = count_themes(@articles);
	update_articles($start, @articles);
	print "counted all files. end.\n";
	
	return $start;
}