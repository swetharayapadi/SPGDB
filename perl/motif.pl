#!/usr/bin/perl
use CGI;
use DBI;
use lib '\cgi-bin\SPGDB';
use Main;
print "Content-Type: text/html \n\n";
Main_Menu();
print <<"EOF";
<html>
<body>
	<div class = "MainContent">
	<form method = "POST" action = "" id = "myForm_motif">
		<p class = "MCHead"> DNA Motif search </p>
		<p style = "font: 12px verdana;"> Search for DNA motifs in <i> Streptococcus pneumoniae </i> genome </p>
		<table>
			<tr>
				<td style = "font: 12px verdana; font-weight: bold;"> &nbsp &nbsp Select genome </td>
				<td> <div class = "styled-select" style = "margin-left: 0px;">
					<select name = "organism" id = "organism">
						<option> Options--------- </option>
						<option> Streptococcus pneumoniae 670-6B </option>
						<option> Streptococcus pneumoniae 70585 </option>
						<option> Streptococcus pneumoniae A026 </option>
						<option> Streptococcus pneumoniae AP200 </option>
						<option> Streptococcus pneumoniae ATCC 700669 </option>
						<option> Streptococcus pneumoniae CGSP14 </option>
						<option> Streptococcus pneumoniae D39 </option>
						<option> Streptococcus pneumoniae G54 </option>
						<option> Streptococcus pneumoniae gamPNI0373 </option>
						<option> Streptococcus pneumoniae Hungary19A-6 </option>
						<option> Streptococcus pneumoniae INV104 </option>
						<option> Streptococcus pneumoniae INV200 </option>
						<option> Streptococcus pneumoniae JJA </option>
						<option> Streptococcus pneumoniae OXC141 </option>
						<option> Streptococcus pneumoniae P1031 </option>
						<option> Streptococcus pneumoniae R6 </option>
						<option> Streptococcus pneumoniae SPN994039 </option>
						<option> Streptococcus pneumoniae SPN034156 </option>
						<option> Streptococcus pneumoniae SPN994038 </option>
						<option> Streptococcus pneumoniae SPN034183 </option>
						<option> Streptococcus pneumoniae SPNA45 </option>
						<option> Streptococcus pneumoniae ST556 </option>
						<option> Streptococcus pneumoniae Taiwan19F-14 </option>
						<option> Streptococcus pneumoniae TCH8431/19A  </option>
						<option> Streptococcus pneumoniae TIGR4 </option>	
					</select> </div></td></tr><tr></tr><tr></tr><tr></tr><tr></tr>
			<tr>
				<td><p style= "font: 12px verdana; font-weight: bold; margin-left: 15px; width: 175px; text-align: justify; line-height: 20px;"> Please enter the nucleotide sequence in IUPAC format <br/> &nbsp &nbsp &nbsp Instructions <img onclick = "show_Iupac()"; class = "qmark" style = "margin-top:-20px;" src = "/SPGDB/images/qmark.png" /></p> </td>
				<td> <textarea style = "margin-left: 0px;" rows = "5" cols = "50" name = "sequence" id = "sequence"></textarea> </td>
			</tr>
		</table>
		<div class = "iupac_EX" id = "example_IUPAC" style= "display:none;"> <img class = \"closepop_Iupac\" onclick = "close_Iupac()"; src=\"/SPGDB/images/close.png\"/>
			<div style = "margin-left: 50px;"> 
				<ul> <li> Enter a nucleotide sequence in IUPAC format and click the search button </li>
				 	 <li> A variable-length consensus sequence may also be entered in a format to reflect the unknown number of nucleotides </li></ul>
				<b> Example: </b> GTAN{3,5}AGTN{5,10}AGTC </br> 
				<p style = "margin-left: 15px;"> In this example any nucleotide can appear 3 to 5 times startingat position 4 and any nucleotide can appear 5 to 10 times starting at the position following the T  </p>
				<b> IUPAC format </b> </br>
				<ul> <li> A = adenine </li>
			 	  	<li> C = cytosine </li>
 				  	<li> G = guanine </li>
 				  	<li> T = thymine </li>
 				  	<li> U = uracil </li>
 				  	<li> R = G A (purine) </li>
 				  	<li> Y = T C (pyrimidine) </li>
 				  	<li> K = G T (keto) </li>
	 			  	<li> M = A C (amino) </li>
 				  	<li> S = G C </li>  
 				  	<li> W = A T </li>
 				  	<li> B = G T C </li>
 				  	<li> D = G A T </li>
 				  	<li> H = A C T </li>
		 		  	<li> V = G C A </li>  
			 	  	<li> N = A G C T (any) </li></ul>
			 </div>
		</div> </br>
		<input style = "font: 14px verdana; border: outset 3px black; margin-left: 300px;" type = "button" value = \"Search\" onclick = "go_Motifsearch(1,document.getElementById('sequence').value,document.getElementById('organism').value)"/>
		<input type = "reset" style = "font: 14px verdana; border: outset 3px black;" value = "Reset" onclick="resetmotif();"/>
	</form>
	<div id = "motifsearch_result" class = "searchresult"></div>
	</div>
</body>
</html>
EOF
