package News::Tagger;

use 5.008;
use strict;
use warnings;


use SimpleUtilsXML;
use Encode;
use utf8;



use base 'Exporter';
our @EXPORT = qw( tagTexts);




sub createNewDocument{
	use TectoMT::Document;
	my $text = shift;
	
	my $document = TectoMT::Document->new();
	$document->set_attr("czech_source_text", $text);
	
	return $document;
}

sub docToXML {
	use TectoMT::Document;
	
	my $document = shift;
	my $res="";
	open my $resh, '>', \$res;
	$document->serialize_to(\*$resh);
	return decode("utf8", $res);
}

my $scenario = TectoMT::Scenario->new({'blocks'=> [ qw(SCzechW_to_SCzechM::Sentence_segmentation SCzechW_to_SCzechM::Tokenize  SCzechW_to_SCzechM::TagHajic SCzechM_to_SCzechN::Czech_named_ent_SVM_recognizer) ]});

sub tagTexts {
	use TectoMT::Scenario;
	use TectoMT::Document;
		
	my @texts = @_;

	my @documents = map(createNewDocument($_), @texts);
	
	open my $saveerr, ">&STDERR";
	open STDERR, '>', "/dev/null";
	
	
	# my $time;
	# my $i = 0;
	
	# while ($i < scalar (@documents)) {
	# 	print $i."\n";
	# 	$time = time();
	# 	
	# 	my @subd = @documents[$i..$i+9];
	# 	
	# 
	# 	$scenario->apply_on_tmt_documents(@subd);
	# 	
	# 	
	# 	my $stime = time();
	# 	print ($stime-$time);
	# 	print "\n";
	# 	$time=$stime;
	# 	$i+=10;
	# }
	$scenario->apply_on_tmt_documents(@documents);
	
	
	open STDERR, ">&", $saveerr;
	
	my @XMLs = map (docToXML($_), @documents);
	$scenario->DESTROY;
	return @XMLs;
}

1;