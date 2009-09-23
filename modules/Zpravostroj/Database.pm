package Zpravostroj::Database;

use strict;
use warnings;

use File::Slurp;
use File::Touch;

use YAML::XS qw(LoadFile DumpFile);

use Zpravostroj::Other;

use base 'Exporter';
our @EXPORT = qw( get_pool_count add_new_articles read_articles update_articles);

my $database_dir = read_option("data_address")."/articles";
my $pool_dir = $database_dir."/pool";
my $count_file = $pool_dir."/count";

my %all_article_properties;
@all_article_properties{@{read_option("all_article_properties")}}=();

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
	my @articles = @_;
	my $i = get_pool_count;
	foreach my $article_ref (@articles) {
		foreach (keys %$article_ref) {
			(exists $all_article_properties{$_}) or die "forbidden article property $_";
		}
		DumpFile($pooldir."/".$i, $article_ref);
		$i++;
	}
	write_file($count_file, $i);
}

sub read_articles {
	my $begin = shift;
	$begin=0 if !$begin;
	my @result;
	foreach my $i ($begin..(get_pool_count-1)){
		push (@result, LoadFile($pooldir."/".$i));
	}
	return @result;
}

sub update_articles {
	my $begin = shift;
	$begin=0 if !$begin;
	my @input = @_;
	foreach my $i ($begin..$begin+(scalar @input)){
		($i<get_pool_count) or die "I can't update article no. $i when there are only ".get_pool_count." articles.";
		
		my %article = %{LoadFile($pooldir."/".$i)};
		my %updating = %{shift (@input)};
		
		foreach (keys %updating) {
			(exists $all_article_properties{$_}) or die "forbidden article property $_";
			$article{$_} = $updating{$_};
		}
		
		DumpFile($pooldir."/".$i, \%article};
	}
}