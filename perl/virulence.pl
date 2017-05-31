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
   	<p class = \"bhead\"> Virulence factors </p>
   	<div class = \"bcontent\">
   	<p class = \"bcontenttext\"> The <i> Streptococcus pneumoniae </i> produces a deluge of virulence factors such as polysaccharide capsule, various surface-located proteins, toxin pneumolysin, neuraminidases, and the metal-ion-binding proteins (Kadioglu et al., 2008, Mitchell et al., 2010). The capsule is an important virulence determinant due to its  anti-phagocytic activity and reduces the entrapment in the mucus and at least 90 different capsule types have been identified. (Brown et al., 1983, Abeyta et al., 2003, Hoskins et al., 2001, Hyams et al., 2010). The encapsulated strain are 10*5 times virulent than the strains which lack the capsule. </p>
	<p class = \"bcontenttext\"> The penumococcal surface protein A (PspA) and C (PspC) are the best marked choline-binding proteins among the large number of surface-associated proteins. PspA plays a important role in immune escape of the organism by intruding the complement activation and deposition mediated through the classical and alternative pathways. It also binds with lactoferrin. PspC merge with human immunoglobulin A and polymeric immunoglobulin receptor which invokes adhesion and transcytosis (Ricci et al., 2013). 
The penumolysin triggers the production of inflammatory cytokines like tumor necrosis factor alpha and interleukin-1 beta. It suppresses the beating of cilia on human respiratory epithelial cells and disrupts the monolayers of cultured epithelial cells from the upper respiratory tract and alveoli. It decreases the bactericidal activity and migration of neutrophils (AlonsoDeVelasco et al., 1995). It damages the blood-brain-barrier(BBB). The neuraminidases are the enzymes which cleaves sialic acid from the host glycolipids and gangliosides and then attaches the epithelial cells (Krivan et al., 1988). </p>
	<p class = \"bcontenttext\"> The major murein hydrolase is an N-acetylmuramoyl-L-alanine amidase, referred to as autolysin (LytA) and it is required to bind with the choline present on teichoic acid for its function (Briese et al., 1985). In addition, the other choline binding proteins like CbpA is also consider as a determinant of virulence as it aids in bacterial adherence (Roesnow et al., 1997).</p>
	</div>
	</div>	
</body>
</html>
EOF





