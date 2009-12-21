use warnings;
use strict;
use Zpravostroj::Walker;

print "start\n";
redo_it(pool=>1, do_counting=>1);
print "end\n";