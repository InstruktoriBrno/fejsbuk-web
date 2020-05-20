#!/usr/bin/perl -w

use strict;

my $uvod=1;
my $tym=2;
my $info=3;
my $prihlaska=4;
#my $spoje=5;

my $menuWidth = 290;
my $mainSpaceWidth = 767;

my $stranka;
my %jmenoStranky = (
     $uvod => "Úvod",
     $info => "O akci",
     $tym  => "Tým",
     $prihlaska => "Připoj se"#,
#     $spoje => "Jak se tam dostanu?"
   );


my %menuImage = (
     $uvod => "uvod",
     $info => "info",
     $tym  => "tym",
     $prihlaska => "prihlaska"
   );

my %menuWidth = (
     $uvod => 124,
     $info => 201,
     $tym  => 141,
     $prihlaska => 227
   );
   
my %menuHeight = (
     $uvod => 52,
     $info => 58,
     $tym  => 83,
     $prihlaska => 73
   );


my %menuLeft = (
     $uvod => 127,
     $info => 49,
     $tym  => 120,
     $prihlaska => 34
   );

my %menuTop = (
     $uvod => 243,
     $info => 306,
     $tym  => 374,
     $prihlaska => 475
   );



my %podstranek = (
     $uvod => 0,
     $tym  => 0,
     $info => 0,
     $prihlaska => 0#,
#     $spoje => 0
);

my @podstrankyTymu = ( undef, "tym_vasek.html", "tym_ilca.html", "tym_peklo.html", "tym_mlok.html", "tym_finn.html" );

my %jmenoSouboru = (
     $uvod => "index.html",
     $tym  => "tym.html",
     $info => "o_akci.html",
     $prihlaska => "prihlaska.html"#,
#     $spoje => "spoje.html"
   );

my $file;

sub println
{
 my $arg1 = shift;
 print $file "$arg1\n";
}

sub print1
{
 my $arg1 = shift;
 print $file "$arg1";
}

sub printMenu
{
 my $active = shift;
 my $strankaInner;
 for ($strankaInner=1; $strankaInner<=4; $strankaInner+=1)
  {
   if ($active == $strankaInner)
    {
     println '      <img style="position:absolute; left: '.($menuLeft{$strankaInner}).'px; top: '.$menuTop{$strankaInner}.'px; width: '.$menuWidth{$strankaInner}.'px; height: '.$menuHeight{$strankaInner}.'px;" border="0" src="images/'.$menuImage{$strankaInner}.'_active.png">'; 
    }
   else
    {
     println '      <span style="position:absolute;  left: '.($menuLeft{$strankaInner}).'px; top: '.$menuTop{$strankaInner}.'px;" id="'.$menuImage{$strankaInner}.'"><a href="'.$jmenoSouboru{$strankaInner}.'"></a></span>';
    }
  }
}


for ($stranka=1; $stranka<=4; $stranka+=1) {
  my $podstranka;
  for ($podstranka=0; $podstranka<=$podstranek{$stranka}; $podstranka+=1) {
    if ($podstranka==0)
     { open($file, '>', $jmenoSouboru{$stranka}); }
    else
     {
      if ($stranka == $tym)
       { open($file, '>', $podstrankyTymu[$podstranka]); }
      else
       { die "Unexpected error"; }
     }
  
    println '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">';
    println '<html>';
    println '<head>';
    println '  <meta content="text/html; charset=UTF-8" http-equiv="content-type">';
    println '  <title>Fejsbuk - '.$jmenoStranky{$stranka}.'</title>';
    println '  <link rel="stylesheet" href="styl.css" type="text/css">';
    println '</head>';
    println '<body style="color: rgb(0, 0, 0); background-color: rgb(127, 127, 127);" vhlink="#b6524c" alink="#903020" link="#802512">';
    println '  <div align="center" width="100%">';
    println '  <div style="top:0px; width: '.($mainSpaceWidth+2*$menuWidth).'px; position: relative;">';
    println '    <div style="text-align: left; position: absolute; top:0px; left:0px; width:'.$menuWidth.'px">';
    printMenu $stranka;
    println '    </div>';
    println '    <div style="background-color: rgb(127, 127, 127); text-align: left; left: '.$menuWidth.'px; width: '.$mainSpaceWidth.'px; position: absolute;">';
    println '       <img style="position: absolute; left: 0px; top: 0px; width: 767px; height: 231px" alt="Fejsbuk" src="images/hlavicka.jpg"/>';
    println '       <div style=" position: absolute; left:0px; top: 231px; background-color: rgb(255, 255, 255); text-align: left; padding:0; margin-top: 0; margin-left:0; margin-right: 0; margin-bottom:0; width: 767px;">';
    println '          <div style="background-color: rgb(255, 255, 255); padding: 20px; text-align: left; margin-top: 0px; margin-left: 0px; margin-right: 0px; margin-bottom:0px; width: 727px;">';
#    println '      <img style="position: absolute; left:0px; top:0px; border: 0px solid ; width: 900px; height: 882px;" alt="" src="images/zaklad.jpg">';
    if ($stranka==$uvod)
     {
      println '            <p class="uvodOtazka"><img src="images/sipka_orange.png"/> Už jsi dostal(a) kopačky SMSkou?</p>';
      println '            <p class="uvodOtazka"><img src="images/sipka_blue.png"/> Omrzely tě statusy všech tvých pěti set kamarádů?</p>';
      println '            <p class="uvodOtazka"><img src="images/sipka_orange.png"/> Pořád něco hledáš a Google nepomáhá?</p>';
      println '            <div style="position:relative; width:100%">';
      println '              <div style="width:435px; padding-left: 37px; padding-right: 30px; padding-top: 4 px">';
      println '                <p>Tak se na 4 dny odpoj od sítě a <a href="'.$jmenoSouboru{$prihlaska}.'">připoj</a> se k nám.';
#      println '                   Společně s&nbsp;nadhledem shlédnem na své mikrosvěty, ze kterých vysíláme signály po všeobjímající síti a čekáme na odpovědi, které nepřichází.';
      println '                </p>';
      println '                <p>Získáš nevšední prožitky. Zažiješ silné emoce, nevázanou radost a nenucenou upřímnost. Poběžíš s větrem ve vlasech a bahnem po kolena.';
      println '                   Zakusíš vyčerpání i zasloužený odpočinek. Podíváš se na Facebook a jiné virtuální světy s odstupem a očima ostatních účastníků.</p>';
      println '                <p>Pojď to toho s námi. Bude to zatraceně skutečné.';
      println '                </p>';
      println '              </div>';
      println '              <div style="width:152px; position:absolute; left: 495px; top:-70px;">';
      println '                <img src="images/jumping.png"/>';
      println '              </div>';
      println '            </div>';
      
      
#      Chybí ti upřímnost, emoce, radost nebo nové zážitky?
#      Jak je to dlouho, co jsi naposled zažil vítr ve vlasech, vůni lesa nebo šimrání slunce na tváři?
#      Pamatuješ si ještě, jak chutná tvoření, vyčerpání a zasloužený odpočinek?
#      
#      Dokážeš být 4 dny offline? Váháš? Máš otázky? Zjisti s námi, jak se věci ve Tvém životě mají.
#      Nečekej, jednej a připoj se k nám. Může to být zatraceně skutečné ...

     }
    if ($stranka==$tym)
     {
      println '            <p class="jmenoLeft">Petra Hovězáková (Peťka)</p>';
      println '            <table border="0" cellspacing="0" cellpadding="0"><tr>';
      println '               <td>';
      println '                    <img src="images/petka.jpg" alt="foto Peťka" border=0 width="270px" height="270px"/>';
      println '               </td>';
      println '               <td class="tymLeft">';
      println '                    <p>Studuju psychologii, které bych se chtěla jednou naplno věnovat, a kromě školních přednášek poslední dobou trávím taky hodně času ve studovně. Vnímám potřebu sezení nad knihami vyvážit pohybem a zábavou, proto ráda vyrážím na výlety s přáteli pěšky i na kole nebo jen tak posedět do příjemné hospůdky, na zahradu nebo do parku. Miluju hudbu, zpěv, tanec, dobré jídlo a nesnáším nudu.</p>';
      println '                    <p>Facebook používám hlavně ke komunikaci s přáteli, kteří jsou daleko a se kterými nemám možnost se pravidelně vídat. Jako jeho dobrou stránku vidím to, že mi zjednodušuje práci při organizování nejrůznějších akcí veřejných i soukromých, protože během pár vteřin se o mých plánech dozví široké okolí. Někdy však zabřednu do některého z lákadel, které nabízí, a trávím čas hraním her nebo projížděním fotek kamarádů, známých i lidí, které sotva znám.</p>';
      println '               </td>';
      println '            </tr></table>';
      println '            <p class="jmenoRight">Kristýna Janásová (Kris)</p>';
      println '            <table border="0" cellspacing="0" cellpadding="0"><tr>';
      println '               <td class="tymRight">';
      println '                    <p>Napůl studuji a pracuji na volné noze, funguji jako příležitostná konzultantka přes duši a amatérská masérka. Svůj volný čas ráda trávím s přáteli, ideálně při aktivitách spojených s hudbou nebo sportem. Miluji cestování a kdykoliv je to je možné, pokouším se vyrazit do zahraničí a oprášit cizí jazyky. Ráda se pouštím do zajímavých akcí, nebráním se recesi, mám ráda improvizaci. Baví mne práce s dětmi a ráda se kreativně vyžívám. V životě se pohybuji intuitivně a zvídavě, nemám ráda bezpráví a nespravedlnost. IT světu příliš nerozumím a už jsem se dávno smířila s tím, že nejsem technický typ.</p>';
      println '                    <p>Facebook má pro mne mnoho podob i významů, mnoho pro i proti. Osobně jej používám především ze dvou důvodů, jednak jako univerzální komunikační kanál a také jako nekonečný zdroj informací a inspirace.</p>';
      println '               </td>';
      println '               <td>';
      println '                    <img src="images/kris.jpg" alt="foto Kris" border=0 width="270px" height="270px"/>';
      println '               </td>';
      println '            </tr></table>';
      println '            <p class="jmenoLeft">Petra Tylichová (Peťa)</p>';
      println '            <table border="0" cellspacing="0" cellpadding="0"><tr>';
      println '               <td>';
      println '                    <img src="images/peta.jpg" alt="foto Peťa" border=0 width="270px" height="270px"/>';
      println '               </td>';
      println '               <td class="tymLeft">';
      println '                    <p>I když jsem vystudovala chemii, tak spíše než v laboratoři se vyskytuji v kanceláři, kde se zabývám problematikou čistoty ovzduší. Proto mě to z uzavřených prostor často táhne ven, do přírody, za kulturou, do společnosti příjemných lidí. Úplně nejraději si ale vychutnávám chvíle klidu a pohody na horách, daleko od internetu a všech těch nezbytných vymožeností moderní doby.</p>';
      println '                    <p>Facebook používám hlavně ke komunikaci s přáteli, sdílení zážitků s lidmi, které nevídám tak často, jak bych chtěla a k získávání informací o akcích nejrůznějších typu. Občas se ale stane, že online zůstanu déle, než bych si přála, na nějakou dobu uvíznu v síti, a to se pak už jen nestačím divit, jak se dá mrhat drahocenným časem.</p>';
      println '               </td>';
      println '            </tr></table>';
      println '            <p class="jmenoRight">Pavel Šimeček (Finn)</p>';
      println '            <table border="0" cellspacing="0" cellpadding="0"><tr>';
      println '               <td class="tymRight">';
      println '                    <p>Počítače mě živí a tudíž často přemýšlím, kde je hranice mezi tím, kdy mi pomáhají a kdy u nich jen mrhám časem. Trpím silnou potřebou kompenzovat vysedávání u strojů pohybem a výlety do přírody s kamarády. Mám rád zajímavé myšlenky a lidi co je dokáží uchopit a správně vyslovit. Pohybuji se u Instruktorů Brno řadu let, působím také v Hnutí Brontosaurus, kde vedu kursy pro nové organizátory.</p>';
      println '                    <p>Facebook používám hlavně jako nástroj pro domluvu různých akcí a srazů. Mimoděk se skrz něj také dozvídám novinky o kamarádech, které nemám jinak mnoho příležitostí potkat.</p>';
      println '               </td>';
      println '               <td>';
      println '                    <img src="images/finn.jpg" alt="foto Finn" border=0 width="270px" height="270px"/>';
      println '               </td>';
      println '            </tr></table>';
      println '            <p class="jmenoLeft">Roman Stejskal (Roman)</p>';
      println '            <table border="0" cellspacing="0" cellpadding="0"><tr>';
      println '               <td>';
      println '                    <img src="images/roman.jpg" alt="foto Roman" border=0 width="270px" height="270px"/>';
      println '               </td>';
      println '               <td class="tymLeft">';
      println '                    <p>Jsem člověk, který více času žije snem, než realitou a člověk, který více času přemýšlí, než koná. Mám proto rád dokonalost a to je jediné co opravdu dokážu ocenit. Ve volném čase více než mým koníčkům a zálibám se věnuji věcem, které mě z nějakého důvodu nadchli a dávají mi možnost seberealizace.</p>';
      println '                    <p>Primárně se Facebook snažím používat spíše jako nástroj, kdy se mi osvědčil při pořádání akcí, komunikaci s lidmi, organizaci menších skupin atd… Ale i velice často podlehnu jeho kouzlu a rád si prohlédnu fotky přátel z akcí, kterých jsem se neúčastnil, či jenom tak sleduji, co se komu honí hlavou.</p>';
      println '               </td>';
      println '            </tr></table>';
      println '            <p class="jmenoRight">Petr Novák (Nox)</p>';
      println '            <table border="0" cellspacing="0" cellpadding="0"><tr>';
      println '               <td class="tymRight">';
      println '                    <p>Jsem klasický student, co prokrastinuje, ale v poslední době se s tím (víc, než dřív) snaží něco dělat. Sezení u počítače jsem schopný nahradit třídenním výletem bez jídla a o prázdninách pravidelně zapomenu, jak se píše na klávesnici.</p>';
      println '                    <p>Na Facebooku mám svých skromných 70 přátel a na zeď mi chodí příspěvky od firem, stránek a komunit, které mi mají co říct a o které se zajímám. Díky Facebooku tak velmi dobře vím, co se kde děje a nemusím nic dlouze hledat. Beru ho proto spíše jako nástroj "nekomunikace" - s lidmi na něm vždycky jen domluvím, kdy a kde se uvidíme. Poslední dobou sám dvě Facebook komunity aktivně vytvářím a zabývám se tím, co na Facebook dávat, nedávat a jak často tam něco dávat. Zážitky si podle mě může člověk na Facebooku jenom připomenout a proto ho používám tak, jak ho používám.</p>';
      println '               </td>';
      println '               <td>';
      println '                    <img src="images/nox.jpg" alt="foto Nox" border=0 width="270px" height="270px"/>';
      println '               </td>';
      println '            </tr></table>';
     }
    if ($stranka==$info)
     {
      println '              <div style="position:relative; padding-left: 33px; padding-right: 33px;">';
      println '                <p>Fejsbuk je 4-denní zážitková akce, o střetu virtuálního světa se skutečností.</p>';
      println '                <p>Spolu s ostatními účastníky zažiješ mnoho nového, nečekaného a zábavného. Budeš své zážitky také sdílet a diskutovat o nich face-to-face. V nabitém programu se dotkneme témat vztahů, volného času, virtuální identity, textové komunikace i bezpečnosti. Na akci se vystřídají chvíle zamyšlení, zábavy i okamžiky, kdy si sáhneš na dno svých fyzických sil.</p>';
      println '                <div style="position:relative;">';
      println '                  <div style="width:435px;">';
      println '                    <p><b>Kdy:</b> 27.-30.9. 2012<br/>';
      println '                       <b>Kde:</b> Bedřichov (okres Blansko)<br/>';
      println '                       <b>Cena:</b> 930 Kč<br/>';
      println '                       <b>S kým:</b> s dalšími 23 účastníky<br/>';
      println '                       podmínkou účasti je věk 18+ a vlastní facebookový profil</p>';
      println '                    <p><b>Co na akci rozhodně nečekej:</b> dlouhé sedavé přednášky, poučování o tom, co si organizátoři myslí, že je dobré a co špatné, připojení k internetu, mnoho volného času a nudu.</p>';
      println '                  </div>';
      println '                  <div style="width:152px; position:absolute; left: 475px; top:0px;">';
      println '                    <a href="http://www.instruktori.cz"><img src="images/logo_instruktori_simple.png" alt="Instruktoři Brno" border="0"/></a>';
      println '                  </div>';
      println '                </div>';
      println '                <p>Pořád ti není úplně jasné o co jde a přesto tě akce láká? Nebo se prostě jen potřebuješ na něco doptat? Piš na fejsbuk2012<img style="margin-bottom:-3px" src="images/zavinac.png" alt="[zavináč]"/>email.cz nebo volej na 605060203.</p>';
      println '                <p>Akci pořádají <a href="http://www.instruktori.cz">Instruktoři Brno</a>.</p>';
      println '              </div>';                     
     }
    if ($stranka==$prihlaska)
     {
      println '                 <iframe src="https://docs.google.com/spreadsheet/embeddedform?formkey=dENpendORE80NWNDZnVUZUR3T2gwSXc6MQ" width="730" height="2100" frameborder="0" marginheight="0" marginwidth="0">Načítání...</iframe>';
#      println '      <img style="position: absolute; left: 490px; top: 310px;" alt="Prihláška" src="images/prihl_hnedy.png">';
#      println '      <img style="position: absolute; left: 294px; top: 458px;" alt="" src="images/prihlaska_text.jpg">';
#      println '      <span style="position: absolute; left: 306px; top: 515px;" id="prihlOdkaz"><a href="http://spreadsheets.google.com/viewform?hl=cs&formkey=dG9hMEhOajY2UmJVOVZ3dGRxTkEyY2c6MA" target="KOLOCADAPRIHLASKA"></a></span>';
     }
#    println '      <a href="images/pruzkum.jpg" target="KOLONADAPRUZKUM"><img border="0" style="position: absolute; left: 720px; top:645px;" alt="fotky z průzkumu terénu" src="images/fotkyzterenu.png"></a>';
    println '      <br/>';
    println '';
    println '       </div>';
    println '       <div style="background-color: rgb(255, 255, 255); text-align: left; margin-top: 20px; margin-left:20px; margin-right: 20px; margin-bottom:20px; width: 767px;">';
    println '          <img style="position: absolute; left: 0px; width: 767px; height: 229px" alt="Paticka" src="images/paticka.jpg"/>';
    println '       </div>';
    println '    </div>';
    println '';
#    println '<a href="http://www.waudit.cz/"><script type="text/javascript">';
#    println '<!--';
#    println "document.write('<img src=\"http://h.waudit.cz/h.php?id=16908&amp;ty=b_1&amp;js=1&amp;x='+screen.width+'&amp;y='+screen.height+'&amp;bit='+screen.colorDepth+'&amp;wx=0&amp;wy=0&amp;url='+escape(document.location)+'&amp;ref='+escape(top.document.referrer)+'\" width=\"1\" height=\"1\" border=\"0\" title=\"\" alt=\"\" />');";
#    println '// -->';
#    println '</script></a>';
#    println '<noscript><a href="http://www.waudit.cz/"><img src="http://h.waudit.cz/h.php?id=16908&amp;ty=b_1" width="1" height="1" border="0" title="" alt="" /></a></noscript>';
    println '  </div>';
    println '  </div>';
    println '  </div>';
    println '  <div id="preload">';
    println '      <img src="images/uvod_hover.png" width="1" height="1"/>';
    println '      <img src="images/uvod_active.png" width="1" height="1"/>';
    println '      <img src="images/uvod_inactive.png" width="1" height="1"/>';
    println '      <img src="images/info_hover.png" width="1" height="1"/>';
    println '      <img src="images/info_active.png" width="1" height="1"/>';
    println '      <img src="images/info_inactive.png" width="1" height="1"/>';
    println '      <img src="images/tym_hover.png" width="1" height="1"/>';
    println '      <img src="images/tym_active.png" width="1" height="1"/>';
    println '      <img src="images/tym_inactive.png" width="1" height="1"/>';
    println '      <img src="images/prihlaska_hover.png" width="1" height="1"/>';
    println '      <img src="images/prihlaska_active.png" width="1" height="1"/>';
    println '      <img src="images/prihlaska_inactive.png" width="1" height="1"/>';
    println '  </div>';
    println '</body>';
    println '</html>';
  }
}

