#!/usr/bin/perl
use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use Data::Pageset;
use POSIX;
use DBI;
use CGI;
$CGI::POST_MAX = 1024;
$CGI::DISABLE_UPLOADS = 1;
use PDF::Create;
 
print "Content-Type: text/html \n\n";

$strain = param ('organism');
#print "########$strain#########<br/>";
$input_sequence = param('sequence');
#print "#########$input_sequence###########<br/>";
$sequence = "\U$input_sequence";
#chop $sequence;
open (SAVE,">/var/apache/htdocs/SPGDB/output/motif_result.txt") || die('Not able to write');
$pagenum=param('pagenum');
$user = "root";
$password = "";
$server = "localhost";
$db = "SPDB";
@strn = split(/\s+/,$strain);
$strnn = join('+',@strn);

###############Processing sequence##################
if ($sequence =~ /R/) {
	$sequence =~ s/R/[G|A]/g;
}
if ($sequence =~ /Y/) {
	$sequence =~ s/Y/[T|C]/g;
}
if ($sequence =~ /K/) {
	$sequence =~ s/K/[G|T]/g;
}
if ($sequence =~ /M/) {
	$sequence =~ s/M/[A|C]/g;
}
if ($sequence =~ /S/) {
	$sequence =~ s/S/[G|C]/g;
}
if ($sequence =~ /W/) {
	$sequence =~ s/W/[A|T]/g;
}
if ($sequence =~ /B/) {
	$sequence =~ s/B/[G|T|C]/g;
}
if ($sequence =~ /D/) {
	$sequence =~ s/D/[G|A|T]/g;
}
if ($sequence =~ /H/) {
	$sequence =~ s/H/[A|C|T]/g;
}
if ($sequence =~ /V/) {
	$sequence =~ s/V/[G|C|A]/g;
}
if ($sequence =~ /N/) {
	$sequence =~ s/N/[A|G|C|T]/g;
}
#print $sequence;
##################### Substitution
=dsfdsf
 R = G A (purine)   
 Y = T C (pyrimidine)   
 K = G T (keto)   
 M = A C (amino)   
 S = G C   
 W = A T   
 B = G T C   
 D = G A T   
 H = A C T   
 V = G C A   
 N = A G C T (any) 
=cut

$dbh = DBI -> connect("DBI:mysql:$db:$server",$user,$password);
$sql = "select count(*) from gene_list where Organism = '$strain' and Nucleo_seq REGEXP '$sequence'";
$count = $dbh -> prepare ($sql);
$count -> execute;
while (@row = $count->fetchrow_array){
	$totalcount = $row[0];
	#print "$totalcount<br/>";
}

$total_entries = $totalcount;
$entries_per_page = 10;
$current_page = $pagenum;
$pages_per_set = 10;
if($pagenum==0)
	{$pagenum=1;}
$f=($pagenum-1)*10;
$g=10;
$s = $f+1;
$foocount=$totalcount/10;
$foocount1 = ceil($foocount);
$calc=sprintf("%.2f", $foocount);
#print $calc;
if ($calc=~/(\d+)\.(\d+)/) {
	$final_page=$1+1;
	#print "Final_page: $final_page";
	$final_page_balance=$2;
	#print "Balance: $final_page_balance";
	if ($1 != 0){
		$final_page_count=$1.$final_page_balance;
		#print "Count: $final_page_count";
	}
	else {
		$final_page_count=$final_page_balance;
	}
}
my $page_info = Data::Pageset->new({
    'total_entries'       => $total_entries, 
    'entries_per_page'    => $entries_per_page, 
    # Optional, will use defaults otherwise.
    'current_page'        => $current_page,
    'pages_per_set'       => $pages_per_set,
    'mode'                => 'slide', # default, or 'slide'
});

# Can add in the pages per set after the object is created
$page_info->pages_per_set($pages_per_set);
$first=$page_info->first_page;
$previous=$page_info->previous_page;
$next=$page_info->next_page;
$last=$page_info->last_page;
print "<html>";
print "<body>";
if ($totalcount != 0){
print "<p class = \"MCHead\"> The DNA motif '$input_sequence' in <i> $strain </i> genome</p>";
#print "####### $strain ####";
print "<div>";  
print "<p class = \"reshead\">Total no. of hits: $totalcount <j style = \"float:right; margin-right: 0px;\">Page: $current_page/$foocount1</j></p>";
print "<table class = \"pageGI\"><tr>";
print "<td>&nbsp&nbsp</td><td width=35><a style='text-decoration: none;' href = \"javascript:go_Motifsearch('$first','$input_sequence','$strnn');\"><img class = \"pagefirst\" src = \"/SPGDB/images/first.png\"/> </a></td>";
print "<td width=35><a style='text-decoratimotif_result.txton: none;' href = \"javascript:go_Motifsearch('$previous','$input_sequence','$strnn');\"> <img class = \"page1\" src = \"/SPGDB/images/backward.png\"/></a></td>";
# Print the page numbers of the current set
foreach my $page (@{$page_info->pages_in_set()}) {
	if($page == $page_info->current_page()) {
  		print "<td width=35><a style = 'text-decoration: none;font: 12px verdana;color: white; background-color: black; padding: 5px; border-radius: 3px;' href = \"javascript:go_Motifsearch('$page','$input_sequence','$strnn');\"><b>$page</b></a></td> ";
		} else {
  		print "<td width=35><a style='text-decoration: none;font: 12px verdana; color: black; background-color: rgba(192,192,192,0.80); padding: 5px; border-radius: 3px;' href = \"javascript:go_Motifsearch('$page','$input_sequence','$strnn');\">$page</a></td> ";
	}
}
print "<td width=35><a style='text-decoration: none;' href = \"javascript:go_Motifsearch('$next','$input_sequence','$strnn');\"> <img class = \"page1\" src = \"/SPGDB/images/forward.png\"/></a></td>";
print "<td width=35><a style='text-decoration: none;' href = \"javascript:go_Motifsearch('$last','$input_sequence','$strnn');\"> <img class = \"pagelast\" src = \"/SPGDB/images/last.png\"/></a></td></tr></table>";
if ($final_page == $pagenum){
	$lowerlimit = $f+1;
	print "<p style = \"float: right; margin-top: -40px; margin-right: 13px; font: 14px verdana;\">Current Hits: $lowerlimit - $totalcount</p>";
}
else {
	$upperlimit = $g*$pagenum;
	$lowerlimit = $f+1;
	print "<p style = \"float: right; margin-top: -40px; margin-right: 13px; font: 14px verdana;\">Current Hits: $lowerlimit - $upperlimit</p>";
}
print "<div class = \"imgbox_motif\"><a href = \"/cgi-bin/SPGDB/download.pl?filename=motif_result.txt\" title = \"Click on the image to download as text file\"><img class = \"jpg\" src = \"/SPGDB/images/text.png\"></a>";
print "<a href = \"/cgi-bin/SPGDB/download_pdf.pl?filename=motif_result.pdf\" title = \"Click on the image to download as pdf file\"><img class = \"pdf\" src = \"/SPGDB/images/pdf.png\"></a></div>";

$dbh1 = DBI -> connect("DBI:mysql:$db:$server",$user,$password);
$sql1 = "select * from gene_list where Organism = '$strain' and Nucleo_seq REGEXP '$sequence' limit $f,$g";
$query = $dbh -> prepare ($sql1);
$query -> execute;
print "<br/><center><table class = \"borcoll\">";
#print SAVE "<br/><table class = \"borcoll\">";
print "<tr> <td class = \"Complistseq \" style='color: #800000;'><b> Locus tag </b></td> <td style='color: #800000;' class = \"Complistseq \"><b> Category </b></td> <td style='color: #800000;' class = \"Complistseq \"><b> Gene name </b></td> <td style='color: #800000;' class = \"Complistseq \"><b> Protein name </b></td><td style='color: #800000;' class = \"Complistseq \"><b> Direction </b></td><td style='color: #800000;' class = \"Complistseq \"><b> Start </b></td> <td class = \"Complistseq \" style='color: #800000; '><b> End </b></td><td class = \"Complistseq \" style='color: #800000; '><b> Blast </b></td></tr>";
$k = 0;
while (@list = $query->fetchrow_array){
	@position = ();
	$k++;
	$organism = $list[0]; $accession = $list[1]; $gi = $list[2]; $chromosome = $list[3]; $locustag = $list[4];
	$category = $list[5]; $start = $list[6]; $end = $list[7]; $direction = $list[8];
	$gene_name = $list[9]; $protein_name = $list[10]; $nseq[$k] = $list[11]; $Pseq = $list[12]; $Nseq = $list[11];
	$sequence1 = "\L$sequence";
	while ($nseq[$k] =~ /($sequence1)/gi){
    	$match = $1;
    	$length = length($&);
    	$pos = length($`);
    	$start_position = $start + $pos;
    	$end_position = $start_position + $length-1;
    	$hitpos = "$start_position-$end_position";
    	push @position,$hitpos;
    	#print "$locustag: $hitpos<br/>";
	}
	$position = join(', ',@position);
	$Nseq_split = $Nseq;
	$Nseq_split =~ s/(.{1,60})/$1\n/gs;
	if ($nseq[$k] =~ /$sequence1/) {
		$nseq[$k] =~ s/$&/\<j style \=\"color\: white\; background-color\: #800000\; font-weight\:bold\;\"\>$&\<\/j\>/g;
	}
	if ($direction eq 'Complement') {$direction =~ s/Complement/\-/g;}
	if ($direction eq 'Non-complement') {$direction =~ s/^Non\-complement/\+/g;}
	if (defined $gene_name) {
	print "<tr> <td class = \"Complist3\">$locustag</td><td class = \"Complistseq \">$category</td> <td class = \"Complistseq \">$gene_name</td> <td class = \"Complistseq \">$protein_name</td> <td class = \"Complistseq \"><b> $direction </b></td> <td class = \"Complistseq \">$start</td> </td> <td class = \"Complistseq\">$end</td><td class = \"Complistseq\"><form method = \"post\" action = \"blast.pl\"><input type = \"hidden\" value = \"$locustag\" name = \"motif_locustag\"><input type = \"hidden\" value = \"$Nseq\" name = \"motif_sequence\"><input type = \"submit\" value = \"Blast\" style = \"font: 12px verdana;\"/></form></td></tr>";
	print "<tr><td colspan = \"7\" style = \"font: 12px verdana; text-align: center;  background-color:rgb(192,192,192);\"><b> Matched postion: </b> $position <td></tr>";
	print "<tr><td colspan = \"7\"><div class = \"sequence_box_motif\"><p class = \"bases\">$nseq[$k]</p></div><td></tr>";
	print SAVE "Matched pattern: $input_sequence\n";
	print SAVE "Locus tag: $locustag \t Category: $category \t Gene name: $gene_name \t Protein name: $protein_name \t Direction: $direction \n Start: $start \t End: $end\n";
	print SAVE "Matched postion : $position\n";
	print SAVE "$Nseq_split\n";
	}
	else {
	print "<tr> <td class = \"Complist3\">$locustag</td><td class = \"Complistseq \">$category</td> <td class = \"Complistseq \">--</td> <td class = \"Complistseq \">$protein_name</td><td class = \"Complistseq \"><b> $direction </b></td> <td class = \"Complistseq \">$start</td> </td> <td class = \"Complistseq\">$end</td><td class = \"Complistseq\"><form method = \"post\" action = \"blast.pl\"><input type = \"hidden\" value = \"$locustag\" name = \"motif_locustag\"><input type = \"hidden\" value = \"$Nseq\" name = \"motif_sequence\"><input type = \"submit\" value = \"Blast\" style = \"font: 12px verdana;\"/></form></td></tr>";
	print "<tr><td colspan = \"7\" style = \"font: 12px verdana; text-align: center; background-color:rgb(192,192,192);\"><b> Matched position: </b> $position <td></tr>";
	print "<tr><td colspan = \"7\"><div class = \"sequence_box_motif\"><p class = \"bases\">$nseq[$k]</p></div><td></tr>";
	print SAVE "Matched pattern: $input_sequence\n";
	print SAVE "Locus tag: $locustag \t Category: $category \t Gene name: $gene_name \t Protein name: $protein_name \t Direction: $direction \n Start: $start \t End: $end\n";
	print SAVE "Matched postion : $position\n";
	print SAVE "$Nseq_split\n";
	}
	
}
print "</table></center></br>";
print "</div>";
}
else {
	print "<p class = \"MCHead\" style= \"margin-left: 10px;\"> No <b>'$input_sequence'</b> motif in <i>$strain</i></p>";
	
}
`perl download_motif_pdf.pl`;
print "</body>";
print "</html>";


