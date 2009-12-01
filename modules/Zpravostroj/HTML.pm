package Zpravostroj::HTML;

use base 'Exporter';
our @EXPORT = qw(generate_HTML);

use strict;
use warnings;
use utf8;

use CGI ':standard';

use Zpravostroj::Database;

sub generate_HTML {
	 my $q = shift;
	# my $x = $q->param('lol');
	
	my @themes = get_top_themes;
	my @forms = map {my$r=$_->{best_form};$r;$r=~s/_/ /g;$r} @themes;
	
	my $res;
	$res.=start_html(-title=>'Zpravostroj - nejčastější témata',
					-author=>'kaja.bilek[<>]gmail.com',
					-meta=>{'keywords'=>'zpravostroj zpravodajství zprávy',
							'copyright'=>'(C) Karel Bílek 2009'},
					-lang=>"cs",
					-head=>meta({-http_equiv => 'Content-Type',
					 			 -content    => 'text/html; charset=utf8'}));
	
	$res.=h1("Nejčastější témata");
	
	$res.=table(Tr({-align=>'CENTER',-valign=>'TOP'},
				[
					th(['Téma']),
					map {td[$_]} @forms
				]
				));
	
	$res.=end_html;
	return $res;
}

1;