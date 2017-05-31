#!/usr/bin/perl
use DBI;
use CGI;
use lib '\cgi-bin\SPGDB';
use Main;
print "Content-Type: text/html \n\n";
$cgi = new CGI;
$gene = $cgi -> param('gene');
$db = "SPDB";
$user = "root";
$password = "";
$host = "localhost";
$dbh1 = DBI -> connect("DBI:mysql:$db:$host", $user, $password);
$query1 = "select count(*) from gene_list where Gene_name = '$gene'";
$sth1 = $dbh1 -> prepare ($query1);
$sth1 -> execute;
while (@list = $sth1 -> fetchrow_array()){
	$count = $list[0];
	#print "#############$count##########";
}

$dbh = DBI -> connect("DBI:mysql:$db:$host", $user, $password);
$query = "select * from gene_list where Gene_name = '$gene'";
$sth = $dbh -> prepare ($query);
$sth -> execute;
Main_Menu();
print "<html>";
print "<body>";
print "<div class=\"MainContent\">";
if ($count gt 1){
print "<p class = \"reshead\"> Gene search results for - <strong>$gene</strong> </p>";
print "<img class = \"backGI\" src = \"/SPGDB/images/back-button-png.svg\" onclick = \"window.history.back()\"\;/>";
print "<p class = \"reshead1\">Total number of records: <b> $count </b> </p>";
print "<br/><table class = \"borcoll\">";
print "<tr><td class = \"Complist1\" style='text-align:center; color: #800000;'><b> Organism </b></td> <td class = \"Complistseq \" style='color: #800000;'><b> Locus tag </b></td> <td style='color: #800000;' class = \"Complistseq \"><b> Gene name </b></td> <td style='color: #800000;' class = \"Complistseq \"><b> Start </b></td> <td class = \"Complistseq \" style='color: #800000; '><b> End </b></td><td class = \"Complist3 \" style='color: #800000; '><b> Details </b></td> </tr>"; }
while (@list = $sth -> fetchrow_array()){
	$organism = $list[0]; $accession = $list[1]; $gi = $list[2]; $chromosome = $list[3]; $locustag = $list[4];
	$category = $list[5]; $start = $list[6]; $end = $list[7]; $direction = $list[8];
	$gene_name = $list[9]; $protein_name = $list[10]; $nseq = $list [11]; $Pseq = $list [12]; $virulence = $list[13]; $reference = $list[14];
	if ($direction eq 'Complement') {$direction =~ s/Complement/\-/g;}
	if ($direction eq 'Non-complement') {$direction =~ s/^Non\-complement/\+/g;}
	if ($count gt 1){
	print "<tr> <td class = \"Complist1\"><i>$organism</i></td><td class = \"Complist3\"><i>$locustag</i></td> <td class = \"Complistseq \">$gene_name</td> <td class = \"Complistseq \">$start</td> </td> <td class = \"Complistseq\">$end</td>  <td class = \"Complist3 \"><a style = \" text-decoration: none; background-color: rgba(192,192,192,0.80); color: black; padding: 5px; border-radius: 5px;\"href = \"genesearchm.pl?locus=$locustag&gene=$gene\"> Show more </a></td></tr>";
	}
}
print "</table>";
print "</div> <br/>";
print "</body>";
print "</html>";


