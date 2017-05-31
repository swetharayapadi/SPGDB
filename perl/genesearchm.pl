#!/usr/bin/perl
use DBI;
use CGI;
use lib '\cgi-bin\SPGDB';
use Main;
print "Content-Type: text/html \n\n";
$cgi = new CGI;
$gene = $cgi -> param('gene');
$locustag = $cgi -> param ('locus');
$db = "SPDB";
$user = "root";
$password = "";
$host = "localhost";
$dbh = DBI -> connect("DBI:mysql:$db:$host", $user, $password);
$query = "select * from gene_list where Gene_name = '$gene' and Locus_tag = '$locustag'";
$sth = $dbh -> prepare ($query);
$sth -> execute;
while (@list = $sth -> fetchrow_array()){
	$organism = $list[0]; $accession = $list[1]; $gi = $list[2]; $chromosome = $list[3]; $locustag = $list[4];
	$category = $list[5]; $start = $list[6]; $end = $list[7]; $direction = $list[8];
	$gene_name = $list[9]; $protein_name = $list[10]; $nseq = $list [11]; $Pseq = $list [12]; $virulence = $list[13]; $reference = $list[14];
}
$Nseq = "\U$nseq";
@Nuclength = split(//,$Nseq);
$Nlength = scalar(@Nuclength);
@Protlength = split(//,$Pseq);
$Plength = scalar(@Protlength);
$Nseq =~ s/(.{1,60})/$1\<br>/gs;
#$new = $Nseq;
$Pseq =~ s/(.{1,60})/$1\<br>/gs;
#$new = $Nseq;
Main_Menu();
print "<html>";
print "<body>";
print "<div class=\"MainContent\">";
if (defined $gene_name){
	print "<p class = \"reshead\"> Gene search results for - <strong>$gene</strong> </p>";
	print "<img class = \"backGI\" src = \"/SPGDB/images/back-button-png.svg\" onclick = \"window.history.back()\"\;/>";
	print "<div class = \"reshead2\"> $gene - $organism </div>";
	print "<div class = \"reshead2\"> Summary </div>";
	print "<table style = \"margin: 10px 20px 20px 20px\">";
	print "<tr> <td class = \"leftcol\"> Gene name </td> <td> : </td> <td class = \"rightcol\"> $gene_name </td></tr>";
	print "<tr> <td class = \"leftcol\"> Locus tag </td> <td> : </td> <td class = \"rightcol\"> $locustag </td> </tr>";
	print "<tr> <td class = \"leftcol\"> Organism </td> <td> : </td> <td class = \"rightcol\"> <i> $organism </i> </td> </tr>";
	if (defined $virulence) {
	print "<tr> <td class = \"leftcol\"> Virulent </td> <td> : </td> <td class = \"rightcol\"> $virulence </td> </tr>";
	print "<tr> <td class = \"leftcol\"> Reference </td> <td> : </td> <td class = \"rightcol\" style = \"text-align: justify;\"> $reference </td> </tr>";
		}
	print "</table>";
	print "<div class = \"reshead2\"> Genomic context </div>";
	print "<table style = \"margin: 10px 20px 20px 20px\">";
	print "<tr> <td class = \"leftcol\"> Location </td> <td> : </td> <td class = \"rightcol\"> $start .. $end, $direction </td> </tr>";
	print "</table>";
	$Nucl_seq = ">gi|$locustag: $start-$end $organism\n$Nseq";
	print "<div class = \"reshead2\"> Nucleotide sequence </div>";
	print "<table style = \"margin: 10px 20px 20px 20px\">";
	print "<tr> <td class = \"leftcol\"> Length </td> <td> : </td> <td class = \"rightcol\"> $Nlength bases</td> </tr>";
	print "</table>";
	print "<form method = \"POST\" action = \"blastn.pl\">";
	print "<input type = \"hidden\" name = \"input_nucl\" value = \"$Nucl_seq\" id = \"Nseq\">";
	print "<input style = \"float: right; margin-right: 300px; margin-top: -50px; font: 14px verdana; border: outset 3px black; \"type = \"submit\" value = \"BlastN\">";
	print "</form>";
	print "<div class = \"sequencebox\"> >gi| $gi: $start-$end <i> $organism </i> <br/> $Nseq </div>";
	print "<div class = \"reshead2\"> Protein </div>";
		if (defined $protein_name){
			print "<table style = \"margin: 10px 20px 20px 20px\">";
			print "<tr> <td class = \"leftcol\"> Protein name </td> <td> : </td> <td class = \"rightcol\"> $protein_name </td> </tr>";
			print "</table>";
			print "<div class = \"reshead2\"> Protein sequence </div>";
			print "<table style = \"margin: 10px 20px 20px 20px\">";
			print "<tr> <td class = \"leftcol\"> Length </td> <td> : </td> <td class = \"rightcol\"> $Plength residues </td> </tr>";
			print "</table>";
			$Prot_seq = ">gi|$protein_name $organism\n$Pseq";
			print "<form method = \"POST\" action = \"blastp.pl\">";
			print "<input type = \"hidden\" name = \"input_prot\" value = \"$Prot_seq\">";
			print "<input style = \"float: right; margin-right: 300px; margin-top: -50px; font: 14px verdana; border: outset 3px black;\"type = \"submit\" value = \"BlastP\">";
			print "</form>";
			print "<div class = \"sequencebox\"> >gi| $gi: $protein_name <i> $organism </i> <br/> $Pseq </div> <br/><br/>";
		}
		else {
			print "No data";
		}
}
else {print "$gene_name is not found";}	
print "</div> <br/>";
print "</body>";
print "</html>";


