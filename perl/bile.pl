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
   	<p class = \"bhead\" style = "font: 12px verdana; font-weight: bold;"> Bile solubility test </p>
   	<p style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px; line-height:20px;">The bile (sodium deoxycholate) 		solubility test distinguishes <i> S. pneumoniae </i> from all other alpha-hemolytic streptococci. <i> S. pneumoniae </i> is bile soluble whereas all other alpha-hemolytic streptococci are bile resistant. Sodium deoxycholate (2% in water) will lyse the pneumococcal cell wall.</p>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> A. Preparation of 2% sodium deoxycholate (bile salt) solution </p>
	<ol style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;">
		<li> Dissolve 2 g of sodium deoxycholate into 100 ml sterile distilled water. </li> </ol>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> B. Performing the bile solubility test </p>
	<ol style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
		<li> Grow the isolate(s) to be tested for 18-24 hours on a BAP at 35-37°C with ~5% CO<sub>2</sub> (or in a candle-jar). </li>
		<li> Add bacterial growth from the overnight BAP to 1.0 ml of 0.85% saline to achieve turbidity in the range of a 0.5-1.0 McFarland standard. </li>
		<li> Divide the cell suspension equally into 2 tubes (0.5 ml per tube). </li>
		<li> Add 0.5 ml of 2% sodium deoxycholate (bile salts) to one tube. Add 0.5 ml of 0.85% saline to the other tube. Mix each tube well. </li>
		<li> Incubate the tubes at 35-37°C in CO<sub>2</sub>. </li>
		<li> Vortex the tubes. </li>
		<li> Observe the tubes for any clearing of turbidity after 10 minutes. Continue to incubate the tubes for up to 2 hours at 35-37°C in CO<sub>2</sub> if negative after 10 minutes. Observe again for clearing. </li></ol>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> C. Reading the bile solubility test results </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
		<li> A clearing of the turbidity in the bile tube but not in the saline control tube indicates a positive test </li> </ul>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> D. Troubleshooting </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
		<li> Partial clearing (partial solubility) is not considered positive for pneumococcal identification. Partially soluble strains that have optochin zones of inhibition of less than 14 mm are not considered pneumococci. </li> </ul>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> E. Quality control </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
		<li> Each new lot of sodium deoxycholate should be tested with positive and negative QC strains. <i> S. pneumoniae </i> strain ATCC 49619 can be used as a positive control and <i> S. mitis </i> strain ATCC 49456 can be used as a negative control. </li> </ul>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> Reference </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;">
	<li> Centers for disease control and prevention: Laboratory methods for the diagnosis of Meningitis - Chapter 8: Identification and characterisation of <i> Streptococcus pneumoniae. </i>  </li></ul>
	</div>	
</body>
</html>
EOF





