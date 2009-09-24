package Zpravostroj::Database;

use strict;
use warnings;

use File::Slurp;
use File::Touch;
use Scalar::Util qw(looks_like_number);

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
	if (!-e  $count_file) {
		if (!-d $pool_dir) {
			if (!-d $database_dir) {
				mkdir $database_dir or die "making directory $database_dir not succesful.";
			}
			mkdir $pool_dir or die "making directory $pool_dir not succesful.";
		}
		touch $count_file or die "touching $count_file not succesful.";
		return 0;
	} else {
		my $count = read_file($count_file);
		if (looks_like_number($count)) {
			return $count;
		} else {
			die "count doesn't look like number.";
		}
	}
}

sub get_filename {
	my $i = shift;
	return $pool_dir."/".$i.".yaml";
}

sub add_new_articles {
	my @articles = @_;
	my $i = get_pool_count;
	foreach my $article_ref (@articles) {
		foreach (keys %$article_ref) {
			(exists $all_article_properties{$_}) or die "forbidden article property $_";
		}
		DumpFile(get_filename($i), $article_ref);
		$i++;
	}
	write_file($count_file, $i);
}

sub read_articles {
	my $begin = shift;
	$begin=0 if !$begin;
	my @result;
	foreach my $i ($begin..(get_pool_count()-1)){
		push (@result, LoadFile(get_filename($i)));
	}
	return @result;
}

sub update_articles {
	my $begin = shift;
	$begin=0 if !$begin;
	my @input = @_;
	foreach my $i ($begin..$begin+(scalar @input)){
		($i<get_pool_count) or die "I can't update article no. $i when there are only ".get_pool_count()." articles.";
		
		my %article = %{LoadFile(get_filename($i))};
		my %updating = %{shift (@input)};
		
		foreach (keys %updating) {
			(exists $all_article_properties{$_}) or die "forbidden article property $_";
			$article{$_} = $updating{$_};
		}
		
		DumpFile(get_filename($i), \%article);
	}
}

1;