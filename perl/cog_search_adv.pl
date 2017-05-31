#!/usr/bin/perl

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use Data::Pageset;
use POSIX;
use DBI;

print "Content-Type: text/html \n\n";

$strain = param ('organism');
#print "########$strain<br/>";
$cog= param('cog');
#print "#########$cog<br/>";
$pagenum=param('pagenum');
$user = "root";
$password = "";
$server = "localhost";
$db = "SPDB";
@strn = split(/\s+/,$strain);
$strnn = join('+',@strn);

$dbh = DBI -> connect("DBI:mysql:$db:$server",$user,$password);
$sql = "select count(*) from protein_list where Organism = '$strain' and GO LIKE '\%$cog\%'";
$count = $dbh -> prepare ($sql);
$count -> execute;
while (@row = $count->fetchrow_array){
	$totalcount = $row[0];
	#print "$totalcount<br/>";

}

$total_entries = $totalcount;
$entries_per_page = 50;
$current_page = $pagenum;
$pages_per_set = 50;
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
print "<p class = \"MCHead\">List of proteins with <b> $cog </b> in <i> $strain </i></p>";
#print "####### $strain ####";
print "<div>";  
print "<p class = \"reshead\">Total no. of hits: $totalcount <j style = \"float:right; margin-right: 0px;\">Page: $current_page/$foocount1</j></p>";
print "<table class = \"pageGI\"><tr>";
print "<td>&nbsp&nbsp</td><td width=35><a style='text-decoration: none;' href = \"javascript:go_Cog('$first','$cog','$strnn');\"><img class = \"pagefirst\" src = \"/SPGDB/images/first.png\"/> </a></td>";
print "<td width=35><a style='text-decoration: none;' href = \"javascript:go_Cog('$previous','$cog','$strnn');\"> <img class = \"page1\" src = \"/SPGDB/images/backward.png\"/></a></td>";
# Print the page numbers of the current set
foreach my $page (@{$page_info->pages_in_set()}) {
	if($page == $page_info->current_page()) {
  		print "<td width=35><a style = 'text-decoration: none;font: 12px verdana;color: white; background-color: black; padding: 5px; border-radius: 3px;' href = \"javascript:go_Cog('$page','$cog','$strnn');\"><b>$page</b></a></td> ";
		} else {
  		print "<td width=35><a style='text-decoration: none;font: 12px verdana; color: black; background-color: rgba(192,192,192,0.80); padding: 5px; border-radius: 3px;' href = \"javascript:go_Cog('$page','$cog','$strnn');\">$page</a></td> ";
	}
}
print "<td width=35><a style='text-decoration: none;' href = \"javascript:go_Cog('$next','$cog','$strnn');\"> <img class = \"page1\" src = \"/SPGDB/images/forward.png\"/></a></td>";
print "<td width=35><a style='text-decoration: none;' href = \"javascript:go_Cog('$last','$cog','$strnn');\"> <img class = \"pagelast\" src = \"/SPGDB/images/last.png\"/></a></td></tr></table>";
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
$sql1 = "select * from protein_list where Organism = '$strain' and GO LIKE '\%$cog\%' limit $f,$g";
$query = $dbh -> prepare ($sql1);
$query -> execute;
print "<br/><table class = \"borcoll\">";
print "<tr><td class = \"Complist2\" style='text-align:center; color: #800000;'><b> Entry </b></td> <td class = \"Complist2\" style='color: #800000;'><b> Entry name </b></td> <td style='color: #800000; width: 400px;' class = \"Complist2\"><b> Protein names </b></td> <td style='color: #800000;' class = \"Complist2\"><b> Gene names </b></td> <td class = \"Complist2\" style='color: #800000;'><b> Details </b></td></tr>"; 
while (@list = $query->fetchrow_array){
	$entry = $list[0]; $entry_name = $list[1]; $protein_name = $list[3]; $gene_name = $list[4]; 
	if (defined $gene_name){
	print "<tr> <td class = \"Complist2\" style = \"height: 30px;\"> $entry </td> <td class = \"Complist2\"> $entry_name </td> </td> <td class = \"Complist3\"> $protein_name </td> <td class = \"Complist3\"> $gene_name </td> <td class = \"Complist3\">";}
	if (!defined $gene_name) {
	print "<tr> <td class = \"Complist2\" style = \"height: 230px;\"><i> $entry </i></td> <td class = \"Complist2\"> $entry_name </td> </td> <td class = \"Complist3\"> $protein_name </td> <td class = \"Complist3\">--</td> <td class = \"Complist3\">";}
	print "<a style = \" text-decoration: none; background-color: rgba(192,192,192,0.80); color: black; padding: 3px; border-radius: 5px; \"href = \"proteinsearch_lista.pl?protein=$entry\"> Show </a></td></tr>";
}
print "</table></br>";
print "</div>";
}
else {
	print "<p class = \"MCHead\" style= \"margin-left: 10px;\"> No proteins with <b>$cog</b> available for <i>$strain</i></p>";
}
print "<form method = \"GET\" enctype = \"multipart/form-data\">";
print "<input type = \"hidden\" name = \"protein\" value = \"$entry\">";
print "</form>";
print "</body>";
print "</html>";

