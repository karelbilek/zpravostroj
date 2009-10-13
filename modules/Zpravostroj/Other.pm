package Zpravostroj::Other;

use YAML::XS qw(LoadFile);

use strict;
use warnings;

use File::Spec;
use utf8;
use DateTime;
#use Text::Unaccent;


use base 'Exporter';
our @EXPORT = qw(get_day my_log my_warning split_size all_subthemes is_word is_banned make_normal_word load_yaml_file read_option most_frequent read_information get_correction longest_correction);



	#!!!!!!!!!!!! ------ GLOBALS ------ !!!!!!!!!!!!
my ($option_ref) = load_yaml_file("configure.yaml");

my %banned=();
@banned{@{read_information("banned_words")}}=();

my $czechs="ÁČĎĚÉÍŇÓŘŠŤÚŮÝŽáčďěéíňóřšťúůýž";
	#!!!!!!!!!!!! ------ GLOBALS ------ !!!!!!!!!!!!
	
	
my $longest_correction=0;
my %corrections;
my $log_file = read_option("log_file");
my $warning_file = read_option("warning_file");
	#!!!!!!!!!!!! ------ GLOBALS ------ !!!!!!!!!!!!


sub get_day {

	return DateTime->today->dmy;
}

sub get_time {
	my $now = DateTime->now;
	return (($now->hms()).($now->millisecond()));
}

sub my_warning {
	my $what = shift;
	open (my $fh, ">>", $warning_file);
	print {$fh} get_day(),":", get_time()," - ", $what,"\n";
	close $fh;
}


sub my_log {
	my $what = shift;
	open (my $fh, ">>", $log_file);
	print {$fh} get_day(),":", get_time()," - ", $what,"\n";
	close $fh;
}


#workaround for weird split behaviour in scalar context - they say its not a bug, i think it is
sub split_size{my $r=shift;my @ol=split (" |_", $r);return scalar @ol;}


sub load_yaml_file {
	my $name = shift;
	
	my ($volume, $directory) = File::Spec->splitpath( $INC{'Zpravostroj/Other.pm'} );
	my $whole_name = File::Spec->catpath( $volume, $directory, '../../'.$name );
	
	if (!-e $whole_name) {
		my_warning("load_yaml_file - file ".$whole_name." does not exists!");
		return "";
	}

	my $ref="";
	
	eval{$ref = LoadFile($whole_name)};
	if ($@) {
		my_warning("load_yaml_file - some strange error when reading ". $whole_name." - ".$@." :-(");
	}
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

	return 1 if ((!$what) or ($what eq ''));
	
	return ((exists $banned{lc($what)}) or ($what=~/^[0-9]+$/));# or (length ($what) < read_option("min_word_length")));
}

sub make_normal_word {

    my $text = shift;
    return unless defined $text;
    
    $text =~ s/^([A-Za-z0-9$czechs ]*).*$/$1/;
        #remove all weird letters
    	
    $text =~ s/ +$//;
        #remove final space(s)
	#$text = unac_string('UTF-8', lc $text);
	$text= lc $text;
	
    return $text;
}


sub get_correction {
	my $what=shift;
	if (!$longest_correction) {
		my %read_corrections;
		if (my $correction_ref = read_information("corrections")) {
			%read_corrections = %{read_information("corrections")};
		}

		foreach my $correct_lemma (keys %read_corrections) {
			my $length = split_size($correct_lemma);
			$longest_correction = $length if ($length > $longest_correction);

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