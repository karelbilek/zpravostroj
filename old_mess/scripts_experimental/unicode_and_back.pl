use Encode;
use File::Slurp;
use XML::RAI;
use LWP::UserAgent;
use HTML::Encoding 'encoding_from_http_message';

my $ua = LWP::UserAgent->new;

my $resp = $ua->get("http://www.blesk.cz/rss");

my $decoded = decode(encoding_from_http_message($resp) => ($resp->content));

my $encoded = encode ("utf8", $decoded);

XML::RAI->parse($resp->content);