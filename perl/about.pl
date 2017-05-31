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
   	<p class = \"bhead\"> About </p>
   	<div class = \"bcontent\">
   	<p class = \"bcontenttext\"> The <i> Streptococcus pneumoniae </i> Genome database (SPGDB) is an integrated database containing the genomic and proteomic information of the entire <i> S. pneumoniae </i> strains. The aim of this database is to afford a resource for the research community to perform varied searches against <i> S. pneumoniae </i> strains. The database has the inbuilt tools like BLAST, DNA motif search, the graphics based plugin, GBrowse and Jmol to visualize the genome and Protein Data Bank (PDB) structures of <i> S. pneumoniae </i> strains respectively. In addition, the database provides the users to browse all annotations using either the simple or advanced Boolean based search tools. The database covers the significant points on general and cultutal characteristics, virulence factors, pathogenic mechanism and laboratory diagnosis  of <i> S. pneumoniae</i>. A superior understanding of the genes accountable for virulence in these strains can facilitate researchers determine immunogen targets and drug candidates. </p> 
   	</div>
	</div>
</body>
</html>
EOF





