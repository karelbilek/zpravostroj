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




sub create_new_document{
	my $text = shift;
	
	my $document = TectoMT::Document->new();
	$document->set_attr("czech_source_text", $text);
	
	return $document;
}

sub doc_to_YAML {
	my $document = shift;
	my %forms;
	my @entities;
	
	
	
	
	
}

my $scenario_initialized = 0;
my $scenario;

sub tag_texts {
	
	unless ($scenario_initialized) {
		$scenario = TectoMT::Scenario->new({'blocks'=> [ qw(SCzechW_to_SCzechM::Sentence_segmentation SCzechW_to_SCzechM::Tokenize  SCzechW_to_SCzechM::TagHajic SCzechM_to_SCzechN::Czech_named_ent_SVM_recognizer) ]});
		$scenario_initialized = 1;
	}
		
	my @texts = @_;

	my @documents = map(create_new_document($_), @texts);
	
	open my $saveerr, ">&STDERR";
	open STDERR, '>', "/dev/null";

	$scenario->apply_on_tmt_documents(@documents);
	
	
	open STDERR, ">&", $saveerr;
	
	my @YAMLs = map (doc_to_YAML($_), @documents);
	return @YAMLs;
}

1;