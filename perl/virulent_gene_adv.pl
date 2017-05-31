#!/usr/bin/perl

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use Data::Pageset;
use POSIX;
use DBI;

print "Content-Type: text/html \n\n";

$strain = param ('organism');
#print "########$strain<br/>";
$virulence = param('virulence');
#print "#########$virulence<br/>";
$pagenum=param('pagenum');
$user = "root";
$password = "";
$server = "localhost";
$db = "SPDB";
@strn = split(/\s+/,$strain);
$strnn = join('+',@strn);

$dbh = DBI -> connect("DBI:mysql:$db:$server",$user,$password);
$sql = "select count(*) from gene_list where Organism = '$strain' and virulence = '$virulence'";
$count = $dbh -> prepare ($sql);
$count -> execute;
while (@row = $count->fetchrow_array){
	$totalcount = $row[0];
	#print "$totalcount<br/>";
}

$total_entries = $totalcount;
$entries_per_page = 50;
$current_page = $pagenum;
$pages_per_set = 10;
if($pagenum==0)
	{$pagenum=1;}
$f=($pagenum-1)*50;
$g=50;
$s = $f+1;
$foocount=$totalcount/50;
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
print "<p class = \"MCHead\">List of virulent genes in <i> $strain </i></p>";
#print "####### $strain ####";
print "<div>";  
print "<p class = \"reshead\">Total no. of hits: $totalcount <j style = \"float:right; margin-right: 0px;\">Page: $current_page/$foocount1</j></p>";
print "<table class = \"pageGI\"><tr>";
print "<td>&nbsp&nbsp</td><td width=35><a style='text-decoration: none;' href = \"javascript:go_Virule('$first','$virulence','$strnn');\"><img class = \"pagefirst\" src = \"/SPGDB/images/first.png\"/> </a></td>";
print "<td width=35><a style='text-decoration: none;' href = \"javascript:go_Virule('$previous','$virulence','$strnn');\"> <img class = \"page1\" src = \"/SPGDB/images/backward.png\"/></a></td>";
# Print the page numbers of the current set
foreach my $page (@{$page_info->pages_in_set()}) {
	if($page == $page_info->current_page()) {
  		print "<td width=35><a style = 'text-decoration: none;font: 12px verdana;color: white; background-color: black; padding: 5px; border-radius: 3px;' href = \"javascript:go_Virule('$page','$virulence','$strnn');\"><b>$page</b></a></td> ";
		} else {
  		print "<td width=35><a style='text-decoration: none;font: 12px verdana; color: black; background-color: rgba(192,192,192,0.80); padding: 5px; border-radius: 3px;' href = \"javascript:go_Virule('$page','$virulence','$strnn');\">$page</a></td> ";
	}
}
print "<td width=35><a style='text-decoration: none;' href = \"javascript:go_Virule('$next','$virulence','$strnn');\"> <img class = \"page1\" src = \"/SPGDB/images/forward.png\"/></a></td>";
print "<td width=35><a style='text-decoration: none;' href = \"javascript:go_Virule('$last','$virulence','$strnn');\"> <img class = \"pagelast\" src = \"/SPGDB/images/last.png\"/></a></td></tr></table>";
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
$sql1 = "select * from gene_list where Organism = '$strain' and virulence = '$virulence' limit $f,$g";
$query = $dbh -> prepare ($sql1);
$query -> execute;
print "<br/><table class = \"borcoll\">";
print "<tr><td class = \"Complist1\" style='text-align:center; color: #800000;'><b> Organism </b></td> <td class = \"Complistseq \" style='color: #800000;'><b> Locus tag </b></td> <td style='color: #800000;' class = \"Complistseq \"><b> Gene name </b></td> <td style='color: #800000;' class = \"Complistseq \"><b> Start </b></td> <td class = \"Complistseq \" style='color: #800000; '><b> End </b></td><td class = \"Complist3 \" style='color: #800000; '><b> Details </b></td> </tr>";
while (@list = $query->fetchrow_array){
	$organism = $list[0]; $accession = $list[1]; $gi = $list[2]; $chromosome = $list[3]; $locustag = $list[4];
	$category = $list[5]; $start = $list[6]; $end = $list[7]; $direction = $list[8];
	$gene_name = $list[9]; $protein_name = $list[10]; $nseq = $list [11]; $Pseq = $list [12];
	if ($direction eq 'Complement') {$direction =~ s/Complement/\-/g;}
	if ($direction eq 'Non-complement') {$direction =~ s/^Non\-complement/\+/g;}
	print "<tr> <td class = \"Complist1\"><i>$organism</i></td><td class = \"Complist3\"><i>$locustag</i></td> <td class = \"Complistseq \">$gene_name</td> <td class = \"Complistseq \">$start</td> </td> <td class = \"Complistseq\">$end</td>  <td class = \"Complist3 \"><a style = \" text-decoration: none; background-color: rgba(192,192,192,0.80); color: black; padding: 5px; border-radius: 5px;\"href = \"genesearchm.pl?locus=$locustag&gene=$gene_name\"> Show more </a></td></tr>";
}
print "</table></br>";
print "</div>";
}
else {
	print "<p class = \"MCHead\" style= \"margin-left: 10px;\"> No virulent genes in <i>$strain</i></p>";
	
}

print "</body>";
print "</html>";

