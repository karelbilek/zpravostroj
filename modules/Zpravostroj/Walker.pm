package Zpravostroj::Walker;

use strict;
use warnings;
use Zpravostroj::Other;
use Zpravostroj::RSS;
use Zpravostroj::Database;
use Zpravostroj::Extractor;
use Zpravostroj::Tagger;
use Zpravostroj::Counter;

use base 'Exporter';
our @EXPORT = qw(download_articles);

sub download_articles {
	my $start = get_pool_count;
	
	my @links = get_all_links;
	
	my @articles = map ({url=>$_}, @links);
	add_new_articles(@articles);
	
	print "wrote all URLs.\n";
	my @sources = read_from_webs(@links);
	update_articles($start, map ({html=>$_}, @sources));
	
	print "read all files.\n";
	my @extracted = extract_texts(@sources);
	update_articles($start, map ({extracted=>($_->{extracted}), title=>($_->{title})}, @extracted));
	
	print "extracted all files.\n";
	my @tagged = tag_texts(map($_->{extracted}, @extracted));
	update_articles($start, map ({tagged=>$_}, @tagged));
	
	print "tagged all files.\n";
	my @counted = count_themes(@tagged);
	update_articles($start, map ({keys=>$_}, @counted));
	
	print "counted all files. end.\n";
	return $start;
}