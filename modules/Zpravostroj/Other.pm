package Zpravostroj::Other;

use YAML::XS qw(LoadFile);

use strict;
use warnings;

use File::Spec;
use Encode;
use HTML::Encoding 'encoding_from_http_message';
use LWP::UserAgent;


use utf8;

use base 'Exporter';
our @EXPORT = qw(split_size all_subthemes is_word is_banned make_normal_word load_yaml_file read_option read_information read_from_web read_from_webs);

	#!!!!!!!!!!!! ------ GLOBALS ------ !!!!!!!!!!!!
my ($option_ref) = load_yaml_file("configure.yaml");

my %banned=();
@banned{@{read_information("banned_words")}}=();

my $czechs="ÁČĎĚÉÍŇÓŘŠŤÚŮÝŽáčďěéíňóřšťúůýž";

my $ua = LWP::UserAgent->new;
	#!!!!!!!!!!!! ------ GLOBALS ------ !!!!!!!!!!!!

#workaround for weird split behaviour in scalar context - they say its not a bug, i think it is
sub split_size{my $r=shift;my @ol=split (" |_", $r);return scalar @ol;}


sub load_yaml_file {
	my $name = shift;
	
	my ($volume, $directory) = File::Spec->splitpath( $INC{'Zpravostroj/Other.pm'} );
	my $config_file = File::Spec->catpath( $volume, $directory, '../../'.$name );

	my $ref = LoadFile($config_file) or die "file $name does not exist.";
	return $ref;
}



sub read_option{
	my $what = shift;
	exists $option_ref->{$what} or die "Option $what does not exists.";
	return $option_ref->{$what};
}

sub read_from_web {
	my $pokus_count;
	my $address = shift;
	
	my $resp;
	
	do {
		$resp = $ua->get( $address );
		$pokus_count++;
	} while ($pokus_count<=5 and $resp->code != 200);
		#try to download it 5 times, if server is not responsive
	
	if ($resp->code != 200) {
		return "";
	}
	
	my $enco = encoding_from_http_message($resp);
	return decode($enco => ($resp->content));
}

sub read_from_webs {
	return map (read_from_web($_), @_);
}

sub read_information {
	my $what = shift;
	return load_yaml_file("informations/".$what.".yaml");
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

sub is_word {
	my $what = shift;
	return ($what =~ /^[A-Za-z0-9$czechs]+$/);
}

sub is_banned {
	my $what=shift;
	return ((exists $banned{lc($what)}) or (length ($what) < read_option("min_word_length")));
}

sub make_normal_word {

    my $text = shift;
    return unless defined $text;
    
    $text =~ s/^([A-Za-z$czechs ]*).*$/$1/;
        #remove all weird letters
    
    $text =~ s/ +$//;
        #remove final space(s)
	
    return $text;
}

1;