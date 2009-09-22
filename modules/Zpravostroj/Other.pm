package Zpravostroj::Other;

use YAML::XS qw(LoadFile);

use strict;
use FindBin;
use warnings;

use utf8;
use Encode;

use base 'Exporter';
our @EXPORT = qw(split_size all_subthemes is_word is_banned make_normal_word);

#workaround for weird split behaviour in scalar context
sub split_size{my $r=shift;my @ol=split (" |_", $r);return scalar @ol;}

sub utf8_array_to_hash {
	my @array = @_;
	my %hash = map ((decode("utf8", $_)=>1), @array);
	return %hash;
}

sub all_subthemes {
	my $delimit=shift;
	my @res;
	
	foreach my $theme (@_) {
		my @themes = split($delimit, $theme);
		while (@themes) {
			my @themes_c = @themes;
			while (@themes_c) {
				my $joined = join($delimit, @themes_c);
				push(@res, $joined) unless ($joined eq $theme);
				pop @themes_c;
			}
			shift @themes;
		}
	}
	return @res;
}

my $banned_read=0;
my %banned=();
my $czechs="ÁČĎĚÉÍŇÓŘŠŤÚŮÝŽáčďěéíňóřšťúůýž";

sub load_yaml_file {
	my $name = shift;
	my $ref = LoadFile("$FindBin::Bin/../$name");
	return $ref;
}

sub is_word {
	my $what=shift;
	return ($what =~ /^[A-Za-z0-9$czechs]+$/);
}

sub is_banned{
	if (!$banned_read) {
		%banned=utf8_array_to_hash(@{load_yaml_file("information/banned_words.yaml")});
		$banned_read=1;
	}
	my $what=shift;
	return ($banned{$what});
}

sub make_normal_word {

    my $text = shift;
    return unless defined $text;
    
    $text =~ s/^([A-Za-z$czechs ]*).*$/$1/;
        #remove all weird letters
    
    $text =~ s/ *$//;
        #remove final space(s)
	
    return $text if (((length ($text))>=3) and !($banned{$text}));
	"";
}

1;