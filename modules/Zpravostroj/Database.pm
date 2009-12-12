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
our @EXPORT = qw( write_db read_db archive_pool set_global get_global save_to_countree);

my $database_dir = read_option("articles_address");
my $pool_dir = $database_dir."/pool";
my $appendix = ".yaml.bz2";

my $countree_dir = read_option("countree_dir");


my %all_article_properties;
@all_article_properties{@{read_option("all_article_properties")}}=();

my $archive="archive.yaml.bz2";
my $topthemes = "top_themes.yaml.bz2";

sub read_db {
	
	my %parameters = @_;
	my %results;
	
	if ($parameters{pool} or (exists $parameters{day} and $parameters{day} eq get_day)) {
		#reading pool
		if ($parameters{top_themes}) {
			my $arr_ref;
			$arr_ref = load_anything($pool_dir."/".$topthemes)
				or $arr_ref = [];
			$results{top_themes} = $arr_ref;
		}
		
		if ($parameters{articles}) {
			my @res;
			
			my $begin = (exists $parameters{articles_begin}) ? $parameters{articles_begin} : 0;
			
			my $end = (exists $parameters{articles_end}) ? $parameters{articles_end} : (get_count("pool")-1);
			
			if (exists $parameters{articles_one}) {
				$begin = $end = $parameters{articles_one};
			}
			
			foreach my $i ($begin..$end){
				my $article = load_anything($pool_dir."/".$i.$appendix);
				if (!$article) {
					$article = \%all_article_properties;
				}
				push (@res, $article);
			}
			$results{articles} = \@res;
		}
		
		if ($parameters{count}) {
			$results{count} = get_count("pool");
		}
		
	} elsif (my $day = $parameters{day}) {
		#reading from archive
		if ($parameters{top_themes}) {
			my $arr_ref;
			$arr_ref = load_anything($database_dir."/".$day."/".$topthemes)
				or $arr_ref = [];
			$results{top_themes} = $arr_ref;
		}
		
		if ($parameters{count}) {
			$results{count} = get_count($day);
		}
		
		if ($parameters{articles}) {
			if ($parameters{short}) {
				my @res;

				my $begin = (exists $parameters{articles_begin}) ? $parameters{articles_begin} : 0;

				my $end = (exists $parameters{articles_end}) ? $parameters{articles_end} : (get_count($day)-1);

				if (exists $parameters{articles_one}) {
					$begin = $end = $parameters{articles_one};
				}

				foreach my $i ($begin..$end){
					my $article = load_anything($database_dir."/".$day."/".$i.$appendix);
					if (!$article) {
						$article = \%all_article_properties;
					}
					push (@res, $article);
				}
				$results{articles} = \@res;
			} else {
				
				my $arr_ref;
				$arr_ref = load_anything($database_dir."/".$day."/".$archive)
					or $arr_ref = [];

				if ((exists $parameters{articles_begin}) and exists $parameters{articles_end}) {
					my @splited = @{$arr_ref}[$parameters{articles_begin}..$parameters{articles_end}];
					$results{articles} = \@splited;
				} else {
					$results{articles} = $arr_ref;
				}
				
			}
		}
	}
	return \%results;
}

sub write_db {
	my %parameters = @_;
	my $res;
	if ($parameters{pool}) {
		if (exists $parameters{articles}) {
			my $i=0;
			if ($parameters{append}) {
				
				$res = my $i = get_count("pool");
				
			} elsif ($parameters{articles_begin}) { 
				
				$i = $parameters{articles_begin};
			}
			
			foreach my $article_ref (@{$parameters{articles}}) {
				dump_anything($pool_dir."/".$i.$appendix, $article_ref);
				$i++;
			}
		}
		if (exists $parameters{top_themes}) {
			dump_anything($pool_dir."/".$topthemes, $parameters{top_themes});
		}
	} elsif (my $day = $parameters{day}) {
		#it ALWAYS rewrites EVERYTHING - so no appending / rewriting
		get_count($day); #this is just for creating directories
		
		if (exists $parameters{articles}) {
			dump_anything($database_dir."/".$day."/".$archive, $parameters{articles});
			
			for my $i (0..$#{$parameters{articles}}){
				my $article = $parameters{articles}->[$i];
				my @keys = map ({best_form=>$_->{best_form}, lemma=>$_->{lemma}}, @{$article->{top_keys}});
				dump_anything($database_dir."/".$day."/".$i.$appendix, {url=>($article->{url}), keys=>\@keys, title=>$article->{title}});
			}	#saves some little info about the article extra, rest to the megaarchive 
			
			if (!exists $parameters{append_to_countree}) {
				#TODO
			}
			
			
		}
		if (exists $parameters{top_themes}) {
			dump_anything($database_dir."/".$day."/".$topthemes, $parameters{top_themes});
		}
	}
	return $res; #sometimes i DO want to return something
}

sub save_to_countree {
	my $word = shift;
	my $count = shift;
	
	#TODO more files with the same name
	#TODO shorter/longer problem
	#TODO .... hello, more than two files?????
	
	#$countree_dir
	if (!-d $countree_dir) {
		mkdir $countree_dir;
		open (my $fh, ">", $countree_dir."/c".$word);
		print {$fh} $count;
		return;
	}
	
	my @files = <$countree_dir/*>;
	

	
	if (!@files) {
		open (my $fh, ">", $countree_dir."/c".$word);
		print {$fh} $count;
		return;
	}
	
	
	
	my @node_letters;
	my $node_address = $countree_dir;
	my @word_letters = split(//, $word);
	#my $saved = false;
	while (true) {
		if ((grep {/\/d[^\/]*$/} @files) == 0) {
			my ($first_file) = grep {/\/c[^\/]*$/} @files;
			my $first_word =~ s/^.*\/c([^\/]*)$/$1/;
			
			if ($first eq $word) {
				open (my $inp, "<", $first_file);
				chomp(my $numb = <$inp>);
				$numb+=$count;
				close $inp;
				open (my $outp, ">", $first_file);
				print {$outp} $numb;
				return;
			}
			
			my @first_letters = split (//, $first);
			
			my $i = @node_letters;
			my $dirs = $node_address;
	
			while (($i < @first) and ($i < @second) and ($first_letters[$i] eq $word_letters[$i])) {
		
				$dirs.="d".$first_letters[$i]."/";
				mkdir $dirs;
				$i++;
			}
			
			my $new_first_dir = $dirs."d".$first_letters[$i];
			mkdir $new_first_dir;
	
			my $new_word_dir = $dirs."d".$word_letters[$i];
			mkdir $new_word_dir;
	
			rename $node_address."/c".$first , $new_first_dir."/c".$first_word;
			
			open (my $fh, ">", $new_second_dir."/c".$second);
			print {$fh} $count;
			
			return ;
		}
		
	}
	
	
	
	
	if ((my @first = (grep {/\/c[^\/]*$/} @files))==1 and (grep {/\/d[^\/]*$/} @files) == 0) {
		#there is just one file in root
		my $first = $first[0];
		$first=~ s/^.*\/c([^\/]*)$/$1/;
		my $new = resolve_countree_conflict($first, $word, "");
		open (my $fh, ">", $new);
		print {$fh} $count;
		return;
	} 
	
	my $base;
	my @word = split (//, $word);
	#while (not ((my @first = (grep {/\/c[^\/]*$/} @files))==1 and (grep {/\/d[^\/]*$/} @files) == 0));
}

sub resolve_countree_conflict {
	my $first = shift;
	my @first = split (//,$first);
	my $second = shift;
	my @second = split (//,$second);
	my $base = shift;
	my @base = split (//,$base);
	my $base_address = $countree_dir.join("", (map {("/d", $_)} @base))."/"; #works even when base is empty
	
	my $i = @base;
	my @conflict;
	my $dirs = $base_address;
	
	while (($i < @first) and ($i < @second) and ($first[$i] eq $second[$i])) {
		push @conflict, $first[$i];
		
		$dirs.="d".$first[$i]."/";
		mkdir $dirs;
		$i++;
	}
	
	
	my $new_first_dir = $dirs."d".$first[$i];
	mkdir $new_first_dir;
	my $new_second_dir = $dirs."d".$second[$i];
	mkdir $new_second_dir;
	
	#TODO
	rename $base_address."/c".$first , $new_first_dir."/c".$first;
	return $new_second_dir."/c".$second;
}

sub get_count {
	my $what = shift;
	my $dir = $database_dir."/".$what;
	if (!-d $dir) {
		if (!-d $database_dir) {
			mkdir $database_dir or die "making directory $database_dir not succesful.";
		}
		mkdir $dir or die "making directory $pool_dir not succesful.";
		return 0;
	} else {
		
		my $count=0;
		$count = scalar grep(/(^|\/)\d+\.yaml\.bz2$/, <$dir/*.yaml.bz2>);
		return $count;
	}
}


sub load_anything {
	
	
	my $where = shift;
	
	my $no_existence_warning = shift;
	
	if (!-e $where) {
		my_warning("load_anything - $where does not exist!!") unless ($no_existence_warning);
		return 0;
	}
	
	my $z = new IO::Uncompress::Bunzip2($where);
	
	if (!$z) {
		my_warning("load_anything - $where cannot be read for weird reason...");
		return 0;
	}
	
	my $all = do {local ($/); <$z>};
	close $z;
	
	my $result;
	if ($all) {
		eval {$result = Load($all)};
		
		if ($@) {
			my_warning("load_anything - some weird error given when loading $where - ".$@." :-(");
			return 0;
		}
		return $result;
	} else {
		return 0;
	}

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


sub archive_pool {
	
	my $day = get_day(1);
	
	my %r = %{read_db(pool=>1, top_themes=>1, articles=>1)};
	
	write_db(%r, day=>$day);
	
	`rm -r $pool_dir`;
}

1;