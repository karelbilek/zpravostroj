use strict;
use warnings;

use Zpravostroj::Counter qw(count_themes);

use Zpravostroj::Database;

my ($article) = read_articles(162,162);

($article) = count_themes($article);

use YAML::XS;
print Dump $article->{keys}