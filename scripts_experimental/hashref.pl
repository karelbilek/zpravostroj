use strict;
use warnings;

sub doit {
	my $hashref = shift;
	$hashref->{ping} = "pink";
}

sub doit2 {
	my $hashref = shift;
	my %hash=%$hashref;
	$hashref->{ping} = "pink";
}

# sub doit3 {
# 	my %hash=%{shift};
# 	$hashref->{ping} = "pink";
# }

my %hash;
$hash{ping}="pong";
doit2 \%hash;
print $hash{ping};