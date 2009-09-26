use YAML::XS;
use Zpravostroj::Database;
use Zpravostroj::Counter;

$what = 41;
($article)=read_articles($what, $what);
($article)=count_themes($article);

#print Dump $article->{keys};