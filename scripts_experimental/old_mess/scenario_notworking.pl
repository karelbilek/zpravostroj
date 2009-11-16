use TectoMT::Scenario;
use TectoMT::Document;
use strict;
use warnings;


my $scenario = TectoMT::Scenario->new({'blocks'=> [ qw(SCzechW_to_SCzechM::Sentence_segmentation SCzechW_to_SCzechM::Tokenize  SCzechW_to_SCzechM::TagHajic SCzechM_to_SCzechN::SVM_ne_recognizer) ]});

my $document = TectoMT::Document->new();
$document->set_attr("czech_source_text", "Ema ma maso, o my se mame!");

$scenario->apply_on_tmt_documents($document);