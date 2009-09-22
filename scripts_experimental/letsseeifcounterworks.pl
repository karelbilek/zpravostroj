use strict;
use warnings;

use Zpravostroj::Counter qw(count_TMT);

my $sthg = '<?xml version="1.0" encoding="utf-8"?>

<tmt_document xmlns="http://ufal.mff.cuni.cz/pdt/pml/">
 <head>
  <schema href="tmt_schema.xml" />
 </head>
 <meta>
  <czech_source_text>Dvě třetiny obchodů na středeční pražské burze se týkaly akcií ČEZu. Ten však oslabil a spolu s bankami zapříčinil mírný pokles indexu PX po dvou dnech růstu.Pražská burza ve středu po dvou dnech růstu klesla. Nedařilo se především cenným papírům společnosti ČEZ a bankovního sektoru. Naopak zisky si připsaly akcie CME, NWR a Philip Morris. Hlavní index PX v závěru obchodování ztratil 0,49 procenta na 1152,9 bodu.Podle Josefa Němého z investičního bankovnictví Komerční banky se pražské burze nadále vyhýbaly prudké změny u indexu PX a většiny titulů. "Tržní index byl celý den v červených číslech. Oslabily všechny tituly s velkou váhou v indexu, tedy obě banky a ČEZ," doplnil Němý.Cenné papíry firmy ČEZ ztratily 0,42 procenta na 933,10 koruny. Obchody s akciemi energetické společnosti tuto středu na pražské burze tvořily téměř dvě třetiny všech uzavřených obchodů. V systému pro nejlepší akcie SPAD byly během dne celkově uzavřeny obchody za zhruba 2,69 miliardy korun, z čehož obchody s cennými papíry ČEZu byly ve výši 1,74 miliardy Kč.Komerční banka klesla o více než procento na 3340 korun a rakouská banka Erste si pohoršila o čtvrt procenta na 758 Kč. V oslabování pokračoval také operátor Telefónica O2, když ztratil 1,53 procenta na 445,10 koruny. "Poté, co se začaly akcie Telefóniky O2 v pondělí poprvé obchodovat bez práva na dividendu, neznají jinou cestu než dolů," dodal Němý.Výrazně se nedařilo developerům, když Orco kleslo o 2,51 procenta na 240,80 koruny a společnost ECM ztratila 1,57 procenta na 387,80 Kč.Největší zisky si připsaly akcie mediální společnosti CME, které posílily o 3,59 procenta na 548 korun. Cenné papíry těžební společnosti NWR a tabákové Philip Morris si připsaly shodně 0,17 procenta. Pojišťovna VIG za malého zájmu investorů posílila o více než procento na 921,60 koruny.Z okolních středoevropských trhů si ztráty připsal také budapešťský BUX, který klesl o 1,58 procenta. Naopak vídeňský ATX vzrostl o 0,83 procenta a varšavský WIG 20 si polepšil o procento.</czech_source_text>
 </meta>
 <bundles>
  <LM id="s1">
   <czech_source_sentence>Dvě třetiny obchodů na středeční pražské burze se týkaly akcií ČEZu.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s1">
     <children>
      <LM id="SCzechM-s1-w1">
       <form>Dvě</form>
       <lemma>dva`2</lemma>
       <tag>ClHP1----------</tag>
      </LM>
      <LM id="SCzechM-s1-w2">
       <form>třetiny</form>
       <lemma>třetina</lemma>
       <tag>CyFP1----------</tag>
      </LM>
      <LM id="SCzechM-s1-w3">
       <form>obchodů</form>
       <lemma>obchod</lemma>
       <tag>NNIP2-----A----</tag>
      </LM>
      <LM id="SCzechM-s1-w4">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--6----------</tag>
      </LM>
      <LM id="SCzechM-s1-w5">
       <form>středeční</form>
       <lemma>středeční</lemma>
       <tag>AAFS6----1A----</tag>
      </LM>
      <LM id="SCzechM-s1-w6">
       <form>pražské</form>
       <lemma>pražský</lemma>
       <tag>AAFS6----1A----</tag>
      </LM>
      <LM id="SCzechM-s1-w7">
       <form>burze</form>
       <lemma>burza</lemma>
       <tag>NNFS6-----A----</tag>
      </LM>
      <LM id="SCzechM-s1-w8">
       <form>se</form>
       <lemma>se_^(zvr._zájmeno/částice)</lemma>
       <tag>P7-X4----------</tag>
      </LM>
      <LM id="SCzechM-s1-w9">
       <form>týkaly</form>
       <lemma>týkat_:T</lemma>
       <tag>VpTP---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s1-w10">
       <form>akcií</form>
       <lemma>akcie</lemma>
       <tag>NNFS7-----A----</tag>
      </LM>
      <LM id="SCzechM-s1-w11">
       <form>ČEZu</form>
       <lemma>ČEZu</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s1-w12">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN></SCzechN>
   </trees>
  </LM>
  <LM id="s2">
   <czech_source_sentence>Ten však oslabil a spolu s bankami zapříčinil mírný pokles indexu PX po dvou dnech růstu.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s2">
     <children>
      <LM id="SCzechM-s2-w1">
       <form>Ten</form>
       <lemma>ten</lemma>
       <tag>PDYS1----------</tag>
      </LM>
      <LM id="SCzechM-s2-w2">
       <form>však</form>
       <lemma>však</lemma>
       <tag>J^-------------</tag>
      </LM>
      <LM id="SCzechM-s2-w3">
       <form>oslabil</form>
       <lemma>oslabit_:W</lemma>
       <tag>VpYS---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s2-w4">
       <form>a</form>
       <lemma>a-1</lemma>
       <tag>J^-------------</tag>
      </LM>
      <LM id="SCzechM-s2-w5">
       <form>spolu</form>
       <lemma>spolu</lemma>
       <tag>Db-------------</tag>
      </LM>
      <LM id="SCzechM-s2-w6">
       <form>s</form>
       <lemma>s-1</lemma>
       <tag>RR--7----------</tag>
      </LM>
      <LM id="SCzechM-s2-w7">
       <form>bankami</form>
       <lemma>banka</lemma>
       <tag>NNFP7-----A----</tag>
      </LM>
      <LM id="SCzechM-s2-w8">
       <form>zapříčinil</form>
       <lemma>zapříčinit_:W</lemma>
       <tag>VpYS---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s2-w9">
       <form>mírný</form>
       <lemma>mírný</lemma>
       <tag>AAIS4----1A----</tag>
      </LM>
      <LM id="SCzechM-s2-w10">
       <form>pokles</form>
       <lemma>pokles</lemma>
       <tag>NNIS4-----A----</tag>
      </LM>
      <LM id="SCzechM-s2-w11">
       <form>indexu</form>
       <lemma>index</lemma>
       <tag>NNIS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s2-w12">
       <form>PX</form>
       <lemma>PX_:B_^(index)</lemma>
       <tag>Xx-------------</tag>
      </LM>
      <LM id="SCzechM-s2-w13">
       <form>po</form>
       <lemma>po-1</lemma>
       <tag>RR--6----------</tag>
      </LM>
      <LM id="SCzechM-s2-w14">
       <form>dvou</form>
       <lemma>dva`2</lemma>
       <tag>ClXP6----------</tag>
      </LM>
      <LM id="SCzechM-s2-w15">
       <form>dnech</form>
       <lemma>den_^(jednotka_času)</lemma>
       <tag>NNIP6-----A----</tag>
      </LM>
      <LM id="SCzechM-s2-w16">
       <form>růstu</form>
       <lemma>růst-1</lemma>
       <tag>NNIS2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s2-w17">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN></SCzechN>
   </trees>
  </LM>
  <LM id="s3">
   <czech_source_sentence>Pražská burza ve středu po dvou dnech růstu klesla.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s3">
     <children>
      <LM id="SCzechM-s3-w1">
       <form>Pražská</form>
       <lemma>pražský</lemma>
       <tag>AAFS1----1A----</tag>
      </LM>
      <LM id="SCzechM-s3-w2">
       <form>burza</form>
       <lemma>burza</lemma>
       <tag>NNFS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s3-w3">
       <form>ve</form>
       <lemma>v-1</lemma>
       <tag>RV--4----------</tag>
      </LM>
      <LM id="SCzechM-s3-w4">
       <form>středu</form>
       <lemma>středa</lemma>
       <tag>NNFS4-----A----</tag>
      </LM>
      <LM id="SCzechM-s3-w5">
       <form>po</form>
       <lemma>po-1</lemma>
       <tag>RR--6----------</tag>
      </LM>
      <LM id="SCzechM-s3-w6">
       <form>dvou</form>
       <lemma>dva`2</lemma>
       <tag>ClXP6----------</tag>
      </LM>
      <LM id="SCzechM-s3-w7">
       <form>dnech</form>
       <lemma>den_^(jednotka_času)</lemma>
       <tag>NNIP6-----A----</tag>
      </LM>
      <LM id="SCzechM-s3-w8">
       <form>růstu</form>
       <lemma>růst-1</lemma>
       <tag>NNIS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s3-w9">
       <form>klesla</form>
       <lemma>klesnout_:W</lemma>
       <tag>VpQW---XR-AA--1</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s3-w10">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN></SCzechN>
   </trees>
  </LM>
  <LM id="s4">
   <czech_source_sentence>Nedařilo se především cenným papírům společnosti ČEZ a bankovního sektoru.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s4">
     <children>
      <LM id="SCzechM-s4-w1">
       <form>Nedařilo</form>
       <lemma>dařit_:T</lemma>
       <tag>VpNS---XR-NA---</tag>
      </LM>
      <LM id="SCzechM-s4-w2">
       <form>se</form>
       <lemma>se_^(zvr._zájmeno/částice)</lemma>
       <tag>P7-X4----------</tag>
      </LM>
      <LM id="SCzechM-s4-w3">
       <form>především</form>
       <lemma>především</lemma>
       <tag>Db-------------</tag>
      </LM>
      <LM id="SCzechM-s4-w4">
       <form>cenným</form>
       <lemma>cenný</lemma>
       <tag>AAIP3----1A----</tag>
      </LM>
      <LM id="SCzechM-s4-w5">
       <form>papírům</form>
       <lemma>papír</lemma>
       <tag>NNIP3-----A----</tag>
      </LM>
      <LM id="SCzechM-s4-w6">
       <form>společnosti</form>
       <lemma>společnost_^(*3ý)</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s4-w7">
       <form>ČEZ</form>
       <lemma>ČEZ-1_:B_;K_^(České_energetické_závody)</lemma>
       <tag>NNIPX-----A---8</tag>
      </LM>
      <LM id="SCzechM-s4-w8">
       <form>a</form>
       <lemma>a-1</lemma>
       <tag>J^-------------</tag>
      </LM>
      <LM id="SCzechM-s4-w9">
       <form>bankovního</form>
       <lemma>bankovní</lemma>
       <tag>AAIS2----1A----</tag>
      </LM>
      <LM id="SCzechM-s4-w10">
       <form>sektoru</form>
       <lemma>sektor</lemma>
       <tag>NNIS2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s4-w11">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN></SCzechN>
   </trees>
  </LM>
  <LM id="s5">
   <czech_source_sentence>Naopak zisky si připsaly akcie CME, NWR a Philip Morris.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s5">
     <children>
      <LM id="SCzechM-s5-w1">
       <form>Naopak</form>
       <lemma>naopak</lemma>
       <tag>Db-------------</tag>
      </LM>
      <LM id="SCzechM-s5-w2">
       <form>zisky</form>
       <lemma>zisk</lemma>
       <tag>NNIP1-----A----</tag>
      </LM>
      <LM id="SCzechM-s5-w3">
       <form>si</form>
       <lemma>se_^(zvr._zájmeno/částice)</lemma>
       <tag>P7-X3----------</tag>
      </LM>
      <LM id="SCzechM-s5-w4">
       <form>připsaly</form>
       <lemma>připsat</lemma>
       <tag>VpTP---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s5-w5">
       <form>akcie</form>
       <lemma>akcie</lemma>
       <tag>NNFP1-----A----</tag>
      </LM>
      <LM id="SCzechM-s5-w6">
       <form>CME</form>
       <lemma>CME-2_:B_;K_,t_^(Chicago_Mercantile_Exchange)</lemma>
       <tag>NNFXX-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s5-w7">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
      </LM>
      <LM id="SCzechM-s5-w8">
       <form>NWR</form>
       <lemma>NWR</lemma>
       <tag>NNFXX-----A----</tag>
      </LM>
      <LM id="SCzechM-s5-w9">
       <form>a</form>
       <lemma>a-1</lemma>
       <tag>J^-------------</tag>
      </LM>
      <LM id="SCzechM-s5-w10">
       <form>Philip</form>
       <lemma>Philip_;Y</lemma>
       <tag>NNMS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s5-w11">
       <form>Morris</form>
       <lemma>Morris_;S</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s5-w12">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN>
     <children>
      <LM id="SCzechN-s5-w2">
       <ne_type>pf</ne_type>
       <normalized_name>Philip</normalized_name>
       <m.rf>
        <LM>SCzechM-s5-w10</LM>
       </m.rf>
      </LM>
      <LM id="SCzechN-s5-w3">
       <ne_type>P</ne_type>
       <normalized_name>Philip Morris</normalized_name>
       <m.rf>
        <LM>SCzechM-s5-w10</LM>
        <LM>SCzechM-s5-w11</LM>
       </m.rf>
      </LM>
      <LM id="SCzechN-s5-w4">
       <ne_type>ps</ne_type>
       <normalized_name>Morris</normalized_name>
       <m.rf>
        <LM>SCzechM-s5-w11</LM>
       </m.rf>
      </LM>
     </children>
    </SCzechN>
   </trees>
  </LM>
  <LM id="s6">
   <czech_source_sentence>Hlavní index PX v závěru obchodování ztratil 0,49 procenta na 1152,9 bodu.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s6">
     <children>
      <LM id="SCzechM-s6-w1">
       <form>Hlavní</form>
       <lemma>hlavní</lemma>
       <tag>AAIS1----1A----</tag>
      </LM>
      <LM id="SCzechM-s6-w2">
       <form>index</form>
       <lemma>index</lemma>
       <tag>NNIS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s6-w3">
       <form>PX</form>
       <lemma>PX_:B_^(index)</lemma>
       <tag>Xx-------------</tag>
      </LM>
      <LM id="SCzechM-s6-w4">
       <form>v</form>
       <lemma>v-1</lemma>
       <tag>RR--6----------</tag>
      </LM>
      <LM id="SCzechM-s6-w5">
       <form>závěru</form>
       <lemma>závěr_^(př._z_jednání,_úvah)</lemma>
       <tag>NNIS6-----A----</tag>
      </LM>
      <LM id="SCzechM-s6-w6">
       <form>obchodování</form>
       <lemma>obchodování_^(*3at)</lemma>
       <tag>NNNS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s6-w7">
       <form>ztratil</form>
       <lemma>ztratit_:W</lemma>
       <tag>VpYS---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s6-w8">
       <form>0</form>
       <lemma>0</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s6-w9">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s6-w10">
       <form>49</form>
       <lemma>49</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s6-w11">
       <form>procenta</form>
       <lemma>procento</lemma>
       <tag>NNNS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s6-w12">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s6-w13">
       <form>1152</form>
       <lemma>1152</lemma>
       <tag>C=-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s6-w14">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s6-w15">
       <form>9</form>
       <lemma>9</lemma>
       <tag>NNMS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s6-w16">
       <form>bodu</form>
       <lemma>bod</lemma>
       <tag>NNIS2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s6-w17">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN>
     <children>
      <LM id="SCzechN-s6-w2">
       <ne_type>ty</ne_type>
       <normalized_name>1152</normalized_name>
       <m.rf>
        <LM>SCzechM-s6-w13</LM>
       </m.rf>
      </LM>
     </children>
    </SCzechN>
   </trees>
  </LM>
  <LM id="s7">
   <czech_source_sentence>Podle Josefa Němého z investičního bankovnictví Komerční banky se pražské burze nadále vyhýbaly prudké změny u indexu PX a většiny titulů.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s7">
     <children>
      <LM id="SCzechM-s7-w1">
       <form>Podle</form>
       <lemma>podle-2</lemma>
       <tag>RR--2----------</tag>
      </LM>
      <LM id="SCzechM-s7-w2">
       <form>Josefa</form>
       <lemma>Josef_;Y</lemma>
       <tag>NNMS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s7-w3">
       <form>Němého</form>
       <lemma>němý</lemma>
       <tag>AAMS2----1A----</tag>
      </LM>
      <LM id="SCzechM-s7-w4">
       <form>z</form>
       <lemma>z-1</lemma>
       <tag>RR--2----------</tag>
      </LM>
      <LM id="SCzechM-s7-w5">
       <form>investičního</form>
       <lemma>investiční</lemma>
       <tag>AANS2----1A----</tag>
      </LM>
      <LM id="SCzechM-s7-w6">
       <form>bankovnictví</form>
       <lemma>bankovnictví</lemma>
       <tag>NNNS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s7-w7">
       <form>Komerční</form>
       <lemma>komerční</lemma>
       <tag>AAFS2----1A----</tag>
      </LM>
      <LM id="SCzechM-s7-w8">
       <form>banky</form>
       <lemma>banka</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s7-w9">
       <form>se</form>
       <lemma>se_^(zvr._zájmeno/částice)</lemma>
       <tag>P7-X4----------</tag>
      </LM>
      <LM id="SCzechM-s7-w10">
       <form>pražské</form>
       <lemma>pražský</lemma>
       <tag>AAFS6----1A----</tag>
      </LM>
      <LM id="SCzechM-s7-w11">
       <form>burze</form>
       <lemma>burza</lemma>
       <tag>NNFS6-----A----</tag>
      </LM>
      <LM id="SCzechM-s7-w12">
       <form>nadále</form>
       <lemma>nadále</lemma>
       <tag>Db-------------</tag>
      </LM>
      <LM id="SCzechM-s7-w13">
       <form>vyhýbaly</form>
       <lemma>vyhýbat_:T</lemma>
       <tag>VpTP---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s7-w14">
       <form>prudké</form>
       <lemma>prudký</lemma>
       <tag>AAFP1----1A----</tag>
      </LM>
      <LM id="SCzechM-s7-w15">
       <form>změny</form>
       <lemma>změna</lemma>
       <tag>NNFP1-----A----</tag>
      </LM>
      <LM id="SCzechM-s7-w16">
       <form>u</form>
       <lemma>u-1</lemma>
       <tag>RR--2----------</tag>
      </LM>
      <LM id="SCzechM-s7-w17">
       <form>indexu</form>
       <lemma>index</lemma>
       <tag>NNIS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s7-w18">
       <form>PX</form>
       <lemma>PX_:B_^(index)</lemma>
       <tag>Xx-------------</tag>
      </LM>
      <LM id="SCzechM-s7-w19">
       <form>a</form>
       <lemma>a-1</lemma>
       <tag>J^-------------</tag>
      </LM>
      <LM id="SCzechM-s7-w20">
       <form>většiny</form>
       <lemma>většina</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s7-w21">
       <form>titulů</form>
       <lemma>titul</lemma>
       <tag>NNIP2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s7-w22">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN>
     <children>
      <LM id="SCzechN-s7-w2">
       <ne_type>pf</ne_type>
       <normalized_name>Josef</normalized_name>
       <m.rf>
        <LM>SCzechM-s7-w2</LM>
       </m.rf>
      </LM>
     </children>
    </SCzechN>
   </trees>
  </LM>
  <LM id="s8">
   <czech_source_sentence>"Tržní index byl celý den v červených číslech.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s8">
     <children>
      <LM id="SCzechM-s8-w1">
       <form>"</form>
       <lemma>"</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s8-w2">
       <form>Tržní</form>
       <lemma>tržní</lemma>
       <tag>AAIS1----1A----</tag>
      </LM>
      <LM id="SCzechM-s8-w3">
       <form>index</form>
       <lemma>index</lemma>
       <tag>NNIS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s8-w4">
       <form>byl</form>
       <lemma>být</lemma>
       <tag>VpYS---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s8-w5">
       <form>celý</form>
       <lemma>celý</lemma>
       <tag>AAIS4----1A----</tag>
      </LM>
      <LM id="SCzechM-s8-w6">
       <form>den</form>
       <lemma>den_^(jednotka_času)</lemma>
       <tag>NNIS4-----A----</tag>
      </LM>
      <LM id="SCzechM-s8-w7">
       <form>v</form>
       <lemma>v-1</lemma>
       <tag>RR--6----------</tag>
      </LM>
      <LM id="SCzechM-s8-w8">
       <form>červených</form>
       <lemma>červený-1_;o</lemma>
       <tag>AANP6----1A----</tag>
      </LM>
      <LM id="SCzechM-s8-w9">
       <form>číslech</form>
       <lemma>číslo</lemma>
       <tag>NNNP6-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s8-w10">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN></SCzechN>
   </trees>
  </LM>
  <LM id="s9">
   <czech_source_sentence>Oslabily všechny tituly s velkou váhou v indexu, tedy obě banky a ČEZ," doplnil Němý.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s9">
     <children>
      <LM id="SCzechM-s9-w1">
       <form>Oslabily</form>
       <lemma>oslabit_:W</lemma>
       <tag>VpTP---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s9-w2">
       <form>všechny</form>
       <lemma>všechen</lemma>
       <tag>PLYP4----------</tag>
      </LM>
      <LM id="SCzechM-s9-w3">
       <form>tituly</form>
       <lemma>titul</lemma>
       <tag>NNIP4-----A----</tag>
      </LM>
      <LM id="SCzechM-s9-w4">
       <form>s</form>
       <lemma>s-1</lemma>
       <tag>RR--7----------</tag>
      </LM>
      <LM id="SCzechM-s9-w5">
       <form>velkou</form>
       <lemma>velký</lemma>
       <tag>AAFS7----1A----</tag>
      </LM>
      <LM id="SCzechM-s9-w6">
       <form>váhou</form>
       <lemma>váha_^(na_vážení;_hmotnost)</lemma>
       <tag>NNFS7-----A----</tag>
      </LM>
      <LM id="SCzechM-s9-w7">
       <form>v</form>
       <lemma>v-1</lemma>
       <tag>RR--6----------</tag>
      </LM>
      <LM id="SCzechM-s9-w8">
       <form>indexu</form>
       <lemma>index</lemma>
       <tag>NNIS6-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s9-w9">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
      </LM>
      <LM id="SCzechM-s9-w10">
       <form>tedy</form>
       <lemma>tedy</lemma>
       <tag>Db-------------</tag>
      </LM>
      <LM id="SCzechM-s9-w11">
       <form>obě</form>
       <lemma>oba`2</lemma>
       <tag>ClHP1----------</tag>
      </LM>
      <LM id="SCzechM-s9-w12">
       <form>banky</form>
       <lemma>banka</lemma>
       <tag>NNFP1-----A----</tag>
      </LM>
      <LM id="SCzechM-s9-w13">
       <form>a</form>
       <lemma>a-1</lemma>
       <tag>J^-------------</tag>
      </LM>
      <LM id="SCzechM-s9-w14">
       <form>ČEZ</form>
       <lemma>ČEZ-1_:B_;K_^(České_energetické_závody)</lemma>
       <tag>NNIPX-----A---8</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s9-w15">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s9-w16">
       <form>"</form>
       <lemma>"</lemma>
       <tag>Z:-------------</tag>
      </LM>
      <LM id="SCzechM-s9-w17">
       <form>doplnil</form>
       <lemma>doplnit_:W</lemma>
       <tag>VpYS---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s9-w18">
       <form>Němý</form>
       <lemma>němý</lemma>
       <tag>AAIS1----1A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s9-w19">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN></SCzechN>
   </trees>
  </LM>
  <LM id="s10">
   <czech_source_sentence>Cenné papíry firmy ČEZ ztratily 0,42 procenta na 933,10 koruny.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s10">
     <children>
      <LM id="SCzechM-s10-w1">
       <form>Cenné</form>
       <lemma>cenný</lemma>
       <tag>AAIP1----1A----</tag>
      </LM>
      <LM id="SCzechM-s10-w2">
       <form>papíry</form>
       <lemma>papír</lemma>
       <tag>NNIP1-----A----</tag>
      </LM>
      <LM id="SCzechM-s10-w3">
       <form>firmy</form>
       <lemma>firma</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s10-w4">
       <form>ČEZ</form>
       <lemma>ČEZ-1_:B_;K_^(České_energetické_závody)</lemma>
       <tag>NNIPX-----A---8</tag>
      </LM>
      <LM id="SCzechM-s10-w5">
       <form>ztratily</form>
       <lemma>ztratit_:W</lemma>
       <tag>VpTP---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s10-w6">
       <form>0</form>
       <lemma>0</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s10-w7">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s10-w8">
       <form>42</form>
       <lemma>42</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s10-w9">
       <form>procenta</form>
       <lemma>procento</lemma>
       <tag>NNNS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s10-w10">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s10-w11">
       <form>933</form>
       <lemma>933</lemma>
       <tag>C=-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s10-w12">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s10-w13">
       <form>10</form>
       <lemma>10</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s10-w14">
       <form>koruny</form>
       <lemma>koruna</lemma>
       <tag>NNFS2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s10-w15">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN></SCzechN>
   </trees>
  </LM>
  <LM id="s11">
   <czech_source_sentence>Obchody s akciemi energetické společnosti tuto středu na pražské burze tvořily téměř dvě třetiny všech uzavřených obchodů.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s11">
     <children>
      <LM id="SCzechM-s11-w1">
       <form>Obchody</form>
       <lemma>obchod</lemma>
       <tag>NNIP1-----A----</tag>
      </LM>
      <LM id="SCzechM-s11-w2">
       <form>s</form>
       <lemma>s-1</lemma>
       <tag>RR--7----------</tag>
      </LM>
      <LM id="SCzechM-s11-w3">
       <form>akciemi</form>
       <lemma>akcie</lemma>
       <tag>NNFP7-----A----</tag>
      </LM>
      <LM id="SCzechM-s11-w4">
       <form>energetické</form>
       <lemma>energetický</lemma>
       <tag>AAFS2----1A----</tag>
      </LM>
      <LM id="SCzechM-s11-w5">
       <form>společnosti</form>
       <lemma>společnost_^(*3ý)</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s11-w6">
       <form>tuto</form>
       <lemma>tento</lemma>
       <tag>PDFS4----------</tag>
      </LM>
      <LM id="SCzechM-s11-w7">
       <form>středu</form>
       <lemma>středa</lemma>
       <tag>NNFS4-----A----</tag>
      </LM>
      <LM id="SCzechM-s11-w8">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--6----------</tag>
      </LM>
      <LM id="SCzechM-s11-w9">
       <form>pražské</form>
       <lemma>pražský</lemma>
       <tag>AAFS6----1A----</tag>
      </LM>
      <LM id="SCzechM-s11-w10">
       <form>burze</form>
       <lemma>burza</lemma>
       <tag>NNFS6-----A----</tag>
      </LM>
      <LM id="SCzechM-s11-w11">
       <form>tvořily</form>
       <lemma>tvořit_:T</lemma>
       <tag>VpTP---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s11-w12">
       <form>téměř</form>
       <lemma>téměř</lemma>
       <tag>Db-------------</tag>
      </LM>
      <LM id="SCzechM-s11-w13">
       <form>dvě</form>
       <lemma>dva`2</lemma>
       <tag>ClHP4----------</tag>
      </LM>
      <LM id="SCzechM-s11-w14">
       <form>třetiny</form>
       <lemma>třetina</lemma>
       <tag>CyFP4----------</tag>
      </LM>
      <LM id="SCzechM-s11-w15">
       <form>všech</form>
       <lemma>všechen</lemma>
       <tag>PLXP2----------</tag>
      </LM>
      <LM id="SCzechM-s11-w16">
       <form>uzavřených</form>
       <lemma>uzavřený_^(*3ít)</lemma>
       <tag>AAIP2----1A----</tag>
      </LM>
      <LM id="SCzechM-s11-w17">
       <form>obchodů</form>
       <lemma>obchod</lemma>
       <tag>NNIP2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s11-w18">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN></SCzechN>
   </trees>
  </LM>
  <LM id="s12">
   <czech_source_sentence>V systému pro nejlepší akcie SPAD byly během dne celkově uzavřeny obchody za zhruba 2,69 miliardy korun, z čehož obchody s cennými papíry ČEZu byly ve výši 1,74 miliardy Kč.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s12">
     <children>
      <LM id="SCzechM-s12-w1">
       <form>V</form>
       <lemma>v-1</lemma>
       <tag>RR--6----------</tag>
      </LM>
      <LM id="SCzechM-s12-w2">
       <form>systému</form>
       <lemma>systém</lemma>
       <tag>NNIS6-----A----</tag>
      </LM>
      <LM id="SCzechM-s12-w3">
       <form>pro</form>
       <lemma>pro-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s12-w4">
       <form>nejlepší</form>
       <lemma>dobrý</lemma>
       <tag>AAFP4----3A----</tag>
      </LM>
      <LM id="SCzechM-s12-w5">
       <form>akcie</form>
       <lemma>akcie</lemma>
       <tag>NNFP4-----A----</tag>
      </LM>
      <LM id="SCzechM-s12-w6">
       <form>SPAD</form>
       <lemma>spad</lemma>
       <tag>NNIS4-----A----</tag>
      </LM>
      <LM id="SCzechM-s12-w7">
       <form>byly</form>
       <lemma>být</lemma>
       <tag>VpTP---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s12-w8">
       <form>během</form>
       <lemma>během</lemma>
       <tag>RR--2----------</tag>
      </LM>
      <LM id="SCzechM-s12-w9">
       <form>dne</form>
       <lemma>den_^(jednotka_času)</lemma>
       <tag>NNIS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s12-w10">
       <form>celkově</form>
       <lemma>celkově_^(*1ý)</lemma>
       <tag>Dg-------1A----</tag>
      </LM>
      <LM id="SCzechM-s12-w11">
       <form>uzavřeny</form>
       <lemma>uzavřít</lemma>
       <tag>VsTP---XX-AP---</tag>
      </LM>
      <LM id="SCzechM-s12-w12">
       <form>obchody</form>
       <lemma>obchod</lemma>
       <tag>NNIP1-----A----</tag>
      </LM>
      <LM id="SCzechM-s12-w13">
       <form>za</form>
       <lemma>za-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s12-w14">
       <form>zhruba</form>
       <lemma>zhruba</lemma>
       <tag>Db-------------</tag>
      </LM>
      <LM id="SCzechM-s12-w15">
       <form>2</form>
       <lemma>2</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s12-w16">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s12-w17">
       <form>69</form>
       <lemma>69</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s12-w18">
       <form>miliardy</form>
       <lemma>miliarda`1000000000</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s12-w19">
       <form>korun</form>
       <lemma>koruna</lemma>
       <tag>NNFP2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s12-w20">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
      </LM>
      <LM id="SCzechM-s12-w21">
       <form>z</form>
       <lemma>z-1</lemma>
       <tag>RR--2----------</tag>
      </LM>
      <LM id="SCzechM-s12-w22">
       <form>čehož</form>
       <lemma>což-1</lemma>
       <tag>PE--2----------</tag>
      </LM>
      <LM id="SCzechM-s12-w23">
       <form>obchody</form>
       <lemma>obchod</lemma>
       <tag>NNIP1-----A----</tag>
      </LM>
      <LM id="SCzechM-s12-w24">
       <form>s</form>
       <lemma>s-1</lemma>
       <tag>RR--7----------</tag>
      </LM>
      <LM id="SCzechM-s12-w25">
       <form>cennými</form>
       <lemma>cenný</lemma>
       <tag>AAIP7----1A----</tag>
      </LM>
      <LM id="SCzechM-s12-w26">
       <form>papíry</form>
       <lemma>papír</lemma>
       <tag>NNIP7-----A----</tag>
      </LM>
      <LM id="SCzechM-s12-w27">
       <form>ČEZu</form>
       <lemma>ČEZu</lemma>
       <tag>NNMXX-----A----</tag>
      </LM>
      <LM id="SCzechM-s12-w28">
       <form>byly</form>
       <lemma>být</lemma>
       <tag>VpTP---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s12-w29">
       <form>ve</form>
       <lemma>v-1</lemma>
       <tag>RV--6----------</tag>
      </LM>
      <LM id="SCzechM-s12-w30">
       <form>výši</form>
       <lemma>výše_^(velikost_apod.;_též_tlaková_výše)</lemma>
       <tag>NNFS6-----A----</tag>
      </LM>
      <LM id="SCzechM-s12-w31">
       <form>1</form>
       <lemma>1</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s12-w32">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s12-w33">
       <form>74</form>
       <lemma>74</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s12-w34">
       <form>miliardy</form>
       <lemma>miliarda`1000000000</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s12-w35">
       <form>Kč</form>
       <lemma>Kč</lemma>
       <tag>NNFXX-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s12-w36">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN>
     <children>
      <LM id="SCzechN-s12-w2">
       <ne_type>om</ne_type>
       <normalized_name>Kč</normalized_name>
       <m.rf>
        <LM>SCzechM-s12-w35</LM>
       </m.rf>
      </LM>
     </children>
    </SCzechN>
   </trees>
  </LM>
  <LM id="s13">
   <czech_source_sentence>Komerční banka klesla o více než procento na 3340 korun a rakouská banka Erste si pohoršila o čtvrt procenta na 758 Kč.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s13">
     <children>
      <LM id="SCzechM-s13-w1">
       <form>Komerční</form>
       <lemma>komerční</lemma>
       <tag>AAFS1----1A----</tag>
      </LM>
      <LM id="SCzechM-s13-w2">
       <form>banka</form>
       <lemma>banka</lemma>
       <tag>NNFS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s13-w3">
       <form>klesla</form>
       <lemma>klesnout_:W</lemma>
       <tag>VpQW---XR-AA--1</tag>
      </LM>
      <LM id="SCzechM-s13-w4">
       <form>o</form>
       <lemma>o-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s13-w5">
       <form>více</form>
       <lemma>hodně</lemma>
       <tag>Dg-------2A----</tag>
      </LM>
      <LM id="SCzechM-s13-w6">
       <form>než</form>
       <lemma>než-2</lemma>
       <tag>J,-------------</tag>
      </LM>
      <LM id="SCzechM-s13-w7">
       <form>procento</form>
       <lemma>procento</lemma>
       <tag>NNNS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s13-w8">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s13-w9">
       <form>3340</form>
       <lemma>3340</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s13-w10">
       <form>korun</form>
       <lemma>koruna</lemma>
       <tag>NNFP2-----A----</tag>
      </LM>
      <LM id="SCzechM-s13-w11">
       <form>a</form>
       <lemma>a-1</lemma>
       <tag>J^-------------</tag>
      </LM>
      <LM id="SCzechM-s13-w12">
       <form>rakouská</form>
       <lemma>rakouský</lemma>
       <tag>AAFS1----1A----</tag>
      </LM>
      <LM id="SCzechM-s13-w13">
       <form>banka</form>
       <lemma>banka</lemma>
       <tag>NNFS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s13-w14">
       <form>Erste</form>
       <lemma>Erste_;K_;b_,t_^(Erste_Bank)</lemma>
       <tag>NNFXX-----A----</tag>
      </LM>
      <LM id="SCzechM-s13-w15">
       <form>si</form>
       <lemma>se_^(zvr._zájmeno/částice)</lemma>
       <tag>P7-X3----------</tag>
      </LM>
      <LM id="SCzechM-s13-w16">
       <form>pohoršila</form>
       <lemma>pohoršit_:W</lemma>
       <tag>VpQW---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s13-w17">
       <form>o</form>
       <lemma>o-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s13-w18">
       <form>čtvrt</form>
       <lemma>čtvrt-2_^(čtvrtina)</lemma>
       <tag>NNFS4-----A----</tag>
      </LM>
      <LM id="SCzechM-s13-w19">
       <form>procenta</form>
       <lemma>procento</lemma>
       <tag>NNNS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s13-w20">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s13-w21">
       <form>758</form>
       <lemma>758</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s13-w22">
       <form>Kč</form>
       <lemma>Kč</lemma>
       <tag>NNFXX-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s13-w23">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN>
     <children>
      <LM id="SCzechN-s13-w2">
       <ne_type>om</ne_type>
       <normalized_name>Kč</normalized_name>
       <m.rf>
        <LM>SCzechM-s13-w22</LM>
       </m.rf>
      </LM>
     </children>
    </SCzechN>
   </trees>
  </LM>
  <LM id="s14">
   <czech_source_sentence>V oslabování pokračoval také operátor Telefónica O2, když ztratil 1,53 procenta na 445,10 koruny.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s14">
     <children>
      <LM id="SCzechM-s14-w1">
       <form>V</form>
       <lemma>v-1</lemma>
       <tag>RR--6----------</tag>
      </LM>
      <LM id="SCzechM-s14-w2">
       <form>oslabování</form>
       <lemma>oslabování_^(*3at)</lemma>
       <tag>NNNS6-----A----</tag>
      </LM>
      <LM id="SCzechM-s14-w3">
       <form>pokračoval</form>
       <lemma>pokračovat_:T</lemma>
       <tag>VpYS---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s14-w4">
       <form>také</form>
       <lemma>také_^(rovněž)</lemma>
       <tag>Db-------------</tag>
      </LM>
      <LM id="SCzechM-s14-w5">
       <form>operátor</form>
       <lemma>operátor</lemma>
       <tag>NNMS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s14-w6">
       <form>Telefónica</form>
       <lemma>Telefónica</lemma>
       <tag>NNMS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s14-w7">
       <form>O2</form>
       <lemma>O2</lemma>
       <tag>C=-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s14-w8">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
      </LM>
      <LM id="SCzechM-s14-w9">
       <form>když</form>
       <lemma>když</lemma>
       <tag>J,-------------</tag>
      </LM>
      <LM id="SCzechM-s14-w10">
       <form>ztratil</form>
       <lemma>ztratit_:W</lemma>
       <tag>VpYS---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s14-w11">
       <form>1</form>
       <lemma>1</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s14-w12">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s14-w13">
       <form>53</form>
       <lemma>53</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s14-w14">
       <form>procenta</form>
       <lemma>procento</lemma>
       <tag>NNNS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s14-w15">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s14-w16">
       <form>445</form>
       <lemma>445</lemma>
       <tag>C=-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s14-w17">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s14-w18">
       <form>10</form>
       <lemma>10</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s14-w19">
       <form>koruny</form>
       <lemma>koruna</lemma>
       <tag>NNFS2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s14-w20">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN></SCzechN>
   </trees>
  </LM>
  <LM id="s15">
   <czech_source_sentence>"Poté, co se začaly akcie Telefóniky O2 v pondělí poprvé obchodovat bez práva na dividendu, neznají jinou cestu než dolů," dodal Němý.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s15">
     <children>
      <LM id="SCzechM-s15-w1">
       <form>"</form>
       <lemma>"</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s15-w2">
       <form>Poté</form>
       <lemma>poté</lemma>
       <tag>Db-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s15-w3">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
      </LM>
      <LM id="SCzechM-s15-w4">
       <form>co</form>
       <lemma>co-1</lemma>
       <tag>PQ--1----------</tag>
      </LM>
      <LM id="SCzechM-s15-w5">
       <form>se</form>
       <lemma>se_^(zvr._zájmeno/částice)</lemma>
       <tag>P7-X4----------</tag>
      </LM>
      <LM id="SCzechM-s15-w6">
       <form>začaly</form>
       <lemma>začít-1</lemma>
       <tag>VpTP---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s15-w7">
       <form>akcie</form>
       <lemma>akcie</lemma>
       <tag>NNFP1-----A----</tag>
      </LM>
      <LM id="SCzechM-s15-w8">
       <form>Telefóniky</form>
       <lemma>Telefónika</lemma>
       <tag>NNMS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s15-w9">
       <form>O2</form>
       <lemma>O2</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s15-w10">
       <form>v</form>
       <lemma>v-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s15-w11">
       <form>pondělí</form>
       <lemma>pondělí</lemma>
       <tag>NNNS4-----A----</tag>
      </LM>
      <LM id="SCzechM-s15-w12">
       <form>poprvé</form>
       <lemma>poprvé</lemma>
       <tag>Cv-------------</tag>
      </LM>
      <LM id="SCzechM-s15-w13">
       <form>obchodovat</form>
       <lemma>obchodovat_:T</lemma>
       <tag>Vf--------A----</tag>
      </LM>
      <LM id="SCzechM-s15-w14">
       <form>bez</form>
       <lemma>bez-1</lemma>
       <tag>RR--2----------</tag>
      </LM>
      <LM id="SCzechM-s15-w15">
       <form>práva</form>
       <lemma>právo_^(právo_na_něco;_také_jako_obor)</lemma>
       <tag>NNNS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s15-w16">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s15-w17">
       <form>dividendu</form>
       <lemma>dividenda</lemma>
       <tag>NNFS4-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s15-w18">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
      </LM>
      <LM id="SCzechM-s15-w19">
       <form>neznají</form>
       <lemma>znát</lemma>
       <tag>VB-P---3P-NA---</tag>
      </LM>
      <LM id="SCzechM-s15-w20">
       <form>jinou</form>
       <lemma>jiný</lemma>
       <tag>AAFS4----1A----</tag>
      </LM>
      <LM id="SCzechM-s15-w21">
       <form>cestu</form>
       <lemma>cesta_^(konkrétní_i_abstr.;_i_\'soudní_cestou\')</lemma>
       <tag>NNFS4-----A----</tag>
      </LM>
      <LM id="SCzechM-s15-w22">
       <form>než</form>
       <lemma>než-2</lemma>
       <tag>J,-------------</tag>
      </LM>
      <LM id="SCzechM-s15-w23">
       <form>dolů</form>
       <lemma>dolů</lemma>
       <tag>Db-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s15-w24">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s15-w25">
       <form>"</form>
       <lemma>"</lemma>
       <tag>Z:-------------</tag>
      </LM>
      <LM id="SCzechM-s15-w26">
       <form>dodal</form>
       <lemma>dodat_:W</lemma>
       <tag>VpYS---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s15-w27">
       <form>Němý</form>
       <lemma>němý</lemma>
       <tag>AAIS1----1A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s15-w28">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN></SCzechN>
   </trees>
  </LM>
  <LM id="s16">
   <czech_source_sentence>Výrazně se nedařilo developerům, když Orco kleslo o 2,51 procenta na 240,80 koruny a společnost ECM ztratila 1,57 procenta na 387,80 Kč.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s16">
     <children>
      <LM id="SCzechM-s16-w1">
       <form>Výrazně</form>
       <lemma>výrazně_^(*1ý)</lemma>
       <tag>Dg-------1A----</tag>
      </LM>
      <LM id="SCzechM-s16-w2">
       <form>se</form>
       <lemma>se_^(zvr._zájmeno/částice)</lemma>
       <tag>P7-X4----------</tag>
      </LM>
      <LM id="SCzechM-s16-w3">
       <form>nedařilo</form>
       <lemma>dařit_:T</lemma>
       <tag>VpNS---XR-NA---</tag>
      </LM>
      <LM id="SCzechM-s16-w4">
       <form>developerům</form>
       <lemma>developer</lemma>
       <tag>NNMP3-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s16-w5">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
      </LM>
      <LM id="SCzechM-s16-w6">
       <form>když</form>
       <lemma>když</lemma>
       <tag>J,-------------</tag>
      </LM>
      <LM id="SCzechM-s16-w7">
       <form>Orco</form>
       <lemma>Orco</lemma>
       <tag>NNNS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s16-w8">
       <form>kleslo</form>
       <lemma>klesnout_:W</lemma>
       <tag>VpNS---XR-AA--1</tag>
      </LM>
      <LM id="SCzechM-s16-w9">
       <form>o</form>
       <lemma>o-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s16-w10">
       <form>2</form>
       <lemma>2</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s16-w11">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s16-w12">
       <form>51</form>
       <lemma>51</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s16-w13">
       <form>procenta</form>
       <lemma>procento</lemma>
       <tag>NNNS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s16-w14">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s16-w15">
       <form>240</form>
       <lemma>240</lemma>
       <tag>C=-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s16-w16">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s16-w17">
       <form>80</form>
       <lemma>80</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s16-w18">
       <form>koruny</form>
       <lemma>koruna</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s16-w19">
       <form>a</form>
       <lemma>a-1</lemma>
       <tag>J^-------------</tag>
      </LM>
      <LM id="SCzechM-s16-w20">
       <form>společnost</form>
       <lemma>společnost_^(*3ý)</lemma>
       <tag>NNFS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s16-w21">
       <form>ECM</form>
       <lemma>ECM-1_:B_,t_^(European_Common_Market)</lemma>
       <tag>NNFXX-----A----</tag>
      </LM>
      <LM id="SCzechM-s16-w22">
       <form>ztratila</form>
       <lemma>ztratit_:W</lemma>
       <tag>VpQW---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s16-w23">
       <form>1</form>
       <lemma>1</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s16-w24">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s16-w25">
       <form>57</form>
       <lemma>57</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s16-w26">
       <form>procenta</form>
       <lemma>procento</lemma>
       <tag>NNNS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s16-w27">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s16-w28">
       <form>387</form>
       <lemma>387</lemma>
       <tag>C=-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s16-w29">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s16-w30">
       <form>80</form>
       <lemma>80</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s16-w31">
       <form>Kč</form>
       <lemma>Kč</lemma>
       <tag>NNFXX-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s16-w32">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN>
     <children>
      <LM id="SCzechN-s16-w2">
       <ne_type>om</ne_type>
       <normalized_name>Kč</normalized_name>
       <m.rf>
        <LM>SCzechM-s16-w31</LM>
       </m.rf>
      </LM>
     </children>
    </SCzechN>
   </trees>
  </LM>
  <LM id="s17">
   <czech_source_sentence>Největší zisky si připsaly akcie mediální společnosti CME, které posílily o 3,59 procenta na 548 korun.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s17">
     <children>
      <LM id="SCzechM-s17-w1">
       <form>Největší</form>
       <lemma>velký</lemma>
       <tag>AAIP1----3A----</tag>
      </LM>
      <LM id="SCzechM-s17-w2">
       <form>zisky</form>
       <lemma>zisk</lemma>
       <tag>NNIP1-----A----</tag>
      </LM>
      <LM id="SCzechM-s17-w3">
       <form>si</form>
       <lemma>se_^(zvr._zájmeno/částice)</lemma>
       <tag>P7-X3----------</tag>
      </LM>
      <LM id="SCzechM-s17-w4">
       <form>připsaly</form>
       <lemma>připsat</lemma>
       <tag>VpTP---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s17-w5">
       <form>akcie</form>
       <lemma>akcie</lemma>
       <tag>NNFP1-----A----</tag>
      </LM>
      <LM id="SCzechM-s17-w6">
       <form>mediální</form>
       <lemma>mediální</lemma>
       <tag>AAFS2----1A----</tag>
      </LM>
      <LM id="SCzechM-s17-w7">
       <form>společnosti</form>
       <lemma>společnost_^(*3ý)</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s17-w8">
       <form>CME</form>
       <lemma>CME-2_:B_;K_,t_^(Chicago_Mercantile_Exchange)</lemma>
       <tag>NNFXX-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s17-w9">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
      </LM>
      <LM id="SCzechM-s17-w10">
       <form>které</form>
       <lemma>který</lemma>
       <tag>P4FP4----------</tag>
      </LM>
      <LM id="SCzechM-s17-w11">
       <form>posílily</form>
       <lemma>posílit_:W</lemma>
       <tag>VpTP---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s17-w12">
       <form>o</form>
       <lemma>o-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s17-w13">
       <form>3</form>
       <lemma>3</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s17-w14">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s17-w15">
       <form>59</form>
       <lemma>59</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s17-w16">
       <form>procenta</form>
       <lemma>procento</lemma>
       <tag>NNNS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s17-w17">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s17-w18">
       <form>548</form>
       <lemma>548</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s17-w19">
       <form>korun</form>
       <lemma>koruna</lemma>
       <tag>NNFP2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s17-w20">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN>
     <children>
      <LM id="SCzechN-s17-w2">
       <ne_type>io</ne_type>
       <normalized_name>CME</normalized_name>
       <m.rf>
        <LM>SCzechM-s17-w8</LM>
       </m.rf>
      </LM>
     </children>
    </SCzechN>
   </trees>
  </LM>
  <LM id="s18">
   <czech_source_sentence>Cenné papíry těžební společnosti NWR a tabákové Philip Morris si připsaly shodně 0,17 procenta.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s18">
     <children>
      <LM id="SCzechM-s18-w1">
       <form>Cenné</form>
       <lemma>cenný</lemma>
       <tag>AAIP1----1A----</tag>
      </LM>
      <LM id="SCzechM-s18-w2">
       <form>papíry</form>
       <lemma>papír</lemma>
       <tag>NNIP1-----A----</tag>
      </LM>
      <LM id="SCzechM-s18-w3">
       <form>těžební</form>
       <lemma>těžební</lemma>
       <tag>AAFS2----1A----</tag>
      </LM>
      <LM id="SCzechM-s18-w4">
       <form>společnosti</form>
       <lemma>společnost_^(*3ý)</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s18-w5">
       <form>NWR</form>
       <lemma>NWR</lemma>
       <tag>NNFXX-----A----</tag>
      </LM>
      <LM id="SCzechM-s18-w6">
       <form>a</form>
       <lemma>a-1</lemma>
       <tag>J^-------------</tag>
      </LM>
      <LM id="SCzechM-s18-w7">
       <form>tabákové</form>
       <lemma>tabákový</lemma>
       <tag>AANS1----1A----</tag>
      </LM>
      <LM id="SCzechM-s18-w8">
       <form>Philip</form>
       <lemma>Philip_;Y</lemma>
       <tag>NNMS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s18-w9">
       <form>Morris</form>
       <lemma>Morris_;S</lemma>
       <tag>NNMS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s18-w10">
       <form>si</form>
       <lemma>se_^(zvr._zájmeno/částice)</lemma>
       <tag>P7-X3----------</tag>
      </LM>
      <LM id="SCzechM-s18-w11">
       <form>připsaly</form>
       <lemma>připsat</lemma>
       <tag>VpTP---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s18-w12">
       <form>shodně</form>
       <lemma>shodně_^(*1ý)</lemma>
       <tag>Dg-------1A----</tag>
      </LM>
      <LM id="SCzechM-s18-w13">
       <form>0</form>
       <lemma>0</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s18-w14">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s18-w15">
       <form>17</form>
       <lemma>17</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s18-w16">
       <form>procenta</form>
       <lemma>procento</lemma>
       <tag>NNNS2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s18-w17">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN>
     <children>
      <LM id="SCzechN-s18-w2">
       <ne_type>pf</ne_type>
       <normalized_name>Philip</normalized_name>
       <m.rf>
        <LM>SCzechM-s18-w8</LM>
       </m.rf>
      </LM>
      <LM id="SCzechN-s18-w3">
       <ne_type>P</ne_type>
       <normalized_name>Philip Morris</normalized_name>
       <m.rf>
        <LM>SCzechM-s18-w8</LM>
        <LM>SCzechM-s18-w9</LM>
       </m.rf>
      </LM>
      <LM id="SCzechN-s18-w4">
       <ne_type>ps</ne_type>
       <normalized_name>Morris</normalized_name>
       <m.rf>
        <LM>SCzechM-s18-w9</LM>
       </m.rf>
      </LM>
     </children>
    </SCzechN>
   </trees>
  </LM>
  <LM id="s19">
   <czech_source_sentence>Pojišťovna VIG za malého zájmu investorů posílila o více než procento na 921,60 koruny.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s19">
     <children>
      <LM id="SCzechM-s19-w1">
       <form>Pojišťovna</form>
       <lemma>pojišťovna</lemma>
       <tag>NNFS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s19-w2">
       <form>VIG</form>
       <lemma>Vigo-1_;G</lemma>
       <tag>NNNP2-----A----</tag>
      </LM>
      <LM id="SCzechM-s19-w3">
       <form>za</form>
       <lemma>za-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s19-w4">
       <form>malého</form>
       <lemma>malý</lemma>
       <tag>AAMS4----1A----</tag>
      </LM>
      <LM id="SCzechM-s19-w5">
       <form>zájmu</form>
       <lemma>zájem</lemma>
       <tag>NNIS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s19-w6">
       <form>investorů</form>
       <lemma>investor</lemma>
       <tag>NNMP2-----A----</tag>
      </LM>
      <LM id="SCzechM-s19-w7">
       <form>posílila</form>
       <lemma>posílit_:W</lemma>
       <tag>VpQW---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s19-w8">
       <form>o</form>
       <lemma>o-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s19-w9">
       <form>více</form>
       <lemma>hodně</lemma>
       <tag>Dg-------2A----</tag>
      </LM>
      <LM id="SCzechM-s19-w10">
       <form>než</form>
       <lemma>než-2</lemma>
       <tag>J,-------------</tag>
      </LM>
      <LM id="SCzechM-s19-w11">
       <form>procento</form>
       <lemma>procento</lemma>
       <tag>NNNS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s19-w12">
       <form>na</form>
       <lemma>na-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s19-w13">
       <form>921</form>
       <lemma>921</lemma>
       <tag>C=-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s19-w14">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s19-w15">
       <form>60</form>
       <lemma>60</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s19-w16">
       <form>koruny</form>
       <lemma>koruna</lemma>
       <tag>NNFS2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s19-w17">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN>
     <children>
      <LM id="SCzechN-s19-w2">
       <ne_type>gu</ne_type>
       <normalized_name>Vigo</normalized_name>
       <m.rf>
        <LM>SCzechM-s19-w2</LM>
       </m.rf>
      </LM>
     </children>
    </SCzechN>
   </trees>
  </LM>
  <LM id="s20">
   <czech_source_sentence>Z okolních středoevropských trhů si ztráty připsal také budapešťský BUX, který klesl o 1,58 procenta.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s20">
     <children>
      <LM id="SCzechM-s20-w1">
       <form>Z</form>
       <lemma>z-1</lemma>
       <tag>RR--2----------</tag>
      </LM>
      <LM id="SCzechM-s20-w2">
       <form>okolních</form>
       <lemma>okolní</lemma>
       <tag>AAIP2----1A----</tag>
      </LM>
      <LM id="SCzechM-s20-w3">
       <form>středoevropských</form>
       <lemma>středoevropský</lemma>
       <tag>AAIP2----1A----</tag>
      </LM>
      <LM id="SCzechM-s20-w4">
       <form>trhů</form>
       <lemma>trh</lemma>
       <tag>NNIP2-----A----</tag>
      </LM>
      <LM id="SCzechM-s20-w5">
       <form>si</form>
       <lemma>se_^(zvr._zájmeno/částice)</lemma>
       <tag>P7-X3----------</tag>
      </LM>
      <LM id="SCzechM-s20-w6">
       <form>ztráty</form>
       <lemma>ztráta</lemma>
       <tag>NNFS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s20-w7">
       <form>připsal</form>
       <lemma>připsat</lemma>
       <tag>VpYS---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s20-w8">
       <form>také</form>
       <lemma>také_^(rovněž)</lemma>
       <tag>Db-------------</tag>
      </LM>
      <LM id="SCzechM-s20-w9">
       <form>budapešťský</form>
       <lemma>budapešťský</lemma>
       <tag>AAIS1----1A----</tag>
      </LM>
      <LM id="SCzechM-s20-w10">
       <form>BUX</form>
       <lemma>BUX</lemma>
       <tag>NNIS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s20-w11">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
      </LM>
      <LM id="SCzechM-s20-w12">
       <form>který</form>
       <lemma>který</lemma>
       <tag>P4YS1----------</tag>
      </LM>
      <LM id="SCzechM-s20-w13">
       <form>klesl</form>
       <lemma>klesnout_:W</lemma>
       <tag>VpYS---XR-AA--1</tag>
      </LM>
      <LM id="SCzechM-s20-w14">
       <form>o</form>
       <lemma>o-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s20-w15">
       <form>1</form>
       <lemma>1</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s20-w16">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s20-w17">
       <form>58</form>
       <lemma>58</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s20-w18">
       <form>procenta</form>
       <lemma>procento</lemma>
       <tag>NNNS2-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s20-w19">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN></SCzechN>
   </trees>
  </LM>
  <LM id="s21">
   <czech_source_sentence>Naopak vídeňský ATX vzrostl o 0,83 procenta a varšavský WIG 20 si polepšil o procento.</czech_source_sentence>
   <trees>
    <SCzechM id="SCzechM-s21">
     <children>
      <LM id="SCzechM-s21-w1">
       <form>Naopak</form>
       <lemma>naopak</lemma>
       <tag>Db-------------</tag>
      </LM>
      <LM id="SCzechM-s21-w2">
       <form>vídeňský</form>
       <lemma>vídeňský</lemma>
       <tag>AAIS1----1A----</tag>
      </LM>
      <LM id="SCzechM-s21-w3">
       <form>ATX</form>
       <lemma>ATX</lemma>
       <tag>NNMS1-----A----</tag>
      </LM>
      <LM id="SCzechM-s21-w4">
       <form>vzrostl</form>
       <lemma>vzrůst</lemma>
       <tag>VpYS---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s21-w5">
       <form>o</form>
       <lemma>o-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s21-w6">
       <form>0</form>
       <lemma>0</lemma>
       <tag>NNMS1-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s21-w7">
       <form>,</form>
       <lemma>,</lemma>
       <tag>Z:-------------</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s21-w8">
       <form>83</form>
       <lemma>83</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s21-w9">
       <form>procenta</form>
       <lemma>procento</lemma>
       <tag>NNNS2-----A----</tag>
      </LM>
      <LM id="SCzechM-s21-w10">
       <form>a</form>
       <lemma>a-1</lemma>
       <tag>J^-------------</tag>
      </LM>
      <LM id="SCzechM-s21-w11">
       <form>varšavský</form>
       <lemma>varšavský</lemma>
       <tag>AAIS1----1A----</tag>
      </LM>
      <LM id="SCzechM-s21-w12">
       <form>WIG</form>
       <lemma>Wigalsko</lemma>
       <tag>NNFXX-----A---8</tag>
      </LM>
      <LM id="SCzechM-s21-w13">
       <form>20</form>
       <lemma>20</lemma>
       <tag>C=-------------</tag>
      </LM>
      <LM id="SCzechM-s21-w14">
       <form>si</form>
       <lemma>se_^(zvr._zájmeno/částice)</lemma>
       <tag>P7-X3----------</tag>
      </LM>
      <LM id="SCzechM-s21-w15">
       <form>polepšil</form>
       <lemma>polepšit_:W</lemma>
       <tag>VpYS---XR-AA---</tag>
      </LM>
      <LM id="SCzechM-s21-w16">
       <form>o</form>
       <lemma>o-1</lemma>
       <tag>RR--4----------</tag>
      </LM>
      <LM id="SCzechM-s21-w17">
       <form>procento</form>
       <lemma>procento</lemma>
       <tag>NNNS4-----A----</tag>
       <no_space_after>1</no_space_after>
      </LM>
      <LM id="SCzechM-s21-w18">
       <form>.</form>
       <lemma>.</lemma>
       <tag>Z:-------------</tag>
      </LM>
     </children>
    </SCzechM>
    <SCzechN></SCzechN>
   </trees>
  </LM>
 </bundles>
</tmt_document>
';

print count_TMT($sthg);