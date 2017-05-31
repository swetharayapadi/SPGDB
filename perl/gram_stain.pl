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
   	<p class = \"bhead\" style = "font: 12px verdana; font-weight: bold;"> Gram stain test </p>
   	<p style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px; line-height:20px;"> The Gram stain is used to classify bacteria on the basis of their forms, sizes, cellular morphologies, and Gram reactions; in a clinical microbiology laboratory, it
is additionally a critical test for the rapid presumptive diagnosis of infectious agents and serves to assess the quality of clinical specimens. The test was originally developed by Christian Gram in 1884, but was modified by Hucker in 1921. The modified procedure provided greater reagent stability and better differentiation of organisms. Other modifications have been specifically developed for staining anaerobes and for weakly staining gram-negative bacilli (Legionella spp., Campylobacter spp., Bacteroides spp., Fusobacterium spp., Brucella spp.) by using a carbol-fuchsin or basic fuchsin counterstain. Interpretation of Gram-stained smears involves consideration of staining characteristics and cell size, shape, and arrangement. These characteristics may be influences by a number of variables, including culture age, media, incubation atmosphere, staining methods, and the presence of inhibitory substances. Similar considerations apply to the interpretation of smears from clinical specimens, and additional factors include different host cell types and possible phagocytosis. </p>
   	<p style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px; line-height:20px;"> Gram stain permits the separation of all bacteria into two large groups, those which retain the primary dye (gram-positive) and those that take the color of the
counterstain (gram-negative). The primary dye is crystal violet and the secondary dye is usually either safranin O or basic fuchsin. Some of the more common formulations include: saturated crystal violet (approximately 1%), Hucker’s crystal violet, and 2% alcoholic crystal violet </p>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> A. Performing the Gram-stain test </p>
	<ol style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
		<li> Heat-fix the glass slide containing the specimen. </li>
		<li> Flood the fixed slide with crystal violet. </li>
		<li> Allow stain to remain on for 1 min. </li> 
		<li> Rinse slide gently under running tap water. </li> 
		<li> Flood slide with the iodine solution. </li> 
		<li> Allow the solution to remain for 1 min. </li>
		<li> Rinse slide gently under running tap water. </li> 
		<li> Decolorize slide by letting the alcohol/acetone solution flow over the smear, while the slide is held at an angle. Stop applying decolorizer when the solution runs clear. </li> 
		<li> Rinse slide gently under running tap water. </li>
		<li> Flood slide with safranin. </li>
		<li> Allow stain to remain for 30 sec. </li> 
		<li> Rinse slide gently under running tap water. </li> 
		<li> Drain slide and air-dry it in an upright position </li>
		<li> Oberve under microscope </li>
	</ol>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> B. Observation under microscope </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;"> 
		<li> Gram-positive diplococci or Gram-positive cocci indicates the presence of <i> Streptococcus pnuemoniae </i></li></ul>
	<p style = "font: 12px verdana; font-weight: bold; margin:10px; text-align: justify;"> Reference </p>
	<ul style = "font: 12px verdana; margin:10px; text-align: justify; line-height:20px;">
	<li> Gram stain protocol - Medical chemical corporation  </li></ul>
	</div>	
</body>
</html>
EOF





