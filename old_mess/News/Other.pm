package News::Other;

use strict;
use warnings;
use base 'Exporter';
use File::Slurp;
use File::Touch;
use LWP::UserAgent;
use utf8;
use HTML::Encoding 'encoding_from_http_message';
use Encode;
use DateTime;


our @EXPORT = qw(chomped splitSize fileToHash isParagraph isBanned readFromWeb allSubThemes makeNormalWord encodeArr decodeArr todayString isNumber isWord);
sub chomped{chomp @_;@_;}

sub todayString{
	return DateTime->today->date;
}

#workaround for weird split behaviour in scalar context
#esentially, split in scalar context stores the array into @_ - what is more, 
sub splitSize{my $r=shift;my @ol=split (" ", $r);return scalar @ol;}


sub allSubThemes {
	my $delimit=shift;
	my @res;
	foreach my $theme (@_) {
		my @themes = split($delimit, $theme);
		while (@themes) {
			my @themes_c = @themes;
			while (@themes_c) {
				my $joined = join($delimit, @themes_c);
				push(@res, $joined) unless ($joined eq $theme);
				pop @themes_c;
			}
			shift @themes;
		}
	}
	return @res;
}

sub isParagraph{
	my $text = shift;
	if ($text =~ /^[^\.\?!]+[\.\?!][^\.\?!]+[\.\?!]/) {
		return 1;
	} else {
		if ($text =~ /^[^\.\?!]{90,}[\.\?!]/) {
			return 1;
		} else {
			return 0;
		}
	}
}


sub fileToHash{
	my $r = shift;
	touch($r);
	my %hash = (map ((decode("utf8",$_) => 1), chomped(read_file($r))));
	delete $hash{""};
	return %hash;
}

my $ua = LWP::UserAgent->new;

sub isNumber {
	my $what = shift;
	return ($what =~ /^[0-9]+$/);
}

sub encodeArr{
	my $enc = shift;
	my @arr = @_;
	return map (encode($enc, $_), @arr);
}

sub decodeArr{
	my $enc = shift;
	my @arr = @_;
	return map (decode($enc, $_), @arr);
}

sub readFromWeb{
	my $pokusCount;
	my $address = shift;
	my %options = @_;
	
	my $resp;
	do {
		$resp = $ua->get( $address );
		$pokusCount++;
	} while ($pokusCount<=5 and $resp->code != 200);
		#try to download it 5 times, if server is not responsive
	
	if ($resp->code != 200) {
		return "";
	}
	
	my $enco = encoding_from_http_message($resp);
	if (!$options{"encoding"}) {
		return decode($enco => ($resp->content));
	} else {
		return decode($options{"encoding"} => ($resp->content));
	}
}

my $banned_read=0;
my %banned=();

my $czechs="ÁČĎĚÉÍŇÓŘŠŤÚŮÝŽáčďěéíňóřšťúůýž";

sub isWord {
	my $what=shift;
	return ($what =~ /^[A-Za-z0-9$czechs]+$/);
}

sub isBanned{
	if (!$banned_read) {
		%banned=fileToHash("Other_info/banned.txt");
		$banned_read=1;
	}
	my $what=shift;
	return ($banned{$what});
}

sub makeNormalWord {
	if (!$banned_read) {
		%banned=fileToHash("Other_info/banned.txt");
		$banned_read=1;
	}
	
    my $text = shift;
    return unless defined $text;
    
    $text =~ s/^([A-Za-z$czechs ]*).*$/$1/;
        #remove all weird letters
    
    $text =~ s/ *$//;
        #remove final space(s)
	
    return $text if (((length ($text))>=3) and !($banned{$text}));
}
