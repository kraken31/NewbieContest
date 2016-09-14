# Newbie Contest - Challenge programmation 4

use WWW::Mechanize;

my $mech = WWW::Mechanize->new();

$mech->get( "https://www.newbiecontest.org" );

# Connexion
$mech->set_fields( "user" => [ 'kraken31', 1 ] );
$mech->set_fields( "passwrd" => [ 'dejean', 1 ] );
$mech->click();

# Récupération de l'a chaine à décrypter et de la clé
my $chaine = "";
my $cle = "";
$mech->get( "https://www.newbiecontest.org/epreuves/prog/prog5.php" );
my $page = $mech->content;
if ( $page =~ /.*ypter est : '(.*)' <br .*'(.*)'/ ) {
	$chaine = $1;
	$cle = $2;
}
print "$chaine\n$cle\n\n";

while ( $chaine ne "" ) {
	my $caractere = chomp($chaine);
	print $caractere;
}

# Transformation de l'équation en perl
#( $equation =~ s/racine/sqrt/ );
#( $equation =~ s/&sup2;/\*\*2/ );

# Calcul de l'opération
#my $resultat = int(eval($equation));

# Récupération du mot de passe
#my $password = "";
#$mech->get( "https://www.newbiecontest.org/epreuves/prog/verifpr4.php?solution=$resultat" );
#$page = $mech->content;
#print $page;
