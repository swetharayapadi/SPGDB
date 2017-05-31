#!/usr/bin/perl

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use Data::Pageset;
use POSIX;
use DBI;
use lib '\cgi-bin\SPGDB';
use Main;


print "Content-Type: text/html \n\n";

$strain = param ('strain');
#print $strain;
$pagenum=param('pagenum');
$category = param('category');
#print $category;
$user = "root";
$password = "";
$server = "localhost";
$db = "SPDB";
@strn = split(/\s+/,$strain);
$strnn = join('+',@strn);
#print $strnn;

$dbh = DBI -> connect("DBI:mysql:$db:$server",$user,$password);
$sql = "select count(*) from gene_list where Organism = '$strain' and Category = '$category'";
$count = $dbh -> prepare ($sql);
$count -> execute;
while (@row = $count->fetchrow_array){
	$totalcount = $row[0];
	#print "$totalcount<br/>";

}

$total_entries = $totalcount;
$entries_per_page = 100;
$current_page = $pagenum;
$pages_per_set = 10;
if($pagenum==0)
	{$pagenum=1;}
$f=($pagenum-1)*100;
$g=100;
$s = $f+1;
$foocount=$totalcount/100;
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
Main_Menu();
print "<html>";
print "<body>";
print "<div class=\"MainContent\">";
if ($totalcount != 0){
print "<p class = \"MCHead\">List of <b>$category</b> in <i> $strain </i></p>";
print "<img class = \"backGI\" src = \"/SPGDB/images/back-button-png.svg\" onclick = \"window.history.back()\"\;/>";
#print "####### $strain ####";
print "<div>";  
print "<p class = \"reshead\">Total no. of hits: $totalcount <j style = \"float:right; margin-right: 10px;\">Page: $current_page/$foocount1</j></p>";
print "<table class = \"pageGI\"><tr>";
print "<td>&nbsp&nbsp</td><td width=35><a style='text-decoration: none;' href = ?pagenum=".$page_info->first_page."&strain="."$strnn"."&category="."$category".">&nbsp&nbsp<img class = \"pagefirst\" src = \"/SPGDB/images/first.png\"/> </a></td>";
print "<td width=35><a style='text-decoration: none;' href = ?pagenum=".$page_info->previous_page."&strain="."$strnn"."&category="."$category"."> <img class = \"page1\" src = \"/SPGDB/images/backward.png\"/></a></td>";
# Print the page numbers of the current set
foreach my $page (@{$page_info->pages_in_set()}) {
	if($page == $page_info->current_page()) {
  		print "<td width=35><a style = 'text-decoration: none;font: 12px verdana;color: white; background-color: black; padding: 5px; border-radius: 3px;' href = ?pagenum=".$page."&strain="."$strnn"."&category="."$category"."><b>$page</b></a></td> ";
		} else {
  		print "<td width=35><a style='text-decoration: none;font: 12px verdana; color: black; background-color: rgba(192,192,192,0.80); padding: 5px; border-radius: 3px;' href = ?pagenum=".$page."&strain="."$strnn"."&category="."$category".">$page</a></td> ";
	}
}
print "<td width=35><a style='text-decoration: none;' href = ?pagenum=".$page_info->next_page."&strain="."$strnn"."&category="."$category"."> <img class = \"page1\" src = \"/SPGDB/images/forward.png\"/></a></td>";
print "<td width=35><a style='text-decoration: none;' href = ?pagenum=".$page_info->last_page."&strain="."$strnn"."&category="."$category"."> <img class = \"pagelast\" src = \"/SPGDB/images/last.png\"/></a></td></tr></table>";
if ($final_page == $pagenum){
	$lowerlimit = $f+1;
	print "<p style = \"float: right; margin-top: -40px; margin-right: 13px; font: 14px verdana;\">Current Hits: $lowerlimit - $totalcount</p>";
}
else {
	$upperlimit = $g*$pagenum;
	$lowerlimit = $f+1;
	print "<p style = \"float: right; margin-top: -40px; margin-right: 13px; font: 14px verdana;\">Current Hits: $lowerlimit - $upperlimit</p>";
}

$dbh1 = DBI -> connect("DBI:mysql:$db:$server",$user,$password);
$sql1 = "select * from gene_list where Organism = '$strain' and Category = '$category' limit $f,$g";
$query = $dbh -> prepare ($sql1);
$query -> execute;
print "<br/><table class = \"borcoll\">";
print "<tr><td class = \"Complist3\" style='text-align:center; color: #800000;'><b> Locus tag </b></td> <td class = \"Complistseq \" style='color: #800000;'><b> Category </b></td> <td class = \"Complistseq \" style='color: #800000;'><b> Start </b></td> <td style='color: #800000;' class = \"Complistseq \"><b> End </b></td> <td style='color: #800000;' class = \"Complistseq \"><b> Gene name </b></td> <td style='color: #800000; width: 500px;' class = \"Complistseq\"><b> Protein name </b></td> <td class = \"Complistseq \" style='color: #800000; '><b> Strand </b></td> <td class = \"Complistseq1\" style='color: #800000; width: 1500px;'><b> Sequence </b></td></tr>"; 
$k = 0;
while (@list = $query->fetchrow_array){
	$k++;
	$organism = $list[0]; $gi = $list[2]; $locus_tag = $list[4]; $category = $list[5]; $start = $list[6]; $end = $list[7]; $strand = $list[8]; $gene_name = $list[9]; $protein_name = $list[10]; $Nseq[$k] = $list[11]; $Pseq[$k] = $list[12]; 
	#$Nseq =~ s/(.{1,60})/$1\\n/gs;
	#$new = $Nseq;
	#$Pseq =~ s/(.{1,60})/$1\\n/gs;
	#$new1 = $Pseq;
	if ($strand eq 'Complement') {$strand =~ s/Complement/\-/g;}
	if ($strand eq 'Non-complement') {$strand =~ s/^Non\-complement/\+/g;}
	if (defined $gene_name){
	print "<tr> <td class = \"Complist3\">$locus_tag</td> <td class = \"Complistseq\">$category</td> <td class = \"Complistseq \">$start</td> </td> <td class = \"Complistseq\">$end</td> <td class = \"Complistseq \">$gene_name</td> <td class = \"Complistseq\" style = \"width: 500px;\">$protein_name</td> <td class = \"Complistseq \">$strand</td> <td class = \"Complistseq1 \" style = \"width: 1500px;\">";}
	if (!defined $gene_name) {
	print "<tr> <td class = \"Complist3\">$locus_tag</td> <td class = \"Complistseq\">$category</td> <td class = \"Complistseq \">$start</td> </td> <td class = \"Complistseq \">$end</td> <td class = \"Complistseq \">--</td><td class = \"Complistseq\" style = \"width: 500px;\">$protein_name</td> <td class = \"Complistseq\">$strand</td> <td class = \"Complistseq1\" style = \"width: 1500px;\">";}
	print "<input type = \"radio\" name = seq id = 'nseq' value=\"<b>\>gi\|$gi: $start-$end <i>$organism</i></b><br>$Nseq[$k]\" onclick = shownseq(this.value)> Nucleotide"; 
	if (defined $Pseq[$k]){ 
	print "<input type = \"radio\" name = seq id = 'pseq' value=\"<b>\>gi\|$gi: $protein_name <i>$organism</i></b><br>$Pseq[$k]\" onclick = showpseq(this.value)> Translated protein";
	} 
	print "</td></tr>";
}
print "<div id = \"popup1\" class = \"sequenceboxpop\" style = \"display:none;\"></div>";
print "<div id = \"popup2\" class = \"sequenceboxpop\" style = \"display:none;\"></div>";
print "</table></br>";
print "</div>";
}
else {
	print "<p class = \"MCHead\" style= \"margin-left: 10px;\">No $category available for <i>$strain</i></p>";
	print "<img class = \"backGI2 \" src = \"/SPGDB/images/back-button-png.svg\" onclick = \"window.history.back()\"\;/>";
}
	print $head;
print "<form method = \"GET\" enctype = \"multipart/form-data\">";
print "<input type = \"hidden\" name = \"locus\" value = \"$locus_tag\">";
print "</form>";


print "</div>";
print "</body>";
print "</html>";

