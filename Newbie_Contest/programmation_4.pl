# Newbie Contest - Challenge programmation 4

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

# Récupération du cryptogramme est de la clé
my $cryptogramme = "";
my $cle = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog5.php" );
my $page = $mech->content;
if ( $page =~ /.*crypter est : '(\S*)'.*est : '(.*)'/ ) {
	$cryptogramme = $1;
	$cle = $2;
}

# Décryptage du message
my $reference = "abcdefghijklmnopqrstuvwxyz";
my $resultat = "";
foreach $c (split //, $cryptogramme) {
	my $index = index($reference, $c) - $cle;
	if ( $index >= 0 ) {
		$resultat .= substr($reference, $index, 1);
	} else {
		$resultat .= substr($reference, 26 + $index, 1);
	}
}

# Récupération du mot de passe
$mech->get( "https://www.newbiecontest.org/epreuves/prog/verifpr5.php?solution=$resultat" );
$page = $mech->content;
print $page;
