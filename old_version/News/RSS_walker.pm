package News::RSS_walker;

use warnings;
use strict;
use HTTP::Request;
use File::Slurp;
use XML::RAI;
use News::Other;
use Encode;
use utf8;

use base 'Exporter';
our @EXPORT = qw(NewFromRSS RSSLinks RSSArticles);


sub NewFromRSS {
	my @RSSs = chomped(read_file("RSS_info/RSSlinks.txt"));
	return map(RSSLinks($_), @RSSs); #"(limit"=>5)
}

sub RSSLinks{
	my $address=shift;
	my %options = @_;
	my $content = readFromWeb $address;
	my $rai = XML::RAI->parse_string(encode("utf8",$content));
		#this might be a bug in XML::RAI...I don't really know why RAI expects utf8 but it does
	
	my @results;
	my $count=0;
	

	my $name = lc $address;
	$name =~ s/^http:\/\/([^\.]*\.)*([^\.]*)\.cz.*$/$+/;
	 	#extracts only the name of the news server (for example, idnes / ihned), except aktualne (it mtch as centrum)
	
	$name = "RSS_info/".$name.".rssinfo";
	
	my %visited = fileToHash($name);		
	
	foreach my $item (@{$rai->items}) {
		
		if ((!$options{"limit"}) or ($options{"limit"}>$count)){
			$count++;
			push @results, $item->link() unless ($visited{$item->link()});
			append_file($name, $item->link()."\n");
		}
		
	}		
	
		
	return @results;
}

sub RSSArticles{
	return map (readFromWeb($_), RSSLinks @_);
}



#print join ("\n", readFromRSS("http://aktualne.centrum.cz/export/rss-hp.phtml"));

#print join ("\n",
# readFromRSS("http://www.novinky.cz/rss/");
#);