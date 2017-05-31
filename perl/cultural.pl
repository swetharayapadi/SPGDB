#!/usr/bin/perl
use CGI;
use DBI;
use lib '\cgi-bin\SPGDB';
use Main;
print "Content-Type: text/html \n\n";
Main_Menu();
print <<"EOF";
<html>
<body>
   	<div class="MainContent">
   	<p class = \"bhead\"> Cultural characteristics </p>
   	<div class = \"bcontent\">
   	<p class = \"bcontenttext\"> The <i> Streptococcus pneumoniae </i> is a fastidious bacterium and the optimal growth of the organism is at 35-37&#176 C with approximately 5% CO<sub>2</sub>. It is commonly cultured on blood agar but it can also grow on chocolate agar plate (CAP). The colonies appears to be small, grey, moist (sometimes mucoidal) and characteristically form a zone of alpha hemolysis (green). The alpha hemolytic property is used to differentiate the organism from many other species but not from the viridans Streptococci. It can be differentiated from viridans Streptococci only when the culture ages 24-48 hours as the colonies become flattened and the central portion becomes depressed which is not occur in the viridans Streptococci (The Center for Disease Control).</p> 
<p class = \"bcontenttext\"> The <i> Streptococcus pneumoniae </i> isolates go through spontaneous, reversible phenotypic (phase) variation which is evident in colony opacity on transparent agar surfaces. The colonies may be opaque, semitransparent and transparent. Based on the colony morphology, there are at least three phase variants have been recognized (Cundell et al., 1995, Weiser et al., 1996).  The transparent variants are capable of colonizing the nasopharynx expeditiously and adhere the human endothelial cells and type II lung cells in culture (Cundell et al., 1995) where as the opaque variants are inadequate to colonize (Weiser, 1994).  The studies suggests that the organism own pathways for destructive metabolism of pentitols via the pentose phosphate pathway where as cellobiose, fructose, fucose, galactose, galactitol, glucose, glycerol, lactose, mannitol, mannose, raffinose, sucrose, trehalose and maltosaccharides are catabolized via glycolytic pathway (Tettelin et al., 2001).</p>
	</div>
	</div>		
</body>
</html>
EOF





