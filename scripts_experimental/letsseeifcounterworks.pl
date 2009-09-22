use strict;
use warnings;

use Zpravostroj::Counter qw(count_themes);

use YAML::XS qw(DumpFile LoadFile);

my $hash_ref = LoadFile("tagger.dump");

DumpFile("counter.dump", count_themes($hash_ref));