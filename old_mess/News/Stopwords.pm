package News::Stopwords;

use strict;
use warnings;
use News::Other;
use Encode;

use base 'Exporter';
our @EXPORT = qw(getStopWords);

my %superCount;

sub repetitive {
	my $number = shift;
	
	my @all = @_;
	
	my %partCounts;
	
	while (scalar(@all)) {
		my @part = splice (@all, 0, $number);
		
		my %partThemes;
		foreach my $keys(@part) {
			my @themes = map ({my($f,undef) = split (/\|/, $_); $f} (split (/\n/, $keys)));
			@themes = (@themes, allSubThemes(" ", @themes));
			@partThemes{@themes} = 1 x @themes;
		} 
		foreach (keys %partThemes){
			$partCounts{$_}++;
		}
	}
	
	foreach my $key (keys %partCounts) {
		$superCount{$key}=$superCount{$key}+$partCounts{$key}*$number;
	}
}

sub getStopWords {
	my @all = @_;
	%superCount=();
	

	repetitive(10, @all);
	#repetitive(20,@all);
	#repetitive(30,@all);
	#repetitive(40,@all);
	repetitive(50,@all);
	repetitive(100,@all);
	repetitive(200,@all);
	
	my @res;
	foreach my $key (sort {$superCount{$b}<=>$superCount{$a}} keys %superCount) {
		push (@res, $key);#." ".$superCount{$key});
	}
	
	return splice(@res,0,200);
}

1;