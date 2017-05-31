#!/usr/bin/perl
use CGI;
use DBI;
print "Content-Type: text/html \n\n";
$cgi = new CGI;
$protein = $cgi -> param('protein');
$db = "SPDB";
$host = "localhost";
$user = "root";
$password = "";
$dbh = DBI -> connect("DBI:mysql:$db:$host",$user,$password);
$query = "select * from protein_list where Entry = '$protein'";
$sth = $dbh -> prepare($query);
$sth -> execute;
while(@list = $sth -> fetchrow_array){
	$entry = $list[0]; $entryname = $list[1]; $status = $list[2]; $proteinnames = $list[3]; $genenames = $list[4]; $organism = $list[5]; $length = $list[6]; $DOCreate = $list[7]; $DOModifi = $list[8]; $DOSeqModi = $list[9]; $domains = $list[10]; $ecnumber = $list[11]; $fragments = $list[12]; $geneencode = $list[13]; $GO = $list[14]; $GOid = $list[15]; $interactswith = $list[16]; $keywords = $list[17]; $organismid = $list[18]; $pathway = $list[19]; $proteinexist = $list[20]; $proteinfamily = $list[21]; $pubmedid = $list[22]; $sequence = $list[23]; $subcellularlocation = $list[24];
}
print "<html>";
print "<body>";
print "<div>";
if (defined $entry) {
	print "<p class = \"reshead\"> Protein search results for - <strong> $entry </strong> <p>";
	print "<div class = \"reshead2\"> Names and origin </div>";
	print "<table style = \"margin: 10px 20px 20px 20px\">";
	print "<tr> <td class = \"leftcol\"> Entry </td> <td> : </td> <td class = \"rightcol\"> $entry ($status) </td></tr>";
	print "<tr> <td class = \"leftcol\"> Entry name </td> <td> : </td> <td class = \"rightcol\"> $entryname </td> </tr>";
	print "<tr> <td class = \"leftcol\"> Protein names </td> <td> : </td> <td class = \"rightcol\"> $proteinnames </td> </tr>";
	print "<tr> <td class = \"leftcol\"> Organism </td> <td> : </td> <td class = \"rightcol\"><i> $organism <i></td> </tr>";
	print "<tr> <td class = \"leftcol\"> Organism ID </td> <td> : </td> <td class = \"rightcol\"> $organismid </td> </tr>";
	if (defined $genenames) {
		print "<tr> <td class = \"leftcol\"> Gene names </td> <td> : </td> <td class = \"rightcol\"> $genenames </td> </tr>";
	}
	if (defined $geneencode) {	
		print "<tr> <td class = \"eftcol\"> Encoded on </td> <td> : </td> <td class = \"rightcol\"> $geneencode </td> </tr>";
	}
	if (defined $ecnumber) {
		print "<tr> <td class = \"leftcol\"> EC number </td> <td> : </td> <td class = \"rightcol\"> $ecnumber </td> </tr>";
	}
	print "</table>";
	print "<div class = \"reshead2\"> History </div>";
	print "<table style = \"margin: 10px 20px 20px 20px\">";
	print "<tr> <td class = \"leftcol\"> Date of creation </td> <td> : </td> <td class = \"rightcol\"> $DOCreate </td> </tr>";
	print "<tr> <td class = \"leftcol\"> Date of modification </td> <td> : </td> <td class = \"rightcol\"> $DOModifi </td> </tr>";
	print "<tr> <td class = \"leftcol\"> Date of sequence modification </td> <td> : </td> <td class = \"rightcol\"> $DOSeqModi </td> </tr>";
	print "</table>";
	print "<div class = \"reshead2\"> Protein attributes </div>";
	print "<table style = \"margin: 10px 20px 20px 20px\">";
	print "<tr> <td class = \"leftcol\"> Protein existence </td> <td> : </td> <td class = \"rightcol\"> $proteinexist </td> </tr>";	
	if (defined $fragments) {
		print "<tr> <td class = \"leftcol\"> Sequence status </td> <td> : </td> <td class = \"rightcol\"> $fragments </td> </tr>";
	}
	print "</table>";
	if (defined $GO) {
		print "<div class = \"reshead2\"> Gene Ontology (GO) </div>";	
		print "<table style = \"margin: 10px 20px 20px 20px\">";
		print "<tr> <td class = \"leftcol\"> GO term name </td> <td> : </td> <td class = \"rightcol\"> $GO </td> </tr>";
	}
	if (defined $GOid) {	
		print "<tr> <td class = \"leftcol\"> GO identifier </td> <td> : </td> <td class = \"rightcol\"> $GOid </td> </tr>";
		print "</table>";
	}
	if	(defined $interactswith) {
		print "<div class = \"reshead2\"> Binary interactions </div>";
		print "<table style = \"margin: 10px 20px 20px 20px\">";
		print "<tr> <td class = \"leftcol\"> Entry </td> <td> : </td> <td class = \"rightcol\"> $interactswith </td> </tr>";
		print "</table>";
	}
	if (defined $keywords) {
		print "<div class = \"reshead2\"> Keywords </div>";
		print "<table style = \"margin: 10px 20px 20px 20px\">";			
		print "<tr> <td class = \"leftcol\"> Ligand & Biological process </td> <td> : </td> <td class = \"rightcol\"> $keywords </td> </tr>";
		print "</table>";
	}
	if (defined $domains || $pathway || $proteinfamily || $subcellularlocation) {
	print "<div class = \"reshead2\"> General annotation </div>";
	print "<table style = \"margin: 10px 20px 20px 20px\">";
	if (defined $domains) {
		print "<tr> <td class = \"leftcol\"> Domains </td> <td> : </td> <td class = \"rightcol\"> $domains </td> </tr>";
	}	
	if (defined $pathway) {	
		print "<tr> <td class = \"leftcol\"> Pathway </td> <td> : </td> <td class = \"rightcol\"> $pathway </td> </tr>";
	}	
	if (defined $proteinfamily) {
		print "<tr> <td class = \"leftcol\"> Sequence similarities </td> <td> : </td> <td class = \"rightcol\"> Belongs to $proteinfamily </td> </tr>";
	}
	if (defined $subcellularlocation) {
		print "<tr> <td class = \"leftcol\"> Subcellular location </td> <td> : </td> <td class = \"rightcol\"> $subcellularlocation </td> </tr>";
	}
	print "</table>";
}
	if (defined $pubmedid) {
		print "<div class = \"reshead2\"> Reference </div>";
		print "<table style = \"margin: 10px 20px 20px 20px\">";
		print "<tr> <td class = \"leftcol\"> PubMed ID </td> <td> : </td> <td class = \"rightcol\"> $pubmedid </td> </tr>";
		print "</table>";
	}
	open(INFILE, "/var/apache/htdocs/SPGDB/Protein_Seq.fasta")||die($_);
	while (<INFILE>) {
		process_record() if /$entry/;
	}
	sub process_record
	{
		print "<div class = \"reshead2\"> Protein sequence </div>";
		$line;
  	 	while ($line = <INFILE>, $line !~ />/)
   		{
			#print "$line";
			$complete .= $line;
		}
	
	$complete =~ s/\s//g;
	$complete =~ s/\s//g;
	$complete =~ s/(.{1,60})/$1\<br>/gs;
	$Plen = length($complete);
	print "<table style = \"margin: 10px 20px 20px 20px\">";
	print "<tr> <td class = \"leftcol\"> Length </td> <td> : </td> <td class = \"rightcol\"> $Plen residues</td> </tr>";
	print "</table>";
	$Prot_seq = ">$entry|$entryname $organism $proteinnames\n$complete";
	print "<form method = \"POST\" action = \"count.pl\">";
	print "<input type = \"hidden\" name = \"entry\" value = \"$entry\">";
	print "<input type = \"hidden\" name = \"input_prot\" value = \"$complete\">";
	print "<input style = \"float: right; margin-right: 200px; margin-top: -50px; font: 14px verdana; border: outset 3px black;\"type = \"submit\" value = \"Compute\">";
	print "</form>";
	print "<form method = \"POST\" action = \"blastp.pl\">";
	print "<input type = \"hidden\" name = \"input_prot\" value = \"$Prot_seq\">";
	print "<input style = \"float: right; margin-right: 300px; margin-top: -50px; font: 14px verdana; border: outset 3px black;\"type = \"submit\" value = \"BlastP\">";
	print "</form>";
	print "<div class = \"Protsequencebox\"> >$entry|$entryname $organism $proteinnames <br/>$complete </div>";
	}
}
else {
	print "<p class = \"MCContent2\">The protein entry </b> \"$protein\"</b> is not found</p>";
}
print "</div>";
print "</body>";
print "</html>";
