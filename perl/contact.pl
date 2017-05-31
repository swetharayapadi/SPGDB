#!/usr/bin/perl
use CGI;
use DBI;
use lib '\cgi-bin\SPGDB';
use Main;
print "Content-Type: text/html \n\n";
Main_Menu ();
print <<"EOF";
<div class = "MainContent">
	<p class = "MCHead"> Contact persons </p>
	<p class = "contact1"> 1. Dr. K. Sekar </p>
		<table style = "font: 14px verdana; margin-left: 30px;">	
			<tr>
			<td valign = "top"> Address </td>
			<td valign = "top"> : </td>
			<td> Dr. K. Sekar, </br>
				 Supercomputer Education and Research Centre, </br>
				 Room No: 341, 2<sup>nd</sup> Floor, Old CES Building, </br>
				 Indian Institute of Science, </br>
				 Bangalore - 560 012, </br>
		 		 India. </br> </td> </tr>
		 	<tr> 
		 	<td valign = "top"> E-mail </td>
		 	<td valign = "top"> : </td>
		 	<td> sekar\@physics.iisc.ernet.in </br>
			     sekar\@serc.iisc.ernet.in </td> </tr>
			<tr>
			<td> Telephone </td>
			<td> : </td>
			<td> +91-080-22933059 / 22933060 / 23600551 </td></tr>
			<tr>
			<td> Telefax </td>
			<td> : </td>
			<td> +91-080-23600085 </td> </tr>
		</table>
	<p class = "contact1"> 2. Dr. Anand Anbarasu </p>
		<table  style = "font: 14px verdana; margin-left: 30px;">
			<tr>
			<td valign = "top"> Address </td>
			<td valign = "top"> : </td>
			<td> Dr. Anand Anbarasu, </br>
				 Professor, </br>
				 Medical and Biological Computing Laboratory, </br>
				 VIT University, </br>
				 Vellore - 632 014, <br>
				 India. </td> </tr>
		 	<tr> 
		 	<td> E-mail </td>
		 	<td> : </td>
		 	<td> aanand\@vit.ac.in </td> </tr>
			<tr>
			<td> Telephone </td>
			<td> : </td>
			<td> +91-416-2202547 </td></tr>
			<tr>
			<td> Telefax </td>
			<td> : </td>
			<td> +91-416-2243092 </td> </tr>
		</table>		  
		 		 
		
</div>
EOF


