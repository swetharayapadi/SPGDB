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
   	<p class = \"bhead\"> General characteristics </p>
   	<div class = \"bcontent\">
   	<p class = \"bcontenttext\"> The <i> Streptococcus pneumoniae </i> is a Gram-positive encapsulated (Verma et al., 2012) coccus, alpha-hemolytic and a member of lactic acid bacteria. In 1881, the organism was first isolated and grown by Louis Pasteur. It is also known as pneumococcus or Diplococcus pneumoniae. The organism is a human pathogen (Tettelin et al., 2001) and it is associated with a wide range of community-acquired diseases which includes meningitis, pneumococcal infections of the upper respiratory tract that leads to pneumonia and other infections like acute sinusitis, otitis  media, conjunctivitis, osteomyelitis, septic arthritis, endocarditis, peritonitis, pericarditis, cellulitis and sepsis (Allegrucci et al., 2007). Collectively, these diseases result in millions of deaths worldwide each year. It affects both children and adults.</p> 
	<p class = \"bcontenttext\"> <b> Genetics: </b><br/>
The genome of <i> Streptococcus penumoniae </i> consist of a single circular chromosome and the length ranges from 2,240 to 2,270 kbp with approximately 39.7&#37 of GC content. The genome is rich in insertion sequences (Iss) which make up to 5% of the genome (Tettelin et al., 2001) but majority of these elements were non-functional because insertions, deletions or point mutations. The physical mapping studies on the organism suggests that there are at least six rRNA operons and three structural RNAs (a tRNA like/mRNA like (tm) RNA, signal recognition particle RNA and a ribonuclease P RNA) present in its genome (Gasc et al., 1991). It has high proportion of ATP-dependent transporters and also has sodium ion/proton exchanger and sodium ion driven transporters. About 30% of the transporters present in <i> Streptococcus pneumoniae </i> were believed to be sugar transporters (Paulsen et al., 2000). The organism contains extracellular enzymes that metabolize polysaccharides and hexosamies. Thereby, it provides carbon and nitrogen to the organism which is important for the synthesis of the capsule and the virulence factors (Tettelin et al., 2001). Based on differences in composition of the polysaccharide capsule, about 90 serotypes of <i> Streptococcus pneumoniae </i>  have been identified (Verma et al., 2012). </p>
   	</div>
	</div>
</body>
</html>
EOF





