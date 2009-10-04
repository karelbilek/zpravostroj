#!/usr/bin/perl

use strict;

use Zpravostroj::Walker;

use Zpravostroj::Other;
my $script = glob(read_option("password_script_dir")."/*.sh");
my $pass = `$script`;

while (1) {
	step;
	`klog -pa $pass`;	#this is sadly needed :(
	sleep(14400);
}

