use Zpravostroj::RSS;
use YAML::XS;

my @wow = get_all_links();
print Dump(\@wow);