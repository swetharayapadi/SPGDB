#!/usr/bin/perl
use CGI;
use DBI;
use lib '\cgi-bin\SPGDB';
use Main;
print "Content-Type: text/html \n\n";
Main_Menu();
$db = "SPDB";
$user = "root";
$password = "";
$host = "localhost";
$dbh = DBI -> connect("DBI:mysql:$db:$host", $user, $password);
$query = "select * from strain_list";
$sth = $dbh -> prepare ($query);
$sth -> execute;
=sdf
while (@list = $sth -> fetchrow_array()){
	$organism[$k] = $list[1]; $details = $list[2]; $bioproject1 = $list[3]; $bioproject2 = $list[5];
	$assembly = $list[7]; $status = $list[8]; $chromosome = $list[9]; $size = $list[10]; $gc = $list[11];
	$gene = $list[12]; $protein = $list[13]; $accession = $list[14]; $gi = $list[15]; $bp = $list[16];
	#print $organism;
	#@org = split(/,/,$organism);
	#print "@org<br/>";
}
=cut
print <<"EOF";
<html>
<body>
   <div class="MainContent">
		<p class="MCHead"> Advance search </p> 
		<p class="MCContent2">Please select the strain of interest</p>
		<div class = "styled-select">
		<select id = "organism" name = "organism">
EOF
			while (@list = $sth -> fetchrow_array()){
			$organism = $list[1];
			print "<option value = \"$organism\"> $organism </option></p>";
			}
		print "</select></div>";
print <<"EOF2";
		<!-- ###################### gene/protein ################ -->
		<p class="resheaddrop" onclick="show_Adv()";> Browse gene/protein <img class = "dropdown" src="/SPGDB/images/btn_dwn.png" /> </p>
		<div id = "search1" style = "display: none; border: 1px solid black; border-radius: 3px; margin-left: 30px; margin-right: 30px;">
		<div><img class = "closeadv" onclick = close1() src="/SPGDB/images/close.png"/>
		<p class="MCContent1" style= "margin-left:100px;">
		<input type = "radio" name = "category" onclick="show4();"> Gene		
		<input type = "radio" name = "category" onclick="show5();"> Protein </p> </div>
		
		<div id = "gene_input" style = "display: none; margin-left:100px;">
			<p class = "MCContent2"><u> Gene search </u></p>
			<form method="GET" action="" id = "myForm_Gene">
				<p class="MCContent2"> Enter the gene name to search: <input type = "text" class = "textbox2" id = "gene_name" name = "gene" /> 
				<input type = "button" class="resbutton" value = "Search" onclick = "go_Gene_Adv(document.getElementById('gene_name').value,document.getElementById('organism').value)"/>
				<input type = "reset" class="resbutton" value = "reset" onclick="reset_gene()"/> </p>
			</form>	
			<p style = "font: 12px verdana; margin-left: 265px;"> <b> Example: </b> PspA  </p>		
		</div>
		<div id = "protein_input" style = "display: none; margin-left:100px;">
			<p class = "MCContent2"><u> Protein search </u></p>
			<form method="GET" action="" id = "myForm_Protein">
				<p class="MCContent2"> Enter the protein entry name to search: <input type = "text" class = "textbox2" id = "protein_name" name = "protein" /> 
				<input type = "button" class="resbutton" value = "Search" onclick = "go_Protein_Adv(document.getElementById('protein_name').value,document.getElementById('organism').value)"/>
				<input type = "reset" class="resbutton" value = "reset" onclick="reset_protein()"/> </p>
			</form>
			<p style = "font: 12px verdana; margin-left: 325px;"> <b> Example: </b> Q97SR8 </p>				
		</div>
		<div id = "gene_result" class = "searchresult"></div>
		<div id = "protein_result" class = "searchresult"></div>
		</div>
		<!-- ###################### review/unreview ################ -->
		<p class="resheaddrop" onclick="show_Adv1()"> Browse reviewed/Unreviewed proteins <img class = "dropdown" src="/SPGDB/images/btn_dwn.png" /> </p>
		<div id = "search2" style = "display: none; border: 1px solid black; border-radius: 3px; margin-left: 30px; margin-right: 30px;">
		<div><img class = "closeadv" onclick = close2() src="/SPGDB/images/close.png"/>
			<form method = "GET" action = "">
				<p class="MCContent1" style= "margin-left:100px;">
				<input type = "radio" id = status name = "category" value = "reviewed" onclick = "go_Protein_Rev(1,document.getElementById('status').value,document.getElementById('organism').value)"> Reviewed		
				<input type = "radio" id = status1 name = "category" value = "unreviewed" onclick = "go_Protein_Rev(1,document.getElementById('status1').value,document.getElementById('organism').value)"> Unreviewed 
				</form>
		</div>
		<div id = "review_result" class = "searchresult"></div>
		<div id = "unreview_result" class = "searchresult"></div>
		</div>
		<!-- ###################### subcellular localization ################ -->
		<p class="resheaddrop" onclick="show_Adv2();"> Browse proteins by subcellular localization <img class = "dropdown" src="/SPGDB/images/btn_dwn.png" /> </p>
		<div id = "search3" style = "display: none; border: 1px solid black; border-radius: 3px; margin-left: 30px; margin-right: 30px;">
		<div><img class = "closeadv" onclick = close3() src="/SPGDB/images/close.png"/>
			<form method = "GET" action = "">
				<p class="MCContent1" style= "margin-left:100px;">
				<table>
				<tr>
					<td style = "font: 12px verdana; font-weight: bold;"> Select location </td>
					<td> <div class = "styled-select" style = "margin-left: 0px;">
					<select name = "location" onchange="go_locate(1,this.value,document.getElementById('organism').value)">
						<option> Options----- </option>
						<option value = "cytoplasm"> Cytoplasm </option>
						<option value = "cell membrane"> Cell membrane </option>
						<option value = "peripheral membrane"> Peripheral membrane </option>
						<option value = "multi-pass membrane"> Multi-pass membrane </option>
						<option value = "single-pass membrane"> Single-pass membrane </option>  
					</select>
					</div> </td></tr></table>
				</p>	
			</form>
		</div>
		<div id = "location_result" class = "searchresult"></div>
		</div>
		<!-- ###################### pattern/profile ################ -->
		<p class="resheaddrop" onclick="show_Adv3();"> Browse proteins by pattern/profile <img class = "dropdown" src="/SPGDB/images/btn_dwn.png" /> </p>
		<div id = "search4" style = "display: none; border: 1px solid black; border-radius: 3px; margin-left: 30px; margin-right: 30px;">
		<div><img class = "closeadv" onclick = close4() src="/SPGDB/images/close.png"/>
			<form method = "GET" action = "">
				<p class="MCContent1" style= "margin-left:100px;">
				<table>
				<tr>
					<td style = "font: 12px verdana; font-weight: bold;"> Select domain category </td>
					<td> <div class = "styled-selectB" style = "margin-left: 0px;">
					<select name = "domain" id = "domain" onclick = "patpro(this.value);">
						<option> Options-------- </option>
						<option value = "profile"> Profile </option>
						<option value = "pattern"> Pattern </option>
					</select>
					</div> </td> </tr> <tr></tr><tr></tr>
				<tr>
					<td id = "profile_head" style = "font: 12px verdana; font-weight: bold; display: none;"> Select a profile </td>
					<td> <div class = "styled-select" id = "profile_list" style = "display:none; margin-left: 0px;">
					<select name = "domain" onchange="go_Domain(1,this.value,document.getElementById('organism').value)">
						<option> Options--------- </option>
						<option value = "ACT domain"> ACT </option>
						<option value = "ATP-cone domain"> ATP-cone </option>
						<option value = "ATP-grasp domain"> ATP-grasp </option>					
						<option value = "B5 domain"> B5 </option>					
						<option value = "FDX-ACB domain"> FDX-ACB </option>					
						<option value = "BRCT domain"> BRCT </option>					
						<option value = "CBS domain"> CBS </option>					
						<option value = "DAGKc domain"> DAGKc </option>					
						<option value = "EngC GTPase domain"> EngC GTPase </option>					
						<option value = "FAD-binding FR-type domain"> FAD-binding FR-type </option>					
						<option value = "Fe/B12 periplasmic-binding domain"> Fe/B12 periplasmic-binding </option>					
						<option value = "Flavodoxin-like domain"> Flavodoxin-like </option>					
						<option value = "FtsK domain"> FtsK domain </option>					
						<option value = "GIY-YIG domain"> GIY-YIG </option>					
						<option value = "UVR domain"> UVR domain </option>					
						<option value = "GMPS ATP-PPase (ATP pyrophosphatase) domain"> GMPS ATP-PPase </option>					
						<option value = "Guanylate kinase-like domain"> Guanylate kinase-like </option>					
						<option value = "HTH deoR-type DNA-binding domain"> HTH deoR-type DNA-binding </option>					
						<option value = "HTH lysR-type DNA-binding domain"> HTH lysR-type DNA-binding </option>					
						<option value = "HTH merR-type DNA-binding domain"> HTH merR-type DNA-binding </option>					
						<option value = "HTH tetR-type DNA-binding domain"> HTH tetR-type DNA-binding </option>					
						<option value = "KH"> KH </option>					
						<option value = "PTS EIIA type-1 domain"> PTS EIIA type-1 </option>					
						<option value = "PTS EIIA type-2 domain"> PTS EIIA type-2 </option>					
						<option value = "PTS EIIB type-1 domain"> PTS EIIB type-1 </option>					
						<option value = "PTS EIIB type-2 domain"> PTS EIIB type-2 </option>					
						<option value = "PUA domain"> PUA </option>					
						<option value = "Response regulatory domain"> Response regulatory </option>					
						<option value = "S1-like domain"> S1-like </option>					
						<option value = "Smr domain"> Smr </option>					
						<option value = "SSB domain"> SSB </option>					
						<option value = "THUMP domain"> THUMP </option>					
						<option value = "Toprim domain"> Toprim </option>					
						<option value = "TRAM domain"> TRAM </option>					
						<option value = "UmuC domain"> UmuC </option>					
						<option value = "UVR domain"> UVR </option>					
						<option value = "Helicase ATP-binding domain"> Helicase ATP-binding </option>					
						<option value = "Helicase C-terminal domain"> Helicase C-terminal </option>					
						<option value = "YjeF C-terminal domain"> YjeF C-terminal </option>					
						<option value = "YrdC-like domain"> YrdC-like </option>					
					</select>					
					</div></td></tr>
				<tr>
					<td id = "pattern_head" style = "font: 12px verdana; font-weight: bold; display: none;"> Select a pattern </td>
					<td> <div class = "styled-select" id = "pattern_list" style = "display:none; margin-left: 0px;">
					<select name = "domain" onchange="go_Domain(1,this.value,document.getElementById('organism').value)">
						<option> Options--------- </option>
						<option value = "ABC transporter domain"> ABC transporter </option>
						<option value = "J domain"> J </option>					
						<option value = "CR-type zinc finger"> CR-type zinc finger </option>
						<option value = "Glycine radical domain"> Glycine radical </option>					
						<option value = "HTH araC/xylS-type DNA-binding domain"> HTH araC/xylS-type DNA-binding </option>
						<option value = "HTH lacI-type DNA-binding domain"> HTH lacI-type DNA-binding </option>					
						<option value = "HTH marR-type DNA-binding domain"> HTH marR-type DNA-binding </option>
						<option value = "Lipoyl-binding domain"> Lipoyl-binding </option>
						<option value = "PpiC domain"> PpiC domain </option>
						<option value = "Rhodanese domain"> Rhodanese </option>
						<option value = "Thioredoxin domain"> Thioredoxin </option>					
					</select>
					</div> </td></tr></table>
				</p>	
			</form>
		</div>
		<div id = "domain_result" class = "searchresult"></div>
		</div>
		<!-- ###################### COG category ################ -->
		<p class="resheaddrop" onclick="show_Adv4();"> Browse proteins by COG category <img class = "dropdown" src="/SPGDB/images/btn_dwn.png" /> </p>
		<div id = "search5" style = "display: none; border: 1px solid black; border-radius: 3px; margin-left: 30px; margin-right: 30px;">
		<div><img class = "closeadv" onclick = close5() src="/SPGDB/images/close.png"/>
			<form method = "GET" action = "">
				<p class="MCContent1" style= "margin-left:100px;">
					<table>
					<tr>
						<td style = "font: 12px verdana; font-weight: bold;"> Select COG category </td>
						<td> <div class = "styled-select" style = "margin-left: 0px;">
					<select name = "COG" onchange="go_Cog(1,this.value,document.getElementById('organism').value)">
						<option> Options--------- </option>
						<option value = "Amino acid transport"> Amino acid transport </option>					
						<option value = "carbohydrate transport"> Carbohydrate transport </option>
						<option value = "CDP-diacylglycerol biosynthetic process"> CDP-diacylglycerol biosynthetic process </option>					
						<option value = "cell cycle"> Cell cycle control </option>					
						<option value = "cell division"> Cell division </option>
						<option value = "cell wall"> Cell wall </option>					
						<option value = "cytidylyltransferase activity"> Cytidylyltransferase activity</option>
						<option value = "cytosine deaminase activity"> Cytosine deaminase activity </option>
						<option value = "defense response"> Defense mechanism </option>
						<option value = "DNA polymerase activity"> DNA polymerase activity </option>					
						<option value = "DNA binding; DNA recombination; DNA repair"> DNA binding, DNA recombination, DNA repair </option>
						<option value = "DNA replication"> DNA replication </option>					
						<option value = "exopolyphosphatase activity"> Exopolyphosphatase activity</option>					
						<option value = "ferredoxin-NADP+ reductase activity"> Ferredoxin-NADP+ reductase activity </option>
						<option value = "integrase activity"> Integtrase activity </option>
						<option value = "NAD binding"> NAD binding</option>
						<option value = "oxoglutarate aminotransferase activity"> Oxoglutarate aminotransferase activity</option>					
						<option value = "penicillin binding"> Penicillin binding </option>
						<option value = "regulation of transcription"> Regulation of transcription </option>
						<option value = "RNA binding"> RNA binding</option>					
						<option value = "RNA processing"> RNA processing </option>					
						<option value = "signal transduction"> Signal transduction mechanisms </option>
						<option value = "superoxide dismutase activity"> Superoxide dismutase activity </option>					
						<option value = "structural constituent of ribosome; translation"> Translation, ribosomal structure</option>
						<option value = "uridine kinase activity"> Uridine kinase activity </option>
					</select>
					</div> </td></tr></table>
				</p>	
			</form>
		</div>
		<div id = "COG_result" class = "searchresult"></div>
		</div>
		<!-- ###################### virulence ################ -->
		<p class="resheaddrop" onclick="show_Adv5();"> Browse virulent genes <img class = "dropdown" src="/SPGDB/images/btn_dwn.png" /> </p>
		<div id = "search6" style = "display: none; border: 1px solid black; border-radius: 3px; margin-left: 30px; margin-right: 30px;">
		<div><img class = "closeadv" onclick = close6() src="/SPGDB/images/close.png"/>
			<form method = "GET" action = "">
				<p class="MCContent1" style= "margin-left:100px;">
					<input type = "radio" id = "virulence" name = "virulence" value = "yes" onclick = "go_Virule(1,document.getElementById('virulence').value,document.getElementById('organism').value)";> Virulent genes		
				</p>	
			</form>
		</div>
		<div id = "virulence_result" class = "searchresult"></div>
		</div>
</div>
</body>
</html>
EOF2





