package Zpravostroj::Other;

use strict;
use warnings;
use base 'Exporter';

#workaround for weird split behaviour in scalar context
sub split_size{my $r=shift;my @ol=split (" ", $r);return scalar @ol;}


sub all_subthemes {
	my $delimit=shift;
	my @res;
	
	foreach my $theme (@_) {
		my @themes = split($delimit, $theme);
		while (@themes) {
			my @themes_c = @themes;
			while (@themes_c) {
				my $joined = join($delimit, @themes_c);
				push(@res, $joined) unless ($joined eq $theme);
				pop @themes_c;
			}
			shift @themes;
		}
	}
	return @res;
}