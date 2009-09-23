package Zpravostroj::Database;

use strict;
use warnings;

use File::Slurp;
use File::Touch;

use Zpravostroj::Other;


my $database_dir = read_option("data_address")."/articles";
my $pool_dir = $database_dir."/pool";
my $count_file = $pool_dir."/count";

my @all_article_options = @{read_option("all_article_options")};

sub get_pool_count {
	if (-d $pool_address) {
		if (-e  $count_file) {
			my $count = read_file($count_file);
			if (looks_like_number($count)) {
				return $count;
			}
		}
	} else {
		mkdir $pool_dir;
		touch $count_file;
		return 0;
	}
}

sub add_new_articles {
	
}