package Zpravostroj::Walker;

use strict;
use warnings;
use Zpravostroj::Other;
use Zpravostroj::RSS;
use Zpravostroj::Database;

use base 'Exporter';
our @EXPORT = qw(download_articles);

sub download_articles {
	my $start = get_pool_count;
	
	my @links = get_all_links;
	
	my @articles = map ({url=>$_}, @links);
	
	add_new_articles(@articles);
	
	update_articles($start, map ({html=>read_from_web($_)}, @links));
	
	return $start;
}