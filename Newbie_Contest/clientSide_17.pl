# Newbie Contest - Challenge clientSide 17

my $res = 225000;
my $resultat = 0;
my $nb_lig1 = 0;
my $nb_lig2 = 0;
my $nb_lig3 = 0;

print "debut:\n";
for (my $i=8; $i<20; $i++) {
	
	for (my $j=$i; $j>=0; $j--) {
	
		if ( $j == $i ) {
			
			$resultat=5**$j;
			#print "j=$j => res=$resultat\n";
			if ( $resultat == $res ) {
				print "lig3=$j\n";
			}
		} else {
	
			for ( my $k=($i-$j); $k>=0; $k-- ) {
			
				if ( ($j+$k) == $i ) {
					
				
					$resultat = 5**$j*3**$k;
					#print "j=$j k=$k => res=$resultat\n";
					if ( $resultat == $res ) {
						print "lig3=$j lig2=$k\n";
					}
				} else {
					$resultat = 5**$j * 3**$k * 2**($i-$j-$k);
					#print "j=$j k=$k l=" . ($i-$j-$k) . " => res=$resultat\n";
					if ( $resultat == $res ) {
						print "lig3=$j lig2=$k lig1=" . ($i-$j-$k) . "\n";
						$nb_lig3=$j;
						$nb_lig2=$k;
						$nb_lig1=($i-$j-$k);
					}
				}
			}
		}
	}
}

my $res2 = 2607893925;
my @tab = (2,3,5,7,11,13,17,19,23,29,31,37);
my @tabLig1 = ('A','B','C','D','E','F','G','H','I','J','K','L');
my @tabLig2 = ('M','N','O','P','Q','R','S','T','U','V','W','X');
my @tabLig3 = ('Y','Z','0','1','2','3','4','5','6','7','8','9');

for ( $a=0; $a<10; $a++ ) {
	for ( $b=$a+1; $b<11; $b++ ) {
		for ( $c=$b+1; $c<12; $c++ ) {
			for ( $d=0; $d<10; $d++ ) {
				for ( $e=$d+1; $e<11; $e++ ) {
					for ( $f=0; $f<8; $f++ ) {
						for ( $g=$f+1; $g<9; $g++ ) {
							for ( $h=$g+1; $h<10; $h++ ) {
								for ( $i=$h+1; $i<11; $i++ ) {
									for ( $j=$i+1; $j<12; $j++ ) {
										$resultat=$tab[$a]*$tab[$b]*$tab[$c]*$tab[$d]*$tab[$e]*$tab[$f]*$tab[$g]*$tab[$h]*$tab[$i]*$tab[$j];
										#print "$a $b $c $d $e $f $g $h $i $j => $resultat\n";
										if ( $resultat == $res2 ) {
											print "$tabLig1[$a] $tabLig1[$b] $tabLig1[$c] $tabLig2[$d] $tabLig2[$e] $tabLig3[$f] $tabLig3[$g] $tabLig3[$h] $tabLig3[$i] $tabLig3[$j]\n";
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

