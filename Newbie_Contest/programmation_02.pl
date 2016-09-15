# Newbie Contest - Challenge programmation 2

use WWW::Mechanize;

my $usernb = $ARGV[0];
my $passnb = $ARGV[1];

my $mech = WWW::Mechanize->new();

# Définition du proxy
$mech->proxy(['https', 'http', 'ftp'], 'http://proxy-tech.svc.ext.tdc:3128/');

$mech->get( "https://www.newbiecontest.org" );

# Connexion
$mech->set_fields( "user" => [ $usernb, 1 ] );
$mech->set_fields( "passwrd" => [ $passnb, 1 ] );
$mech->click();

# Récupération du premier nombre aléatoire
my $nombre1 = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog3_1.php" );
my $page = $mech->content;

if ( $page =~ /.*: (\d*)/ ) {
	$nombre1 = $1;
}

# Récupération du deuxième nombre aléatoire
my $nombre2 = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog3_2.php" );
my $page = $mech->content;

if ( $page =~ /.*: (\d*)/ ) {
	$nombre2 = $1;
}

# Calcul de l'opération
my $resultat = "";
$resultat = int(sqrt($nombre1)*$nombre2);

# Récupération du mot de passe
my $password = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/verifpr3.php?solution=$resultat" );
$page = $mech->content;
print $page;
