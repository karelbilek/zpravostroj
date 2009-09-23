package Zpravostroj::Tagger;

use 5.008;
use strict;
use warnings;


use Encode;
use utf8;

use TectoMT::Scenario;
use TectoMT::Document;

use Zpravostroj::Other;

use base 'Exporter';
our @EXPORT = qw( tag_texts);

my @wanted_named = @{read_option("tagger_wanted_named")};

sub create_new_document{
	my $text = shift;
	
	my $document = TectoMT::Document->new();
	$document->set_attr("czech_source_text", $text);
	
	return $document;
}

sub save_words {
	my $words_ref = shift;	my $node = shift;
	
	if (my $lemma = ($node->get_attr('lemma'))) {
		if (my $lemma_better = (make_normal_word($lemma))) {
			push (@{$words_ref},{lemma=>$lemma_better, form=>($node->get_attr('form'))});
		}
	}
	foreach my $child ($node->get_children) {
		save_words($words_ref, $child);
	}
}

sub save_named {
	my $named_ref = shift;
	my $node = shift;
	
	if ($node->get_deref_attr('m.rf')) {
		#it is a named entity.
		my $type;
		if (($type=($node->get_attr('ne_type'))) and (length(my $name = $node->get_attr('normalized_name'))>=read_option("min_word_length")) and ($type =~ "/^".join("|", @wanted_named)."/")) {
			$named_ref->{$name} = 1;
		}
	}
	
	foreach my $child ($node->get_children) {
		save_named($named_ref, $child);
	}
}

sub doc_to_hash {
	my $document = shift;
	my @words;
	my %named;
	foreach my $bundle ( $document->get_bundles() ) {
		save_words(\@words, $bundle->get_tree('SCzechM'));
		save_named(\%named, $bundle->get_tree('SCzechN'));
	}
	
	my @arnamed = keys %named;
	
	my %reshash = (words=>\@words, named=>\@arnamed);
	return \%reshash;
}

my $scenario_initialized = 0;
my $scenario;

sub tag_texts {
	
	open my $saveerr, ">&STDERR";
	open STDERR, '>', "/dev/null";
	unless ($scenario_initialized) {
		$scenario = TectoMT::Scenario->new({'blocks'=> [ qw(SCzechW_to_SCzechM::Sentence_segmentation SCzechW_to_SCzechM::Tokenize  SCzechW_to_SCzechM::TagHajic SCzechM_to_SCzechN::Czech_named_ent_SVM_recognizer) ]});
		$scenario_initialized = 1;
	}
		
	my @texts = @_;

	my @documents = map(create_new_document($_), @texts);
	


	$scenario->apply_on_tmt_documents(@documents);
	
	
	open STDERR, ">&", $saveerr;
	
	my @hashes = map (doc_to_hash($_), @documents);
	return @hashes;
}

1;