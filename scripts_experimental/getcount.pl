use strict;
use warnings;

my $count = scalar grep(/^\d+\.yaml\.bz2$/, <*.yaml.bz2>);

print $count."\n";