#!/usr/bin/perl
use CGI;
print "Content-Type: text/html \n\n";
print <<"EOF";
<html>
<head>
    <title>SPGDB: Streptococcus pneumoniae database</title>
    <link rel="icon" href="/SPGDB/images/iisc_logo.jpg" type="image/x-icon">
    <link href="/SPGDB/StyleSheet_asp.css" rel="stylesheet" type="text/css" />
	<script src = "/SPGDB/MyScript.js"></script>
</head>
<body>
   	<div style = "overflow: scroll; height: 500px; width: 500px; background-color: rgba(146,231,240,0.56);">
   	<p class = \"bhead\" style = "font: 12px verdana; font-weight: bold;"> Optochin test </p>
   	<p style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px; line-height:20px;"> <i> S. pneumoniae </i> strains are sensitive to the chemical optochin (ethylhydrocupreine hydrochloride). Optochin sensitivity allows for the presumptive identification of alpha-hemolytic <i> streptococci </i> as <i> S. pneumoniae </i>, although some pneumococcal strains are optochin-resistant. Other alpha-
hemolytic streptococcal species are optochin-resistant. </p>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> A. Performing the Optochin test </p>
	<p style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px; line-height:20px;"> Optochin (P) disks (6 mm, 5 μg) can be obtained from a commercial vendor. Optochin disks are often called “P disks” and many commercial versions are labeled with a capital “P”. If a commercial source of P disks is not available, a 1:4000 solution of ethylhydrocupreine hydrochloride can be applied to sterile 6 mm filter paper disks. </p>
	<ol style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
		<li> Grow the strain(s) to be tested for 18-24 hours on a BAP at 35-37°C with ~5% CO<sub>2</sub> (or in a candle-jar). </li>
		<li> Use a disposable loop to remove an isolated colony from the overnight culture on the BAP and streak onto one half of a BAP. </li>
		<ul> <li> Two different isolates can be tested on the same plate, but care must be taken to ensure that the cultures do not overlap. </li></ul>
		<li> Place a P disk within the streaked area of the plate and incubate the BAP overnight at 35-37°C with ~5% CO<sub>2</sub> (or in a candle-jar). </li>
		<li> Observe the growth on the BAP near the P disk and measure the zone of inhibition, if
applicable. </li>
	</ol>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> B. Reading the optochin test results </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
		 <li> Using a 6 mm, 5 μg disk, a zone of inhibition of 14 mm or greater indicates sensitivity and allows for presumptive identification of pneumococci. </li>
		 <li> Zones of inhibition should be measured from the top surface of the plate with the top removed. </li> 
		 <li> Use either calipers or a ruler with a handle attached for these measurements. Measure the diameter of the zone holding the ruler over the center of the surface of the disk when measuring the zone of inhibition. In the case of an isolate completely resistant to optochin, the diameter of the disk (6 mm) should be recorded.</li>
 	</ul>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> C. Troubleshooting </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
		<li> A smaller zone of inhibition (< 14 mm) or no zone of inhibition indicates that the bile solubility test is required. It is important to remember that pneumococci are sometimes optochin-resistant. </li> </ul>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> D. Quality control </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
	<li> Each new lot of optochin disks should be tested with positive and negative controls. The growth of <i> S. pneumoniae </i> strain ATCC 49619 is inhibited by optochin and growth of <i> S. mitis </i> strain ATCC 49456  is not inhibited by optochin. </li> </ul>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> Reference </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;">
	<li> Centers for disease control and prevention: Laboratory methods for the diagnosis of Meningitis - Chapter 8: Identification and characterisation of <i> Streptococcus pneumoniae. </i>  </li></ul>
	</div>	
</body>
</html>
EOF





