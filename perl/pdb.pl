#!/usr/bin/perl

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
#print "Content-Type: text/html \n\n";

$pdb_id = param ('pdb_id');
print $pdb_id;
open (IN,"/var/apache/htdocs/SPGDB/jmol-12.2.9/pdb/$pdb_id.pdb") || die ("Can't open file");
open (OUT,">/var/apache/htdocs/SPGDB/$pdb_id.txt") || die ("Cant write file");
@content = <IN>;
close (IN);
print OUT "@content";

print<<HTML;
<script type="text/javascript">
document.location=download.pl?filename="+/var/apache/htdocs/SPGDB/$pdb_id.txt+"&name="+$pdb_id;
</script>
HTML


