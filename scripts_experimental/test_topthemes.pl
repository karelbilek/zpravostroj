use Zpravostroj::Database;
use Zpravostroj::TopThemes;
use YAML::XS;

print "start\n";
my @articles = read_pool_articles();
print "read_all\n";
my @topthemes = top_themes(@articles);

print Dump(\@topthemes);