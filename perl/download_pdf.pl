#!/usr/bin/perl
use CGI;
$cgi = new CGI;
$filename = $cgi -> param('filename');

if ($filename eq 'motif_result.pdf') {
open($DLFILE, '<',"/var/apache/htdocs/SPGDB/output/$filename") or return(0);

print $cgi->header(-type            => 'application/x-download',
                  -attachment      => "motif_result.pdf",
                 'Content-length' => -s "/var/apache/htdocs/SPGDB/output/$filename"
);
binmode $DLFILE;
print while <$DLFILE>;
undef ($DLFILE);
}
if ($filename eq 'blast_output.pdf') {
open(my $DLFILE, '<',"/var/apache/htdocs/SPGDB/output/$filename") or return(0);

print $cgi->header(-type            => 'application/x-download',
                  -attachment      => "blast_result.pdf",
                 'Content-length' => -s "/var/apache/htdocs/SPGDB/output/$filename"
);
binmode $DLFILE;
print while <$DLFILE>;
undef ($DLFILE);
}
