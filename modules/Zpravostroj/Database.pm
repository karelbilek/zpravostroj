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
use utf8;

use Zpravostroj::Other;


use base 'Exporter';
our @EXPORT = qw( get_pool_count add_new_articles read_pool_articles save_key_count update_pool_themes archive_pool unarchive load_anything update_pool_articles set_global get_global get_top_themes);

my $database_dir = read_option("articles_address");
my $pool_dir = $database_dir."/pool";

my $themes_dir = read_option("themes_dir");

my %all_article_properties;
@all_article_properties{@{read_option("all_article_properties")}}=();

my $archive="archive.yaml.bz2";
my $topthemes = "top_themes.yaml.bz2";

sub get_top_themes {
	my $day = shift;
	my $today = get_day;
	my $archive_dir;
	
	if (!$day or $today eq $day) {
		$archive_dir = $pool_dir;
	} else {
		$archive_dir = $database_dir;
		if (-d $archive_dir) {
			return ();
		}
	}
	
	
	return @{load_anything($archive_dir."/".$topthemes)};
}

sub save_key_count {
	my ($key, $day, $count) = @_;
	
	if (!$key) {
		my_warning("save_key_count - key is empty :-(");
		return;
	}
	
	
	my $first_letter = substr($key,0,1);
	my $two_letters = $first_letter;
	if (length $key >= 2) {
		$two_letters .= substr($key,1,1);
	}
	
	my $first_dir = $themes_dir."/".$first_letter;
	my $second_dir = $first_dir."/".$two_letters;
	my $key_file = $second_dir."/".$key.".yaml.bz2";
	
	mkdir $themes_dir;
	mkdir $first_dir;
	mkdir $second_dir;
	
	my %key_hash;
	if (my $key_ref=load_anything($key_file, 1)) {
		%key_hash = %$key_ref;
	} else {
		$key_hash{key} = $key;
	}
	
	$key_hash{counts}->{$day}=$count;
	dump_anything($key_file, \%key_hash);
}

sub get_pool_count {
	my_log ("get_pool_count - entering");
	if (!-d $pool_dir) {
		if (!-d $database_dir) {
			mkdir $database_dir or die "making directory $database_dir not succesful.";
		}
		mkdir $pool_dir or die "making directory $pool_dir not succesful.";
		return 0;
	} else {
		
		my $count=0;
		eval {$count = scalar grep(/(^|\/)\d+\.yaml\.bz2$/, <$pool_dir/*.yaml.bz2>)};
		
		if ($@) {
			my_warning("get_pool_count - weird error getting pool count - $@");
		}
		return $count;
	}
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
	my_log ("add_new_articles - done");
	
}

sub load_article {
	my $i = shift;
	return load_anything(get_pool_filename($i));
	
}

sub load_anything {
	
	
	my $where = shift;
	
	my $no_existence_warning = shift;
	
	if (!-e $where) {
		my_warning("load_anything - $where does not exist!!") unless ($no_existence_warning);
		return \%all_article_properties; #trick - I return EMPTY article
	}
	
	my $z = new IO::Uncompress::Bunzip2($where);
	
	if (!$z) {
		my_warning("load_anything - $where cannot be read for weird reason...");
		return \%all_article_properties; #trick - I return EMPTY article
	}
	
	my $all = do {local ($/); <$z>};
	close $z;
	
	my $result;
	if ($all) {
		eval {$result = Load($all)};
		
		if ($@) {
			my_warning("load_anything - some weird error given when loading $where - ".$@." :-(");
			return \%all_article_properties; #trick - I return EMPTY article
		}
		return $result;
	} else {
		return \%all_article_properties; #trick - I return EMPTY article
	}

}


sub dump_article {
	my $i = shift;
	my $what = shift;
	
	dump_anything(get_pool_filename($i), $what);
}

sub dump_anything {
	my $where = shift;
	my $what = shift;
	

	# open my $z, "| bzip2 > $where";
	my $z = new IO::Compress::Bzip2($where);
	if (!$z) {
		my_warning("dump_anything - cannot create file ".$where);
		return;
	}	
	
	if (!$what) {
		my_warning ("dump_anything - \$what is empty :-(");
		return;
	}

	my $dumped;
	eval {$dumped = Dump($what)};
	if ($@) {
		my_warning("dump_anything - cannot dump when trying to write to ".$where."- ".$@." :-(");
	}
	
	print $z $dumped unless (!$what);
	close $z;
}

sub set_global {
	my $name=shift;
	my $contents= shift;
	open my $fh, ">", $database_dir."/".$name;
	print $fh $contents;
	close $fh;
}

sub get_global {
	my $name = shift;
	if (-e $database_dir."/".$name) {
		open my $fh, "<", $database_dir."/".$name;
		chomp (my $c = <$fh>);
		close $fh;
		return $c;
	} else {
		return "";
	}
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

		push (@result, $article) if (defined $article);
			#if some article is unreadable, this will "delete" him from database
	}
	return @result;
}



sub update_pool_themes {
	my $themes = shift;
	if (!$themes) {
		die "SHIT\n";
	}
	my $filename = shift;
	if (!$filename) {
		$filename = $topthemes;
	} else {
		$filename = $filename.".yaml.bz2";
	}
	
	my $where = $pool_dir."/".$filename;
	dump_anything($where, $themes);
}



sub update_pool_articles {
	my_log ("update_pool_articles - entering");
	
	my $begin = shift;
	$begin=0 if !$begin;
	my @input = @_;
	if (@input) {
		foreach my $i ($begin..$begin+(scalar @input)-1){
		
			my %article = %{shift (@input)};
		
			foreach (keys %article) {
				#(exists $all_article_properties{$_}) or die "forbidden article property $_";
				#
				if (!exists $all_article_properties{$_}) {delete $article{$_}};
			}
		
			dump_article($i, \%article);
		}
	}
	my_log ("update_pool_articles - escaping");
}



sub archive_pool {
	my_log ("archive_pool - entering");
	
	my $day = get_day(1);
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
		
		my @keys = map ({best_form=>$_->{best_form}, lemma=>$_->{lemma}}, @{$article->{top_keys}});
		dump_anything($article_file, {url=>($article->{url}), keys=>\@keys, title=>$article->{title}});
		
		$i++;
	}
	
	my $topthemes_file = $archive_dir."/".$topthemes;
	
	my_log ("archive_pool - OK, done, now let's copy the topthemes file...");	
	copy($pool_dir."/".$topthemes, $topthemes_file);
	
	my @themes = @{load_anything($topthemes_file)};
	splice (@themes, 100)if @themes>100;
	
	for my $theme(@themes) {
		save_key_count($theme->{lemma}, $day, scalar @{$theme->{articles}});
	}
	
	
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