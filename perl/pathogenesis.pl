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
   	<p class = \"bhead\"> Pathogenesis </p>
   	<div class = \"bcontent\">
   	<p class = \"bcontenttext\"> The <i> Streptococcus pneumoniae </i> is carried in the nasopharynx by many healthy individuals with a prevalence of about 40%  and 15% in infants and adults respectively (Barichello et al., 2012). The organism cause different types of infections which includes meningitis, otitis media, bacteremia and pneumonia. The children below <2 years and elderly adults are at the higher risk towards this infection (Pallares et al., 2003). During the several forms of infections, the organism must take the necessary nutrients for survival and replication within the host (Honsa et al., 2013). The pneumococcal disease occur with the nasopharyngeal colonization by the homologous strain which is the crucial characteristics of the organism (Gray et al., 1980, Faden et al., 1997). </p>
   	<p class = \"bcontenttext\"> The organism is transferred from one person to other person through coughing and sneezing. It degrades the mucus membrane with the help of exoglycosidases such as neuraminidase A, beta-galatosidase, beta-N-acetylglucosaminidase and neuraminidase B. Thereby, it decrease the mucous viscosity and colonizes the nasopharynx. It produces major exotoxin,  penumolysin which decrease the epithelial cell ciliary's beating and resulting in the enhanced adherence. It also produce IgA1 protease that cleaves secretory IgA which makes the organism to bind with respiratory mucosa. It  halts the action of enzymes like N-acetylglucosamine-deacetylase A and O-acetyltransferase and acquire resistance to lysozyme. It causes the invasive illness by transportation of bacterium to the basal membrane of host's epithelial cell. The mechanisms by which the organism transfer from nasopharynx to lung, causing pneumonia or move directly into the blood, giving emergence to bacteremia or septicaemia are poorly understood (AlonsoDeVelasco et al., 1995, Bogaert et al., 2004). The pathogenic route for the <i> Streptococcus pneumoniae </i> is given in the flowchart below.</p>
   	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: center;"> Figure: Pathogenic route of <i> Streptococcus pneumoniae </i> infection </p>
   	<center><img src = "/SPGDB/images/pathogenesis.png" class = "flowPatho"/></center>
   	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: center;"> Reference: The flow chart redrawn from reference no. 5.</p>
	</div>
	</div>	
</body>
</html>
EOF





