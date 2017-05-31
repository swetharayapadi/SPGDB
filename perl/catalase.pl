#!/usr/bin/perl
use CGI;
print "Content-Type: text/html \n\n";
print <<"EOF";
<html>
<head>
    <title>SPGDB: Streptococcus pneumoniae Genome database</title>
    <link rel="icon" href="/SPGDB/images/iisc_logo.jpg" type="image/x-icon">
    <link href="/SPGDB/StyleSheet_asp.css" rel="stylesheet" type="text/css" />
	<script src = "/SPGDB/MyScript.js"></script>
</head>
<body>
   	<div style = "overflow: scroll; height: 500px; width: 500px; background-color: rgba(146,231,240,0.56);">
   	<p class = \"bhead\" style = "font: 12px verdana; font-weight: bold;"> Catalase test </p>
   	<p style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px; line-height:20px;"> Catalase is the enzyme that breaks down hydrogen peroxide (H<sub>2</sub>O<sub>2</sub>) into H<sub>2</sub>O and O<sub>2</sub>. The oxygen is given off as bubbles in the liquid. The catalase test is primarily used to differentiate between gram-positive cocci. Members of the genus <i> Staphylococcus </i> are catalase-positive, and members of the genera <i> Streptococcus </i> and <i> Enterococcus </i> are catalase-negative. </p>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> A. Performing the catalase test </p>
	<ol style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
		<li> Grow the isolate(s) to be tested for 18-24 hours on a BAP at 35-37°C with ~5% CO<sub>2</sub> (or in a candle-jar). </li>
		<li> From overnight growth on the BAP, use a disposable loop to carefully remove a colony and place it on a glass slide. </li>
		<ul>
			<li> Do not transfer any of the blood agar to the slide as erythrocytes in the blood agar will cause a false-positive reaction. </li> </ul>
		<li> Add 1.0 ml of 3% H<sub>2</sub>O<sub>2</sub> to the slide and mix with the bacteria.</li>
		<ul>
			<li> H2O2 can be obtained from a commercial drug store. </li>
			<li> After initially opening, store H<sub>2</sub>O<sub>2</sub> at 4°C in a tightly closed bottle as it will slowly lose potency once opened. </li></ul>
		<li> Observe the bacterial suspension on the slide immediately for vigorous bubbling. </li>
		<li> It is essential to use a known positive and negative quality control (QC) strain. A <i> Staphylococcus spp. </i> strain can be used for a positive control and a known <i> S. pneumoniae </i> strain or any other streptococcal spp., i.e., <i> S. pyogenes </i> can be used for a negative control. </li></ol>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> B. Reading the catalase test results </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
		<li> The absence of bubbling from a transferred colony indicates a negative test.</li>
		<li> Any bubbling from a transferred colony indicates a positive test.</li> </ul>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> C. Troubleshooting </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
		<li> False positives will result from transfer of red blood cells so take care when picking colonies from the BAP for this test. </li> </ul>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> D. Quality control </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
	<li> It is essential to use a known positive and negative QC strain as described in the procedure. Opened bottles should be checked against a known catalase positive organism every 6 months. </li> </ul>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> Reference </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;">
	<li> Centers for disease control and prevention: Laboratory methods for the diagnosis of Meningitis - Chapter 8: Identification and characterisation of <i> Streptococcus pneumoniae. </i>  </li></ul>
	</div>	
</body>
</html>
EOF





