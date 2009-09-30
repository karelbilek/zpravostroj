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
our @EXPORT = qw(do_everything recount step);

my $last_day="";


sub do_everything {
	my $start = get_pool_count;
	
	my @articles = get_all_links;
	print time." - got all URLs.\n";
	if (!scalar @articles) {
		print time." - nothing to add.\n";
		return $start;
	}
	
	add_new_articles(@articles);	
	print time." - wrote all URLs.\n";
	
	@articles = read_from_webs(@articles);
	print time." - downloaded all webs.\n";
	
	@articles = extract_texts(@articles);
	print time." - extracted all. goodbye for a while...\n";
	
	@articles = tag_texts(@articles);
	print time." - ...hello again. tagged all (wow).\n";
		
	@articles = count_themes(@articles);
	print time." - counted all.\n";
	
	update_pool_articles($start, @articles);
	print time." - wrote everything.\n";
	
	return $start;
}

sub step {
	print time." - starting.\n";
	do_everything;
	print time." - counting top themes...\n";
	count_pool_themes;
	print time." - ...done.\n";
	
	my $new_day = get_day;
	if (($last_day eq "") or ($last_day eq $new_day)) {
		print time." - no need to archive yet.\n";
	} else {
		print time." - archiving...\n";
		archive_pool;
		print time." - done. \n"
	}
	print time." - done\n==========\n";
}


sub recount {
	my @articles = read_pool_articles;
	print "read all.\n";
	
	@articles = count_themes(@articles);
	print "counted all.\n";
	
	update_pool_articles(0, @articles);
	print "wrote all counted. end.\n";
	
	
}

1;