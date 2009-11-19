use strict;
use warnings;
use Zpravostroj::Other;
use Zpravostroj::WebReader;
use Zpravostroj::RSS;
use Zpravostroj::Database;
use Zpravostroj::Extractor;
use Zpravostroj::Tagger;
use Zpravostroj::Counter;


my @articles = read_pool_articles(69,69);

@articles = extract_texts(@articles);

update_pool_articles(69, @articles);
