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
   	<p class = bhead> Laboratory Diagnosis </p>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: center;"> Figure: Flow chart for identification and characterization of a <i> Streptococcus pneumoniae </i> isolate </p>
   	<div style = "background-image: url('/SPGDB/images/diagnosis_flowchart.png'); background-size: 1000px 500px; width: 1020px; height: 510px;">
   		<p> <img src = "/SPGDB/images/qmark.png" class = "qmark" onclick = "winsize_Gram();" style = "margin-left: 70px; margin-top: -190px;" id = "gram_stain"/></p>
		<p> <img src = "/SPGDB/images/qmark.png" class = "qmark" onclick = "winsize_Catalase();" style = "margin-left: 285px; margin-top: -175px;" id = "Catalase"/></p>
		<p> <img src = "/SPGDB/images/qmark.png" class = "qmark" onclick = "winsize_Optochin();" style = "margin-left: 670px; margin-top: -160px;" id = "Optochin"/></p>
		<p> <img src = "/SPGDB/images/qmark.png" class = "qmark" onclick = "winsize_Bile();" style = "margin-left: 790px; margin-top: -275px;"/></p>
	</div>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: center;"> Reference: The flow chart redrawn from reference no. 26. </p>
	</div>	
</body>
</html>
EOF





