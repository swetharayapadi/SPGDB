#!/usr/bin/perl
use CGI;
use DBI;
use lib '\cgi-bin\SPGDB';
use Main;
print "Content-Type: text/html \n\n";
Main_Menu();
$db = "SPDB";
$user = "root";
$password = "";
$host = "localhost";
$dbh = DBI -> connect("DBI:mysql:$db:$host", $user, $password);
$query = "select * from strain_list";
$sth = $dbh -> prepare ($query);
$sth -> execute;
print "<div class=\"MainContent\">";
print "<p class=\"MCHead\"> Related links </p>";
print "<p style = \"font: 12px verdana;\"> Additional information for <i> Streptococcus pneumoniae </i> sequence analysis are listed below </p>";
print "<ul>";
print "<li><p  style = \"font: 12px verdana; color: black;\"> <a href = \"http://www.cdc.gov/pneumococcal/clinicians/streptococcus-pneumoniae.html\" target = \"_blank\" style = \"color: black;\"> <i> Streptococcus pneumoniae </i></a> information - Centers for Disease Control and Prevention (CDC) </p></li>";
print "<li><p  style = \"font: 12px verdana; color: black;\"> <a href = \"http://www.cdc.gov/VACCINES/vpd-vac/pneumo/default.htm\" target = \"_blank\" style = \"color: black;\"> Pneumococcal Vaccination</a> information - Centers for Disease Control and Prevention (CDC) </p></li>";
print "<li><p  style = \"font: 12px verdana; color: black;\"> <a href = \"http://wwwnc.cdc.gov/travel/diseases/pneumococcal-disease-streptococcus-pneumoniae\" target = \"_blank\" style = \"color: black;\"> Pneumococcal Disease </a> information - Centers for Disease Control and Prevention (CDC) </p></li>";
print "<li><p  style = \"font: 12px verdana; color: black;\"> <a href = \"https://www.sanger.ac.uk/resources/downloads/bacteria/streptococcus-pneumoniae.html\" target = \"_blank\" style = \"color: black;\"> <i> Streptococcus pneumoniae </i></a> information - Sanger institute </p></li>";
while (@list = $sth -> fetchrow_array()){
	$organism = $list[1]; $details = $list[2]; $bioproject1 = $list[3]; $bio1_url = $list[4]; $bioproject2 = $list[5];
	$assembly = $list[7]; $status = $list[8]; $chromosome = $list[9]; $size = $list[10]; $gc = $list[11];
	$gene = $list[12]; $protein = $list[13]; $accession = $list[14]; $gi = $list[15]; $bp = $list[16];
	#Burkholderia ambifaria strain MC40-6 genome project website link at NCBI.
	if (defined $bio1_url) {
		#print "<ul>";
		print "<li><p style = \"font: 12px verdana; color: black;\"><a href = \"$bio1_url\" target = \"_blank\" style = \"color: black;\"> <i>$organism </i></a> genome project website link at NCBI.</p></li>";
	}
}
print "</ul>";
print "</div>";


