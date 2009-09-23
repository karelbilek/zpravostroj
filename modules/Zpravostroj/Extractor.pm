package Zpravostroj::Extractor;

use HTML::DOM;
use strict;
use warnings;
use utf8;

use Zpravostroj::Other;

use base 'Exporter';
our @EXPORT = qw(extract_text);


my %not_wanted;
my %wanted;
{
	my $read = read_information("HTML_tags");
	my @wanted_arr = @{$read->{wanted}};
	@not_wanted{@wanted_arr} = (1) x @wanted_arr;
	my @not_wanted_arr = @{$read->{not_wanted}};	
}
	#again, its global, but it is needed all the time, but I have to read it just once

my $not_beginning = join ("|", @{read_option("extractor_not_wanted_at_beginning")});
	#also global... what are you gonna do

sub is_wanted {
	my $who = shift;

    return ($wanted{$who->tagName} or $wanted{$who->getAttribute('id')} or $wanted{$who->getAttribute('class')} or $wanted{$who->getAttribute('name')});
}

sub is_not_wanted{
    my $who=shift;

    return ($not_wanted{$who->tagName} or $not_wanted{$who->getAttribute('id')} or $not_wanted{$who->getAttribute('class')} or $not_wanted{$who->getAttribute('name')});

}

sub check_unknown {
	my $element = shift;
	my $result = shift;
	$result = "" unless defined $result;
	
	foreach my $node ($element->childNodes) {
		next unless ((ref $node) =~ /^HTML::DOM::Element/);
							#we are ignoring "free laying" text, because it's not in wanted div
							
		next if is_not_wanted($node);
							#we are ignoring unwanted divs
							
		if (is_wanted($node)) {
			$result = check_wanted ($node, $result);
				#we know its wanted 
		} else {
			$result = checkRecursive ($node, $result);
				#we know nothing	
		}
	}
	return $result;
}

sub check_wanted{
    my $element = shift;
	my $result = shift;
	
    foreach my $node ($element->childNodes) {
        if ((ref $node) =~ /^HTML::DOM::Element/) {
			$result = checkWanted($node, $result) unless (isNotWanted($node));
				#EVEN within wanted, we can have unwanted part!
				
        } else {
			my $addition="";
			$addition = ($node->data) if (($node->data) and (isParagraph($node->data)));
			$addition =~ s/([^.]*)($not_beginning) -/$1/;
			
			$result = $result.$addition;
				#if its a text, write it.
			
				#Praha as a first word/ word before - (as in "Praha -") = not a "regular" word
        }
    }    
	return $result;
}

sub extract_text{   
    my $text = shift;
	
	
    my $dom_tree = new HTML::DOM;
    $dom_tree->write($text);
	$dom_tree->close();
    
    my %hash;
	$hash{"extracted"} = checkRecursive $dom_tree;
	$hash{"title"} = $dom_tree->getElementsByTagName('title')->[0]->text();
    return \%hash;
}