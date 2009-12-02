use Zpravostroj::Extractor;
use Zpravostroj::Database;
use YAML::XS;
use strict;
use warnings;
use utf8;


my ($article) = read_articles(184,184);

($article) = extract_texts($article);

print Dump $article->{extracted};