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
	<p class="MCHead"> Genome map </p> 
	<p class="MCContent2">Select a <i> Streptococcus pneumoniae </i>strain of interest</p>
	<div class = "styled-select">
		<select id = "organism" name = "organism" onchange = "genome_Map(this.value)";>
			<option> Select----------- </option>
			<option value = "Streptococcus pneumoniae 70585"> Streptococcus pneumoniae 70585 </option>
			<option value = "Streptococcus pneumoniae ATCC 700669"> Streptococcus pneumoniae ATCC 700669 </option>
			<option value = "Streptococcus pneumoniae CGSP14"> Streptococcus pneumoniae CGSP14 </option>
			<option value = "Streptococcus pneumoniae D39"> Streptococcus pneumoniae D39 </option>
			<option value = "Streptococcus pneumoniae G54"> Streptococcus pneumoniae G54 </option>
			<option value = "Streptococcus pneumoniae Hungary19A-6"> Streptococcus pneumoniae Hungary19A-6 </option>
			<option value = "Streptococcus pneumoniae JJA"> Streptococcus pneumoniae JJA </option>
			<option value = "Streptococcus pneumoniae P1031"> Streptococcus pneumoniae P1031 </option>
			<option value = "Streptococcus pneumoniae R6"> Streptococcus pneumoniae R6 </option>
			<option value = "Streptococcus pneumoniae Taiwan19F-14"> Streptococcus pneumoniae Taiwan19F-14 </option>
			<option value = "Streptococcus pneumoniae TCH8431"> Streptococcus pneumoniae TCH8431 </option>
			<option value = "Streptococcus pneumoniae TIGR4"> Streptococcus pneumoniae TIGR4 </option>
		</select>
	</div><br/><br/>
	<div id = "genome_map_image" style = "display:none;"></div>
</div>		
</body>
</html>

EOF
