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
our @EXPORT = qw(do_everything recount step retag_recount redo_all_on_one);

my $last_day="";

sub redo_all_on_one {
	my $which = shift;
	my ($article) = read_pool_articles($which, $which);
	
	extract_texts($article);
	
	update_pool_articles($which, $article);
	
	($article) = tag_texts($article);
	
	update_pool_articles($which, $article);
	
	my %r = count_themes($article);
	($article) = @{$r{articles}};
	
	
	update_pool_articles($which, $article);
}

sub retag_recount {
	my @articles = read_pool_articles;
	@articles = extract_texts(@articles);
	
	
	
	@articles = tag_texts(@articles);
	
	my %r = count_themes(@articles);
	@articles = @{$r{articles}};
	
	update_pool_articles(0, @articles);
	
	
	update_pool_themes(@{$r{themes}});
}

sub do_everything {
	my $start = get_pool_count;
	
	my @articles = get_all_links;
	my_log("do_everything - got all URLs");
	if (!scalar @articles) {
		my_log("do_everything - nothing to add");
		return $start;
	}
	
	add_new_articles(@articles);	
	my_log("do_everything - wrote all URLs");
	
	@articles = read_from_webs(@articles);
	my_log("do_everything - downloaded all webs.");
	
	@articles = extract_texts(@articles);
	my_log("do_everything - extracted all. takes a while...");
	
	update_pool_articles($start, @articles);
	
	@articles = tag_texts(@articles);
	my_log("do_everything - hello again. tagged all");
	
	update_pool_articles($start, @articles);
	
	my %r = count_themes(@articles);
	@articles = @{$r{articles}};
	my_log("do_everything - counted all");
	
	
	update_pool_articles($start, @articles);
	my_log("do_everything - wrote everything.");
	
	return $start;
}

sub step {
	my_log("step - starting");
	do_everything;
	my_log("step - counting top themes...");
	update_pool_themes(@{$r{themes}});
	my_log("step - ...done");
	
	my $new_day = get_day;
	if (($last_day eq "") or ($last_day eq $new_day)) {
		my_log("step - no need to archive yet.");
	} else {
		my_log("step - archiving...");
		archive_pool;
		my_log("step - archiving done.");
	}
	$last_day = $new_day;
	my_log("step - done. going to sleep.");
}


sub recount {
	my_log("recount - start");
	my @articles = read_pool_articles;
	my_log("recount - read, gonna count");
	
	my %r = count_themes(@articles);
	@articles = @{$r{articles}};
	my_log("recount - counted, gonna update");
	
	
	update_pool_articles(0, @articles);
	
	my_log("recount - updated, gonna count pool themes");
	
	update_pool_themes(@{$r{themes}});
	my_log("recount - counted, end");
	
	
}

1;