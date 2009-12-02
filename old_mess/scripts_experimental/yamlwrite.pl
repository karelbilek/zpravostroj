use YAML::XS qw(LoadFile);
use File::Slurp;

my %hash = (data=>"~/rocnik/data", RSS=>["http://www.idnes.shit", "loloi"]);

print Dump(\%hash);

my @stuff=("ll","fsdfds");
print Dump(\@stuff);