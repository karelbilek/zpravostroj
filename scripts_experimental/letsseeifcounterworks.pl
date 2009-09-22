use strict;
use warnings;

use Zpravostroj::Counter qw(count_TMT);

my $sthg = '<?xml version="1.0" encoding="utf-8"?>

<tmt_document xmlns="http://ufal.mff.cuni.cz/pdt/pml/">
 <head>
  <schema href="tmt_schema.xml" />
 </head>
 <meta>
  <czech_source_text>Iveta Kopřivová z Ivančic se pokusila zazpívat hit od skupiny Team - Reklama na ticho a zaútočila tak na přední pozice v žebříčku Hvězdné pěchoty.</czech_source_text>
 </meta>
 <bundles>
  <LM id="s1">
   <czech_source_sentence>Iveta Kopřivová z Ivančic se pokusila zazpívat hit od skupiny Team - Reklama na ticho a zaútočila tak na přední pozice v žebříčku Hvězdné pěchoty.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s1">
     <children>
      <LM id="SCzechM-s1-w1">
       <form>Iveta</form>
       <lemma>Iveta_;Y</lemma>
       <tag>NNFS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s1-w2">
       <form>Kopřivová</form>
       <lemma>kopřivový</lemma>
       <tag>AAFS1----1A----</tag>
      </LM>
      <LM id="SCzechM-s1-w3">
       <form>z</form>
       <lemma>z-1</lemma>
       <tag>RR--2----------</tag>
      </LM>
      <LM id="SCzechM-s1-w4">
       <form>Ivančic</form>
       <lemma>Ivančice_;G</lemma>
       <tag>NNFP2-----A----</tag>
      </LM>
      <LM id="SCzechM-s1-w5">
       <form>se</form>
       <lemma>se_^(zvr._zájmeno/částice)</lemma>
       <tag>P7-X4----------</tag>
      </LM>
      <LM id="SCzechM-s1-w6">
       <form>pokusila</form>
       <lemma>pokusit_:W</lemma>
       <tag>VpQW---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s1-w7">
       <form>zazpívat</form>
       <lemma>zazpívat_:W</lemma>
       <tag>Vf--------A----</tag>
      </LM>
      <LM id="SCzechM-s1-w8">
       <form>hit</form>
       <lemma>hit</lemma>
       <tag>NNIS4-----A----</tag>
      </LM>
      <LM id="SCzechM-s1-w9">
       <form>od</form>
       <lemma>od-1</lemma>
       <tag>RR--2----------</tag>
      </LM>
      <LM id="SCzechM-s1-w10">
       <form>skupiny</form>
       <lemma>skupina</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s1-w11">
       <form>Team</form>
       <lemma>team_,t</lemma>
       <tag>NNIS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s1-w12">
       <form>-</form>
       <lemma>-</lemma>
       <tag>Z:-------------</tag>
      </LM>
      <LM id="SCzechM-s1-w13">
       <form>Reklama</form>
       <lemma>reklama</lemma>
       <tag>NNFS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s1-w14">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s1-w15">
       <form>ticho</form>
       <lemma>ticho</lemma>
       <tag>NNNS4-----A----</tag>
      </LM>
      <LM id="SCzechM-s1-w16">
       <form>a</form>
       <lemma>a-1</lemma>
       <tag>J^-------------</tag>
      </LM>
      <LM id="SCzechM-s1-w17">
       <form>zaútočila</form>
       <lemma>zaútočit_:W</lemma>
       <tag>VpQW---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s1-w18">
       <form>tak</form>
       <lemma>tak-3</lemma>
       <tag>Db-------------</tag>
      </LM>
      <LM id="SCzechM-s1-w19">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s1-w20">
       <form>přední</form>
       <lemma>přední</lemma>
       <tag>AAFS4----1A----</tag>
      </LM>
      <LM id="SCzechM-s1-w21">
       <form>pozice</form>
       <lemma>pozice</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s1-w22">
       <form>v</form>
       <lemma>v-1</lemma>
       <tag>RR--6----------</tag>
      </LM>
      <LM id="SCzechM-s1-w23">
       <form>žebříčku</form>
       <lemma>žebříčko_,s</lemma>
       <tag>NNNS6-----A----</tag>
      </LM>
      <LM id="SCzechM-s1-w24">
       <form>Hvězdné</form>
       <lemma>hvězdný</lemma>
       <tag>AAFS2----1A----</tag>
      </LM>
      <LM id="SCzechM-s1-w25">
       <form>pěchoty</form>
       <lemma>pěchota</lemma>
       <tag>NNFS2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s1-w26">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN>
     <children>
      <LM id="SCzechN-s1-w2">
       <ne_type>pf</ne_type>
       <normalized_name>Iveta</normalized_name>
       <m.rf>
        <LM>SCzechM-s1-w1</LM>
       </m.rf>
      </LM>
      <LM id="SCzechN-s1-w3">
       <ne_type>P</ne_type>
       <normalized_name>Iveta kopřivový</normalized_name>
       <m.rf>
        <LM>SCzechM-s1-w1</LM>
        <LM>SCzechM-s1-w2</LM>
       </m.rf>
      </LM>
      <LM id="SCzechN-s1-w4">
       <ne_type>ps</ne_type>
       <normalized_name>kopřivový</normalized_name>
       <m.rf>
        <LM>SCzechM-s1-w2</LM>
       </m.rf>
      </LM>
      <LM id="SCzechN-s1-w5">
       <ne_type>gu</ne_type>
       <normalized_name>Ivančice</normalized_name>
       <m.rf>
        <LM>SCzechM-s1-w4</LM>
       </m.rf>
      </LM>
     </children>
    </SCzechN>
   </trees>
  </LM>
 </bundles>
</tmt_document>
';

print count_TMT($sthg);