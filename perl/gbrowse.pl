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
	<p class="MCHead"> GBrowse </p> 
	<p class="MCContent2"> Select a <i> Streptococcus pneumoniae </i> genome to visualize in GBrowse </p>
	<div class = "styled-select">
		<select id = "organism" name = "organism" onchange = "gbrowse(this.value)";>
			<option> Select----------- </option>
			<option value = "Streptococcus pneumoniae 670-6B"> Streptococcus pneumoniae 670-6B </option>
			<option value = "Streptococcus pneumoniae 70585"> Streptococcus pneumoniae 70585 </option>
			<option value = "Streptococcus pneumoniae A026"> Streptococcus pneumoniae A026 </option>
			<option value = "Streptococcus pneumoniae AP200"> Streptococcus pneumoniae AP200 </option>
			<option value = "Streptococcus pneumoniae ATCC 700669"> Streptococcus pneumoniae ATCC 700669 </option>
			<option value = "Streptococcus pneumoniae CGSP14"> Streptococcus pneumoniae CGSP14 </option>
			<option value = "Streptococcus pneumoniae D39"> Streptococcus pneumoniae D39 </option>
			<option value = "Streptococcus pneumoniae G54"> Streptococcus pneumoniae G54 </option>
			<option value = "Streptococcus pneumoniae gamPNI0373"> Streptococcus pneumoniae gamPNI0373 </option>
			<option value = "Streptococcus pneumoniae Hungary19A-6"> Streptococcus pneumoniae Hungary19A-6 </option>
			<option value = "Streptococcus pneumoniae INV104"> Streptococcus pneumoniae INV104 </option>
			<option value = "Streptococcus pneumoniae INV200"> Streptococcus pneumoniae INV200 </option>
			<option value = "Streptococcus pneumoniae JJA"> Streptococcus pneumoniae JJA </option>
			<option value = "Streptococcus pneumoniae OXC141"> Streptococcus pneumoniae OXC141 </option>
			<option value = "Streptococcus pneumoniae P1031"> Streptococcus pneumoniae P1031 </option>
			<option value = "Streptococcus pneumoniae R6"> Streptococcus pneumoniae R6 </option>
			<option value = "Streptococcus pneumoniae SPN034156"> Streptococcus pneumoniae SPN034156 </option>
			<option value = "Streptococcus pneumoniae SPN034183"> Streptococcus pneumoniae SPN034183 </option>
			<option value = "Streptococcus pneumoniae SPN994038"> Streptococcus pneumoniae SPN994038 </option>
			<option value = "Streptococcus pneumoniae SPN994039"> Streptococcus pneumoniae SPN994039 </option>
			<option value = "Streptococcus pneumoniae SPNA45"> Streptococcus pneumoniae SPNA45 </option>
			<option value = "Streptococcus pneumoniae ST556"> Streptococcus pneumoniae ST556 </option>
			<option value = "Streptococcus pneumoniae Taiwan19F-14"> Streptococcus pneumoniae Taiwan19F-14 </option>
			<option value = "Streptococcus pneumoniae TCH8431"> Streptococcus pneumoniae TCH8431 </option>
			<option value = "Streptococcus pneumoniae TIGR4"> Streptococcus pneumoniae TIGR4 </option>
		</select>
	</div><br/><br/>
	
</div>		
</body>
</html>

EOF
