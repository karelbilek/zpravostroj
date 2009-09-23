use Zpravostroj::Extractor;
use YAML::XS;
use strict;
use warnings;
use utf8;


my $html = '<!DOCTYPE html PUBLIC "-//iDNES//DTD HTML 4//EN" "http://g.idnes.cz/dtd/n3_uni.dtd"> 
<html> 
<head> 
   <meta http-equiv="Content-Type" content="text/html; charset=windows-1250"> 
   <meta http-equiv="cache-control" content="no-cache"> 
<meta name="keywords" lang="cs" content="Kaddáfí, OSN, fix, nápis, shromáždění, stan, New York,"><meta name="description" lang="cs" content="Libyjský vůdce Muammar Kaddáfí dostál své pověsti svérázného politika i po příjezdu na Valné shromáždění OSN v New Yorku. Hned po příjezdu do budovy OSN si nechal ukázat místo, které bude po celý rok patřit libyjskému vyslanci. Pak vytáhl z tašky fix a v arabštině a angličtině k němu dopsal: &quot;Jsme tady&quot;."><title>Jsme tady, napsal fixem Kaddáfí na libyjské místo v budově OSN - iDNES.cz</title> 
 
   <meta name="robots" content="all"> 
   <meta http-equiv="X-UA-Compatible" content="IE=8">   <link rel="shortcut icon" href="http://g.idnes.cz/u/favicon/idnes.ico"> 
   <script type="text/javascript" src="http://g.idnes.cz/js/uni/uni.js?rr=x013"></script> 
   <script type="text/javascript" src="http://g.idnes.cz/js/ad/reklamy.js?rr=013"></script> 
   <script type="text/javascript" src="http://g.idnes.cz/js/klikni/helpmemore.js?rr=013"></script> 
   <script type="text/javascript" src="http://adidnes2.bbmedia.cz/bb/bb_codesnif.js?rr=013"></script> 
   <script type="text/javascript" src="http://adidnes2.bbmedia.cz/bb/bb_one2n.js?rr=013"></script> 
   <script type="text/javascript" src="http://g.idnes.cz/js/uni/n3.js?rr=a013"></script> 
   <link href="http://servis.idnes.cz/rss.asp?c=zpravodaj" rel="alternate" type="application/rss+xml" title="RSS"> 
 
<style type="text/css"> 
<!--
	@import "http://g.idnes.cz/css/n3/uni.css?rr=013";
	@import "http://g.idnes.cz/css/n3/reklama.css?rr=013";
	@import "http://g.idnes.cz/css/n3/portal.css?rr=013";
	@import "http://g.idnes.cz/css/n3/layout.css?rr=013";
	@import "http://g.idnes.cz/css/n3/zpravodaj.css?rr=013";
-->
</style> 
 
<!--[if !IE]> --> 
<style type="text/css" media="handheld"> 
<!--
     @import "http://g.idnes.cz/css/handheld/n3-layout.css";
-->
</style> 
<!-- <![endif]--></head> 
<body> 
<div id="main"> 
	<div class="counters"> 
		<a href="http://vice.idnes.cz/klavesove-zkratky.asp" accesskey="1">Klávesové zkratky na tomto webu - základní</a><br> 
		<a href="#content" accesskey="0">Přeskočit hlavičku portálu</a> 
		<hr> 
</div> 
	<div class="counters"> 
		<!-- G:Up zpravodaj--><!-- (C)2000-2008 Gemius SA (Zpravy univerzal) --> 
<script type="text/javascript"> 
<!--//--><![CDATA[//><!--
var pp_gemius_identifier = new String(\'ogTglDMr95lELs2.aTQQaZYTzUVpcoLUSZzfdUnc_3b.D7\');
//--><!]]>
</script> 
<script type="text/javascript" src="http://g.idnes.cz/gem/main.js"></script> 
 
 
	</div> 
		<table id="r3.2.32.33" class="ahead"><tr><td><div class="r-head"><span></span></div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.2.32.33\'></div></div></div></td></tr></table> 
 
 <div id="portal"> 
	<h2 id="lidnes"><a href="http://www.idnes.cz/" title="iDNES.cz" accesskey="2"><img src="http://g.idnes.cz/u/portal/logo-idnes.gif" alt="iDNES.cz"></a></h2> 
	<hr> 
    <div id="p-top"> 
		 
<div id="p-dnes"> <a id="p-roll" href="http://r.idnes.cz/r.asp?r=predplatne_ml1&amp;url=http%3A%2F%2Fpredplatne%2Emfdnes%2Ecz%2F">Denní tisk<span></span></a> </div> 
		<div id="toplinks"> 
		 <ul> 
          <li> <a href="http://www.idnes.cz/" title="iDNES.cz &ndash; nejdůvěryhodnější zpravodajský portál na českém internetu">iDNES.cz</a> </li> 
          <li> <a href="http://www.klikni.cz/" title="Klikni.cz &ndash; katalog odkazů, e-mailové schránky, slovníky a další služby">Klikni.cz</a> </li> 
          <li> <a href="http://www.rajce.net/"  title="rajče.net &ndash; pro vaše fotografie">Rajce.net</a> </li> 
          <li> <a href="http://www.ukazse.cz/"  title="Ukažse.cz &ndash; fotoseznamka, hodnocení fotek, pokec, diskuse, zábava, flirt a další">Ukazse.cz</a> </li> 
          <li> <a href="http://www.alik.cz/" title="Alík.cz &ndash; dětský internet">Alik.cz</a> </li> 
          <li> <a href="http://reality.idnes.cz/" title="Reality.iDNES.cz &ndash; široká nabídka nemovitostí">Reality</a> </li> 
          <li> <a href="http://www.jizdnirady.cz/" title="Jízdní řády IDOS">Jizdnirady.cz</a> </li> 
          <li> <a href="http://www.automodul.cz/" title="Automodul.cz &ndash; prodej nových a ojetých automobilů">Automodul.cz</a> </li> 
          <li> <a href="http://www.topkontakt.cz/" title="TOPkontakt.cz &ndash; firmy a instituce na internetu">TOPkontakt.cz</a> </li> 
          <li> <a href="http://www.klikniavolej.cz/" title="Klikniavolej.cz &ndash; levné volání a SMS">Klikniavolej.cz</a> </li> 
          <li> <a href="http://www.jobdnes.cz/" title="JobDNES.cz &ndash; nabídky práce, brigády a personální poradenství">JobDNES.cz</a> </li> 
          <li> <a href="http://www.mfdnes.cz/" title="MF DNES.cz &ndash; internetová verze novin">MF DNES.cz</a> </li> 
          </ul> 
		</div> 
		<div class="fc0"></div> 
    </div> 
    <div id="p-search"> 
<form action="http://rs.idnes.cz/rs.asp" > 
	<div id="p-words"> 
		<div id="words" ></div> 
	</div> 
	<input class="inp" type="text" autocomplete="off" name="slovo" id="slovo" accesskey="4" title="Vyhledávání"> 
	<input class="sen" type="submit" name="search" value="Hledej" > 
	<div class="fc0"></div> 
	<div class="sel1"> 
		<input type="radio" name="kde" value="idnes" id="rec1" checked> 
		<label for="rec1">na iDNES.cz</label> 
	</div> 
	<div class="sel2"> 
		<input type="radio" name="kde" value="firmy" id="rec2" > 
		<label for="rec2">ve firmách</label> 
	</div> 
	<div class="sel3"> 
		<input type="radio" name="kde" value="f_cr" id="rec3" > 
		<label for="rec3">na internetu</label> 
	</div> 
	<div class="ggl">Google<span></span></div> 
</form> 
</div> 
    <div id="p-entice"><a href="http://zpravy.idnes.cz/radar-usa-v-cesku-0kx-/domaci.asp?o=0&amp;klic=64021"><img height="90" alt="USA opustily plány na radar v Česku" width="280" src="http://imgs.idnes.cz/domaci/A090917_MBB_UCRAD_N.JPG" /></a></div> 
    <div class="fc0"><hr class="h" ></div> 
    <div id="p-dwn"> 
		<h4>Hlavní menu</h4> 
		<div id="webs"> 
			<div class="w-top"></div> 
				<menu> 
        <li id="p-sph"><a href="http://www.idnes.cz/" title="iDNES.cz">iDNES.cz</a></li> 
        <li id="p-zpr"><a href="http://zpravy.idnes.cz/" title="Zprávy - zpravy.idnes.cz">Zprávy</a></li> 
        <li id="p-spo"><a href="http://sport.idnes.cz/" title="Sport - sport.idnes.cz">Sport</a></li> 
        <li id="p-sho"><a href="http://kultura.idnes.cz/" title="Kultura - kultura.idnes.cz">Kultura</a></li> 
        <li id="p-eko"><a href="http://ekonomika.idnes.cz/" title="Ekonomika - ekonomika.idnes.cz">Ekonomika</a></li> 
        <li id="p-fin"><a href="http://finance.idnes.cz/" title="Finance - finance.idnes.cz">Finance</a></li> 
        <li id="p-rea"><a href="http://bydleni.idnes.cz/" title="Bydlení - bydleni.idnes.cz">Bydlení</a></li> 
        <li id="p-ces"><a href="http://cestovani.idnes.cz/" title="Cestování - cestovani.idnes.cz">Cestování</a></li> 
        <li id="p-aut"><a href="http://auto.idnes.cz/" title="Auto - auto.idnes.cz">Auto</a></li> 
        <li id="p-zdr"><a href="http://zdravi.idnes.cz/" title="Zdraví - zdravi.idnes.cz">Zdraví</a></li> 
        <li id="p-hob"><a href="http://www.hobby.cz/" title="Hobby - www.hobby.cz">Hobby</a></li> 
        <li id="p-mob"><a href="http://www.mobil.cz/" title="Mobil - www.mobil.cz">Mobil</a></li> 
        <li id="p-tec"><a href="http://www.technet.cz/" title="Technet - www.technet.cz">Technet</a></li> 
        <li id="p-ona"><a href="http://ona.idnes.cz/" title="Ona - ona.idnes.cz">Ona</a></li> 
        <li id="p-xma"><a href="http://www.xman.cz/" title="Xman - www.xman.cz">Xman</a></li> 
        <li id="p-rev"><a href="http://revue.idnes.cz/" title="Revue - revue.idnes.cz">Revue</a></li> 
        <li id="p-blg"><a href="http://blog.idnes.cz/" title="Blog - blog.idnes.cz">Blog</a></li> 
        <li id="p-itv"><a href="http://www.idnes.tv/" title="iDNES.tv - www.idnes.tv">Video</a></li> 
        <li id="p-bon"><a href="http://www.bonusweb.cz/" title="Hry - www.bonusweb.cz">Hry</a></li> 
        <li id="p-vic"><a href="http://vice.idnes.cz/" title="Rozcestník na všechny naše služby a weby..."> více</a></li> 
        </menu> 
			<div class="w-dwn"></div> 
		</div> 
		<h4>Menu ostrova</h4> 
      <div id="webs2"> 
        <div class="w-top"></div> 
        <menu> 
<li id="zpravy-domaci"><a href="http://zpravy.idnes.cz/domaci.asp">Domácí</a></li> 
<li id="zpravy-zahr" class="act "><a href="http://zpravy.idnes.cz/zahranicni.asp">Zahraniční</a></li> 
<li id="zpravy-kronika" class=""><a href="http://zpravy.idnes.cz/krimi.asp">Černá kronika</a></li> 
<li id="zpravy-veda"><a href="http://zpravy.idnes.cz/vedatech.asp">Věda a příroda</a></li> 
<li id="media"><a href="http://zpravy.idnes.cz/media.asp">Média</a></li> 
<li id="metropole"><a href="http://zpravy.idnes.cz/praha.asp">Praha</a></li> 
<li id="brno"><a href="http://zpravy.idnes.cz/brno.asp">Brno</a></li> 
<li id="kavarna"><a href="http://zpravy.idnes.cz/kavarna.asp">Kavárna</a></li> 
<li id="zpravy-nazory"><a href="http://zpravy.idnes.cz/nazory.asp">Názory</a></li> 
<li id="zpr-studium"><a href="http://zpravy.idnes.cz/studium.asp">Studium</a></li> 
<li id="zpr-prilohy"><a href="http://zpravy.idnes.cz/prilohy.asp">Speciály</a></li> 
<li id="zpravy-mfdnes"><a href="http://r.idnes.cz/r.asp?r=mfdnes_zpr&amp;url=http%3A%2F%2Fzpravy%2Eidnes%2Ecz%2Fmfdnes%2Easp">MF DNES</a></li> 
<li class="r-webz"><i>reklama </i><ol id="zpravy_reklama"> 
<li><a href="http://sdeleni.idnes.cz/zpr_sdeleni.asp">Firemní články</a></li> 
</ol> 
</li> 
</menu> 
 
        <div class="w-dwn"></div> 
      </div> 
    </div> 
    <div class="fc0"><hr></div> 
      <div id="p-day"><span class="day"> 
		Středa, 23. září 2009. Svátek má Berta  | <a id="dukatyLink" rel="nofollow" href="http://muj.idnes.cz/dukaty.asp">dukáty</a><script type=\'text/javascript\'>MujPAS.dukaty2(null, "iweb38")</script> 
		| <a id="homesetting" rel="nofollow" href="http://vice.idnes.cz/nastaveni-domovske-stranky.asp" onclick="return !document.setHomePage(\'http://zpravy.idnes.cz/\')">Nastavit jako domovskou stránku</a> 
      </span></div>    
   </div> 
<div id="content" class="content"> 
	<div class="col-ab"> 
		<div class="col-a"><!--FULLTEXTSTART--><div class="art-full adwords-text"><h1>Jsme tady, napsal fixem Kaddáfí na libyjské místo v budově OSN </h1><div id="zoom" class="zoom2"><div id="zooming"><div class="fl">velikost textu:</div><a id="azoom-1" href="#" title="malé"><span></span></a><a id="azoom-2" href="#" title="normalní"><span></span></a><a id="azoom-3" href="#" title="velké"><span></span></a></div><script type="text/javascript">Misc.createSwitch("zoom", [["azoom-1", "zoom1"], ["azoom-2", "zoom2"], ["azoom-3", "zoom3"]], [Storage.data, "zoom"]);</script><div class="art-info"> <span class="time"><span class="time-date">23.&nbsp;září&nbsp;2009</span>&nbsp;&nbsp;16:54</span></div><div class="opener"> Libyjský vůdce Muammar Kaddáfí dostál své pověsti svérázného politika i po příjezdu na Valné shromáždění OSN v New Yorku. Hned po příjezdu do budovy OSN si nechal ukázat místo, které bude po celý rok patřit libyjskému vyslanci. Pak vytáhl z tašky fix a v arabštině a angličtině k němu dopsal: "Jsme tady".</div><div class="ico-r mb10 h" id="js-kam-dal"></div><!--div-test--><div class="text"><div class="bbtext"><div class="equip-tv" xmlns:idnes="urn:idnes"><div class="ico equip not4bbtext"><table width="100%" class="video-16ku9"><tbody><tr><td class="flv-player"><div><script type="text/javascript">Misc.videoFLV({ data: "http://servis.idnes.cz/stream/flv/data.asp?idvideo=V090923_181655_tv-zpravy_sha&reklama=1&idrubriky=zahranicni&idostrova=zpravodaj&idclanku=A090923_165447_zahranicni_btw", width: 460, height: 302, image: "http://i.idnes.cz/09/093/vidw/STF2dfb31_UN_Libya_NY144.jpg"});</script><noscript><h2>VIDEO: Libyjský vůdce Kaddáfí a další státníci přicházejí do budovy OSN v New Yorku</h2><strong>Pro zobrazení videa musíte mít zapnutou podporu JavaScriptu</strong></noscript></div></td></tr></tbody></table></div></div><p>Kromě popsání místa libyjského předsedy Valného shromáždění Alí Abdusaláma Trekího, jenž se funkce ujal před několika dny, vzbudil Muammar Kaddáfí v New Yorku pozornost také svým stanem, ve kterém obvykle bydlí při zahraničních návštěvách.</p> 
<p>Podle newyorských úřadů jeho stavba porušila místní vyhlášky a musela být zastavena. Stan se měl stavět na předměstí New Yorku na pozemku pronajatém od amerického miliardáře Donalda Trumpa. - <strong><em><a href="http://zpravy.idnes.cz/kaddafi-nakonec-v-new-yorku-rozlozil-stan-na-pozemku-donalda-trumpa-112-/zahranicni.asp?c=A090923_105136_zahranicni_ad">přečtěte si, kde a jak Kaddáfí nakonec rozbil svůj stan</a></em></strong> </p> 
<p> 
<table class="complete  not4bbtext"> 
    <tbody> 
        <tr> 
            <td> 
            <h3 class="ico"><span class="ico-link"><span></span><a href="http://zpravy.idnes.cz/rada-bezpecnosti-terorizuje-zeme-rekl-kaddafi-pri-prvnim-projevu-v-osn-13q-/zahranicni.asp?c=A090923_160111_zahranicni_stf">PROJEV KADDÁFÍHO V OSN</a></span></h3> 
            <p class="title">Rada bezpečnosti terorizuje země</p> 
            </td> 
        </tr> 
    </tbody> 
</table> 
</p> 
<p>Příjezd muže, který už čtyřicet let vládne jedné ze zemí Magrebu, řadu lidí rozhořčil. U budovy OSN se někteří chystají protestovat hlavně kvůli tomu, že Skotsko nedávno propustilo libyjského teroristu Abdala Basata Muhammada Midžrahího.</p> 
<p>Tomu skotský soud vyměřil doživotní trest za atentát na letadlo společnosti PanAm, které se v roce 1988 zřítilo na skotské Lockerbie. O život tedy přišlo 259 lidí na palubě letounu, šlo hlavně o Američany. Po nedávném návratu do Libye se Midžrahíhovi dostalo vřelého přijetí. - <strong><em><a href="http://zpravy.idnes.cz/kaddafi-pojede-do-new-yorku-pozustali-po-obetech-lockerbie-zuri-psw-/zahranicni.asp?c=A090723_144801_zahranicni_ad">čtěte Kaddáfí pojede do New Yorku, pozůstalí po obětech Lockerbie zuří</a></em></strong></p> 
<div class="equip-tv"><script> 
  Misc.videoFLV({ data: "http://servis.idnes.cz/stream/flv/data.asp?idvideo=V090923_123234_tv-zpravy_kbe&idostrova=zpravodaj&idrubriky=zahranicni&idclanku=A090923_165447_zahranicni_btw", width: 460, height: 302, image: "http://i.idnes.cz/09/093/vidw/KBE2dfa74_kaddafi_foto_bmp.jpg" });  
</script> 
<noscript><h2>VIDEO: Kaddáfí si postavil stan na zahradě Donalda Trumpa. Podívejte se na záběry z vrtulníku</h2><strong>Pro zobrazení videa musíte mít zapnutou podporu JavaScriptu</strong></noscript></div></div><div class="related"><h3>Kam dál?</h3><ul><li><strong><a href="http://zpravy.idnes.cz/kaddafi-nakonec-v-new-yorku-rozlozil-stan-na-pozemku-donalda-trumpa-112-/zahranicni.asp?c=A090923_105136_zahranicni_ad">Kaddáfí nakonec v New Yorku rozložil stan na pozemku Donalda Trumpa</a></strong></li><li><strong><a href="http://zpravy.idnes.cz/kaddafiho-lide-se-pri-hledani-placku-pro-jeho-stan-vydavali-za-nizozemce-1ns-/zahranicni.asp?c=A090922_153904_zahranicni_ad">Kaddáfího lidé se při hledání „plácku“ pro jeho stan vydávali za Nizozemce</a></strong></li><li><strong><a href="http://zpravy.idnes.cz/kaddafi-pojede-do-new-yorku-pozustali-po-obetech-lockerbie-zuri-psw-/zahranicni.asp?c=A090723_144801_zahranicni_ad">Kaddáfí pojede do New Yorku, pozůstalí po obětech Lockerbie zuří</a></strong></li><li><strong><a href="http://zpravy.idnes.cz/rada-bezpecnosti-terorizuje-zeme-rekl-kaddafi-pri-prvnim-projevu-v-osn-13q-/zahranicni.asp?c=A090923_160111_zahranicni_stf">Rada bezpečnosti terorizuje země, řekl Kaddáfí při prvním projevu v OSN</a></strong></li><li class="b h" id="js-kam-dal-2"></li><!--div-test-2--></ul></div></div><div class="authors"><h3>Autoři:</h3><ul><li class="dot"><a class="name" href="/novinari.asp?idnov=1668">leš</a>&nbsp;<span class="medium">iDNES.cz</span></li><li class="dot">&nbsp;<span class="medium">ČTK</span></li></ul><div class="fc0"></div></div></div><div class="ico art-add"><p class="fan-facebook"><a href="http://www.facebook.com/iDNES.cz" onclick="javascript:pageTracker._trackPageview(\'/cil/facebook\');" tooltip="linkalert-tip"><span tooltip="linkalert-tip"></span> 
            Staňte se fanouškem iDNES.cz na Facebooku
          </a></p><ul><li class="to-top"><a href="#main" class="ico-top" title="Nahoru"><span></span></a></li><li><a href="/diskuse.asp?iddiskuse=A090923_165447_zahranicni_btw" class="ico-moot"><span></span> diskutovat</a></li><li><a href="/tiskni.asp?r=zahranicni&amp;c=A090923_165447_zahranicni_btw" class="ico-print"><span></span> tisk</a></li><li><a rel="nofollow" href="http://vice.idnes.cz/popup/tipredakci.asp?idostrova=zpravodaj&amp;c=A090923_165447_zahranicni_btw" id="tip-redakci-a-A090923_165447_zahranicni_btw" target="tip-redakci-div-A090923_165447_zahranicni_btw" class="ico-tip"><span></span> tip redakci</a></li><li class="fl"><a class="ico-mail" rel="nofollow" href="http://vice.idnes.cz/popup/mail_data.asp?r=zahranicni&amp;c=A090923_165447_zahranicni_btw&amp;objekt=clanek" id="mailem-a-A090923_165447_zahranicni_btw" target="mailem-div-A090923_165447_zahranicni_btw"><span></span> přeposlat e-mailem</a></li></ul><div class="fc0"></div><ul class="link fs92"><li><script type="text/javascript"> 
            
          var badge = \'<a class="ico-smesk" rel="nofollow" href="http://r.idnes.cz/r.asp?r=socialky_sme&url=\' + encodeURIComponent(\'http://vybrali.sme.sk/submit.php?url=\'+ encodeURIComponent(document.URL) + \'&title=\' + encodeURIComponent(document.title)) + \'"><span></span>Vybrali SME</a>\';
          document.writeln(badge);
        
          </script></li><li><script type="text/javascript"> 
            
          var badge = \'<a class="ico-facebook" rel="nofollow" href="http://r.idnes.cz/r.asp?r=socialky_facebook&url=\' + encodeURIComponent(\'http://www.facebook.com/share.php?u=\' + encodeURIComponent(document.URL) + \'&t=\' + encodeURIComponent(document.title)) + \'"><span></span>Facebook</a>\';
          document.writeln(badge);
        
          </script></li><li><script type="text/javascript"> 
            
          var badge = \'<a class="ico-google" rel="nofollow" href="http://r.idnes.cz/r.asp?r=socialky_google&url=\' + encodeURIComponent(\'http://www.google.com/bookmarks/mark?op=add&bkmk=\' + encodeURIComponent(document.URL) + \'&title=\' + encodeURIComponent(document.title)) + \'"><span></span>Google</a>\';
          document.writeln(badge);
        
          </script></li><li><script type="text/javascript"> 
            
          var badge = \'<a class="ico-linkuj" rel="nofollow" href="http://r.idnes.cz/r.asp?r=socialky_linkuj&url=\' + encodeURIComponent(\'http://linkuj.cz/?id=linkuj&url=\' + encodeURIComponent(document.URL) + \'&title=\' + encodeURIComponent(document.title)) + \'"><span></span>Linkuj</a>\';
          document.writeln(badge);
        
          </script></li><li><script type="text/javascript"> 
            
              var badge = \'<a class="ico-twitter" rel="nofollow" href="http://r.idnes.cz/r.asp?r=socialky_twitter&url=\' + encodeURIComponent(\'http://servis.idnes.cz/twitter/link.asp?url=\' + encodeURIComponent(document.URL) + \'&title=\' + encodeURIComponent(document.title)) + \'"><span></span>Twitter</a>\';
              document.writeln(badge);
            
          </script></li></ul><div class="fc0"></div></div><div id="tip-redakci-div-A090923_165447_zahranicni_btw"></div><div id="mailem-div-A090923_165447_zahranicni_btw"></div><script type="text/javascript">Misc.insidePage.link([["mailem-a-A090923_165447_zahranicni_btw", 450]]);Misc.insidePage.link([["tip-redakci-a-A090923_165447_zahranicni_btw", 540]]);</script><div class="fc9"><br class="h"></div></div><!--FULLTEXTSTOP--><div class="counters"><img src="http://log.idnes.cz/ctenost.asp?typ=clanek&id=A090923_165447_zahranicni_btw"  width="1" height="1" title="s1" alt="" /></div> 
 
<script type="text/javascript" src="http://g.idnes.cz/js/ad/etargetUni2.js"></script><div id="eTargetContent"></div><div class="counters"><iframe  src="http://et.idnes.cz/generic/context_ad/idnes.php?c=2&amp;ref=21&amp;q=http%3A%2F%2Fzpravy%2Eidnes%2Ecz%2Fetdata%2Easp%3Fc%3DA090923%5F165447%5Fzahranicni%5Fbtw"></iframe></div> 
<div id="moot2"> 
<h2 id="logo-moot"><a href="/diskuse.asp?iddiskuse=A090923_165447_zahranicni_btw">Diskuse<span></span></a></h2> 
<h3 class="moot-tit"><a href="/diskuse.asp?iddiskuse=A090923_165447_zahranicni_btw">Jsme tady, napsal fixem Kaddáfí na libyjské místo v budově OSN </a></h3> 
<div class="moot-in"> 
<p class="subj">To je bordel!</p> 
<p class="perex">Co to zase je?? Kam ten svět sakra spěje. Na náměstí v New Yorku,...</p> 
<p class="subj">Re: To je bordel!</p> 
<p class="perex">Jenže nejsi, tak to nech na dospělým...</p> 
<p class="subj">Lidská svoloč!</p> 
<p class="perex"></p> 
<p class="subj">Tento terorista extratřídy by neměl být vůbec nikde přijat.</p> 
<p class="perex">Skotsko je opovrženíhodný stát, když jim prodal jednoho Kadáfiho masového...</p> 
<p class="subj">co to má s očima?</p> 
<p class="perex">nebo pod očima? trošku bumbáme, ne?</p> 
</div> 
<div class="btm"> 
<p>počet příspěvků: 22, poslední 23.09.2009 20:30</p> 
<div class="ico-r"><a class="ico-next" href="/diskuse.asp?iddiskuse=A090923_165447_zahranicni_btw"><span></span>vstup do diskuse</a></div> 
</div> 
</div> 
 
<div id="r3.2.1.1" class="hid m1"><hr class="h"><div class="r-head"><span></span></div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.2.1.1\'></div></div><div class="fc0"></div></div><hr class="h"></div> 
<div id="r-billboard" class="m202"><hr class="h"><div class="r-head">reklama<span></span></div><div class="r-body"><div class="r-b-in"><!-- BBSTART iDNES/Zprávy iDNES/viditelná/Full Banner 468x60 --> 
<script type=\'text/javascript\'>/* <![CDATA[ */
var bbat=1,bbbr=0,bbtt=\'_top\',bbpath=\'4057/1/1/1\',bbxl=1,bbac=1;
//]]></script> 
<script type=\'text/javascript\' charset=\'windows-1250\' src=\'http://ad2.billboard.cz/code/bb4.js?2\'></script> 
<noscript><div style=\'display:inline;width:468px;text-align:center;font-weight:900;font-family:Verdana,sans-serif;font-size:xx-small;\'><a href=\'http://ad2.billboard.cz/please/redirect/4057/1/1/1/\'><img src=\'http://ad2.billboard.cz/please/showit/4057/1/1/1/?typkodu=img\' width=\'468\' height=\'60\' style=\'border:0px none\' alt=\'\' /><br />reklama: bb.billboard.cz</a></div></noscript> 
<!-- BBKONEC --> 
</div><div class="fc0"></div></div><hr class="h"></div> 
</div> 
		<div class="col-b"><div class="b-box" id="hlavniz"><h2>Hlavní zprávy</h2><div class="box-in"><ul class="tit-img"><li><a href="http://zpravy.idnes.cz/nejvyssi-spravni-soud-dostal-navrh-na-zruseni-delnicke-strany-pvf-/krimi.asp?c=A090923_171047_krimi_js" name="1"><img src="http://i.idnes.cz/08/082/midi/KLU2520d2_170549_1914595.jpg" width="80" height="60" border="0" alt="Projev šéfa Dělnické strany v Hradci Králové"></a><br class="h"><a href="http://zpravy.idnes.cz/nejvyssi-spravni-soud-dostal-navrh-na-zruseni-delnicke-strany-pvf-/krimi.asp?c=A090923_171047_krimi_js" name="1">Nejvyšší správní soud dostal návrh na zrušení Dělnické strany</a></li><li><a href="http://ekonomika.idnes.cz/v-uspornem-balicku-se-rysuji-zmeny-porodne-se-zrejme-nesnizi-pts-/ekonomika.asp?c=A090923_153902_ekonomika_vem" name="2" class="mark-video midi"><span></span><img src="http://i.idnes.cz/09/022/midi/ABR292c89_pro63566.jpg" width="80" height="60" border="0" alt="Ilustrační foto"></a><br class="h"><a href="http://ekonomika.idnes.cz/v-uspornem-balicku-se-rysuji-zmeny-porodne-se-zrejme-nesnizi-pts-/ekonomika.asp?c=A090923_153902_ekonomika_vem" name="2">V úsporném balíčku se rýsují změny, porodné se zřejmě nesníží</a></li><li><a href="http://zpravy.idnes.cz/jsme-tady-napsal-fixem-kaddafi-na-libyjske-misto-v-budove-osn-pr7-/zahranicni.asp?c=A090923_165447_zahranicni_btw" name="3" class="mark-video midi"><span></span><img src="http://i.idnes.cz/09/093/midi/STF2dfb31_UN_Libya_NY144.jpg" width="80" height="60" border="0" alt="Libyjský vůdce Muammar Kaddáfí v newyorském sídle OSN"></a><br class="h"><a href="http://zpravy.idnes.cz/jsme-tady-napsal-fixem-kaddafi-na-libyjske-misto-v-budove-osn-pr7-/zahranicni.asp?c=A090923_165447_zahranicni_btw" name="3">Jsme tady, napsal fixem Kaddáfí na libyjské místo v budově OSN </a></li><li><a href="http://fotbal.idnes.cz/strizkovsti-bohemians-vypadli-z-nbsp-poharu-jablonec-jde-dal-po-penaltach-1r9-/fot_dsouteze.asp?c=A090923_154854_fot_dsouteze_min" name="4"><img src="http://i.idnes.cz/09/093/midi/PAR2dfbdb_180041_2096466.jpg" width="80" height="60" border="0" alt="Hradec Králové - Bohemians/Střížkov: Pilař a Grznár"></a><br class="h"><a href="http://fotbal.idnes.cz/strizkovsti-bohemians-vypadli-z-nbsp-poharu-jablonec-jde-dal-po-penaltach-1r9-/fot_dsouteze.asp?c=A090923_154854_fot_dsouteze_min" name="4">Střížkovští Bohemians vypadli z&nbsp;poháru, Jablonec jde dál po penaltách</a></li></ul><div class="fc0"></div></div><div class="fc0"></div></div> 
<div id="r3.2.5.36" class="hid m22"><hr class="h"><div class="r-head"><span></span></div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.2.5.36\'></div></div><div class="fc0"></div></div><hr class="h"></div> 
<div id="r3.2.5.25" class="hid m12"><hr class="h"><div class="r-head"><span></span></div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.2.5.25\'></div></div><div class="fc0"></div></div><hr class="h"></div> 
<div class="b-box" id="dalsiclanky"><h2>Další články z rubriky</h2><div class="box-in"><ul class="tit-img"><!--CLANEK:A090923_160111_zahranicni_stf--><li><a href="http://zpravy.idnes.cz/kaddafi-si-na-sto-minut-ukradl-podium-a-spilal-rade-bezpecnosti-osn-109-/zahranicni.asp?c=A090923_160111_zahranicni_stf" name="http://zpravy.idnes.cz/kaddafi-si-na-sto-minut-ukradl-podium-a-spilal-rade-bezpecnosti-osn-109-/zahranicni.asp?c=A090923_160111_zahranicni_stf"><img src="http://i.idnes.cz/09/093/midi/STF2dfbcf_UN_General_Assembly_UNSW112.jpg" width="80" height="60" border="0" alt="Muammar Kaddáfí při projevu před Válným shromážděním OSN (23. září 2009)"></a><br class="h"><a href="http://zpravy.idnes.cz/kaddafi-si-na-sto-minut-ukradl-podium-a-spilal-rade-bezpecnosti-osn-109-/zahranicni.asp?c=A090923_160111_zahranicni_stf" name="1">Kaddáfí si na sto minut „ukradl“ pódium a spílal Radě bezpečnosti OSN</a></li><!--CLANEK:A090923_160111_zahranicni_stf--><!--CLANEK:A090923_133853_zahranicni_ad--><li><a href="http://zpravy.idnes.cz/usa-nevyresi-problemy-sveta-samy-rekl-obama-v-osn-f74-/zahranicni.asp?c=A090923_133853_zahranicni_ad" name="http://zpravy.idnes.cz/usa-nevyresi-problemy-sveta-samy-rekl-obama-v-osn-f74-/zahranicni.asp?c=A090923_133853_zahranicni_ad"><img src="http://i.idnes.cz/09/093/midi/STF2dfba5_UN_General_Assembly_UNSW109.jpg" width="80" height="60" border="0" alt="Barack při projevu před Válným shromážděním OSN (22. září 2009)"></a><br class="h"><a href="http://zpravy.idnes.cz/usa-nevyresi-problemy-sveta-samy-rekl-obama-v-osn-f74-/zahranicni.asp?c=A090923_133853_zahranicni_ad" name="2">USA nevyřeší problémy světa samy, řekl Obama v OSN</a></li><!--CLANEK:A090923_133853_zahranicni_ad--><!--CLANEK:A090923_195037_zahranicni_stf--><li><a href="http://zpravy.idnes.cz/al-kajda-diktovala-nemcum-koho-maji-volit-chce-stazeni-vojsk-z-afghanistanu-161-/zahranicni.asp?c=A090923_195037_zahranicni_stf" name="3" class="mark-video midi"><span></span><img src="http://i.idnes.cz/09/092/midi/IPL2de468_Germany_Terror_Threat_BRO101.jpg" width="80" height="60" border="0" alt="Německo po hrozbě Al-Kajdy posílilo  kontroly na letištích a vlakových nádražích. Na snímku hlídají policisté berlínské nádraží. (19. září 2009)"></a><br class="h"><a href="http://zpravy.idnes.cz/al-kajda-diktovala-nemcum-koho-maji-volit-chce-stazeni-vojsk-z-afghanistanu-161-/zahranicni.asp?c=A090923_195037_zahranicni_stf" name="3">Al-Kajda diktovala Němcům, koho mají volit. Chce stažení vojsk z Afghánistánu</a></li><!--CLANEK:A090923_195037_zahranicni_stf--><!--CLANEK:A090923_171615_zahranicni_ban--><li><a href="http://zpravy.idnes.cz/transparency-international-korupce-v-soukrome-sfere-stoji-miliardy-1ji-/zahranicni.asp?c=A090923_171615_zahranicni_ban" name="http://zpravy.idnes.cz/transparency-international-korupce-v-soukrome-sfere-stoji-miliardy-1ji-/zahranicni.asp?c=A090923_171615_zahranicni_ban"><img src="http://i.idnes.cz/07/072/midi/SPI1c76e1_korupce2.jpg" width="80" height="60" border="0" alt="Ilustrační foto"></a><br class="h"><a href="http://zpravy.idnes.cz/transparency-international-korupce-v-soukrome-sfere-stoji-miliardy-1ji-/zahranicni.asp?c=A090923_171615_zahranicni_ban" name="4">Transparency International: Korupce v soukromé sféře stojí miliardy</a></li><!--CLANEK:A090923_171615_zahranicni_ban--></ul><div class="fc0"></div></div><div class="fc0"></div></div> 
<div id="r3.2.9.37" class="hid m21"><hr class="h"><div class="r-head"><span></span></div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.2.9.37\'></div></div><div class="fc0"></div></div><hr class="h"></div> 
<div id="anketa" class="b-box"><h2><a href="ankety.asp" title="Seznam anket">Anketa<span></span></a></h2><div class="box-in"><p>Co byste doporučili Mirkovi Topolánkovi?</p><div class="vote"><div class="vote c1"><a href="http://servis2.idnes.cz/_anketa_hlas.asp?idanketa=A20090922_top_496&amp;hlas=45131" title="Přidat hlas pro \'Aby zůstal v čele ODS\'">Aby zůstal v čele ODS</a> <span class="rate">7177</span><div class="eb" title="Pro možnost \'Aby zůstal v čele ODS\' hlasovalo 28% čtenářů"><div class="vb" style="width:28%"></div></div></div><div class="vote c2"><a href="http://servis2.idnes.cz/_anketa_hlas.asp?idanketa=A20090922_top_496&amp;hlas=45132" title="Přidat hlas pro \'Aby odešel do Bruselu\'">Aby odešel do Bruselu</a> <span class="rate">1164</span><div class="eb" title="Pro možnost \'Aby odešel do Bruselu\' hlasovalo 5% čtenářů"><div class="vb" style="width:5%"></div></div></div><div class="vote c3"><a href="http://servis2.idnes.cz/_anketa_hlas.asp?idanketa=A20090922_top_496&amp;hlas=45133" title="Přidat hlas pro \'Aby odešel z politiky\'">Aby odešel z politiky</a> <span class="rate">17508</span><div class="eb" title="Pro možnost \'Aby odešel z politiky\' hlasovalo 68% čtenářů"><div class="vb" style="width:68%"></div></div></div><script type="text/javascript">Starter.add(function()
									{
									Misc.anketa("anketa", "zpravodaj")
									}, 100);</script></div><div class="fc0"></div><div class="ico-r"><a class="ico-next" href="http://zpravy.idnes.cz/dalik-s-tvrdikem-se-tajne-sesli-a-resili-co-bude-s-topolankem-pqx-/domaci.asp?c=A090922_081253_domaci_pje"><span></span>více o tématu
					</a></div></div><div class="fc0"></div></div> 
<div id="self-promo" class="prep-1"> 
<div class="webs"><div class="w-top"></div> 
<ul> 
<li id="jobdnes"><a id="self-promo-a1" href="http://r.idnes.cz/r.asp?r=self_box_jobdnes_top&url=http%3A%2F%2Fwww%2Ejobdnes%2Ecz%2F">JobDNES</a></li> 
<li id="auto-modul"><a id="self-promo-a2" href="http://r.idnes.cz/r.asp?r=self_box_automodul_top&url=http%3A%2F%2Fwww%2Eautomodul%2Ecz%2F">Automodul</a></li> 
<li id="topkontakt"><a id="self-promo-a3" href="http://r.idnes.cz/r.asp?r=self_box_topkontakt_top&url=http%3A%2F%2Fwww%2Etopkontakt%2Ecz%2F">TOPkontakt</a></li> 
<li id="ireality"><a id="self-promo-a4" href="http://r.idnes.cz/r.asp?r=self_box_reality_top&url=http%3A%2F%2Freality%2Eidnes%2Ecz%2F">Reality</a></li> 
</ul></div> 
<div class="fc0"></div> 
<div class="arts-1"><h2 class="logo"><a href="http://r.idnes.cz/r.asp?r=self_box_jobdnes&amp;url=http%3A%2F%2Fjobdnes%2Eidnes%2Ecz/" rel="nofollow">JobDNES.cz<span></span></a></h2> 
<div class="fc0"></div> 
<div class="box-in "> 
<div class="b-plus"> 
<p>Řekněte nám kolik vyděláváte a vyhrajte svůj plat.</p><a rel="nofollow" href="http://mujplat.idnes.cz/hlavni-stranka?utm_source=idnes.cz&amp;utm_medium=hypertext&amp;utm_campaign=self-box">více na můjplat.cz</a></div> 
<div class="fl"> 
<h3><span>Vysokoškoláci</span></h3> 
<div class="line1"> 
<h4><a rel="nofollow" href="http://r.idnes.cz/r.asp?r=self_box_jobdnes&amp;url=http%3A%2F%2Fjobdnes%2Eidnes%2Ecz%2Fprace%2Fskoda%2Dholding%2Da%2D%2Ds%2D%2Dmanazer%2Dservisniho%2Dprovozu%2DJX610163%2Easpx">MANAŽER SERVISNÍHO PROVOZU</a></h4> 
<p>ŠKODA HOLDING a. s.</p><span class="wage-text">nabízený plat:</span><span class="wage">20 000 - 60 000</span></div> 
<h3><span>S maturitou</span></h3> 
<div class="line2"> 
<h4><a rel="nofollow" href="http://r.idnes.cz/r.asp?r=self_box_jobdnes&amp;url=http%3A%2F%2Fjobdnes%2Eidnes%2Ecz%2Fprace%2Fekospol%2Da%2Ds%2D%2Drealitni%2D%2Dmakler%2D%2D%96%2D%2Dprodej%2D%2Dbytu%2D%2Da%2D%2Dpozemku%2DJX392369%2Easpx">REALITNÍ  MAKLÉŘ  –  PRODEJ  BYTŮ  A...</a></h4> 
<p>EKOSPOL a.s.</p> 
</div> 
<h3><span>Vyučení a ostatní</span></h3> 
<div class="line3"> 
<h4><a rel="nofollow" href="http://r.idnes.cz/r.asp?r=self_box_jobdnes&amp;url=http%3A%2F%2Fjobdnes%2Eidnes%2Ecz%2Fprace%2Fstefan%2Dsubrt%2Dkadernik%2Ddamsky%2Da%2Dpansky%2DJX357882%2Easpx">Kadeřník dámský a pánský</a></h4> 
<p>Štefan Šubrt</p><span class="wage-text">nabízený plat:</span><span class="wage">12 000 - 14 000</span></div> 
</div> 
<div class="fc0"></div> 
<div class="search"> 
<div class="form"> 
<form action="http://servis.idnes.cz/redirbox/default.asp" method="get"><input type="hidden" name="typ" value="self_box_jobdnes_form"><select name="obor"><option value="all">----- Obor -----</option> 
<option value="1">Administrativa</option> 
<option value="9">Finance, pojišťovnictví, účetnictví</option> 
<option value="20">Marketing, reklama, public relations</option> 
<option value="22">Obchod, prodej</option> 
<option value="30">Stavebnictví, projekce, architektura</option> 
<option value="33">Technika, elektrotechnika</option></select><select name="region"><option value="all">----- Region -----</option> 
<option value="2">Praha</option> 
<option value="3">Středočeský kraj</option> 
<option value="4">Jihočeský kraj</option> 
<option value="5">Plzeňský kraj</option> 
<option value="6">Karlovarský kraj</option> 
<option value="7">Ústecký kraj</option> 
<option value="8">Liberecký kraj</option> 
<option value="10">Královéhradecký kraj</option> 
<option value="11">Pardubický kraj</option> 
<option value="12">kraj Vysočina</option> 
<option value="13">Jihomoravský kraj</option> 
<option value="14">Zlínský kraj</option> 
<option value="15">Olomoucký kraj</option> 
<option value="16">Moravskoslezský kraj</option> 
<option value="EU">EU</option></select><input type="submit" value="hledej" class="submit"></form> 
</div> 
<p>Na JobDNES.cz je právě teď <span>12151</span> volných míst</p> 
<div class="fc0"></div> 
</div> 
</div> 
</div> 
<div id="self-promo-prep-2" class="arts-2"></div> 
<div id="self-promo-prep-3" class="arts-3"></div> 
<div id="self-promo-prep-4" class="arts-4"></div> 
</div> 
<script type="text/javascript">Misc.prepinac({id: "self-promo", pamatovat: 0, dotahovat: {"prep-1": "selfbox.asp", "prep-2": "selfbox.asp", "prep-3": "http://servis.idnes.cz/prepinace/selfbox-tk.asp?idostrova=zpravodaj&idrubriky=zahranicni", "prep-4": "selfbox.asp"}})</script> 
 
<div id="blog" class="prep-3"><h2 id="logo-blog"><a href="http://blog.idnes.cz" title="blog.iDNES.cz">blog.iDNES.cz<span></span></a></h2><div class="fold"><a href="http://blog.idnes.cz/" id="ablog-1" class="sel-b1"><span class="h2bg"><span class="h2l"><span class="h2r"><span class="title">Nejnovější</span></span></span></span></a><a href="http://blog.idnes.cz/top.asp?hod=7&amp;zor=cit" id="ablog-2" class="sel-b2"><span class="h2bg"><span class="h2l"><span class="h2r"><span class="title">Nejčtenější</span></span></span></span></a><a href="#" id="ablog-3" class="sel-b3"><span class="h2bg"><span class="h2l"><span class="h2r"><span class="title">Výběr</span></span></span></span></a></div><div class="fc0"></div><div class="tb-content"><div class="rohy-t"></div><div class="arts-1"><div class="blog-art"><h3>Klára Bresslerová, 20:36</h3><a href="http://bresslerova.blog.idnes.cz/c/102915/Zavrete-oci-odchazim-Nemam-totiz-rada-spravedlnost-jen-pro-nekoho.html" name="_blog_text">Zavřete oči, odcházím. Nemám totiž ráda spravedlnost jen pro někoho</a></div><div class="blog-art"><h3>Aleš Baloun, 20:30</h3><a href="http://alesbaloun.blog.idnes.cz/c/102911/Kolektivni-vina-a-nekolektivni-trest.html" name="_blog_text">Kolektivní vina a nekolektivní trest.</a></div><div class="blog-art"><h3>Michala Bernkopfová, 19:46</h3><a href="http://bernkopfova.blog.idnes.cz/c/102905/Viva-Mexico.html" name="_blog_text">Viva México!</a></div><div class="blog-art"><h3>Jana Javorková, 19:45</h3><a href="http://javorkova.blog.idnes.cz/c/102903/Kdo-na-to-ma-Brno.html" name="_blog_text">Kdo na to má? Brno!</a></div></div><div class="arts-2"><div class="blog-art"><h3>Vladimír Kroupa, Přečteno: <span class="b-numb">15283</span></h3><a href="http://vladimirkroupa.blog.idnes.cz/c/102013/Zprava-o-vysetreni-pripadu-straznika-c2483.html" name="_blog_text">Zpráva o vyšetření případu strážníka č.2483...</a></div><div class="blog-art"><h3>Pavla Jeřábková, Přečteno: <span class="b-numb">14253</span></h3><a href="http://jerabkova.blog.idnes.cz/c/102061/Jak-jsem-naletela-podvodnici-aneb-Neni-charita-jako-charita.html" name="_blog_text">Jak jsem naletěla podvodnici aneb Není charita jako charita</a></div><div class="blog-art"><h3>Petr Musil, Přečteno: <span class="b-numb">13574</span></h3><a href="http://musil.blog.idnes.cz/c/102232/Nestydite-se-soudruzko-Vondrackova.html" name="_blog_text">Nestydíte se, soudružko Vondráčková?</a></div><div class="blog-art"><h3>Petr Pokorný, Přečteno: <span class="b-numb">11805</span></h3><a href="http://petrpokorny.blog.idnes.cz/c/102560/Proc-z-nas-Paroubek-s-Filipem-delaji-voly.html" name="_blog_text">Proč z nás Paroubek s Filipem dělají voly?</a></div></div><div class="arts-3"><div class="half-r"><div class="blog-art"><a href="http://jancizek.blog.idnes.cz/c/102862/Komunismus-je-nejtvrdsi-kapitalismus.html" name="_blog_foto_vyber"><img class="midi" src="http://i.idnes.cz/09/093/midi/JDV2dfb1c_cizek.jpg" alt="Jan Čížek"></a><h3>Jan Čížek</h3><a href="http://jancizek.blog.idnes.cz/c/102862/Komunismus-je-nejtvrdsi-kapitalismus.html" name="_blog_text_vyber">Komunismus je nejtvrdší kapitalismus</a><div class="fc0"></div></div><div class="blog-art"><a href="http://kraval.blog.idnes.cz/c/102831/Paroubkova-vysokoskolacka.html" name="_blog_foto_vyber"><img class="midi" src="http://i.idnes.cz/09/012/midi/BNG288179_Ilja_Kraval.jpg" alt="Ilja Kraval"></a><h3>Ilja Kraval</h3><a href="http://kraval.blog.idnes.cz/c/102831/Paroubkova-vysokoskolacka.html" name="_blog_text_vyber">Paroubkova vysokoškolačka</a><div class="fc0"></div></div><div class="blog-art"><a href="http://stisk.blog.idnes.cz/c/102755/Bydlim-vBrne-Nastesti.html" name="_blog_foto_vyber"><img class="midi" src="http://i.idnes.cz/09/093/midi/JDV2dfb1b_porizkova.jpg" alt="Stisk - Anna Pořízková"></a><h3>Stisk - Anna Pořízková</h3><a href="http://stisk.blog.idnes.cz/c/102755/Bydlim-vBrne-Nastesti.html" name="_blog_text_vyber">Sehnat v Brně ubytování je drama</a><div class="fc0"></div></div></div></div><div class="fc0"></div><div class="ico-r"><ul><li><a class="ico-next blg-width-1" href="http://blog.idnes.cz/"><span></span>více blogů</a></li><li><a class="ico-next blg-width-2" href="http://blog.idnes.cz/regist/"><span></span>chci psát svůj blog</a></li></ul></div><div class="rohy-d"></div></div><div class="fc0"></div></div><script type="text/javascript">if(!Storage.data.zpravy) Storage.data.zpravy = {}; Misc.createSwitch("blog", [["ablog-1", "prep-1"], ["ablog-2", "prep-2"], ["ablog-3", "prep-3"]], [Storage.data.zpravy, "blog"]);</script> 
</div> 
		<div class="fc0"></div> 
 
	</div> 
	
	<div class="col-d"><div class="col-r"><hr class="h"><div class="r-head"> <span></span></div><div class="r-body"><div class="r-body"><div class="r-b-in"><div id="r3.1.27.7" class="hid m"><hr class="h"><div class="r-head">reklama</div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.1.27.7\'></div></div><div class="fc0"></div></div><hr class="h"></div></div></div> 
<div class="fca"><br class="h"></div> 
<div class="r-body"><div class="r-b-in"><div id="r3.1.7.33" class="hid m16"><hr class="h"><div class="r-head"><span></span></div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.1.7.33\'></div></div><div class="fc0"></div></div><hr class="h"></div></div></div> 
<div class="fca"><br class="h"></div> 
<div class="r-body"><div class="r-b-in"><div id="r3.1.2.33" class="hid m18"><hr class="h"><div class="r-head"><span></span></div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.1.2.33\'></div></div><div class="fc0"></div></div><hr class="h"></div></div></div> 
<div class="fca"><br class="h"></div> 
<div class="r-body"><div class="r-b-in"><div id="r3.2.23.33" class="hid m32"><hr class="h"><div class="r-head"><span></span></div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.2.23.33\'></div></div><div class="fc0"></div></div><hr class="h"></div></div></div> 
<div class="fca"><br class="h"></div> 
<div class="r-body"><div class="r-b-in"><div id="r3.2.24.33" class="hid m33"><hr class="h"><div class="r-head"><span></span></div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.2.24.33\'></div></div><div class="fc0"></div></div><hr class="h"></div></div></div> 
<div class="fca"><br class="h"></div> 
<div class="r-body"><div class="r-b-in"><div id="r3.1.5.33" class="hid m38"><hr class="h"><div class="r-head"><span></span></div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.1.5.33\'></div></div><div class="fc0"></div></div><hr class="h"></div></div></div> 
<div class="fca"><br class="h"></div> 
<div class="r-body"><div class="r-b-in"> <div id="r3.1.9.33" class="hid m26"><hr class="h"><div class="r-head"><span></span></div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.1.9.33\'></div></div><div class="fc0"></div></div><hr class="h"></div></div></div> 
<div class="fca"><br class="h"></div> 
<div class="r-body"><div class="r-b-in"><div id="r3.1.6.11" class="hid m7"><hr class="h"><div class="r-head"><span></span></div><div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.1.6.11\'></div></div><div class="fc0"></div></div><hr class="h"></div></div></div> 
<div class="fca"><br class="h"></div> 
<div class="r-body"><div class="r-b-in"><div id=\'bmone2n-3.2.23.7\'></div></div></div> 
</div><hr class="h"></div></div> 
	<div class="fc0"> </div> 
</div> 
<div id="eyes"><h2>Najdete na iDNES.cz</h2><div class="eyes-ico ico"><div class="half fl"><a href="/" class="ico-left" id="eyes-move-left"><span></span>posunout</a></div><div class="half fr"><a href="/" class="ico-right" id="eyes-move-right"><span></span>posunout</a></div></div><ul> 
<li class="e-hobby"><h3><a href="http://hobby.idnes.cz/hobby-domov.asp" title="Hobby.cz - Domov">Domov</a></h3><a  href="http://hobby.idnes.cz/navod-na-neustale-cistou-domacnost-aneb-bleskovy-prulet-bytem-za-20-minut-14t-/hobby-domov.asp?c=A090916_143419_hobby-domov_mce"><img border="0" src="http://i.idnes.cz/09/092/sp5/MCE2dd3c3_AGE_B19_465852.jpg" alt="Neustále čistá domácnost za 20 minut"><br><span>Neustále čistá domácnost za 20 minut</span></a></li> 
<li class="e-technet"><h3><a href="http://technet.idnes.cz/software.asp" title="Technet.cz - Software">Software</a></h3><a  href="http://technet.idnes.cz/premalujte-si-stare-windows-xp-na-moderni-windows-7-fxe-/software.asp?c=A090911_141614_software_vse"><img border="0" src="http://i.idnes.cz/09/043/sp5/JHA2abfae_W7XP.jpg" alt="Přemalujte si staré XP na Windows 7"><br><span>Přemalujte si staré XP na Windows 7</span></a></li> 
<li class="e-fincentrum"><h3><a href="http://finance.idnes.cz/uver.asp" title="Finance iDNES.cz - Finance">Finance</a></h3><a  href="http://finance.idnes.cz/varovne-signaly-dluhove-pasti-vice-kreditek-dovolena-a-darky-na-dluh-1gh-/uver.asp?c=A090921_135455_uver_bab"><img border="0" src="http://i.idnes.cz/09/011/sp5/FIB284436_pro22829_2_.jpg" alt="Dluhová past: kreditky, dovolená, dárky na dluh"><br><span>Dluhová past: kreditky, dovolená, dárky na dluh</span></a></li> 
<li class="e-blog"><h3><a href="http://blogovyroman.idnes.cz/blogovy-roman.asp" title="Blog iDNES.cz - Blogromán">Blogromán</a></h3><a  href="http://blogovyroman.idnes.cz/neni-lehke-byt-ucitelem-ve-tride-o-nekolika-stech-zacich-pi6-/blogovy-roman.asp?c=A090913_215105_blogovy-roman_jdv"><img border="0" src="http://i.idnes.cz/08/101/sp5/KOT262403_view2.JPG" alt="Není lehké být učitelem spisovatelů"><br><span>Není lehké být učitelem spisovatelů</span></a></li> 
<li class="e-zpravodaj"><h3><a href="http://zpravy.idnes.cz/nazory.asp" title="Zprávy iDNES.cz - Názor">Názor</a></h3><a class="bg-img bg-img-quotes"  href="http://zpravy.idnes.cz/volby-nepotrebujeme-vzdyt-mame-pruzkumy-f15-/nazory.asp?c=A090920_193052_nazory_abr">Volby nepotřebujeme. Vždyť máme průzkumy</a></li> 
<!--
<li class="e-ekonomikah"><h3><a href="http://ekonomika.idnes.cz/eko-doprava.asp" title="Ekonomika iDNES.cz - Doprava">Doprava</a></h3><a  href="http://ekonomika.idnes.cz/zlepsovak-drah-pripoje-cekaji-jen-5-minut-cestujici-trci-na-nadrazi-1d0-/eko-doprava.asp?c=A090919_1259651_eko-doprava_vem"><img border="0" src="http://i.idnes.cz/09/073/sp5/JB2ca439_elefant.jpg" alt="Dráhy: přípoje nečekají, cestující trčí na nádraží"><br><span>Dráhy: přípoje nečekají, cestující trčí na nádraží</span></a></li>
<li class="e-xman"><h3><a href="http://xman.idnes.cz/kraska-leta.asp" title="Xman.cz - Finále">Finále</a></h3><a  href="http://xman.idnes.cz/dvanact-sexy-soutezicich-je-ve-finale-vyberte-z-nich-krasku-leta-2009-1da-/kraska-leta.asp?c=A090917_101409_kraska-leta_fro"><img border="0" src="http://i.idnes.cz/09/083/sp5/STP2d47d7_9.jpg" alt="Vyberte z 12 dívek Krásku léta 2009"><br><span>Vyberte z 12 dívek Krásku léta 2009</span></a></li>
<li class="e-bonusweb"><h3><a href="http://bonusweb.idnes.cz" title="BonusWeb.cz - Recenze">Recenze</a></h3><a  href="http://bonusweb.idnes.cz/ps3/recenze/nhl-10-posouva-ceskou-extraligu-opet-o-kousek-dal-fty-/clanek.A090915_231855_bw-ps3-recenze_vdp.idn"><img border="0" src="http://i.idnes.cz/09/092/sp5/VDP2dcff4_boxshot_us_large.jpg" alt="NHL 10 posouvá extraligu o kousek dál"><br><span>NHL 10 posouvá extraligu o kousek dál</span></a></li>
<li class="e-zdravih"><h3><a href="http://zdravi.idnes.cz/vase-telo.asp" title="Zdraví iDNES.cz - Vaše tělo">Vaše tělo</a></h3><a  href="http://zdravi.idnes.cz/rakovina-slinivky-sance-na-vyleceni-je-temer-nulova-fhh-/vase-telo.asp?c=A090915_102524_vase-telo_pet"><img border="0" src="http://i.idnes.cz/09/092/sp5/PET2dcd09_slinivka.jpg" alt="Rakovina slinivky: téměř nulová šance"><br><span>Rakovina slinivky: téměř nulová šance</span></a></li>
<li class="e-zpravodaj"><h3><a href="http://zpravy.idnes.cz/domaci.asp" title="Zprávy iDNES.cz - Politika">Politika</a></h3><a  href="http://zpravy.idnes.cz/ods-i-cssd-kalkuluji-chteji-topolanka-vyslat-do-unie-f9j-/domaci.asp?c=A090922_222257_domaci_vel"><img border="0" src="http://i.idnes.cz/09/091/sp5/JB2d8a45_topo_sul.jpg" alt="ODS i ČSSD kalkulují. Chtějí Topolánka do EU"><br><span>ODS i ČSSD kalkulují. Chtějí Topolánka do EU</span></a></li>
<li class="e-zdravih"><h3><a href="http://zdravi.idnes.cz/zdravy-sport.asp" title="Zdraví iDNES.cz - Maraton">Maraton</a></h3><a  href="http://zdravi.idnes.cz/monika-trenuje-na-maraton-ale-achilovku-ji-poskodila-chuze-pad-/zdravy-sport.asp?c=A090913_163749_zdravy-sport_ves"><img border="0" src="http://i.idnes.cz/09/092/sp5/DRP2dd43d_ZG0H1001rez.jpg" alt="Monika trénuje, ale bolí jí achilovka"><br><span>Monika trénuje, ale bolí jí achilovka</span></a></li>
<li class="e-zpravodaj"><h3><a href="http://zpravy.idnes.cz/krimi.asp" title="Zprávy iDNES.cz - Krimi">Krimi</a></h3><a  href="http://zpravy.idnes.cz/ridic-autobusu-zemrel-po-rvacce-napadl-ho-opily-cestujici-pms-/krimi.asp?c=A090921_213554_praha_jba"><img border="0" src="http://i.idnes.cz/09/093/sp5/LF2df1d3_Kopie_210920092863[1].jpg" alt="Řidič autobusu zemřel po rvačce s opilcem"><br><span>Řidič autobusu zemřel po rvačce s opilcem</span></a></li>
<li class="e-mobil"><h3><a href="http://mobil.idnes.cz/mob_tech.asp" title="Mobil.cz - Trendy">Trendy</a></h3><a  href="http://mobil.idnes.cz/rusky-parni-mobil-ma-i-vyfuk-d1o-/mob_tech.asp?c=A090918_135235_mob_tech_jm"><img border="0" src="http://i.idnes.cz/09/093/sp5/JM2ddeab_Steampunk8.jpg" alt="Ruský parní mobil má i výfuk"><br><span>Ruský parní mobil má i výfuk</span></a></li>
<li class="e-cas"><h3><a href="http://revue.idnes.cz/lidicky.asp" title="Revue iDNES.cz - Revue">Revue</a></h3><a  href="http://revue.idnes.cz/stav-herecky-jiriny-jiraskove-je-po-necekane-operaci-vazny-poc-/lidicky.asp?c=A090922_123715_lidicky_ved"><img border="0" src="http://i.idnes.cz/09/091/sp5/VED2da63e_DSC_0760.JPG" alt="Stav Jiřiny Jiráskové je po operaci vážný "><br><span>Stav Jiřiny Jiráskové je po operaci vážný </span></a></li>
<li class="e-fotbalh"><h3><a href="http://fotbal.idnes.cz/fotbal.asp" title="Fotbal iDNES.cz - Fotbal">Fotbal</a></h3><a  href="http://fotbal.idnes.cz/video-podivejte-se-na-gol-z-poloviny-hriste-i-na-vyhru-jablonce-v-derby-1z2-/fotbal.asp?c=A090921_002558_fotbal_elv"><img border="0" src="http://i.idnes.cz/09/093/sp5/ELV2deae6_181039_263430.jpg" alt="VIDEO: Podívejte se na gól z půlky hřiště"><br><span>VIDEO: Podívejte se na gól z půlky hřiště</span></a></li>
<li class="e-cas"><h3><a href="http://revue.idnes.cz/lidicky.asp" title="Revue iDNES.cz - Video">Video</a></h3><a  href="http://revue.idnes.cz/silena-jezdkyne-na-koni-z-vaclavaku-je-finalistka-ceske-miss-plg-/lidicky.asp?c=A090919_121802_lidicky_ved"><img border="0" src="http://i.idnes.cz/09/023/sp5/MAP295739_HER_8098.jpg" alt="„Šílená“ jezdkyně na koni z Václaváku"><br><span>„Šílená“ jezdkyně na koni z Václaváku</span></a></li>
<li class="e-technet"><h3><a href="http://technet.idnes.cz/tec_reportaze.asp" title="Technet.cz - Reportáž">Reportáž</a></h3><a  href="http://technet.idnes.cz/nova-tramvaj-pro-prahu-vozi-20-tun-kolejnic-misto-cestujicich-podivejte-se-1rw-/tec_reportaze.asp?c=A090920_132056_tec_reportaze_rja"><img border="0" src="http://i.idnes.cz/09/092/sp5/RJA2dda8d_IMG_7815.JPG" alt="Nová tramvaj pro Prahu zatím vozí koleje"><br><span>Nová tramvaj pro Prahu zatím vozí koleje</span></a></li>
<li class="e-kultura"><h3><a href="http://kultura.idnes.cz/filmvideo.asp" title="Kultura iDNES.cz - Film/TV">Film/TV</a></h3><a  href="http://kultura.idnes.cz/carrie-a-spol-nahodily-leginy-a-trvalou-toci-se-sex-ve-meste-2-plw-/filmvideo.asp?c=A090921_132144_filmvideo_tt"><img border="0" src="http://i.idnes.cz/09/093/sp5/TT2def6c_BAF_191120.jpg" alt="Točí se Sex ve městě II. Carrie nahodila legíny"><br><span>Točí se Sex ve městě II. Carrie nahodila legíny</span></a></li>
<li class="e-zpravodaj"><h3><a href="http://zpravy.idnes.cz/praha.asp" title="Zprávy iDNES.cz - Praha">Praha</a></h3><a  href="http://zpravy.idnes.cz/gang-vykrada-ucty-pres-nove-ctecky-na-bankomatech-funguji-on-line-phs-/praha.asp?c=A090921_203506_praha_jba"><img border="0" src="http://i.idnes.cz/09/092/sp5/STF2dc8f2_NWC_290935.jpg" alt="Nový gang plení účty přes bankomaty"><br><span>Nový gang plení účty přes bankomaty</span></a></li>
<li class="e-sport"><h3><a href="http://sport.idnes.cz/formule.asp" title="Sport iDNES.cz - Formule">Formule</a></h3><a  href="http://sport.idnes.cz/umyslna-nehoda-renault-ma-dvouletou-podminku-briatore-dozivoti-pxi-/formule.asp?c=A090921_141711_formule_ald"><img border="0" src="http://i.idnes.cz/09/092/sp5/TEN2db766_ITALY_GP_F1_AUTO_RACING_LB111.jpg" alt="Trest pro Renault: Briatore skončil"><br><span>Trest pro Renault: Briatore skončil</span></a></li>
<li class="e-zpravodaj"><h3><a href="http://zpravy.idnes.cz/nazory.asp" title="Zprávy iDNES.cz - Kavárna">Kavárna</a></h3><a class="bg-img bg-img-quotes"  href="http://zpravy.idnes.cz/co-se-izraelskych-osad-tyce-jsou-palestinci-zajatci-hlavy-xxii-p7w-/kavarna.asp?c=A090922_130136_kavarna_bos">Co se izraelských osad týče, jsou Palestinci zajatci Hlavy XXII</a></li>
<li class="e-autokat"><h3><a href="http://auto.idnes.cz/auto_testy.asp" title="Auto iDNES.cz - Testy aut">Testy aut</a></h3><a  href="http://auto.idnes.cz/stotunovy-obr-v-akci-nejvetsi-veda-je-ho-ubrzdit-fuq-/auto_testy.asp?c=A090918_094520_auto_testy_fdv"><img border="0" src="http://i.idnes.cz/09/092/sp5/FDV2dddd4_cat42.jpg" alt="Stotunový obr v akci: věda je ho ubrzdit"><br><span>Stotunový obr v akci: věda je ho ubrzdit</span></a></li>
<li class="e-kultura"><h3><a href="http://kultura.idnes.cz/literatura.asp" title="Kultura iDNES.cz - Blogromán">Blogromán</a></h3><a  href="http://kultura.idnes.cz/uz-nebudu-devka-rika-hrdinka-blogoveho-romanu-ve-treti-kapitole-pwd-/literatura.asp?c=A090914_002346_literatura_jdv"><img border="0" src="http://i.idnes.cz/09/092/sp5/MBB2db158_srdce.jpg" alt="Sbohem. Třetí kapitola blogrománu"><br><span>Sbohem. Třetí kapitola blogrománu</span></a></li>
<li class="e-ona"><h3><a href="http://ona.idnes.cz/ona_moda.asp" title="Ona iDNES.cz - Móda">Móda</a></h3><a  href="http://ona.idnes.cz/pet-nejcastejsich-ceskych-modnich-hrichu-ledvinka-ponozky-v-sandalech-nebo-igelitka-gmx-/ona_moda.asp?c=A090921_105331_ona_moda_ves"><img border="0" src="http://i.idnes.cz/09/093/sp5/VES2def19_38ONA16a.jpg" alt="Pět slavných českých módních hříchů"><br><span>Pět slavných českých módních hříchů</span></a></li>
<li class="e-ekonomikah"><h3><a href="http://ekonomika.idnes.cz/ekonomika.asp" title="Ekonomika iDNES.cz - Konference">Konference</a></h3><a  href="http://ekonomika.idnes.cz/primy-prenos-balickem-to-nekonci-upozornil-janota-na-konferenci-o-krizi-1a9-/ekonomika.asp?c=A090922_140448_ekonomika_ven"><img border="0" src="http://i.idnes.cz/09/093/sp5/VEN2dfa13_101542_2823385.jpg" alt="Zlatá koruna: hledáme poučení z krize"><br><span>Zlatá koruna: hledáme poučení z krize</span></a></li>
<li class="e-iglobe"><h3><a href="http://cestovani.idnes.cz/igsvet.asp" title="Cestování iDNES.cz - Svět">Svět</a></h3><a  href="http://cestovani.idnes.cz/videt-neapol-a-zemrit-na-choleru-a-strach-ffk-/igsvet.asp?c=A090709_141558_igsvet_fdv"><img border="0" src="http://i.idnes.cz/09/093/sp5/TOM2df00e_DSCN4364.jpg" alt="Vidět Neapol a zemřít. Na choleru a strach"><br><span>Vidět Neapol a zemřít. Na choleru a strach</span></a></li>
<li class="e-reality"><h3><a href="http://bydleni.idnes.cz/dum_osobnosti.asp" title="Bydlení iDNES.cz - Na návštěvě">Na návštěvě</a></h3><a  href="http://bydleni.idnes.cz/chteli-prestehovat-jen-pokoj-pro-skolaka-nakonec-se-stehoval-cely-dum-1kz-/dum_osobnosti.asp?c=A090920_183924_dum_osobnosti_rez"><img border="0" src="http://i.idnes.cz/09/093/sp5/REZ2deaec_4_a.jpg" alt="Kvůli pokoji pro školáka se stěhoval celý dům"><br><span>Kvůli pokoji pro školáka se stěhoval celý dům</span></a></li>
<li class="e-zpravodaj"><h3><a href="http://zpravy.idnes.cz/zahranicni.asp" title="Zprávy iDNES.cz - Zahraniční">Zahraniční</a></h3><a  href="http://zpravy.idnes.cz/hraji-monopoly-verili-naciste-tisicum-zajatcu-hra-pomohla-k-uteku-1c9-/zahranicni.asp?c=A090921_130417_zahranicni_jw"><img border="0" src="http://i.idnes.cz/09/093/sp5/JW2df03a_monopoly.cdbpdx.com.jpg" alt="Hra Monopoly dostala válečné zajatce z lágru"><br><span>Hra Monopoly dostala válečné zajatce z lágru</span></a></li>
--> 
</ul></div><script type="text/javascript">Misc.kukatko("eyes", ["eyes-move-left", "eyes-move-right"])</script><div id="footer"> 
		<div id="clink"><hr class="h" ></div> 
	<div id="f-idnes"><a href="http://www.idnes.cz/" title="iDNES.cz">iDNES.cz<span></span></a></div> 
	<div id="f-dnes"><a href="http://www.mfdnes.cz/" title="MF DNES">MF DNES<span></span></a></div> 
	<h4 class="h">Servis ke stránkám</h4> 
	<ul id="f-iservis"> 
		<li><a href="http://zpravodajstvi.idnes.cz/">iDNES.cz pro váš web</a></li> 
		<!--mobilniverze--> 
		<li><a href="http://vice.idnes.cz/alert_zadani.asp">Zprávy do mailu</a></li> 
		<li><a href="http://r.idnes.cz/r.asp?r=sms&amp;url=http%3A%2F%2Fsms%2Eidnes%2Ecz%2F">Zprávy na mobil</a></li> 
		<li><a href="http://rss.idnes.cz/">RSS</a></li> 
	</ul> 
	<h4 class="h">Další služby</h4> 
	<ul id="f-service"> 
		<li><a href="http://horoskopy.idnes.cz/#utm_source=idnes.cz&utm_medium=referral&utm_campaign=idnes-paticka-horoskopy">Horoskopy</a></li> 
		<li><a href="http://pocasi.idnes.cz/">Počasí</a></li> 
		<li><a href="http://tvprogram.idnes.cz/">TV program</a></li> 
		<li><a href="http://auto.idnes.cz/doprava.asp">Doprava</a></li> 
		<li><a href="http://jizdnirady.idnes.cz/ ">Jízdní řády</a></li> 
		<li><a href="http://golf.idnes.cz/">Golf</a></li> 
		<li><a href="http://finance.idnes.cz/kurz_listek.asp">Kurzy</a></li> 
		<li><a href="http://mapy.idnes.cz/">Mapy</a></li> 
		<li><a href="http://www.ukazse.cz/#utm_source=idnes.cz&utm_medium=referral&utm_campaign=idnes-paticka-seznamka">Seznamka</a></li> 
		<li><a href="http://slovniky.idnes.cz/">Slovníky</a></li> 
		<li><a href="http://www.rajce.net/">Fotoalba</a></li> 
		<li><a href="http://poradny.idnes.cz">Poradny</a></li> 
		<li><a href="http://www.jobdnes.cz/">Práce</a></li> 
		<li><a href="http://www.idnes.tv/">Video</a></li> 
		<li><a href="http://r.idnes.cz/r.asp?r=paticka_topkontakt&amp;url=http%3A%2F%2Ftopkontakt%2Eidnes%2Ecz%2F">Firmy</a></li> 
	</ul> 
	<h4 class="h">iDNES.cz</h4> 
	<ul id="f-ilink"> 
		<li><a rel="nofollow" href="http://www.idnes.cz/volnamista">volná místa</a></li> 
		<li><a rel="nofollow" href="http://www.idnes.cz/privacy">soukromí</a></li> 
		<li><a rel="nofollow" href="http://sluzby.mafra.cz/">reklama</a></li> 
		<li><a rel="nofollow" href="http://www.idnes.cz/kontakty">kontakty</a></li> 
		<li><a rel="nofollow" href="http://www.mafra.cz/cs/default.asp?y=mafra_all\cs_produkty-a-sluzby_idnes-cz.htm">o iDNES.cz</a></li> 
	</ul> 
	<div id="copyright">&copy; Copyright 1999 &ndash; 2009 <a href="http://www.mafra.cz/">MAFRA a.s.</a> a dodavatelé <a href="http://www.profimedia.cz/" rel="nofollow" class="profimedia" target="_blank">Profimedia</a>, Reuters, ČTK, AP.<br>Jakékoliv užití obsahu včetně převzetí, šíření či dalšího zpřístupňování článků a fotografií je bez souhlasu MAFRA a.s. zakázáno.<br>Partner pro inzerci v Německu: <a href="http://www.rp-online.de/">RP Online</a>.</div> 
	<img src="http://g.idnes.cz/u/iweb38.gif" alt="" class="iweb"> 
</div> 
 
<div id=\'bmone2n-3.1.12.33\'></div> 
</div> 
 
<div class="counters"> 
<script type=\'text/javascript\'> 
/*Ads.disableRotation();*/
Ads.bmone2([\'3.2.1.1\',\'3.2.5.36\',\'3.2.5.25\',\'3.2.9.37\',\'3.1.27.7\',\'3.1.7.33\',\'3.1.2.33\',\'3.2.23.33\',\'3.2.24.33\',\'3.1.5.33\',\'3.1.9.33\',\'3.1.6.11\',\'3.2.23.7\',\'3.2.32.33\',\'3.1.12.33\']);
</script> 
 
<div id=\'bmone2t-3.2.1.1\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.2.1.1\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.2.5.36\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.2.5.36\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.2.5.25\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.2.5.25\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.2.9.37\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.2.9.37\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.1.27.7\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.1.27.7\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.1.7.33\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.1.7.33\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.1.2.33\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.1.2.33\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.2.23.33\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.2.23.33\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.2.24.33\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.2.24.33\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.1.5.33\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.1.5.33\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.1.9.33\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.1.9.33\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.1.6.11\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.1.6.11\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.2.23.7\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.2.23.7\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.2.32.33\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.2.32.33\'); /* ]]> */</script></div> 
<div id=\'bmone2t-3.1.12.33\' style=\'display:none\'><script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.makeAd(\'3.1.12.33\'); /* ]]> */</script></div> 
<script type=\'text/javascript\'>/* <![CDATA[ */ bmone2n.moveAd(); /* ]]> */</script> 
</div> 
<script type="text/javascript"> 
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." :  "http://www."); 
    document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));    
</script> 
<script type="text/javascript"> 
    var pageTracker = _gat._getTracker("UA-8307821-1");  
</script> 
<script type="text/javascript"> 
   document.write("<script src=\"http" + (location.protocol != "https:" ? "://g" : "s://secure") + ".idnes.cz/js/ga/vyhledavace.js?rnd=002\"><" + "/script>");  
</script> 
<script type="text/javascript"> 
    try { 
    pageTracker._setDomainName(".idnes.cz"); 
    pageTracker._setSessionTimeout("3600"); 
    pageTracker._setAllowAnchor(true);  
    pageTracker._setAllowHash(false);  
    pageTracker._initData(); 
    pageTracker._trackPageview(); 
   
   Misc.setPageTracker("eTargetResult", "/odchozi/etarget");
    } catch(err) {} 
</script>     
 
<div class="bbtext"></div><script type=\'text/javascript\' src=\'http://g.idnes.cz/js/ad/takeit.js?s6\'></script> 
 
</body> 
</html><!--C 20:38:06 23.9.2009-->';


my $res = extract_text($html);

print Dump($res);