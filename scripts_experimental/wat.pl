
use Zpravostroj::Database;
use Zpravostroj::Counter;

use strict;


my ($article) = read_articles(8,8);

($article) = count_themes($article);

use YAML::XS;
print Dump($article->{keys});