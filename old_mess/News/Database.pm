package News::Database;

use 5.008;
use strict;
use warnings;

use Encode;
use News::Other;
use File::Touch;
use File::Copy;
use File::Slurp;

use Scalar::Util qw(looks_like_number);



use base 'Exporter';
our @EXPORT = qw(getPoolCount addNewArticles transformPool getPoolArticle archive);

my $poolDir = "Database/pool/";

sub my_read_file{
	my ($number, $source) = @_;
	
	my $filename = $poolDir."/".$number."/".$source;
	
	(-e $filename) or die "file $filename does not exist";

	return decode("utf8", read_file($filename));
}

sub my_write_file{
	my ($number, $target, $what) = @_;
	my $filename = $poolDir."/".$number."/".$target;
	
	write_file($filename, encode("utf8", $what));
}

sub getPoolCount {
	
	if (-d $poolDir) {
		if (-e $poolDir."/count") {
			my $count = read_file($poolDir."/count");
			if (looks_like_number($count)) {
				return $count;
			}
		}
	}
	mkdir $poolDir;
	touch $poolDir."/count";
	return 0;
}

sub transformPool {
	my $firstcount = shift;
	my $subref = shift;
	my $source = shift;
	my $target = shift;
	my %options = @_;
	my $maxcount = (getPoolCount() - 1);
	
	if (($options{AT_ONCE}) and ($options{HASH})) {
		die "AT_ONCE and HASH options are not compactible.";
	}
	
	if (($options{DUMP}) and ($options{HASH})) {
		die "DUMP and HASH options are not compactible (it doesn't make much sense to have them together anyway).";
	}
	
		
	my @in;
	

	for my $number ($firstcount..$maxcount) {
		if ($options{FILE}) {
			my $filename = $poolDir."/".$number."/".$source;
			
			(-e $filename) or die "file ".$filename."does not exists!";
			push (@in, $filename);
		} else {
			push (@in, my_read_file($number, $source));
		}
	}
	
	my @out;
	if ($options{AT_ONCE} or $options{DUMP}) {
		# @out=();
		# while (scalar (@in)) {
		# 	my @sin = (splice(@in,0,1));
		# 	my @sout = ($subref->(@sin));
		# 	@out = (@out, @sout);
		# }
		@out = $subref->(@in);
	} else {
		if ($options{HASH}) {
			@out = map ({my %hh = $subref->($_); \%hh;} @in);
		} else {
			@out = map ($subref->($_), @in);
		}
	}	
	
	
	if ($options{DUMP}) {
		my $dumpName = $poolDir."/".$target.".dump";
		write_file($dumpName, encode("utf8", join("\n", @out)));
	} else {
		for my $number ($firstcount..$maxcount) {
			my $dirName = $poolDir."/".$number;
			if ($options{HASH}) {
				(ref ($target) eq "ARRAY") or die "target must be array reference when using HASH option." ;
				my @targets = @$target;
				my %hash = %{shift @out};
				foreach my $savetarget (@targets) {
					my_write_file($number, $savetarget, $hash{$savetarget});
				}
			} else {
				my_write_file($number, $target, shift @out);
			}
		}	
	}
}

sub addNewArticles {
	
	
	my @articles = @_;
	my $number = getPoolCount;
	write_file($poolDir."/count", $number+scalar(@articles));
	
	for (@articles) {
		my %info = %{$_};
		my $dirName = $poolDir."/".$number;
		mkdir $dirName;
		
		for my $key (keys %info) {
			write_file($dirName."/".$key, encode("utf8", $info{$key}));
		}

		$number++;
	}

}

sub getPoolArticle {
	my $number = shift;
	my @wanted = @_;
		
	($number < getPoolCount) or die "Too high number, fella.";
	
	
	my %res;
	
	for my $what (@wanted) {
		$res{$what} = my_read_file($number,$what);
	}
	
	return %res;
}

sub archive {
	#more stuff will be here, probably :)
	my $todayDir = "Database/".todayString;
	(! (-d $todayDir))
		or die "Cannot archive to the same place twice";
	
	move ($poolDir, $todayDir);
	
	#all for now..... will be more complicated, MAYBE....?
}

1;