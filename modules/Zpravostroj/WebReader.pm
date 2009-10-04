package Zpravostroj::WebReader;

use strict;
use warnings;

use Encode;
use HTML::Encoding 'encoding_from_http_message';
use LWP::UserAgent;

use base 'Exporter';
our @EXPORT =qw(read_from_web read_from_webs);

use Zpravostroj::Other;

my $ua = LWP::UserAgent->new;


sub read_from_web {
	my $try_count;
	my $address = shift;
	
	my $resp;
	
	do {
		$resp = $ua->get( $address );
		$try_count++;
	} while ($try_count<=5 and $resp->code != 200);
		#try to download it 5 times, if server is not responsive
	
	if ($resp->code != 200) {
		return "";
	}
	
	my $enco = encoding_from_http_message($resp);
	return decode($enco => ($resp->content));
}

sub read_from_webs {
	my_log("read_from_webs - entering...");
	
	my @result = map ({my %article=%$_; $article{html}=read_from_web($article{url}); \%article} @_);
	
	my_log("read_from_webs - ...done. exiting.");
	return @result;
}