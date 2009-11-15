use Zpravostroj::Database;
use DateTime;

my @articles=unarchive_pool(DateTime->today->date);
add_new_articles(@articles);