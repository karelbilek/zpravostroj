use strict;
use warnings;
use Zpravostroj::Tagger;

my $doc = {extracted=>"Ahoj, jak se vede?"};
tag_texts($doc);