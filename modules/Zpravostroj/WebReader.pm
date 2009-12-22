package Zpravostroj::WebReader;

use strict;
use warnings;

use Encode;
use HTML::Encoding 'encoding_from_http_message';
use LWP::UserAgent;
use utf8;

use base 'Exporter';
our @EXPORT =qw(read_from_web read_from_webs);

use Zpravostroj::Other;

my $ua = LWP::UserAgent->new;


sub read_from_web {
	my $try_count;
	my $address = shift;
	my $not_decoding = shift;
	
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
	if ($not_decoding) {
		return ($resp->content);
	} else {
		return decode($enco => ($resp->content));
	}
}

sub read_from_webs {
	my @result;
	my_log("WebReader", "lets go!");
	
	for my $article_ref (@_) {		
		my %article = %$article_ref;
		eval {$article{html}=read_from_web($article{url})};
		if ($@) {
			my_warning("WebReader", "read_from_webs - error when reading $article{url} - $@");
		}
		push (@result, \%article);
	}
	
	my_log("WebReader", "Dan.");
	
	return @result;
}