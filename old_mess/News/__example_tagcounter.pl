use News::Counter;
use News::Tagger;
use File::Temp;
use File::Slurp;
use Encode;
use strict;
use utf8;

my $text = 'R Tenista Lukáš Dlouhý si po roce zahraje finále čtyřhry na US Open. S Indem Leanderem Paesem dnes porazili nejvýše nasazenou americkou dvojici Mika a Boba Bryanovy 6:4, 3:6 a 7:6. Se stejnými soupeři prohrál česko-indický pár loni v New Yorku ve finále.Šampioni z French Open se v boji o druhý společný titul z grandslamového turnaje utkají buď s dvojicí Maheš Bhúpathí, Mark Knowles, či bělorusko-izraelským párem Max Mirnyj, Andy Ram. Dnešní vyrovnané semifinálové utkání proti světovým jedničkám zahájili Dlouhý s Paesem lépe a za stavu 4:4 proměnili první příležitost k brejku.Obhájci titulu se však po prohraném setu zvedli a rychle získali druhou sadu. Kritický okamžik zažehnali Dlouhý a Paes za stavu 3:3 v rozhodujícím setu, kdy už prohrávali 0:40 při vlastním servisu. Duel nakonec musel rozhodnout až tie-break, ve kterém Američané odvrátili dva mečboly, při třetím už ale kapitulovali.Dlouhý si zahraje finále grandslamu popáté v kariéře, ze zisku trofeje se radoval pouze letos v Paříži. To veterán Paes bude bojovat již o šesté vítězství. Navíc nebude chybět ani ve finále mixu po boku Jihoafričanky Cary Blackové. ';

my ($tmtext) = tagTexts($text);


print $tmtext."\n";