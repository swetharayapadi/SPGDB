#!/usr/bin/perl
use CGI qw(:standard);
use CGI::Carp qw(fatalsToBrowser);
use lib '\cgi-bin\SPGDB';
use Main;
print "Content-Type: text/html \n\n";
Main_Menu();
$input_Pseq = param ('input_prot');
$entry = param ('entry');
#print "#################$entry";
$atom_A = $atom_R = $atom_N= $atom_D = $atom_C = $atom_Q = $atom_E = $atom_G = $atom_H = $atom_I = $atom_L = $atom_K = $atom_M = $atom_F = $atom_P = $atom_S = $atom_T = $atom_W = $atom_Y = $atom_V = 0;
	$input_Pseq = "\U$input_Pseq";
	$final = join('',$input_Pseq);
	@array = split(//,$final);
	foreach $base(@array){
		if ($base eq 'A') {
			$atom_A++;
			}
		if ($base eq 'R') {
			$atom_R++;
			}
		if ($base eq 'N') {
			$atom_N++;
			}
		if ($base eq 'D') {
			$atom_D++;
			}
		if ($base eq 'C') {
			$atom_C++;
			}
		if ($base eq 'Q') {
			$atom_Q++;
			}				
		if ($base eq 'E') {
			$atom_E++;
			}
		if ($base eq 'G') {
			$atom_G++;
			}
		if ($base eq 'H') {
			$atom_H++;
			}
		if ($base eq 'I') {
			$atom_I++;
			}
		if ($base eq 'L') {
			$atom_L++;
			}
		if ($base eq 'K') {
			$atom_K++;
			}
		if ($base eq 'M') {
			$atom_M++;
			}
		if ($base eq 'F') {
			$atom_F++;
			}
		if ($base eq 'P') {
			$atom_P++;
			}
		if ($base eq 'S') {
			$atom_S++;
			}
		if ($base eq 'T') {
			$atom_T++;
			}
		if ($base eq 'W') {
			$atom_W++;
			}
		if ($base eq 'Y') {
			$atom_Y++;
			}
		if ($base eq 'V') {
			$atom_V++;
			}	 		
		}

$mw = $atom_A*71.08  + $atom_S*87.08  + $atom_M*131.21 + $atom_E*129.12 +
              $atom_Q*128.14 + $atom_D*115.09 + $atom_N*114.11 + $atom_R*156.2 +
              $atom_K*128.18 + $atom_I*113.17 + $atom_L*113.17 + $atom_G*57.06  +
              $atom_C*103.14 + $atom_F*147.18 + $atom_Y*163.18 + $atom_H*137.15 +
              $atom_P*97.12  + $atom_T*101.11 + $atom_V*99.14  + $atom_W*186.21;

$vol = $atom_A*88.6  + $atom_S*89.0  + $atom_M*162.9 + $atom_E*138.4 +
               $atom_Q*143.9 + $atom_D*111.1 + $atom_N*117.7 + $atom_R*173.4 +
               $atom_K*168.6 + $atom_I*166.7 + $atom_L*166.7 + $atom_G*60.1 +
               $atom_C*108.5 + $atom_F*189.9 + $atom_Y*193.6 + $atom_H*153.2 +
               $atom_P*122.7 + $atom_T*116.1 + $atom_V*140.0 + $atom_W*227.8;

$totalatom = $atom_A + $atom_S + $atom_M + $atom_E + $atom_Q + $atom_D + $atom_N + $atom_R +
                     $atom_K + $atom_I + $atom_L + $atom_G + $atom_C + $atom_F + $atom_Y + $atom_H +
                     $atom_P + $atom_T + $atom_V + $atom_W ;

$totiso = $atom_A* 6.02+ $atom_S*5.68 + $atom_M*6.10 + $atom_E*7.58+ $atom_Q*5.97 + $atom_D*3.22 +
                  $atom_N*2.87 + $atom_R*5.06 + $atom_K*5.41 + $atom_I*5.98 + $atom_L*5.75 + $atom_G*6.02 +
                  $atom_C*5.98 + $atom_F*5.65 + $atom_Y*5.88 + $atom_H*9.74 + $atom_P*10.76 + $atom_T*6.53 +
                  $atom_V*5.67 + $atom_W*5.97 ;
print "<html>";
print "<body>";
###################### Printing the values #######################
print "<div class=\"MainContent\">";
print "<img class = \"backGI\" style = \"margin-top: -30px;\" src = \"/SPGDB/images/back-button-png.svg\" onclick = \"window.history.back()\"\;/>";
print "<p class = \"reshead\"> The Amino acid composition, molecular weight, volume & iso-electric point of <b>$entry</b></p>";
	print "<br><table border=0  align=center bgcolor=500000  width=60% cellspacing=0 cellpadding=0>";
	print "<tr><td style = \"font: 12px verdana; color: black;\">";
	print "<table border=0 cellspacing=1 cellpadding=7 width=100%>";
	print "<tr valign=top align=center  bgcolor=#F8ECE0>";
	print "<td colspan=3 align=center valign=middle style = \"font: 12px verdana; color:black; font-weight: bold;\">Amino Acid</td><td align=center valign=middle style = \"font:12px verdana; color: black; font-weight: bold;\">No.of Residues</td><td align=center valign=middle style = \"font:12px verdana; color: black; font-weight: bold;\">Molecular weight</td><td align=center valign=middle style = \"font:12px verdana; color: black;font-weight: bold;\">Volume</td></tr>";
   
	if($atom_A != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Alanine</td><td style = \"font: 12px verdana; color: black;\">ALA</td><td style = \"font: 12px verdana; color: black;\">A</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_A, $atom_A/$totalatom*100, $atom_A*71.08, $atom_A*88.6;}
	if($atom_C != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Cysteine</td><td style = \"font: 12px verdana; color: black;\">CYS</td><td style = \"font: 12px verdana; color: black;\">C</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_C, $atom_C/$totalatom*100, $atom_C*103.14, $atom_C*108.5;}
	if($atom_D != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Aspartic acid</td><td style = \"font: 12px verdana; color: black;\">ASP</td><td style = \"font: 12px verdana; color: black;\">D</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_D, $atom_D/$totalatom*100, $atom_D*115.09, $atom_D*111.1;}
	if($atom_E != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Glutamic acid</td><td style = \"font: 12px verdana; color: black;\">GLU</td><td style = \"font: 12px verdana; color: black;\">E</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_E, $atom_E/$totalatom*100, $atom_E*129.12, $atom_E*138.4;}
	if($atom_F != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Phenylalanine</td><td style = \"font: 12px verdana; color: black;\">PHE</td><td style = \"font: 12px verdana; color: black;\">F</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_F, $atom_F/$totalatom*100, $atom_F*147.18, $atom_F*189.9;}
	if($atom_G != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Glycine</td><td style = \"font: 12px verdana; color: black;\">GLY</td><td style = \"font: 12px verdana; color: black;\">G</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_G, $atom_G/$totalatom*100, $atom_G*57.06, $atom_G*60.1;}
	if($atom_H != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Histidine</td><td style = \"font: 12px verdana; color: black;\">HIS</td><td style = \"font: 12px verdana; color: black;\">H</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_H, $atom_H/$totalatom*100, $atom_H*137.15, $atom_H*153.2;}
	if($atom_I != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Isoleucine</td><td style = \"font: 12px verdana; color: black;\">ILE</td><td style = \"font: 12px verdana; color: black;\">I</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_I, $atom_I/$totalatom*100, $atom_I*113.17, $atom_I*166.7;}
	if($atom_K != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Lysine</td><td style = \"font: 12px verdana; color: black;\">LYS</td><td style = \"font: 12px verdana; color: black;\">K</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_K, $atom_K/$totalatom*100, $atom_K*128.18, $atom_K*168.6;}
	if($atom_L != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Leucine</td><td style = \"font: 12px verdana; color: black;\">LEU</td><td style = \"font: 12px verdana; color: black;\">L</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_L, $atom_L/$totalatom*100, $atom_L*113.17, $atom_L*166.7;}
	if($atom_M != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Methionine</td><td style = \"font: 12px verdana; color: black;\">MET</td><td style = \"font: 12px verdana; color: black;\">M</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_M, $atom_M/$totalatom*100, $atom_M*131.21, $atom_M*162.9;}
	if($atom_N != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Asparagine</td><td style = \"font: 12px verdana; color: black;\">ASN</td><td style = \"font: 12px verdana; color: black;\">N</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_N, $atom_N/$totalatom*100, $atom_N*114.11, $atom_N*117.7;}
	if($atom_P != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Proline</td><td style = \"font: 12px verdana; color: black;\">PRO</td><td style = \"font: 12px verdana; color: black;\">P</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_P, $atom_P/$totalatom*100, $atom_P*97.12, $atom_P*122.7;}
	if($atom_Q != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Glutamine</td><td style = \"font: 12px verdana; color: black;\">GLN</td><td style = \"font: 12px verdana; color: black;\">Q</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>",$atom_Q, $atom_Q/$totalatom*100, $atom_Q*128.14, $atom_Q*143.9;}
	if($atom_R != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Arginine</td><td style = \"font: 12px verdana; color: black;\">ARG</td><td style = \"font: 12px verdana; color: black;\">R</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>",$atom_R, $atom_R/$totalatom*100, $atom_R*156.2, $atom_R*173.4;}
	if($atom_S != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Serine</td><td style = \"font: 12px verdana; color: black;\">SER</td><td style = \"font: 12px verdana; color: black;\">S</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_S, $atom_S/$totalatom*100, $atom_S*87.08, $atom_S*89.0;}
	if($atom_T != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Threonine</td><td style = \"font: 12px verdana; color: black;\">THR</td><td style = \"font: 12px verdana; color: black;\">T</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_T, $atom_T/$totalatom*100, $atom_T*101.11, $atom_T*116.1;}
	if($atom_V != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Valine</td><td style = \"font: 12px verdana; color: black;\">VAL</td><td style = \"font: 12px verdana; color: black;\">V</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_V, $atom_V/$totalatom*100, $atom_V*99.14, $atom_V*140.0;}
	if($atom_W != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Tryptophan</td><td style = \"font: 12px verdana; color: black;\">TRP</td><td style = \"font: 12px verdana; color: black;\">W</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_W, $atom_W/$totalatom*100, $atom_W*186.21, $atom_W*227.8;}
	if($atom_Y != 0){printf "<tr align=center valign=middle bgcolor=#F8ECE0><td align=left style = \"font: 12px verdana; color: black\">Tyrosine</td><td style = \"font: 12px verdana; color: black;\">TYR</td><td style = \"font: 12px verdana; color: black;\">Y</td><td style = \"font: 12px verdana; color: black;\">%4d (%5.2f %%)</td><td style = \"font: 12px verdana; color: black;\">%8d</td><td style = \"font: 12px verdana; color: black;\">%8d</td></tr>", $atom_Y, $atom_Y/$totalatom*100, $atom_Y*163.18, $atom_Y*193.6;}
	
	print "</table></td></tr></table><br>"; 
  	print "<br><center><table border=0 cellspacing=1 cellpadding=7>";
	print "<tr><td style = \"font: 14px verdana; color: maroon; font-weight: bold;\">Total number of amino acids</td><td>-</td><td style = \"font: 14px verdana; color: black;\">$totalatom</td></tr>";
	printf "<tr><td style = \"font: 14px verdana; color: maroon; font-weight: bold;\">Molecular weight %s</b></td><td>-</td><td style = \"font: 14px verdana; color: black;\">%.4f KDa</b></td></tr>",$pdbid,$mw/1000;
	printf "<tr><td style = \"font: 14px verdana; color: maroon; font-weight: bold;\">Volume %s</b></td><td>-</td><td style = \"font: 14px verdana; color: black;\">%8d &#197<sup>3</sup></td></tr>",$pdbid,$vol;
	printf "<tr><td style = \"font: 14px verdana; color: maroon; font-weight: bold;\">Iso-electric point %s</b></td><td>-</td><td style = \"font: 14px verdana; color: black;\">%.2f</td></tr>",$pdbid,$totiso/$totalatom;
	print "</table></center>\n\n";
print "</div>";
print "</body>";
print "</html>";


