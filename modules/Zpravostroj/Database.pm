package Zpravostroj::Database;

use strict;
use warnings;

use File::Touch;
use File::Remove 'rm';
use File::Slurp;
use Scalar::Util qw(looks_like_number);
use YAML::XS;# qw(LoadFile DumpFile);
use File::Copy;
use File::Touch;
use IO::Uncompress::Bunzip2;
use IO::Compress::Bzip2;

use Zpravostroj::Other;
use Zpravostroj::TopThemes;


use base 'Exporter';
our @EXPORT = qw( get_pool_count add_new_articles read_pool_articles update_pool_articles archive_pool unarchive load_anything count_pool_themes);

my $database_dir = read_option("articles_address");
my $pool_dir = $database_dir."/pool";
my $count_file = $pool_dir."/count";

my %all_article_properties;
@all_article_properties{@{read_option("all_article_properties")}}=();

my $archive="archive.yaml.bz2";
my $topthemes = "top_themes.yaml.bz2";




sub get_pool_count {
	my_log ("get_pool_count - entering");
	if (!-e  $count_file) {
		if (!-d $pool_dir) {
			if (!-d $database_dir) {
				mkdir $database_dir or die "making directory $database_dir not succesful.";
			}
			mkdir $pool_dir or die "making directory $pool_dir not succesful.";
		}
		
		
		touch $count_file or die "touching $count_file not succesful.";
		my_log ("get_pool_count - creating");
		return 0;
	} else {
		

		
		my $count = read_file($count_file);
		if (looks_like_number($count)) {
			my_log ("get_pool_count - returning normal count");
			return $count;
		} else {
			my_log ("get_pool_count - weird zero");
			return 0;
		}
	}
}

sub set_pool_count {
	my $i=shift;
	write_file($count_file, $i);
}

sub get_pool_filename {
	my $i = shift;
	return $pool_dir."/".$i.".yaml.bz2";
}

sub add_new_articles {
	my_log ("add_new_articles - entering");
	my @articles = @_;
	my $i = get_pool_count;
	foreach my $article_ref (@articles) {
		foreach (keys %$article_ref) {
			(exists $all_article_properties{$_}) or die "forbidden article property $_";
		}
		dump_article($i, $article_ref);
		$i++;
	}
	set_pool_count($i);
	my_log ("add_new_articles - done");
	
}

sub load_article {
	my $i = shift;
	return load_anything(get_pool_filename($i));
	
}

sub load_anything {
	my $where = shift;
	
	if (!-e $where) {
		my_log("load_anything - WARNING WARNING - $where does not exist!!");
		return "";
	}
	
	my $z = new IO::Uncompress::Bunzip2($where);
	
	if (!$z) {
		my_log("load_anything - WARNING WARNING - $where cannot be read for weird reason...");
		return "";
	}
	
	my $all = do {local ($/); <$z>};
	close $z;
	
	my $result;
	eval {$result = Load($all)};
	if ($@) {
		my_log("load_anything - WARNING WARNING - some weird error given when loading $where - ".$@." :-(");
		return "";
	}
	
	return $result;

}


sub dump_article {
	my $i = shift;
	my $what = shift;
	
	dump_anything(get_pool_filename($i), $what);
}

sub dump_anything {
	my $where = shift;
	my $what = shift;

	
	my $z = new IO::Compress::Bzip2($where);
	if (!$z) {
		my_log("dump_anything - WARNING WARNING - cannot create file ".$where);
		return;
	}	
	
	if (!$what) {
		my_log ("dump_anything - WARNING WARNING - \$what is empty :-(");
		return;
	}

	my $dumped;
	eval {$dumped = Dump($what)};
	if ($@) {
		my_log("dump_anything - WARNING WARNING - cannot dump when trying to write to ".$where."- ".$@." :-(");
	}
	
	print $z $dumped unless (!$what);
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



sub count_pool_themes {
	
	my $where = $pool_dir."/".$topthemes;
	my @articles = read_pool_articles;
			#-------------------------------FUTURE:::::add some buffering so I dont have to read it again
	my @themes = top_themes(@articles);
	dump_anything($where, \@themes);
}



sub update_pool_articles {
	my_log ("update_pool_articles - entering");
	
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
	my_log ("update_pool_articles - escaping");
}



sub archive_pool {
	my_log ("archive_pool - entering");
	
	my $day = get_day();
	my $archive_dir = $database_dir."/".$day;
	if (!-d $archive_dir) {
		mkdir $archive_dir or die "Dir $archive_dir cannot be created. Better luck next time, pal.";
	}
	
	my $big_zip = $archive_dir."/".$archive;
	
	my @articles = read_pool_articles;
	
	dump_anything($big_zip, \@articles);
	
	my_log ("archive_pool - everything dumped to big zip, lets extract extra keys...");
	
	
	my $i=0;
	for my $article(@articles) {
		my $article_file=$archive_dir."/".$i.".yaml.bz2";
		
		my @keys = map ({best_form=>$_->{best_form}, lemma=>$_->{lemma}}, @{$article->{keys}});
		dump_anything($article_file, {url=>($article->{url}), keys=>\@keys, title=>$article->{title}});
		
		$i++;
	}
	
	my_log ("archive_pool - OK, done, now let's copy the topthemes file...");	
	copy($pool_dir."/".$topthemes, $archive_dir."/".$topthemes);
	
	my_log ("archive_pool - done. Now lets remove the pool...");
	rm(\1, $pool_dir);
	my_log ("archive_pool - ...done. Exiting.");
}

sub unarchive {
	my_log ("unarchive - this should not get called.... yet.");
	my $day = shift;
	
	my $archive_dir = $database_dir."/".$day;
	if (!-d $archive_dir) {
		die "Wrong date $day OR folder $archive_dir just doesn't exist.";
	}
	
	my $archive_file = $archive_dir."/".$archive;
	
	my $what = load_anything($archive_file);
	
	my @articles = @{$what};
	return @articles;
}

1;