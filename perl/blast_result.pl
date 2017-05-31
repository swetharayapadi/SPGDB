#!/usr/bin/perl

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use PDF::Create;
use lib '\cgi-bin\SPGDB';
use Main;
print "Content-Type: text/html \n\n";
Main_Menu();
$blast_type = param ('blast');
chomp $blast_type;
#print "######$blast_type########## <br/>";
$input_sequence = param('sequence');
chomp $input_sequence;
#print "######$input_sequence########## <br/>";

###### Processing input #############
open(OUT,">/var/apache/cgi-bin/SPGDB/dummy.txt") || die "$!";
print OUT $input_sequence;
close(OUT);
###################################

$strain = param('strain');
chomp $strain;
#print "######$strain########## <br/>";
$word_size = param('word_size');
chomp $word_size;
#print "######$word_size########## <br/>";
$gap = param('gap');
chomp $gap;
@gap_penalty = split(/,/,$gap);
#print "######$gap_penalty[0]########## </br>";
#print "######$gap_penalty[1]########## </br>";
$choo_matrix = param('choo_matrix');
chomp $choo_matrix;
#print "######$choo_matrix########## </br>";
print "<html>";
print "<body onLoad = \"document.getElementById('siteLoader').style.display = 'none';\">";
print "<div class=\"MainContent\">";
print "<div id = \"siteLoader\">";
print "<center><img style = \"height: 100px; width: 100px; margin-top: 100px;\"src = \"/SPGDB/images/loading.GIF\"></center>";
print "</div>";

####### BLAST Program ##############
if ($blast_type eq 'blastn'){
	system("/var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/$blast_type -db /var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/db/nucleotide/$strain -query /var/apache/cgi-bin/SPGDB/dummy.txt -word_size $word_size -gapopen $gap_penalty[0] -gapextend $gap_penalty[1] >/var/apache/cgi-bin/SPGDB/blast_output.txt");
}

if ($blast_type eq 'blastp'){
	system("/var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/$blast_type -db /var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/db/protein/$strain -query /var/apache/cgi-bin/SPGDB/dummy.txt -word_size $word_size -gapopen $gap_penalty[0] -gapextend $gap_penalty[1] -matrix $choo_matrix >/var/apache/cgi-bin/SPGDB/blast_output.txt");
}

if ($blast_type eq 'blastx'){
	system("/var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/$blast_type -db /var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/db/protein/$strain -query /var/apache/cgi-bin/SPGDB/dummy.txt -word_size $word_size -gapopen $gap_penalty[0] -gapextend $gap_penalty[1] -matrix $choo_matrix >/var/apache/cgi-bin/SPGDB/blast_output.txt");
}

if ($blast_type eq 'tblastx'){
	system("/var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/$blast_type -db /var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/db/nucleotide/$strain -query /var/apache/cgi-bin/SPGDB/dummy.txt -word_size $word_size -matrix $choo_matrix >/var/apache/cgi-bin/SPGDB/blast_output.txt");
}

if ($blast_type eq 'tblastn'){
	system("/var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/$blast_type -db /var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/db/nucleotide/$strain -query /var/apache/cgi-bin/SPGDB/dummy.txt -word_size $word_size -gapopen $gap_penalty[0] -gapextend $gap_penalty[1] -matrix $choo_matrix >/var/apache/cgi-bin/SPGDB/blast_output.txt");
}

################# BLAST to all strains ##########################3
if ($strain eq 'all') {
	if ($blast_type eq 'blastn'){
	system("/var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/$blast_type -db /var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/db/Nucleotide_sequence -query /var/apache/cgi-bin/SPGDB/dummy.txt -word_size $word_size -gapopen $gap_penalty[0] -gapextend $gap_penalty[1] >/var/apache/cgi-bin/SPGDB/blast_output.txt");
	}

	if ($blast_type eq 'blastp'){
	system("/var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/$blast_type -db /var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/db/Protein_sequence -query /var/apache/cgi-bin/SPGDB/dummy.txt -word_size $word_size -gapopen $gap_penalty[0] -gapextend $gap_penalty[1] -matrix $choo_matrix >/var/apache/cgi-bin/SPGDB/blast_output.txt");
	}

	if ($blast_type eq 'blastx'){
	system("/var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/$blast_type -db /var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/db/Protein_sequence -query /var/apache/cgi-bin/SPGDB/dummy.txt -word_size $word_size -gapopen $gap_penalty[0] -gapextend $gap_penalty[1] -matrix $choo_matrix >/var/apache/cgi-bin/SPGDB/blast_output.txt");
	}

	if ($blast_type eq 'tblastx'){
	system("/var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/$blast_type -db /var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/db/Nucleotide_sequence -query /var/apache/cgi-bin/SPGDB/dummy.txt -word_size $word_size -matrix $choo_matrix >/var/apache/cgi-bin/SPGDB/blast_output.txt");
	}

	if ($blast_type eq 'tblastn'){
	system("/var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/$blast_type -db /var/apache/cgi-bin/SPGDB/ncbi-blast-2.2.29+/bin/db/Nucleotide_sequence -query /var/apache/cgi-bin/SPGDB/dummy.txt -word_size $word_size -gapopen $gap_penalty[0] -gapextend $gap_penalty[1] -matrix $choo_matrix >/var/apache/cgi-bin/SPGDB/blast_output.txt");
	}
}
open (IN1,"/var/apache/cgi-bin/SPGDB/blast_output.txt") || die "$!";
open (OUT1,">/var/apache/cgi-bin/SPGDB/blast_output_link.txt") || die "$!";
$line1 = <IN1>;
while ($line1 ne "") {
	if ($line1 =~ /^\s+[sp|tr]+\|(\w+)/) {
		$match = $1;
		$line1 =~ s/\|$match\|/\|<a href=\"http:\/\/www.uniprot.org\/uniprot\/$match" target=\"_blank\">$match<\/a>\|/g;
	}
	if ($line1 =~ /^\s+gi\|(\w+)/) {
		$match = $1;
		#print "$match<br>";
		$line1 =~ s/\|$match:/\|<a href=\"http:\/\/www.ncbi.nlm.nih.gov\/gene\/?term=$match\" target=\"_blank\">$match<\/a>\|/g;
}	
	print OUT1 "$line1";
	$line1 = <IN1>;
}
close(IN1);
close(OUT1);

open (IN2,"/var/apache/cgi-bin/SPGDB/blast_output_link.txt") || die "$!";
@blast_output = <IN2>;
close(IN2);

print "<p class = \"reshead\"> BLAST results </p>";
print "<img class = \"backGI\" src = \"/SPGDB/images/back-button-png.svg\" onclick = \"window.history.back()\"\;/>";
print "<div class = \"imgbox\"><a href = \"/cgi-bin/SPGDB/download.pl?filename=blast_output.txt\" title = \"Click on the image to download as text file\"><img class = \"jpg\" src = \"/SPGDB/images/text.png\"></a>";
print "<a href = \"/cgi-bin/SPGDB/download_pdf.pl?filename=blast_output.pdf\" title = \"Click on the image to download as pdf file\"><img class = \"pdf\" src = \"/SPGDB/images/pdf.png\"></a></div>";
print "<pre>";
print @blast_output;
print "</pre>";
print "</div>";

################################ PDF format
open(IN,"/var/apache/cgi-bin/SPGDB/blast_output.txt") || die "$!";
@values = <IN>;
#print @values;

# initialize PDF
$pdf = PDF::Create->new('filename'     => '/var/apache/htdocs/SPGDB/output/blast_output.pdf',
                                        'Author'       => 'PDF::Create',
                                        'Title'        => 'BLAST result',
                                        'CreationDate' => [ localtime ], );
                                        
# add a A4 sized page
$a4 = $pdf->new_page('MediaBox' => $pdf->get_page_size('A4'));

# Add a page which inherits its attributes from $a4
$page = $a4->new_page;

# Prepare a font
$f1 = $pdf->font('Subtype'  => 'Type1',
                        'Encoding' => 'WinAnsiEncoding',
                        'BaseFont' => 'Courier-Bold');

# Prepare a Table of Content
$toc = $pdf->new_outline('Title' => 'BLAST result', 'Destination' => $page);

# Write some text
$page->stringc($f1, 9, 55, 790, "BLAST result");
$page->line(50,780,550,780);
$i = 0;
$j = 750;
$line=75;
$len = scalar(@values);
for($i;$i<$len;$i++){
	if($i%$line==0 && $i>0)
     { 
        $k++;$page=$a4->new_page;$j=750;
     }
	$page->string($f1,8,55,$j,"$values[$i]");$j-=10;
}

# Close the file and write the PDF
$pdf->close;
print "</body>";
print "</html>";


