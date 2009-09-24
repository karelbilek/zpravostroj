use strict;
use utf8;
use News::Hajic_lemmatizer;
use Encode;


while (<STDIN>) { 
	my $r=$_;
	chomp $r;
	$r = decode("utf8", $r);
	my @v = lemmatize($r);
	print encode("utf8",$v[0]);
	print "\n";
}