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
our @EXPORT = qw(do_everything recount);

my $last_day="";

sub step {
	print time." - starting.\n";
	do_everything;
	print "counting top themes...\n";
	count_pool_themes;
	print "...done.\n"
	
	my $new_day = get_day;
	if ($last_day eq "") or ($last_day eq $new_day) {
		print "no need to archive yet.\n";
	} else {
		print "archiving...\n";
		archive_pool;
		print "done. \n"
	}
	print time." - done\n==========\n";
}

sub do_everything {
	my $start = get_pool_count;
	
	my @articles = get_all_links;
	print "got all URLs.\n";
	if (!scalar @articles) {
		print "nothing to add.\n";
		return $start;
	}
	
	add_new_articles(@articles);	
	print "wrote all URLs.\n";
	
	@articles = read_from_webs(@articles);
	print "downloaded all webs.\n";
	
	@articles = extract_texts(@articles);
	print "extracted all. goodbye for a while...\n";
	
	@articles = tag_texts(@articles);
	print "...hello again. tagged all (wow).\n";
		
	@articles = count_themes(@articles);
	print "counted all.\n";
	
	update_articles($start, @articles);
	print "wrote everything.\n";
	
	return $start;
}

sub recount {
	my @articles = read_articles;
	print "read all.\n";
	
	@articles = count_themes(@articles);
	print "counted all.\n";
	
	update_articles(0, @articles);
	print "wrote all counted. end.\n";
	
	
}