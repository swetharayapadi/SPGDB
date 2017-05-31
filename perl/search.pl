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
	<div class="MainContent">
		<p class="MCHead"> Simple search </p>
		<p class="MCContent1"> Click here to search for strains/ genes/ proteins of <i> Streptococcus pneumoniae </i> </p>
		<p class="MCContent1"><input type = "radio" name = "category" onclick="show1()"> Strain
		<input type = "radio" name = "category" onclick="show2()"> Gene
		<input type = "radio" name = "category" onclick="show3()"> Protein </p>
		<div id = "strain_input" style = "display: none;">	
			<p class = "MCContent2"><u> Strain search </u></p>
			<form method="GET" action="" id = "myForm_Strain">
				<p class="MCContent2"> Enter the strain name to search: <input type = "text" class = "textbox" id = "strain_name" name = "strain" /> 
				<input type = "button" class="resbutton" value = "Search" onclick = "go_Strain(document.getElementById('strain_name').value)"/>
				<input type = "reset" class="resbutton" value = "reset" onclick="reset_strain()"/> </p>
			</form>
			<p style = "font: 12px verdana; margin-left: 272px;"> <b> Example: </b> <i> Streptococcus pneumoniae TIGR4 </i> </p>
		</div>
		<div id = "gene_input" style = "display: none;">
			<p class = "MCContent2"><u> Gene search </u></p>
			<form method="GET" action="" id = "myForm_Gene">
				<p class="MCContent2"> Enter the gene name to search: <input type = "text" class = "textbox2" id = "gene_name" name = "gene" /> 
				<input type = "button" class="resbutton" value = "Search" onclick = "go_Gene(document.getElementById('gene_name').value)"/>
				<input type = "reset" class="resbutton" value = "reset" onclick="reset_gene()"/> </p>
			</form>	
			<p style = "font: 12px verdana; margin-left: 265px;"> <b> Example: </b> PspA  </p>			
		</div>
		<div id = "protein_input" style = "display: none;">
			<p class = "MCContent2"><u> Protein search </u></p>
			<form method="GET" action="" id = "myForm_Protein">
				<p class="MCContent2"> Enter the protein entry name to search: <input type = "text" class = "textbox2" id = "protein_name" name = "protein" /> 
				<input type = "button" class="resbutton" value = "Search" onclick = "go_Protein(document.getElementById('protein_name').value)"/>
				<input type = "reset" class="resbutton" value = "reset" onclick="reset_protein()"/> </p>
			<p style = "font: 12px verdana; margin-left: 325px;"> <b> Example: </b> Q97SR8 </p>						
			</form>			
		</div>
		<div id = "strain_result" class = "searchresult"></div>
		<div id = "gene_result" class = "searchresult"></div>
		<div id = "protein_result" class = "searchresult"></div>
</body>
</html>
EOF





