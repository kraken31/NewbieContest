# Newbie Contest - Challenge programmation 7

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

# Positionnement sur la page de l'énoncé
my $equation = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog9/epreuve9.php" );
my $page = $mech->content;

# Recherche des informations sur les barettes de mémoires et processeurs
my %infos_produits = ();
my $libelle = "";

my @actions = $page =~ m{<td>([^<]*)}gis;
foreach $action (@actions) {
	if ( $libelle eq "" ) {
		$libelle = $action;
	} else {
		$infos_produits{$libelle} = $action;
		$libelle = "";
	}
}

# Recherche de la personne et de la config max
my $personnes = "";
if ( $page =~ /<hr width="90%" \/>\n\n([^\n]*)/ ) {
	$personnes = $1;
}

my $personne_max = "";
my $config_max = 0;
my @tab_personnes = split( /\. /, $personnes);
foreach $ligne_personne (@tab_personnes) {

	if ( $ligne_personne =~ /(.*) a un processeur de (.*) et dispose de (.*)/ ) {
		my $config_tmp = $infos_produits{$2} + $infos_produits{$3};
		
		if ( $config_tmp > $config_max ) {
			$config_max = $config_tmp;
			$personne_max = $1;
		}
	} 
}

# Récupération du mot de passe
$mech->get( "http://www.newbiecontest.org/epreuves/prog/prog9/verifpr9.php?prenom=$personne_max&prix=$config_max" );
$page = $mech->content;
print $page;
