package Zpravostroj::RSS;

use warnings;
use strict;
use XML::RAI;
use Encode;
use YAML::XS;

use Zpravostroj::Other;

use base 'Exporter';
our @EXPORT = qw();

my $RSS_address=read_information("RSS_address");
my $RSS_kept = read_information("RSS_kept");

sub get_filename {
	my $source_name = shift;
	return $RSS_address."/".$source_name."yaml";
}

sub get_new_links{
	my $source=shift;
	my %options = @_; #if there is a limit (just for testing)
	my $content = read_from_web $source;
	my $rai = XML::RAI->parse_string(encode("utf8",$content));
		#this might be a bug in XML::RAI...I don't really know why RAI expects utf8 but it does
		
	my $source_name = lc $source;
	$source_name =~ s/^http:\/\/([^\.]*\.)*([^\.]*)\.cz.*$/$+/;	
	
	my @visited_arr = @{LoadFile(get_filename())};
	my %visited_hash;
	@visited{@visited_arr}=();
	
	my @result;
	
	foreach my $item (@{$rai->items}) {
		last if (($options{"limit"}) and ($count>=$options{"limit"}));
		$count++;
		push (@results, $item->link()) unless (exists $visited{$item->link()});
	}
	
	push (@visited_arr, @results);
	if (scalar @visited_arr > $RSS_kept) {
		@visited_arr = splice (@visited_arr, -$RSS_kept);
	}
	
}

sub get_all_links {
	my @RSS_sources = @{read_information("RSS_sources")};
	return map(get_new_links($_), @RSS_sources); #,limit=>5);
}
