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
 	
	eval {
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
	};
	if ($@) {
		my_warning("save_words - unidentified error - $@");
	}
}

 
sub save_named {
	my $named_ref = shift;
	my $node = shift;
	
	eval {
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
	};
	if ($@) {
		my_warning("save_named - unidentified error - $@");
	}
}
 
sub doc_to_hash {
	
	my $article = shift;
	
	my $document = shift;
	my @words;
	my %named;
	
	foreach my $bundle ( $document->get_bundles() ) {
		eval {save_words(\@words, $bundle->get_tree('SCzechM'))};
		if ($@) {my_warning("doc_to_hash - cannot get SCzechM tree - $@")};
	}
	
	foreach my $bundle ( $document->get_bundles() ) {
		eval {save_named( \%named, $bundle->get_tree('SCzechN'))};
		if ($@) {my_warning("doc_to_hash - cannot get SCzechN tree - $@")};
	}
	
	
	my @arnamed = keys %named;
	
	$article->{all_words}=\@words;
	$article->{all_named}=\@arnamed;
}

my $save_err;

sub shut_up {
	my_log("shut_up");
	open $save_err, ">&STDERR";
	open STDERR, '>', "/dev/null";
}
sub open_up {
	my_log("open_up");
	open STDERR, ">&", $save_err;
}


 
my $scenario_initialized = 0;
my $scenario;
 
sub tag_texts {
	
	my @articles = @_;
 
	my_log("tag_texts - entering");
	unless ($scenario_initialized) {
		my_log("tag_texts - initializing scenario for the first time");
		
		shut_up();
		
		my $err;
		do {
			eval {$scenario = TectoMT::Scenario->new({'blocks'=> [ qw(SCzechW_to_SCzechM::Sentence_segmentation SCzechW_to_SCzechM::Tokenize  SCzechW_to_SCzechM::TagHajic SCzechM_to_SCzechN::Czech_named_ent_SVM_recognizer) ]})};
					#redirecting STDERR doesn'  stop eval from working
			$err=$@;
		} while ($err); 
					#I simply HAVE to have scenario for future work. If it causes infinite loop, so be it, I just NEED the scenario
		
		open_up();
		my_log("tag_texts - done initializing");
		$scenario_initialized = 1;
	}
	
 
	
	my %documents_hash;
	
	
	map ($documents_hash{$_}=create_new_document($_->{extracted}), @articles);
	
	my_log("tag_texts - lets apply the thing on the document! ha ha!");
	shut_up();
	
	eval {$scenario->apply_on_tmt_documents(@documents_hash{@articles})};
	if ($@) {
		my_warning("tag_texts - error while applying to tmt documents - $@; trying for 2nd time");
		eval {$scenario->apply_on_tmt_documents(@documents_hash{@articles})};
		if ($@) {
			my_warning("tag_texts - giving up.");
		}
	};
	
	open_up();
	my_log("tag_texts - done. hashing back....");
	
	
	map (doc_to_hash($_, $documents_hash{$_}), @articles);
	
	my_log("tag_texts - ...done. exiting");
	return @articles;
}
 
1;