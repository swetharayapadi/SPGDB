use PDF::Create;
open(IN,"/var/apache/htdocs/SPGDB/output/motif_result.txt") || die "$!";
@values = <IN>;
#print @values;

# initialize PDF
$pdf = PDF::Create->new('filename'     => '/var/apache/htdocs/SPGDB/output/motif_result.pdf',
                                        'Author'       => 'PDF::Create',
                                        'Title'        => 'Motif search result',
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
$toc = $pdf->new_outline('Title' => 'Motif search result', 'Destination' => $page);

# Write some text
$page->stringc($f1, 9, 55, 790, "Motif search result");
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

