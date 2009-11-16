package Zpravostroj::Counter;
use 5.008;
use strict;
use warnings;

use Zpravostroj::Other;



use base 'Exporter';
our @EXPORT = qw( count_themes);
use utf8;




my $max_length=read_option("max_theme_length");						#10
	#max. length of THEME in WORDS
	#longer = more memory

my $max_first_named = read_option("counter_first_named"); 			#30
my $max_first_themes = read_option("counter_first_themes");			#15
	#number of named entities/themes that get it to final keys
	#BUT! this is BEFORE the subthemes cleaning!
	#number of entities should be high - this is actually just a safety catch if the NE recogniser goes wild¨
	#(which usually happens with longer texts in other than Czech language)
	

sub count_themes {
	my @articles = @_;
	my $i=0;
	my @results;
	for my $article (@articles) {
		my $result={};
		my_log ("count_themes - before article $i.");
		
		eval {$result = count_themes_document($article)};
		
		if ($@) {my_warning("count_themes - error when counting - $@");};
		
		my_log ("count_themes - after article $i.");
		push (@results, $result);
		$i++;
	}
	my_log("cont_themes - or not. returning home.");
	return @results;
}

1;