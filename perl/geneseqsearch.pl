#!/usr/bin/perl

use DBI;
use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
print "Content-Type: text/html \n\n";
$locus = param('locus');
#print $locus;

$db = "SPDB";
$user = "root";
$password = "";
$host = "localhost";
$dbh = DBI -> connect("DBI:mysql:$db:$host", $user, $password);
$query = "select Nucleo_seq from gene_list where Locus_tag = '$locus'";
$sth = $dbh -> prepare ($query);
$sth -> execute;
while (@list = $sth -> fetchrow_array()){
	$nucleo = $list[0];
	print $nucleo;
}
