package Zpravostroj::WebReader;

use strict;
use warnings;

use Encode;
use HTML::Encoding 'encoding_from_http_message';
use LWP::UserAgent;

use base 'Exporter';
our @EXPORT =qw(read_from_web read_from_webs);


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
	return map ((%$_, html=>read_from_web($_->{url})), @_);
}