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
	
	my %r = count_themes(1,1,1,1, @articles);
	@articles = @{$r{articles}};
	
	update_pool_articles(0, @articles);
	
	
	update_pool_themes($r{top_themes});
}

sub do_everything {
	my $start = get_pool_count;
	
	my @articles = get_all_links;
		if (!scalar @articles) {
				return $start;
	}
	
	add_new_articles(@articles);	
		
	@articles = read_from_webs(@articles);
		
	@articles = extract_texts(@articles);
		
	update_pool_articles($start, @articles);
	
	@articles = tag_texts(@articles);
		
	update_pool_articles($start, @articles);
	
	
	#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!this is WRONG AND YOU SHOULD FEEL WRONG
	my %r = count_themes(@articles);
	@articles = @{$r{articles}};
		
	
	update_pool_articles($start, @articles);
	
	update_pool_themes($r{top_themes});
	return $start;
}

sub step {
	do_everything;
	
		
	my $new_day = get_day;
	if (($last_day eq "") or ($last_day eq $new_day)) {
		#-----
	} else {
		archive_pool;
	}
	$last_day = $new_day;
}


sub recount {
	my @articles = read_pool_articles;
		
	my %r = count_themes(0.85,0.07,0.9,0.6,@articles);
	@articles = @{$r{articles}};
	
	
	update_pool_articles(0, @articles);
	
	
	update_pool_themes($r{top_themes});
	
	
}

1;