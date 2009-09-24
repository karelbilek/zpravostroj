package News::Today_analyzer;

use strict;
use warnings;
use News::Other;
use Encode;

use base 'Exporter';
our @EXPORT = qw(analyze);

my %formuse;
sub learnForms{
	my $lemref = shift;
	my @lemmas = @{$lemref};
	my $formref = shift;
	my @forms = @{$formref};
	no warnings;
	$formuse{shift @lemmas}->{shift @forms}++ while (scalar(@lemmas));
}

sub bestForm{
	my $what = shift;
	my $ref = $formuse{$what};
	my @k = sort {($ref->{$b})<=>($ref->{$a})} keys %{$ref};
	if ($k[0]) {
		return $k[0];
	} else {
		return $what;
	}
}


my %appearances;
sub keyRate {
	my $key = shift;
	my @app = keys %{$appearances{$key}};
	my $size = splitSize ($key);
	return (scalar @app)**(2*$size);
}

sub analyze {
	
	my @allKeys=@_;
		
	%appearances=();
	%formuse=();
	
	my $num = 0;
		
	foreach my $keys (@allKeys){
		
			
		my @keysArr = split ("\n", $keys);
		
		foreach my $key (@keysArr) {
			my @lemmas;
			my @forms;
			
			my ($lemma, $form) = split (/\|/, $key);
			
			push (@lemmas, $lemma);
			push (@forms, $form);
			@lemmas = (@lemmas, allSubThemes(" ",@lemmas));
			@forms = (@forms, allSubThemes("_",@forms));
			
			learnForms(\@lemmas, \@forms);
			
			foreach my $lemma (@lemmas) {
				$appearances{$lemma}->{$num} = 1;
				#this is not as array, because two THEMES may be different
				#but they may SHARE different subtheme
			}
		}
		++$num;
		

	}
	
	my %scores;
	for my $key (sort {keyRate($b)<=>keyRate($a)} keys %appearances) {
		$scores{$key} += keyRate($key);
		foreach my $subkey (allSubThemes($key)) {
		#	$scores{$subkey} -= (keyRate($key)) ** (6/7);
		}
	}
	
	for (keys %appearances) {
		delete $scores{$_} if (isBanned($_));
	}
	my @res;
	
	for my $key (sort {$scores{$b}<=>$scores{$a}} keys %scores) {
		
		my @apprs_arr = keys %{$appearances{$key}};
		my $apprs="";
		map($apprs=$apprs."|".$_ , @apprs_arr);
		
		push (@res, $key."[".bestForm($key)."](".$scores{$key}.")".$apprs);
		#.map("|".$_, keys %{$appearances{$key}}));
	}
	
	return @res;
	
}

1;