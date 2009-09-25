package Zpravostroj::RSS;

use warnings;
use strict;
use XML::RAI;
use Encode;
use YAML::XS qw(LoadFile DumpFile);
use File::Touch;

use Zpravostroj::Other;
use Zpravostroj::WebReader;


use base 'Exporter';
our @EXPORT = qw(get_all_links);

my $RSS_address=read_option("RSS_address");
my $RSS_kept =  read_option("RSS_kept");

sub get_filename {
	my $source_name = shift;
	my $result = $RSS_address."/".$source_name.".yaml";
	return $result;
}

sub get_new_links{
	my $source=shift;
	my %options = @_; #if there is a limit (just for testing)
	my $content = read_from_web ($source);
	
	
	my $rai = XML::RAI->parse_string(encode("utf8",$content));
		#this might be a bug in XML::RAI...I don't really know why RAI expects utf8 but it does
	
	
	my $source_name = lc $source;
	$source_name =~ s/^http:\/\/([^\.]*\.)*([^\.]*)\.cz.*$/$+/;	
	
	my @visited_arr;
	if (-e (my $filename = get_filename($source_name))) {
		@visited_arr = @{LoadFile($filename)};
	}
	
	
	my %visited_hash;
	@visited_hash{@visited_arr}=();
	
	my @results;
	my $count=0;
	
	my @items;
	eval {@items = @{$rai->items};};
			#in VERY rare occasions XML::RAI just cannot parse RSS
			#I wont force it to
	
	
	foreach my $item (@items) {
		last if (($options{"limit"}) and ($count>=$options{"limit"}));
		$count++;
		push (@results, $item->link()) unless (exists $visited_hash{$item->link()});
	}
	
	
	unshift (@visited_arr, @results);
	if (scalar @visited_arr > $RSS_kept) {
		splice (@visited_arr, $RSS_kept);
	}
	
	DumpFile(get_filename($source_name), \@visited_arr);
	
	return map ({url=>$_}, @results);
	
}

sub get_all_links {
	my @RSS_sources = @{read_option("RSS_sources")};
	return map(get_new_links($_), @RSS_sources); #,limit=>5)
}
