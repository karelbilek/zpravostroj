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
our @EXPORT = qw(step redo_it);



sub read_new {
	
	my @new_articles = get_all_links;
	if (!scalar @new_articles) {
		return;
	}
	my $start = write_db(pool=>1, append=>1, articles=>\@new_articles);
	
	@new_articles = read_from_webs(@new_articles);
	
	@new_articles = extract_texts(@new_articles);
	write_db(pool=>1, articles_begin=>$start, articles=>\@new_articles);
	
	@new_articles = tag_texts(@new_articles);
	write_db(pool=>1, articles_begin=>$start, articles=>\@new_articles);
	
	my $all_articles_ref = (read_db(pool=>1, articles=>1))->{articles};
	
	my %r = count_themes(0.85, 0.07, 0.9, 0.6, $all_articles_ref);
	
	write_db(%r, pool=>1)

}

sub redo_it {
	print "___\n";
	my %parameters = @_;
	my @articles;
	my $top_themes_ref;
	
	if ($parameters{pool}) {
		if (my $which = $parameters{which}) {
			@articles = (read_db(pool=>1, articles=>1, articles_one=>$which))->{articles};
		} else {
			@articles = (read_db(pool=>1, articles=>1))->{articles};
			use YAML::XS;
			print Dump \@articles;
		}
	} elsif (my $day = $parameters{day}) {
		if ($parameters{do_reading}) {
			@articles = @{(read_db(day=>$day, articles=>1, short=>1))->{articles}};
		} else {
			@articles = @{(read_db(day=>$day, articles=>1))->{articles}};
		}
	}
	
	if (!scalar @articles) {
		print "!!!!";
		return;
	}
	
	print "will read...\n";
	if ($parameters{do_reading}) {
		@articles = read_from_webs(@articles);
	}
	
	print "will extract...\n";
	if ($parameters{do_extracting}) {
		@articles = extract_texts(@articles);
	}
	
	print "will tag...\n";
	if ($parameters{do_tagging}) {
		@articles = tag_texts(@articles);
	}
	
	print "will count...\n";
	my $count_bottom_ref;
	my $all_counts_ref;
	if ($parameters{do_counting}) {
		if (my $day = $parameters{day}) {
			print "will null...\n";
			null_day_counts($day);
		}
		print "will count fo real...\n";
		my %r = count_themes(0.85, 0.07, 0.9, 0.6, \@articles);
		#my %r = count_themes(0.85, 0.07, 0.9, 100, \@articles);
		@articles = @{$r{articles}};
		$top_themes_ref = $r{top_themes};
		$count_bottom_ref = $r{count_bottom};
		$all_counts_ref = $r{all_counts};
	}
	
	if ($parameters{pool}) {
		if (my $which = $parameters{which}) {
			write_db(pool=>1, articles_begin=>$which, articles=>\@articles); #counting themes is impossible if doing just one
		} else {
			write_db(pool=>1, articles=>\@articles);
			if ($parameters{do_counting}) {
				write_db(pool=>1, top_themes=>$top_themes_ref);
			}
		}
	} elsif (my $day = $parameters{day}) {
		print "will write to db...\n";

		write_db(day=>$day, articles=>\@articles);
		if ($parameters{do_counting}) {
			write_db(day=>$day, top_themes=>$top_themes_ref, count_bottom=>$count_bottom_ref, all_counts => $all_counts_ref);
		}
	}
	print "Dan...\n";

}


sub step {
	
	my $new_day = get_day;
	my $last_day = get_global("day");
	
	
	if (($last_day) and !($last_day eq $new_day)) {
		archive_pool;
	}
	
	read_new;
	
	
	set_global("day", $new_day);
}


1;