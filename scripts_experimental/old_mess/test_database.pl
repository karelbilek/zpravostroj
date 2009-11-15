use strict;
use warnings;

use Zpravostroj::Database;

my @articles=({title=>"Jiri Paroubek je idiot", extracted=>"Potvrzuji vysledky vyzkumu Univerzity Karlovy"}, {title=>"Proletariat miluje Jiriho Paroubka", extracted=>"Diktatura proletariatu \\n s Jirim Paroubkem!\n - tady je text\n - a je ho hodne"});


add_new_articles(@articles);
my ($article) = read_articles(get_pool_count()-1);
print $article->{extracted};
print "\n";