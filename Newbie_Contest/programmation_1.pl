# Newbie Contest - Challenge programmation 1

use WWW::Mechanize;

my $mech = WWW::Mechanize->new();

$mech->get( "https://www.newbiecontest.org" );

# Connexion
$mech->set_fields( "user" => [ 'kraken31', 1 ] );
$mech->set_fields( "passwrd" => [ 'dejean', 1 ] );
$mech->click();

# Récupération du nombre aléatoire
my $nombre = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog1.php" );
my $page = $mech->content;

if ( $page =~ /.*: (\d*)/ ) {
	$nombre = $1;
}

# Récupération du mot de passe
my $password = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/verifpr1.php?solution=$nombre" );
$page = $mech->content;
print $page;
