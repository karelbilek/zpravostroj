use YAML::XS;
use Zpravostroj::StopWords;

my @stop = get_stopwords(1);

print Dump (\@stop);