#!/usr/bin/perl
use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use lib '\cgi-bin\SPGDB';
use Main;
print "Content-Type: text/html \n\n";
Main_Menu();
$motif_seq = param ('motif_sequence');
#print "###############$motif_seq###############";
$motif_locus = param ('motif_locustag');
print <<"EOF";
<html>
<body>
	<div class="MainContent">
		<p class="MCHead"> BLAST </p>
		<p class="MCContent1"><b> Select a Blast program </b></i> </p>
		
		<form method = "POST" action = "blast_result.pl" id = "myForm_blast">
			<table style = "margin-right: auto; margin-left: auto;">
				<tr><td style = "font: 12px verdana; border-right: 5px groove black;padding: 5px;"> <input type = "radio" name = "blast" value = "blastp" id = "blastp" onclick = "show_mat()";> BLASTP </td> <td style = "font: 12px verdana; padding: 5px; width: 800px;"> Compares an protein query sequence against a protein sequence database </td></tr>
				<tr><td style = "font: 12px verdana; border-right: 5px groove black; padding: 5px;"> <input type = "radio" name = "blast" value = "blastn" id = "blastn" onclick = "hide_mat()";> BLASTN </td> <td style = "font: 12px verdana; padding: 5px; width: 800px;"> Compares a nucleotide query sequence against a nucleotide sequence database </td></tr>
				<tr><td style = "font: 12px verdana; border-right: 5px groove black; padding: 5px;"> <input type = "radio" name = "blast" value = "blastx" id = "blastx" onclick = "show_mat()";> BLASTX </td> <td style = "font: 12px verdana; padding: 5px; width: 800px;"> Compares a nucleotide query sequence translated in all reading frames against a protein sequence database </td></tr>
				<tr><td style = "font: 12px verdana; border-right: 5px groove black; padding: 5px;"> <input type = "radio" name = "blast" value = "tblastn" id = "tblastn" onclick = "show_mat()"> TBLASTN </td> <td style = "font: 12px verdana; padding: 5px; width: 800px;"> Compares a protein query sequence against a nucleotide sequence database dynamically translated in all reading frames </td></tr>
				<tr><td style = "font: 12px verdana; border-right: 5px groove black; padding: 5px;"> <input type = "radio" name = "blast" value = "tblastx" id = "tblastx" onclick = "show_matex()";> TBLASTX </td> <td style = "font: 12px verdana; padding: 5px; width: 800px;"> Compares the six-frame translations of a nucleotide query sequence against the six-frame translations of a nucleotide sequence database </td></tr>
			</table>
			<p class="MCContent1"><b> Paste sequence in FASTA format </b> <sup> <img onclick = "show_Example()"; class = "qmark" src = "/SPGDB/images/qmark.png" /> <sup></p>
			<div class = "sequencebox_EX" id = "examplediv" style= "display:none;"> <img class = \"closepop\" onclick = "close_Example()"; src=\"/SPGDB/images/close.png\"/> <b> Example: </b> <br/>>sp|P01563|IFNA2_HUMAN Interferon alpha-2 OS=Homo sapiens GN=IFNA2 PE=1 SV=1
<br/> MALTFALLVALLVLSCKSSCSVGCDLPQTHSLGSRRTLMLLAQMRKISLFSCLKDRHDFG
FPQEEFGNQFQKAETIPVLHEMIQQIFNLFSTKDSSAAWDETLLDKFYTELYQQLNDLEA
CVIQGVGVTETPLMKEDSILAVRKYFQRITLYLKEKKYSPCAWEVVRAEIMRSFSLSTNL
<br/>QESLRSKE </div>
EOF

if (defined $motif_seq) {
	print "<textarea style = \"margin-left: 50px;\" rows = \"10\" cols = \"90\" name = \"sequence\">\>$motif_locus\n$motif_seq</textarea>";
}

else {

	print "<textarea style = \"margin-left: 50px;\" rows = \"10\" cols = \"90\" name = \"sequence\"> </textarea>";
}
print <<"EOF1";
			<p class="MCContent1"><b> Select databases to search </b></p>		
			<div class = "styled-select">
				<select name = "strain">
					<option value = "all"> All strains </option>
					<option value = "Streptococcus_pneumoniae_A026"> Streptococcus pneumoniae A026 </option>
					<option value = "Streptococcus_pneumoniae_gamPNI0373"> Streptococcus pneumoniae gamPNI0373 </option>
					<option value = "Streptococcus_pneumoniae_R6"> Streptococcus pneumoniae R6 </option>
					<option value = "Streptococcus_pneumoniae_serotype_19F_strain_G54"> Streptococcus pneumoniae G54 </option>
					<option value = "Streptococcus_pneumoniae_SPN034156"> Streptococcus pneumoniae SPN034156 </option>
					<option value = "Streptococcus_pneumoniae_SPN034183"> Streptococcus pneumoniae SPN034183 </option>
					<option value = "Streptococcus_pneumoniae_SPN994038"> Streptococcus pneumoniae SPN994038 </option>
					<option value = "Streptococcus_pneumoniae_SPN994039"> Streptococcus pneumoniae SPN994039 </option>
					<option value = "Streptococcus_pneumoniae_SPNA45"> Streptococcus pneumoniae SPNA45 </option>
					<option value = "Streptococcus_pneumoniae_strain_670_6B"> Streptococcus pneumoniae strain 670-6B </option>
					<option value = "Streptococcus_pneumoniae_strain_70585"> Streptococcus pneumoniae strain 70585 </option>
					<option value = "Streptococcus_pneumoniae_strain_AP200"> Streptococcus pneumoniae strain AP200 </option>
					<option value = "Streptococcus_pneumoniae_strain_ATCC_700669"> Streptococcus pneumoniae strain ATCC-700669 </option>
					<option value = "Streptococcus_pneumoniae_strain_CGSP14"> Streptococcus pneumoniae strain CGSP14 </option>
					<option value = "Streptococcus_pneumoniae_strain_D39"> Streptococcus pneumoniae D39 </option>
					<option value = "Streptococcus_pneumoniae_strain_Hungary19A-6"> Streptococcus pneumoniae strain Hungary19A-6 </option>
					<option value = "Streptococcus_pneumoniae_strain_INV104"> Streptococcus pneumoniae strain INV104</option>
					<option value = "Streptococcus_pneumoniae_strain_INV200"> Streptococcus pneumoniae strain INV200 </option>
					<option value = "Streptococcus_pneumoniae_strain_JJA"> Streptococcus pneumoniae strain JJA </option>
					<option value = "Streptococcus_pneumoniae_strain_OXC141"> Streptococcus pneumoniae strain OXC141 </option>
					<option value = "Streptococcus_pneumoniae_strain_P1031"> Streptococcus pneumoniae strain P1031 </option>
					<option value = "Streptococcus_pneumoniae_strain_ST556"> Streptococcus pneumoniae strainST556 </option>
					<option value = "Streptococcus_pneumoniae_strain_Taiwan19F-14"> Streptococcus pneumoniae Taiwan19F-14 </option>
					<option value = "Streptococcus_pneumoniae_strain_TCH8431"> Streptococcus pneumoniae strain TCH8431 </option>
					<option value = "Streptococcus_pneumoniae_TIGR4"> Streptococcus pneumoniae TIGR4 </option>
				</select>
			</div>
			<div id = "parameter" style = "display:none;">
			<p class="MCContent1"><b> Algorithm parameters </b></p>
			<table style = "margin-left: 50px;">
			<tr><td style = "font: 12px verdana; padding: 5px;"> Word size </td>
			    <td><div class = "styled-selectB"><select name = "word_size">
			    		<option value = "3" id = "proteinws1" style = "display:none;"> 3 </option>	
			    	 	<option value = "2" id = "proteinws2" style = "display:none;"> 2 </option>
			    	 	<option value = "6" id = "nucleows1" style = "display:none;"> 6 </option>
			    	 	<option value = "7" id = "nucleows2" style = "display:none;"> 7 </option>
			    	 	<option value = "8" id = "nucleows3" style = "display:none;"> 8 </option>
			    	 	<option value = "9" id = "nucleows4" style = "display:none;"> 9 </option>
			    	 	<option value = "10" id = "nucleows5" style = "display:none;"> 10 </option>
			    	 </select></div></td> </tr>
			<tr id = "proteinmat" style = "display:none;"> <td style = "font: 12px verdana; padding: 5px;"> Choose matrix </td>
				<td><div class = "styled-selectB" ><select name = "choo_matrix" onchange = "mat(this.value);">
					<option> Select </option>
					<option value = "PAM30"> PAM30 </option>
			    	 	<option value = "PAM70"> PAM70 </option>
			    	 	<option value = "BLOSUM80"> BLOSUM80 </option>
			    	 	<option value = "BLOSUM62"> BLOSUM62 </option>
			    	 	<option value = "BLOSUM45"> BLOSUM45 </option>
			    	 </select></div> </td></tr> 
			<tr><td style = "font: 12px verdana; padding: 5px;display:none;" id = "gapmain"> Gap costs </td>
			    <td> <div class = "styled-select" style = "display:none;" id = "gapmain1"> <select name = "gap">
					<option selected id = "dummy"> Select </option>
					<option value = "13,2" id = "gap1"> Existence 13, Extension 2 </option>		    
			    	 	<option value = "12,2" id = "gap2"> Existence 12, Extension 2 </option>			     
			    	 	<option value = "11,2" id = "gap3"> Existence 11, Extension 2 </option>
			    	 	<option value = "10,2" id = "gap4"> Existence 10, Extension 2 </option>
			    	 	<option value = "9,2" id = "gap5"> Existence 9, Extension 2 </option>
			    	 	<option value = "8,2" id = "gap6"> Existence 8, Extension 2 </option>
			    	 	<option value = "7,2" id = "gap7"> Existence 7, Extension 2 </option>
			    	 	<option value = "6,2" id = "gap8"> Existence 6, Extension 2 </option>
			    	 	<option value = "17,1" id = "gap9"> Existence 17, Extension 1 </option>
			    	 	<option value = "16,1" id = "gap10"> Existence 16, Extension 1 </option>
			    	 	<option value = "13,1" id = "gap11"> Existence 13, Extension 1 </option>
			    	 	<option value = "12,1" id = "gap12"> Existence 12, Extension 1 </option>
			    	 	<option value = "11,1" id = "gap13"> Existence 11, Extension 1 </option>
			    	 	<option value = "10,1" id = "gap14"> Existence 10, Extension 1 </option>
			    	 	<option value = "9,1" id = "gap15"> Existence 9, Extension 1 </option>
			    	 </select></div> </td></tr>
			</table></div>						
			<center><input style = "font: 14px verdana; border: outset 3px black;" type = "submit" value = \"BLAST\" />
			<input type = "reset" style = "font: 14px verdana; border: outset 3px black;" value = "Reset" onclick="resetblast();"/></center>
		</form>
	<br/><br/><br/></div>

</body>
</html>
EOF1





