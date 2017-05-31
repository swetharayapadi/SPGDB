#!/usr/bin/perl
use CGI;
$CGI::POST_MAX = 1024;
$CGI::DISABLE_UPLOADS = 1;
$cgi = new CGI;
$filename = $cgi -> param('filename');
if ($filename eq 'motif_result.txt') {
open(my $DLFILE, '<',"/var/apache/htdocs/SPGDB/output/$filename") or return(0);

print $cgi->header(-type            => 'application/x-download',
                  -attachment      => "motif_result.txt",
                 'Content-length' => -s "/var/apache/htdocs/SPGDB/output/$filename"
);
binmode $DLFILE;
print while <$DLFILE>;
undef ($DLFILE);
}
if ($filename eq 'blast_output.txt') {
open(my $DLFILE, '<',"/var/apache/cgi-bin/SPGDB/$filename") or return(0);

print $cgi->header(-type            => 'application/x-download',
                  -attachment      => "blast_result",
                 'Content-length' => -s "/var/apache/cgi-bin/SPGDB/$filename"
);
binmode $DLFILE;
print while <$DLFILE>;
undef ($DLFILE);
}



