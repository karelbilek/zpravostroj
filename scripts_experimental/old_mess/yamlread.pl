use YAML::XS qw(LoadFile);
my $hashref = LoadFile("../configure.yaml");


print @{$hashref->{RSS}};