#!/usr/bin/perl

use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use DBI;
print "Content-Type: text/html \n\n";
$pdb_id = param ('pdb_id');
$pdb = $pdb_id;
$pdb =~ s/.pdb//g;
print "<p style = \"text-align:center;\">$pdb</p>";
print <<"EOF";
<html>
<head> 
<script src="/SPGDB/jmol-12.2.9/Jmol.js" type="text/javascript"> </script>
<script language='JavaScript'>
var zoom=0;
function onzoomin(){
  
    zi='move 0 0 0 100 0 0 0 0 1';
  	zoom=zoom-100;
    document.jmol.script(zi);
}

function onzoomout(){ 
    zo='move 0 0 0 -100 0 0 0 0 1';
    	zoom=zoom+100;
    document.jmol.script(zo);
}

function onspin()
{
  
    if(document.jmol_form.spin.checked==true)
	{
  
    		document.jmol.script('spin on;delay 1;');
	}

	if(document.jmol_form.spin.checked==false)
	{
  
    		document.jmol.script('spin off;');
	}
}

function onrotation()
{
  
 if(document.jmol_form.rotation.checked==true)
	{
  
    		document.jmol.script('move 360 0 0 0 0 0 0 0 6;');
	}

	if(document.jmol_form.rotation.checked==false)
	{
  
    		document.jmol.script('');
	}
}

function onbackbone(){
	//document.jmol_form.angle.checked=false;
 if(document.jmol_form.backbone.checked==true)
	{
  
    		document.jmol.script('select all;backbone 0.1;');
	}

	if(document.jmol_form.backbone.checked==false)
	{
  
    		document.jmol.script('select all;backbone off;');
	}
}

function onatom()
{
  	aa = 'protein';
  	bb = 'protein';
    at=document.jmol_form.atom.options[document.jmol_form.atom.selectedIndex].value;
    //alert(at);
  
    document.jmol.script("select "+aa+","+bb+";"+at);
}

function onwire()
{
  	aa = 'protein';
  	bb = 'protein';
    wi=document.jmol_form.wire.options[document.jmol_form.wire.selectedIndex].value;
  	//alert(wi);
    document.jmol.script("select "+aa+","+bb+";"+wi);
}

function onbg()
{
  
    jaya=document.jmol_form.background.options[document.jmol_form.background.selectedIndex].value;
  
    document.jmol.script(jaya);
}

function ongra()
{
  
    jaya1=document.jmol_form.gra.options[document.jmol_form.gra.selectedIndex].value;
  
    document.jmol.script(jaya1);
}

function oncolor()
{
  
    cr=document.jmol_form.color.options[document.jmol_form.color.selectedIndex].value;
  
    document.jmol.script(cr);
}

function onsnap()
{
  
    sn='write IMAGE GIF snap1';
    document.jmol.script(sn);
}
</script>

</head>
<body>
<div>
<center>
<form name='jmol_form'>
<applet id='jmol_applet' name='jmol' code='JmolApplet' archive='/SPGDB/jmol-12.2.9/JmolAppletSigned.jar' width='700' height='450' align='center'>
        <param name='load' value='/SPGDB/jmol-12.2.9/pdb/$pdb_id'>
        <param name='bgcolor' value='black'>
        <param name='progressbar' value='true'>
        <param name='script' id='script' value='select hetero;color cpk;backbone on;ribbon off;cartoon off;wireframe on;backbone 100;select protein;backbone only;ribbon off;cartoon off;wireframe off;backbone 100;color cpk;color opaque;set measurements angstroms;set antialiasdisplay on;set measurements 0.1;set monitor 2;show waters'>
        </applet>
        <br><br><center><a href="javascript:onzoomin()" style='text-decoration:none;'><img src="/SPGDB/images/zoom_in.png" width='30px' height='30px' title='Zoom In'></a>&nbsp;&nbsp;<a href="javascript:onzoomout()" style='text-decoration:none;'><img src="/SPGDB/images/zoom_out.png" width='30px' height='30px' title='Zoom Out'></a>&nbsp;&nbsp;<a href="javascript:onsnap()" style='text-decoration:none;'><img src="/SPGDB/images/snapshot.png" width='30px' height='30px' title='Snapshot'></a><br>

<input type='checkbox' name='spin' onClick='onspin()'><j style = "font: 14px verdana;line-height:30px;">Rotation</j>&nbsp;
<input type='checkbox'  name='rotation'  onClick='onrotation()'><j style = "font: 14px verdana;line-height:30px;">Spin</j>&nbsp;&nbsp;

<!--<input type='checkbox'  name='dots'  onClick='ondots()'>Dots&nbsp;&nbsp;-->
<!--<input type='checkbox'  name='label' onClick='onlabel()' disabled>Label&nbsp;&nbsp;-->
<!--<input type='checkbox'  name='measure' onClick='onmeasure()' disabled>Measure&nbsp;&nbsp;-->
<!--<input type='checkbox'  name='distance' onClick='ondistance()' disabled>DA distance&nbsp;&nbsp;==>
<!--<input type='checkbox' name='hadistance' onclick='onhadistance()' disabled>HA disatnce&nbsp;-->
<!--<input type='checkbox'  name='angle' onClick='onangle()' disabled>DHA Angle&nbsp;&nbsp;-->
<input type='checkbox' name='backbone' checked onClick='onbackbone()'><j style = "font: 14px verdana;line-height:30px;">Backbone</j><br>

<medium><j style = "font: 14px verdana;line-height:30px;">Atom size:</j></medium>
<select name='atom' onChange='onatom()'>
<option value='spacefill off' selected>off</option>
<option value='spacefill 0.25' >0.25</option>
<option value='spacefill 25%'>25%</option>
<option value='spacefill 0.5'>0.5</option>
<option value='spacefill 100%'>100%</option>
</select>&nbsp;&nbsp;

<medium><j style = "font: 14px verdana;line-height:30px;">Wireframe:</j></medium>
<select name='wire' onChange='onwire()'>
<option value='wireframe off' selected>off</option>
<option value='wireframe 5'>5</option>
<option value='wireframe 35'>35</option>
<option value='wireframe 50'>50</option>
<option value='wireframe 0.5'>0.5</option>

</select>&nbsp;&nbsp;<br>

<medium><j style = "font: 14px verdana;line-height:30px;">Background color:</j></medium>
<select name='background' onChange='onbg()' >
<option value='background black' selected>black</option>
<option value='background white' >white</option>
<option value='background grey' >grey</option>
<option value='background brown' >brown</option>
<option value='background skyblue' >blue</option>
</select>&nbsp;&nbsp;

<medium><j style = "font: 14px verdana;line-height:30px;">Graphics:</j></medium>
<select name='gra' onChange='ongra()' >
<option value='cartoon;ribbon off;strands off;trace off;meshribbon off;rocket off;backbone off;' >cartoon</option>
<option value='cartoon off;ribbon;strands off;trace off;meshribbon off;rocket off;backbone off;' >ribbon</option>
<option value='cartoon off;ribbon off;strands on;trace off;meshribbon off;rocket off;backbone off;' >strands</option>
<option value='cartoon off;ribbon off;strands off;trace 10;meshribbon off;rocket off;backbone off;' >trace</option>
<option value='cartoon off;ribbon off;strands off;trace off;meshribbon on;rocket off;backbone off;' >meshribbon</option>
<option value='cartoon off;ribbon off;strands off;trace off;meshribbon off;rocket on;backbone off;' >rocket</option>
<option value='cartoon off;ribbon off;strands off;trace off;meshribbon off;rocket off;backbone 0.1;' selected>backbone</option>
</select>&nbsp;&nbsp;


<medium><j style = "font: 14px verdana;line-height:30px;">Color:</j></medium>
<select name='color' id='color' onChange='oncolor()' >
<option value='color cpk' selected>cpk</option>
<option value='color structure' >structure</option>
<option value='color group' >group</option>
<option value='color chain' >chain</option>
<option value='color temperature' >temp</option>
<option value='color amino'>amino</option>
<option value='color translucent' >translucent</option>
<option value='color shapely' >shape</option>
</select></center>

</form>
</center>
</div>
</body>      
</html>
EOF


