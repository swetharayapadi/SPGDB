#!/usr/bin/perl

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
print "Content-Type: text/html \n\n";
$organism = param ('organism');
#print "###### $organism##########";
print "<html>";
print "<body>";
print "<div>";
if (($organism eq "Streptococcus pneumoniae 70585") || ($organism eq "Streptococcus pneumoniae G54") || ($organism eq "Streptococcus pneumoniae JJA") || ($organism eq "Streptococcus pneumoniae P1031") || ($organism eq "Streptococcus pneumoniae Taiwan19F-14")) {
	#print "<a href = \"/SPGDB/images/genome_map/linear.png\" target = \"_blank\"><img class = \"map\" src = \"/SPGDB/images/genome_map/$organism.png\"></a>";
	print "<center><div style = \"display:none;\" id = \"refer_map\"><img class = \"refer_map_linear\" src = \"/SPGDB/images/genome_map/linear.png\"></div></center><br/>";
	print "<center><img class = \"map\" src = \"/SPGDB/images/genome_map/$organism.png\" onclick = \"display_Map()\";></center>";
	print "<center><p style = \"font: 12px verdana;\"> Click on the image to see the legend </p><p style = \"font: 12px verdana;\">  This map has been generated by the software Genome Atlas: http://www.cbs.dtu.dk</p></center>";
}
else {
	print "<div class = \"map\"><center><img class = \"map\" src = \"/SPGDB/images/genome_map/$organism.png\" onclick = \"display_Map()\";></center>";
	print "<center><p style = \"font: 12px verdana;\"> Click on the image to see the legend </p><p style = \"font: 12px verdana;\">  This map has been generated by the software Genome Atlas: http://www.cbs.dtu.dk</p></center></div>";
	print "<div class = \"refer_map\" id = \"refer_map\"><img class = \"refer_map_circular\" src = \"/SPGDB/images/genome_map/circular.png\"></div>";
}

print "</div>";
print "</body>";
print "</html>";


