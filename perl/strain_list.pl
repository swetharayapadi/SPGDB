#!/usr/bin/perl

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use Data::Pageset;
use POSIX;
use DBI;
use lib '\cgi-bin\SPGDB';
use Main;


print "Content-Type: text/html \n\n";
$pagenum=param('pagenum');
$cgi = new CGI;
$user = "root";
$password = "";
$server = "localhost";
$db = "SPDB";
$dbh = DBI -> connect("DBI:mysql:$db:$server",$user,$password);
$sql = "select count(*) from strain_list";
$count = $dbh -> prepare ($sql);
$count -> execute;
while (@row = $count->fetchrow_array){
	$totalcount = $row[0]	;
	#print "$totalcount<br/>";
}

$total_entries = $totalcount;
$entries_per_page = 20;
$current_page = $pagenum;
$pages_per_set = 5;
if($pagenum==0)
	{$pagenum=1;}
$f=($pagenum-1)*20;
$g=20;
$s = $f+1;
$foocount=$totalcount/20;
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
print "<div><br/>";  
print "<p class = \"MCHead\">List of <i> Streptococcus pneumoniae </i> strains</p>";
print "<p class = \"reshead\">Total no. of hits: $totalcount <j style = \"float:right;\">Page: $current_page/$foocount1</j></p>";
print "<table class = \"page\"><tr>";
print "<td>&nbsp&nbsp</td><td width=35><a style='text-decoration: none;' href = ?pagenum=".$page_info->first_page.">&nbsp&nbsp<img class = \"pagefirst\" src = \"/SPGDB/images/first.png\"/> </a></td>";
print "<td width=35><a style='text-decoration: none;' href = ?pagenum=".$page_info->previous_page."> <img class = \"page1\" src = \"/SPGDB/images/backward.png\"/></a></td>";
# Print the page numbers of the current set
foreach my $page (@{$page_info->pages_in_set()}) {
	if($page == $page_info->current_page()) {
  		print "<td width=35><a style = 'text-decoration: none;font: 12px verdana;color: white; background-color: black; padding: 5px; border-radius: 3px;' href = ?pagenum=".$page."><b>$page</b></a></td> ";
		} else {
  		print "<td width=35><a style='text-decoration: none;font: 12px verdana; color: black; background-color: rgba(192,192,192,0.80); padding: 5px; border-radius: 3px;' href = ?pagenum=".$page.">$page</a></td> ";
	}
}
print "<td width=35><a style='text-decoration: none;' href = ?pagenum=".$page_info->next_page."> <img class = \"page1\" src = \"/SPGDB/images/forward.png\"/></a></td>";
print "<td width=35><a style='text-decoration: none;' href = ?pagenum=".$page_info->last_page."> <img class = \"pagelast\" src = \"/SPGDB/images/last.png\"/></a></td></tr></table><br/>";
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
$sql1 = "select * from strain_list limit $f,$g";
$query = $dbh -> prepare ($sql1);
$query -> execute;
print "<br/><table class = \"borcoll\">";
print "<tr><td class = \"Complist1\" style='text-align:center; color: #800000;'><b> Organism </b></td> <td style='color: #800000;' class = \"Complist2\"><b> Status </b></td> <td class = \"Complist2\" style='color: #800000;'><b> No. of genes </b></td> <td style='color: #800000;' class = \"Complist2\"><b> No. of proteins </b></td> <td class = \"Complist2\" style='color: #800000;'><b> Details </b></td></tr>"; 
while (@list = $query->fetchrow_array){
	$organism = $list[1]; $status = $list[8]; $gene = $list[12]; $protein = $list[13];
	if (defined $status && $gene && $protein){
	print "<tr> <td class = \"Complist1\"><i>$organism</i></td> <td class = \"Complist2\">$status</td> <td class = \"Complist3\"><a style = \" text-decoration: none; background-color: rgba(192,192,192,0.80); color: black; padding: 5px; border-radius: 5px;\"href = \"gene_list.pl?pagenum=1&strain=$organism\"> $gene </a></td> <td class = \"Complist3\"><a style = \" text-decoration: none; background-color: rgba(192,192,192,0.80); color: black; padding: 5px; border-radius: 5px;\"href = \"protein_list.pl?pagenum=1&strain=$organism\"> $protein </a></td> <td class = \"Complist3\">";}
	if (!defined $gene) {
	print "<tr> <td class = \"Complist1\"><i>$organism</i></td> <td class = \"Complist2\">$status</td> <td class = \"Complist3\">--</td> <td class = \"Complist3\">--</td> <td class = \"Complist3\">";}
	print "<a style = \" text-decoration: none; background-color: rgba(192,192,192,0.80); color: black; padding: 5px; border-radius: 5px;\"href = \"strainsearch_list.pl?strain=$organism\"> Show more </a></td></tr>";
}
print "</table></br>";
print "</div>";
print "<form method = \"GET\" enctype = \"multipart/form-data\">";
print "<input type = \"hidden\" name = \"strain\" value = \"$organism\">";
print "</form>";
print "</div>";
print "</body>";
print "</html>";

