package News::Counter;

use 5.008;
use strict;
use warnings;

use TectoMT::Scenario;
use TectoMT::Document;


use News::Counter_core;

use SimpleUtilsXML;
use Encode;
use utf8;



use base 'Exporter';
our @EXPORT = qw( countFromTexts);




#copied from czech_plain_text_to_tmt.pl

sub createNewDocument{
	my $text = shift;
	
	my $document = TectoMT::Document->new();
	$document->set_attr("czech_source_text", $text);
	
	return $document;
}

sub countFromTexts {
	
	my @texts = @_;
	
	
	
	
	
	my @documents = map(createNewDocument($_), @texts);
	
	open my $saveerr, ">&STDERR";
	open STDERR, '>', "/dev/null";
	
	my $scenario = TectoMT::Scenario->new({'blocks'=> [ qw(SCzechW_to_SCzechM::Sentence_segmentation SCzechW_to_SCzechM::Tokenize  SCzechW_to_SCzechM::TagHajic SCzechM_to_SCzechN::Czech_named_ent_SVM_recognizer) ]});
	

	$scenario->apply_on_tmt_documents(@documents);
	
	open STDERR, ">&", $saveerr;
	
	my @keys = map (countDocument($_), @documents);
	return @keys;
}

1;