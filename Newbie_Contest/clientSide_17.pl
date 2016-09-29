# Newbie Contest - Challenge clientSide 17

my $res = 225000;
my $resultat = 0;

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
					}
				}
			}
		}
	}
}
