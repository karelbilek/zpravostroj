package News::Hajic_lemmatizer;

use strict;
use base 'Exporter';
use 5.008;
use strict;
use warnings;

use Tagger::Hajic;
use News::Other;
use utf8;
use Encode;

our @EXPORT = qw(lemmatize);


sub lemmatize {
    my @refs;
    my @lengths;
    my @results;
    my ($tags_rf, $lemmas_rf);
    
    foreach my $wordgroup (@_) {
        my @words = split(" ", $wordgroup);
        push (@refs, \@words);
        push @lengths, (scalar @words);
    }
    
    ($tags_rf, $lemmas_rf) = Tagger::Hajic->tag_sentence(@refs);
    my @lemmas=@$lemmas_rf;
    
    foreach my $length (@lengths) {
		my $result = join (" ", map (makeNormalWord($_), splice (@lemmas, 0, $length)));
		while ($result =~ /\s\s/) {
			$result =~ s/(\s)\s+/$1/;
		}
		while ($result =~ /^\s/) {
			$result =~ s/^\s+//;
		}
		push (@results, $result);
    }
    
    return @results;
    
}

1;