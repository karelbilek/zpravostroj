use YAML::XS;
use Zpravostroj::Database;
use Zpravostroj::Counter;

$what = 35;
($article)=read_pool_articles($what, $what);
($article)=count_themes($article);

#print Dump $article->{keys};