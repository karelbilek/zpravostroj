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
			#which types of named I do want

 
sub create_new_document{
	my $text = shift;
	
	my $document = TectoMT::Document->new();
	$document->set_attr("czech_source_text", $text);
 
	return $document;
}
 
sub save_words {
	my $words_ref = shift;	
	my $node = shift;
 
	if (my $lemma = ($node->get_attr('lemma'))) {
		if (my $lemma_better = (make_normal_word($lemma))) {
			
			my $form = $node->get_attr('form');
			push (@{$words_ref},{lemma=>$lemma_better, form=>$form});
			
				#THE LEMMA DOESN'T HAVE TO BE 100% CORRECT!
				#why? because Tagger doesn't read corrections.yaml
				#because corrections can change, but I want to run this module as little as possible
			
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
		save_named( $named_ref, $child);
	}
}
 
sub doc_to_hash {
	
	my $article = shift;
	
	my $document = shift;
	my @words;
	my %named;
	
	foreach my $bundle ( $document->get_bundles() ) {
		save_words(\@words, $bundle->get_tree('SCzechM'));
	}
	
	foreach my $bundle ( $document->get_bundles() ) {
		save_named( \%named, $bundle->get_tree('SCzechN'));
	}
	
	
	my @arnamed = keys %named;
	
	$article->{all_words}=\@words;
	$article->{all_named}=\@arnamed;
}

my $save_err;

sub shut_up {
	#open my $saveerr, ">&STDERR";
	#open STDERR, '>', "/dev/null";
}
sub open_up {
	#open STDERR, ">&", $saveerr;
}


 
my $scenario_initialized = 0;
my $scenario;
 
sub tag_texts {
 
	
	unless ($scenario_initialized) {
		shut_up();
		$scenario = TectoMT::Scenario->new({'blocks'=> [ qw(SCzechW_to_SCzechM::Sentence_segmentation SCzechW_to_SCzechM::Tokenize  SCzechW_to_SCzechM::TagHajic SCzechM_to_SCzechN::Czech_named_ent_SVM_recognizer) ]});
		open_up();
		$scenario_initialized = 1;
	}
	
 
	my @articles = @_;
	my %documents_hash;
	
	
	map ($documents_hash{$_}=create_new_document($_->{extracted}), @articles);
 
	shut_up();
	$scenario->apply_on_tmt_documents(@documents_hash{@articles});
	open_up();
	
	map (doc_to_hash($_, $documents_hash{$_}), @articles);
	
 	return @articles;
}
 
1;