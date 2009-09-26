package Zpravostroj::Other;

use YAML::XS qw(LoadFile);

use strict;
use warnings;

use File::Spec;
use utf8;

use base 'Exporter';
our @EXPORT = qw(split_size all_subthemes is_word is_banned make_normal_word load_yaml_file read_option most_frequent read_information get_correction longest_correction);



	#!!!!!!!!!!!! ------ GLOBALS ------ !!!!!!!!!!!!
my ($option_ref) = load_yaml_file("configure.yaml");

my %banned=();
@banned{@{read_information("banned_words")}}=();

my $czechs="ÁČĎĚÉÍŇÓŘŠŤÚŮÝŽáčďěéíňóřšťúůýž";
	#!!!!!!!!!!!! ------ GLOBALS ------ !!!!!!!!!!!!
	
	
my $longest_correction=0;
my %corrections;
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

sub most_frequent {
	my @array=@_;
	my %appearances;
	@appearances{@array}=(0) x scalar @array;
	for my $element (@array){$appearances{$element}++};
	return ((sort {$appearances{$b}<=>$appearances{$a}} @array)[0]);
	
}

sub read_option{
	my $what = shift;
	exists $option_ref->{$what} or die "Option $what does not exists.";
	return $option_ref->{$what};
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
	return ((exists $banned{lc($what)}) or ($what=~/^[0-9]+$/));# or (length ($what) < read_option("min_word_length")));
}

sub make_normal_word {

    my $text = shift;
    return unless defined $text;
    
    $text =~ s/^([A-Za-z0-9$czechs ]*).*$/$1/;
        #remove all weird letters
    
    $text =~ s/ +$//;
        #remove final space(s)
	
    return $text;
}


sub get_correction {
	my $what=shift;
	if (!$longest_correction) {
		my %read_corrections = %{read_information("corrections")};

		foreach my $correct_lemma (keys %read_corrections) {
			my $length = split_size($correct_lemma);
			$length = $longest_correction if ($length > $longest_correction);

			foreach my $correct_form (@{$read_corrections{$correct_lemma}}) {
				$corrections{$correct_form} = $correct_lemma;
			}
		}
	}
	return 0 if (!exists $corrections{$what});
	
	return $corrections{$what};
}

sub longest_correction {return $longest_correction;}

1;