#!/usr/bin/perl

#just to be sure - this file is a COPY of the cgi-bin file in the real cgi-bin folder
#so it's NOT changed by git in checkout
# I have to do this, because sadly, Git doesn't follow symlinks
# sooooo... it does as little as possible. That basically means nothing at all.

use lib qw( /a/merkur2/ufallabhome/bilek/other_modules/installed/ /a/merkur2/ufallabhome/bilek/rocnik/Zpravostroj/modules/ /a/merkur2/ufallabhome/bilek/other_modules/installed/lib/perl5/site_perl/5.8.8/ /a/merkur2/ufallabhome/bilek/other_modules/installed/lib /a/merkur2/ufallabhome/bilek/other_modules/installed/lib/arch /a/merkur2/ufallabhome/bilek/other_modules/installed/lib64/perl5/site_perl/5.8.8/x86_64-linux-thread-multi/ /a/merkur2/ufallabhome/bilek/tectomt/share/installed_libs/lib/perl5 /a/merkur2/ufallabhome/bilek/tectomt/share/installed_libs/lib/perl5/x86_64-linux-thread-multi /a/merkur2/ufallabhome/bilek/tectomt/libs/core /a/merkur2/ufallabhome/bilek/tectomt/libs/blocks /a/merkur2/ufallabhome/bilek/tectomt/libs/other /a/merkur2/ufallabhome/bilek/tectomt/share/tred/tredlib /a/merkur2/ufallabhome/bilek/tectomt/share/tred/tredlib/libs/fslib /a/merkur2/ufallabhome/bilek/tectomt/share/tred/tredlib/libs/pml-base /a/merkur2/ufallabhome/bilek/tectomt/share/tred/tredlib/libs/backends);

		#yeah I know, this is total overkill, but tectomt + my own modules have to be included
		#and since I am not root I include it manually here and not in .bashrc of www user or anything


use Zpravostroj::HTML qw(generate_HTML);


use CGI;

$x = CGI->new;



print "Content-type: text/html\n\n";

eval {print generate_HTML($x);}; 
if ($@) {
	print "Udala se chyba:<br> \n$@"; #shit happens
}

1;