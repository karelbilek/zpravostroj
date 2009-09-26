use Zpravostroj::Database;
use Test::Deep;

use Time::HiRes qw(time);

my $time_sooner; my $time_later;

$time_sooner = time();
my @articles1 = bunzip_archive("here.yaml.bz2");
$time_later = time();

print "Loading everything from one big zip ".($time_later - $time_sooner)."\n";




$time_sooner = time();
my @articles2 = read_articles;
$time_later = time();

print "Loading everything from many zip files:".($time_later - $time_sooner)."\n";


print "are the same?".eq_deeply(\@articles1, \@articles2)."\n";
