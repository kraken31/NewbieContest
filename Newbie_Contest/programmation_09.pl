# Newbie Contest - Challenge programmation 9

use WWW::Mechanize;
use OCR::PerfectCR;
use GD;
   
my $usernb = $ARGV[0];
my $passnb = $ARGV[1];

my $mech = WWW::Mechanize->new();

# Définition du proxy
#$mech->proxy(['https', 'http', 'ftp'], 'http://proxy-tech.svc.ext.tdc:3128/');

$mech->get( "https://www.newbiecontest.org" );

# Connexion
$mech->set_fields( "user" => [ $usernb, 1 ] );
$mech->set_fields( "passwrd" => [ $passnb, 1 ] );
$mech->click();

# Positionnement sur l'image
my $equation = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog10.php" );
my $page = $mech->content;

# Sauvegarde de l'image
$mech->save_content( "image.png");

# Récupération du texte dans l'image
system("tesseract.exe image.png out");
open(my $fd,'<','out.txt');
my $texte = <$fd>;
close( $fd );

print "ligne=$texte";

# Récupération du mot de passe
$mech->get( "https://www.newbiecontest.org/epreuves/prog/verifpr10.php?chaine=$texte" );
$page = $mech->content;
print $page;

