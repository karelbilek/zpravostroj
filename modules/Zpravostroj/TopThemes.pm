package Zpravostroj::TopThemes;

use strict;
use warnings;

use Zpravostroj::Other;

use Test::Deep qw(eq_deeply);

use base 'Exporter';
our @EXPORT = qw(top_themes);

sub theme_rate{
	my $theme=shift;
	my $appearances_ref=shift;
	my $stopwords = shift;
	
	my $count = scalar keys %{$appearances_ref->{$theme}};

	my $size = stop_size($stopwords, $theme);
	
	return $count ** (2*$size); #original
#	return (2* $size) ** ($count);
}

sub stop_size {
	my $stopwords = shift;
	my $word = shift;
	return scalar grep(!exists $stopwords->{$_}, split(" ",$word));
}

sub top_themes{
	my_log("top_themes - entering.");
	
	my @articles = @_;
	
	my %stopwords; 
	#@stopwords{get_stopwords(20, 0.85, @articles)}=();
	
	my_log("top_themes - stopwords loaded.");
	
	# {use YAML::XS;
	# my @wa = keys %stopwords;
	# print Dump(\@wa);}
		
	my %appearances;
	my %all_forms;
		#every lemma should have all of those
		
	my $i=0;
	
	my_log("top_themes - want to read ALL the themes....");
	foreach my $article (@articles){
		
		my @keys;
		@keys = @{$article->{keys}} if $article->{keys};
		for my $key (@keys) {
			
			my @sub_lemmas = ($key->{lemma}, all_subthemes(" ", $key->{lemma}));
			
			for my $sub_lemma (@sub_lemmas) {
				$appearances{$sub_lemma}->{$i}=1;
			}
	
			
			for my $form (@{$key->{all_forms}}) {
				my @sub_forms = ($form, all_subthemes(" ", $form));
				
				die "HORRIBLE DEATH! ".$form."!=".$key->{lemma} if ((scalar @sub_forms) != (scalar @sub_lemmas));
				
				for my $sub_lemma (@sub_lemmas) {
					
					push (@{$all_forms{$sub_lemma}}, $sub_forms[0]);
					shift @sub_forms;
					#this is a little ugly but I find no better (easy!) way
					#I can do it through helper hash but screw that
				}
			}
		}
		
		++$i;
	}
	my_log("top_themes - ....done. Lets remove redundant subthemes...");
	
	#remove redundant subthemes
	
	for my $lemma (sort {split_size($b)<=>split_size($a)} keys %appearances) {
		
		#I can delete the appearance so I have to test again
		if (exists $appearances{$lemma}) {
			
			my %lemma_appearances = %{$appearances{$lemma}};
			for my $sub_lemma (all_subthemes(" ",$lemma)) {
				if (exists $appearances{$sub_lemma}) {
					my %sub_lemma_appearances = %{$appearances{$sub_lemma}};
					if (eq_deeply(\%lemma_appearances, \%sub_lemma_appearances)) {
						delete $appearances{$sub_lemma};
						delete $all_forms{$sub_lemma};
					} 
				}
			}
		} 
	}
		
	my_log("top_themes - ....done.");
	#so basically, I am done
	
	my @results;
	for my $lemma (sort {theme_rate($b, \%appearances, \%stopwords) <=> theme_rate($a, \%appearances, \%stopwords)} keys %appearances) {
		my %result;
		$result{lemma} = $lemma;
		# $result{score} = theme_rate($lemma, \%appearances);
		my @res_appearances = keys %{$appearances{$lemma}};
		$result{articles} = \@res_appearances;
		# $result{articles_count} = scalar (@{$appearances{$lemma}});
		# $result{stop_size} = stop_size(\%stopwords, $lemma);
		$result{best_form} = most_frequent(@{$all_forms{$lemma}});
		# $result{all_forms} = $all_forms{$lemma};
		push (@results, \%result);# if (length $lemma <= 3); #;
	}
	
	
	splice (@results, 250)if @results>250;
	
	my_log("top_themes - exiting");
	
	return @results;
}

1;