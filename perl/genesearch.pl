#!/usr/bin/perl
use DBI;
use CGI;
print "Content-Type: text/html \n\n";
print "<html>";
print "<head>";
print "<link href=\"/SPGDB/StyleSheet_asp.css\" rel=\"stylesheet\" type=\"text/css\" />";
print "</head>";
print "<body>";
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

if ($count gt 1){
print "<p class = \"reshead\"> Gene search results for - <strong>$gene</strong> </p>";
print "<p class = \"reshead1\">Total number of records: <b> $count </b> </p>";
print "<br/><table class = \"borcoll\">";
print "<tr><td class = \"Complist1\" style='text-align:center; color: #800000;'><b> Organism </b></td> <td class = \"Complistseq \" style='color: #800000;'><b> Locus tag </b></td> <td style='color: #800000;' class = \"Complistseq \"><b> Gene name </b></td> <td style='color: #800000;' class = \"Complistseq \"><b> Start </b></td> <td class = \"Complistseq \" style='color: #800000; '><b> End </b></td><td class = \"Complist3 \" style='color: #800000; '><b> Details </b></td> </tr>"; }
while (@list = $sth -> fetchrow_array()){
	$organism = $list[0]; $accession = $list[1]; $gi = $list[2]; $chromosome = $list[3]; $locustag = $list[4];
	$category = $list[5]; $start = $list[6]; $end = $list[7]; $direction = $list[8];
	$gene_name = $list[9]; $protein_name = $list[10]; $nseq = $list [11]; $Pseq = $list [12];
	#if ($direction eq 'complement') {$direction =~ s/complement/\-/g;}
	#if ($direction eq 'Non-complement') {$direction =~ s/^Non\-complement/\+/g;}
	if ($count gt 1){
	print "<tr> <td class = \"Complist1\"><i>$organism</i></td><td class = \"Complist3\"><i>$locustag</i></td> <td class = \"Complistseq \">$gene_name</td> <td class = \"Complistseq \">$start</td> </td> <td class = \"Complistseq\">$end</td>  <td class = \"Complist3 \"><a style = \" text-decoration: none; background-color: rgba(192,192,192,0.80); color: black; padding: 5px; border-radius: 5px;\"href = \"genesearchm.pl?locus=$locustag&gene=$gene\"> Show more </a></td></tr>";
	}
}
$Nseq = "\U$nseq";
#@Nuclength = split(//,$Nseq);
$Nlength = length($Nseq);
#@Protlength = split(//,$Pseq);
$Plength = length($Pseq);
$Nseq =~ s/(.{1,60})/$1\<br>/gs;
#$new = $Nseq;
$Pseq =~ s/(.{1,60})/$1\<br>/gs;
#$new = $Nseq;
print "</table>";
if ($count eq 1){
print "<div>";
if (defined $gene_name){
	print "<p class = \"reshead\"> Gene search results for - <strong>$gene</strong> </p>";
	print "<div class = \"reshead2\"> $gene - $organism </div>";
	print "<div class = \"reshead2\"> Summary </div>";
	print "<table style = \"margin: 10px 20px 20px 20px\">";
	print "<tr> <td class = \"leftcol\"> Gene name </td> <td> : </td> <td class = \"rightcol\"> $gene_name </td></tr>";
	print "<tr> <td class = \"leftcol\"> Locus tag </td> <td> : </td> <td class = \"rightcol\"> $locustag </td> </tr>";
	print "<tr> <td class = \"leftcol\"> Organism </td> <td> : </td> <td class = \"rightcol\"> <i> $organism </i> </td> </tr>";
	print "</table>";
	print "<div class = \"reshead2\"> Genomic context </div>";
	print "<table style = \"margin: 10px 20px 20px 20px\">";
	print "<tr> <td class = \"leftcol\"> Location </td> <td> : </td> <td class = \"rightcol\"> $start .. $end, $direction strand </td> </tr>";
	print "</table>";
	$Nucl_seq = ">gi|$locustag: $start-$end $organism\n$Nseq";
	print "<div class = \"reshead2\"> Nucleotide sequence </div>";
	print "<table style = \"margin: 10px 20px 20px 20px;\">";
	print "<tr> <td class = \"leftcol\"> Length </td> <td> : </td> <td class = \"rightcol\"> $Nlength bases</td> </tr>";
	print "</table>";
	print "<form method = \"POST\" action = \"blastn.pl\">";
	print "<input type = \"hidden\" name = \"input_nucl\" value = \"$Nucl_seq\" id = \"Nseq\">";
	print "<input style = \"float: right; margin-right: 300px; margin-top: -50px; font: 14px verdana; border: outset 3px black; \"type = \"submit\" value = \"BlastN\">";
	print "</form>";
	print "<div class = \"sequencebox\" id = \"Nseq\"> >gi| $gi: $start-$end <i> $organism </i> <br/> $Nseq </div>";
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
			print "<div class = \"sequencebox\"> >gi| $gi: $protein_name <i> $organism </i> <br/> $Pseq </div>";
		}
		else {
			print "<p style = \"font: 12px verdana;	padding: 5px; margin-left: 20px;\"> No data </p>";
		}	
	}
}
if ($count eq 0)
{print "<p class = \"MCContent2\">The gene <b>\"$gene\"</b> is not found</p>";}	
print "</div> <br/>";
print "</body>";
print "</html>";


