# Newbie Contest - Challenge clientSide 14

my $chaine = "                   azertyuiopqsdfghjklmwxcvbnAZERTYUIOPQSDFGHJKLMWXCVBN0123456789_$&#@";

for (my $i=29; $i<55; $i++ ) {
	for (my $j=29; $j<55; $j++ ) {
		for (my $k=29; $k<55; $k++ ) {
			for (my $l=29; $l<55; $l++ ) {
				for (my $m=29; $m<55; $m++ ) {
					for (my $n=29; $n<55; $n++ ) {
						my $sum=(1+(240*$i)+(1776*$j)+(5670*$k)+(12288*$l)+(27000*$m)+(51840*$n));
						if ( $sum == 3696619 ) {
							print substr($chaine,$i-10,1) . substr($chaine,$j-10,1) . substr($chaine,$k-10,1) . substr($chaine,$l-10,1) . substr($chaine,$m-10,1) . substr($chaine,$n-10,1). "\n";
						}
					}
				}
			}
		}
	}
}

