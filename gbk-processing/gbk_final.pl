#!/usr/bin/perl 
open (FILE,"final_list.txt") || die "can't able to open the file \n";
while ($file_name=<FILE>) {
chomp $file_name;
open(IN, "$file_name") || die "can't able to open the file \n";
open(OUT, ">new03/$file_name.tsv") || die "can't able to write the file \n";
@gene_array = @dna_seq = @dna_sequence = @posis = @dna_tmp = @dna_tmp1 = ();
$start_posis = $end_posis = $dna_seq_final = "";
$line = <IN>;
while (!eof(IN)) {
	chomp($line);
	#print "$line\n";
	if ($line =~/^ACCESSION\s+(\w+)/) {
	$accession_id=$1;
	#print "***$accession_id***\t";
	}
	if ($line =~/^SOURCE\s+(\w+)/) {
	$organism=$1;
	#print "***$organism***\t";	
	}
		if ($line=~/^\s+/) {
		$check = 0;
		$patt=substr ($line,5,5);
			$patt=~s/\s//g;
			#if ($line=~/^\s+misc_feature.*/) {
			#	next;
			#}
			if ($line=~/^\s+misc_feature.*/) {
				next;
			}
			elsif ($patt=~/CDS|[t|r|nc|tm]RNA/) {
				if (($line=~/\s*$patt\s*(.*join.*)/) || ($line=~/\s*$patt\s*(\<?\w*\(?\<?\d+\.\.\>?\d+\)?)/)) {
				$gene_pos=$1;
				if (($line=~/.*join.*/) && ($line!~/\)$/)) {
					do {
					$line1 = <IN>;	
					$line1 =~ s/\s//g;
					$gene_pos .= $line1;
					} until ($line1=~/\)$/);
				}
				
				#print "!!!$gene_pos!!!\n";
				push (@gene_array,$gene_pos);
				%{$gene_pos}=();
				$$gene_pos{patt}=$patt;
				$flag=0;
					do {
					$line=<IN>;	
					chomp($line);
					$patt1=substr ($line,5,5);
					if (($patt1=~/\s{5}/) && $flag!=1) {
						if ($line=~/^\s+\/(gene)="(.*)"/) {
						$key = $1;
						$value = $2; 
						$$gene_pos{$key}=$value;
						#print "$key\t$value\n";
						}
						if ($line=~/^\s+\/(locus_tag)="(.*)"/) {
						$key = $1;
						$value = $2; 
						$$gene_pos{$key}=$value;
						#print "$key\t$value\n";
						}
						if ($line=~/^\s+\/(product)="(.*)"/) {
						$key = $1;
						$value = $2; 
						$$gene_pos{$key}=$value;
						#print "$key\t$value\n";
						}
						elsif ($line=~/^\s+\/(product)="(.*)/) {
						$key = $1;
						$product1 = $2; 
						chop($product1);
						$line=<IN>;
						if ($line=~/^\s+(.*)"/){
						$product2= $1;
						}
						$value="$product1"." "."$product2";
						$$gene_pos{$key}=$value;
						#print "***$product1***$product2***\n";
						#print "$key\t$value\n";
						}
						
						if ($line=~/^\s+\/(translation)="(.+)"/) {
							$check = 0;
							$key = $1;
							$ptn_seq = $2;
							$$gene_pos{$key}=$ptn_seq;
							#print "$key\t$ptn_seq\n";
						}			
						elsif ($line=~/^\s+\/(translation)="(.+)/) {	
							$key = $1;
							$ptn_seq = $2;
							#chop($ptn_seq);
							do {
								$line=<IN>;
								$line=~s/\s//g;
								if ($line=~/\w*\"/) {
									$ptn_seq .= $line;
									chop($ptn_seq);	
									$$gene_pos{$key}=$ptn_seq;
									#print "$gene_pos\t$key\t***$ptn_seq***\n";			
								}
								$ptn_seq .= $line;								
							}until ($line=~/\"$/);						
						}				
					}	else{
							$flag=1;
							}
						if ($line=~/^ORIGIN/) {
						$patt1="CDS";
						$dna_seq="";
							do {
							$line=<IN>;
							chomp($line);
							$dna_seq = substr ($line,10,65);
							$dna_seq=~s/\s//g;
							@dna_seq = split ('',$dna_seq);
								foreach (@dna_seq) {
									push (@dna_sequence,$_);
								}
							}until ($line=~/^\/\//);
						}
					} until ($patt1=~/CDS|[t|r|nc|tm]RNA/);												
				}
			}	else{
				$line=<IN>;
				chomp($line);
				}

		}
			else{
			$line=<IN>;
			chomp($line);
			}	
}close(IN);	

					foreach (@gene_array) { 
						#print "$_\n";
						@posis = ();
						$start_posis = $end_posis = "";
						if (($_=~/complement\((\<?\d+\.\.\>?\d+)\)/) || ($_=~/complement\(join\((.*)\)\)/)){
						$strand='comple';
						$position = $1;
						if ($position=~/^\<?\d+\.\.\>?\d+$/) {
							$position=~s/\<//g;
							$position=~s/\>//g;	
							#print "$position\n";
							push (@posis,$position);
						}
						elsif ($position=~/\d+\.\.\d+\,.*/) {
							#print "$position\n";
							@posis = split (/\,/,$position);
						} 
						}
							elsif (($_=~/^(\<?\d+\.\.\>?\d+)$/) || ($_=~/join\((.*)\)/)) {
							$strand='non-comple';
							$position = $1;
							if ($position=~/^\<?\d+\.\.\>?\d+$/) {
							$position=~s/\<//g;
							$position=~s/\>//g;	
							#print "$position\n";
							push (@posis,$position);
							}
							elsif ($position=~/\d+\.\.\d+\,.*/) {
							#print "$position\n";
							@posis = split (/\,/,$position);
							}
							}				
						$dna_seq_final = "";
						@dna_tmp = @dna_tmp1 = ();
						if ($strand eq "non-comple") {
						foreach $startend (@posis) {
							if ($startend=~/(\d+)\.\.(\d+)/){
							$start = $1;
							$start_posis .= $start."#";
							$end = $2;
							$end_posis .= $end."#";
							}
							for ($i=$start-1;$i<=$end-1;$i++) {
							$dna_seq_final .= $dna_sequence[$i];	
							}
						}
						}
							elsif ($strand eq "comple") {
							foreach $startend (@posis) {
								if ($startend=~/(\d+)\.\.(\d+)/) {
								$start = $1;
								$start_posis .= $start."#";
								$end = $2;
								$end_posis .= $end."#";
								}
								for ($i=$start-1;$i<=$end-1;$i++) {
								push (@dna_tmp,$dna_sequence[$i]);
								}
							}
									@dna_tmp1 = reverse (@dna_tmp);
									foreach $seq (@dna_tmp1){
										$seq=~tr/[a|t|g|c]/[t|a|c|g]/;
										$dna_seq_final .= $seq;	
									} 
							}
						#print "$dna_seq_final\n";
						$$_{dna}=$dna_seq_final;
						chop ($start_posis) if ($start_posis=~/\#$/);
						chop ($end_posis) if ($end_posis=~/\#$/);
print OUT "$organism\t$accession_id\tchromosome\t".$$_{locus_tag}."\t".$$_{patt}."\t"."$start_posis\t$end_posis\t$strand\t".$$_{gene}."\t".$$_{product}."\t".$$_{dna}."\t".$$_{translation}."\n";	
					}
}
