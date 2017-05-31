#!/usr/bin/perl
use CGI;
use DBI;
print "Content-Type: text/html \n\n";
$cgi = new CGI;
$strain = $cgi -> param ('strain');
#print "$strain";
$db = "SPDB";
$user = "root";
$password = "";
$host = "localhost";
$dbh = DBI -> connect("DBI:mysql:$db:$host", $user, $password);
$query = "select * from strain_list where Organism = '$strain'";
$sth = $dbh -> prepare ($query);
$sth -> execute;
while (@list = $sth -> fetchrow_array()){
	$organism = $list[1]; $details = $list[2]; $bioproject1 = $list[3]; $bioproject2 = $list[5];
	$assembly = $list[7]; $status = $list[8]; $chromosome = $list[9]; $size = $list[10]; $gc = $list[11];
	$gene = $list[12]; $protein = $list[13]; $accession = $list[14]; $gi = $list[15]; $bp = $list[16];
}
print "<html>";
print "<head>";
print "<link href=\"/SPGDB/StyleSheet_asp.css\" rel=\"stylesheet\" type=\"text/css\" />";
print "</head>";
print "<body>";
print "<div>";
if (defined $organism){
	print "<p class = \"reshead\"> Strain search results for - <strong><i> $strain </i></strong> <p>";
	print "<div class = \"reshead2\"> Description </div>";
	print "<p class = \"rescontent\"> <i> $organism </i> $details </p>";
	print "<div class = \"reshead2\"> Genome sequencing projects </div>";
	print "<table style = \"margin: 10px 20px 20px 20px\">";
	print "<tr> <td class = \"leftcol\" > Bioproject </td> <td> : </td> <td class = \"rightcol\" > $bioproject1 <br> $bioproject2 </td></tr>";
	print "<tr> <td class = \"leftcol\"> Assembly </td> <td> : </td> <td class = \"rightcol\"> $assembly </td> </tr>";
	print "<tr> <td class = \"leftcol\"> Status </td> <td> : </td> <td class = \"rightcol\"> $status </td> </tr>";
	if ($status eq 'Chromosome'){
		print "<tr> <td class = \"leftcol\"> Number of chromosome </td> <td> : </td> <td class = \"rightcol\"> $chromosome </td> </tr>";
		print "<tr> <td class = \"leftcol\"> Accession number </td> <td> : </td> <td class = \"rightcol\"> $accession </td> </tr>";
		print "<tr> <td class = \"leftcol\"> Gene index </td> <td> : </td> <td class = \"rightcol\"> $gi </td> </tr>";
		print "<tr> <td class = \"leftcol\"> Number of base pair </td> <td> : </td> <td class = \"rightcol\"> $bp </td> </tr>";
		print "<tr> <td class = \"leftcol\"> Size (Mb) </td> <td> : </td> <td class = \"rightcol\"> $size </td> </tr>";
		print "<tr> <td class = \"leftcol\"> GC (%) </td> <td> : </td> <td class = \"rightcol\"> $gc </td> </tr>";
		print "<tr> <td class = \"leftcol\"> Total number of genes </td> <td> : </td> <td class = \"rightcol\"> <a style = \" text-decoration: none; background-color: rgba(192,192,192,0.80); color: black; padding: 5px; border-radius: 5px;\"href = \"gene_list.pl?pagenum=1&strain=$organism\"> $gene </a> </td> </tr>";
		print "<tr> <td class = \"leftcol\"> Total number of proteins </td> <td> : </td> <td class = \"rightcol\"> <a style = \" text-decoration: none; background-color: rgba(192,192,192,0.80); color: black; padding: 5px; border-radius: 5px;\"href = \"protein_list_search.pl?pagenum=1&strain=$organism\"> $protein </a> </td> </tr>";
	}
	print "</table>";
}
else {print "<p class = \"reshead\"> <strong><i> $strain </strong></i> is not found </p>";}	
print "</div>";
print "<form method = \"GET\" enctype = \"multipart/form-data\">";
print "<input type = \"hidden\" name = \"strain\" value = \"$organism\">";
print "</form>";
print "</body>";
print "</html>";

