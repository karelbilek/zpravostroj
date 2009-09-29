package Zpravostroj::Database;

use strict;
use warnings;

use File::Slurp;
use File::Touch;
use Scalar::Util qw(looks_like_number);
use DateTime;
use File::Remove 'rm';

use YAML::XS;# qw(LoadFile DumpFile);

use Zpravostroj::Other;

use base 'Exporter';
our @EXPORT = qw( get_pool_count add_new_articles read_pool_articles update_pool_articles archive_pool load_anything);

my $database_dir = read_option("articles_address");
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
			return 0;
		}
	}
}

sub get_pool_filename {
	my $i = shift;
	return $pool_dir."/".$i.".yaml.bz2";
}

sub add_new_articles {
	my @articles = @_;
	my $i = get_pool_count;
	foreach my $article_ref (@articles) {
		foreach (keys %$article_ref) {
			(exists $all_article_properties{$_}) or die "forbidden article property $_";
		}
		dump_article($i, $article_ref);
		$i++;
	}
	write_file($count_file, $i);
}

sub load_article {
	my $i = shift;
	return load_anything(get_pool_filename($i));
	
}

sub load_anything {
	my $where = shift;
	use IO::Uncompress::Bunzip2;
	
	(-e $where) or die "OH MY GOD PANIC!! ".$where;
	
	my $z = new IO::Uncompress::Bunzip2($where);
	
	my $all = do {local ($/); <$z>};
	close $z;
	return Load($all);

}


sub dump_article {
	my $i = shift;
	my $what = shift;
	
	dump_anywhere(get_pool_filename($i), $what);
}

sub dump_anything {
	my $where = shift;
	my $what = shift;

	use IO::Compress::Bzip2;
	
	my $z = new IO::Compress::Bzip2($where);	
#	open my $z, ">".get_filename($i);

	print $z Dump($what);
	close $z;
}

sub read_pool_articles {
	my $begin = shift;
	$begin=0 if !$begin;
	
	my $end = shift;
	$end = (get_pool_count()-1) if !$end;
	
	return () if ($end < $begin);
	
	my @result;
	foreach my $i ($begin..$end){
		my $article = load_article($i);

		push (@result, $article);
	}
	return @result;
}

sub update_pool_articles {
	my $begin = shift;
	$begin=0 if !$begin;
	my @input = @_;
	if (@input) {
		foreach my $i ($begin..$begin+(scalar @input)-1){
			($i<get_pool_count) or die "I can't update article no. $i when there are only ".get_pool_count()." articles.";
		
			my %article = %{load_article($i)};
			my %updating = %{shift (@input)};
		
			foreach (keys %updating) {
				(exists $all_article_properties{$_}) or die "forbidden article property $_";
				$article{$_} = $updating{$_};
			}
		
			dump_article($i, \%article);
		}
	}
}



sub archive_pool {
	my $day = DateTime->today->date;
	my $archive_dir = $database_dir."/".$day;
	if (!-d $archive_dir) {
		mkdir $archive_dir or die "Dir $archive_dir cannot be created. Better luck next time, pal.";
	}
	
	my $big_zip = $archive_dir."/archive.yaml.bz2";
	
	my @articles = read_pool_articles;
	
	dump_anything($big_zip, \@articles);
	
	my $i=0;
	for my $article(@articles) {
		my $article_file=$archive_dir."/".$i.".yaml.bz2";
		
		my @keys = map ({best_form=>$_->{best_form}, lemma=>$_->{lemma}}, @{$article->{keys}});
		dump_anything($article_file, {url=>($article->{url}), keys=>\@keys, title=>$article->{title}});
		
		$i++;
	}
	
	# LETS REMOVE THE DAMNED POOL!!! HA HA HA !!!
	rm(\1, $pool_dir);
}

sub unarchive_pool {
	my $day = shift;
	
	my $archive_dir = $database_dir."/".$day;
	if (!-d $archive_dir) {
		die "Wrong date $day OR folder $archive_dir just doesn't exist.";
	}
	
	my @articles = @{load_anything($archive_dir)};
	return @articles;
}

1;