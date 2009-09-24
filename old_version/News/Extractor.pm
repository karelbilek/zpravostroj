package News::Extractor;

use 5.008;

use HTML::DOM;
use News::Other;
use File::Slurp;
use strict;
use warnings;
use utf8;

use base 'Exporter';
our @EXPORT = qw(extractFromText extractFromFile);



my %notWanted=fileToHash('Extractor_info/notWanted.txt');
my %wanted=fileToHash('Extractor_info/wanted.txt');;


foreach (qw(H1)) {
	$wantedTags{$_}=1;
}

my %notWantedTags;
foreach (qw(SCRIPT IMG HEAD TITLE LINK BR UL FORM STYLE)) {
	$notWantedTags{$_}=1;
}

sub isWanted{
    my $who = shift;

    return 1 if $wantedTags{$who->tagName};   
	return 1 if $wanted{$who->getAttribute('id')};
	return 1 if $wanted{$who->getAttribute('class')};
	return 1 if $wanted{$who->getAttribute('name')};
	
}

sub isNotWanted{
    my $who=shift;

    return 1 if $notWantedTags{$who->tagName};
        
	return 1 if $notWanted{$who->getAttribute('id')};
	return 1 if $notWanted{$who->getAttribute('class')};
	return 1 if $notWanted{$who->getAttribute('name')};

}

#---------------------------------------------------------------------------------------------------------------------------------
sub checkRecursive {
	#checkrecursive = check the node, that is not wanted and not unwanted
	#that means, you have to check all the childs, and keep only those wanted, and
	#ignore those unwanted
	
    my $element = shift;
	my $result = shift;
	$result = "" unless defined $result;
	
	foreach my $node ($element->childNodes) {
		next unless ((ref $node) =~ /^HTML::DOM::Element/);
							#we are ignoring "free laying" text, because it's not in wanted div
							
		next if isNotWanted($node);
							#we are ignoring unwanted divs
							
		if (isWanted($node)) {
			$result = checkWanted ($node, $result);
		#	$element->removeChild($node);
				#we know its wanted 
		} else {
			$result = checkRecursive ($node, $result);
				#we know nothing	
		}
    }
	return $result;
}

sub checkWanted{
    my $element = shift;
	my $result = shift;
    foreach my $node ($element->childNodes) {
        if ((ref $node) =~ /^HTML::DOM::Element/) {
			$result = checkWanted($node, $result) unless (isNotWanted($node));
				#EVEN within wanted, we can have unwanted part!
        } else {
			my $addition="";
			$addition = ($node->data) if (($node->data) and (isParagraph($node->data)));
			$addition =~ s/([^.]*)(Praha|PRAHA) -/$1/;
			
			$result = $result.$addition;
				#if its a text, write it.
			
				#Praha as a first word/ word before - (as in "Praha -") = not a "regular" word
        }
    }    
	return $result;
}


sub extractFromFile{
	my $address = shift;   
	my $text = read_file($address);
	return extractFromText $text;
}

sub extractFromText{   

    my $text = shift;
	
	
    my $dom_tree = new HTML::DOM;
    $dom_tree->write($text);
	$dom_tree->close();
    
    my %hash;
	$hash{"extracted"} = checkRecursive $dom_tree;
	$hash{"title"} = $dom_tree->getElementsByTagName('title')->[0]->text();
    return %hash;
}

1;