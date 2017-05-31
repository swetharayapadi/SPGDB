sub Main_Menu {
print <<"EOF";
<html>
<head>
    <title>SPGDB: Streptococcus pneumoniae Genome database</title>

    <link href="/SPGDB/StyleSheet_asp.css" rel="stylesheet" type="text/css" />
	<script src = "/SPGDB/MyScript.js"></script>
</head>
<body>
	<div class="header">
        SPGDB - <i> Streptococcus pneumoniae </i> Genome Database
    </div>
    <div>
        <ul id="MainMenu">
            <li><a href = "/SPGDB/index.html"> Home </a></li>
            <li><a href = "/cgi-bin/SPGDB/about.pl"> About SPGDB </a></li>
            <li> Bacteriology &nbsp &nbsp<img src="/SPGDB/images/dropdownicon.png" />
                    <ul><li><a href = "/cgi-bin/SPGDB/general.pl"> General </a></li> 
                        <li><a href = "/cgi-bin/SPGDB/cultural.pl"> Cultural </a></li>
                        <li><a href = "/cgi-bin/SPGDB/virulence.pl"> Virulence factors </a></li>
            <li><a href = "/cgi-bin/SPGDB/pathogenesis.pl"> Pathogenesis </a></li>
            <li><a href = "/cgi-bin/SPGDB/diagnosis.pl"> Laboratory Diagnosis </a></li>
			<!-- <li> Epidemiology </li> -->
			<!-- <li> Diagnosis </li> -->
			<!-- <li> Treatment </li> -->
		   </ul>
            </li>
            <li> Gene/Protein search &nbsp &nbsp<img src="/SPGDB/images/dropdownicon.png" />
                    <ul><li><a href = "/cgi-bin/SPGDB/search.pl"> Simple search </a></li> 
                        <li><a href = "/cgi-bin/SPGDB/AdvaSearch.pl"> Advanced search </a> </li>
                        <li><a href = "/cgi-bin/SPGDB/strain_list.pl?pagenum=1"> Complete data </a></li>
                        <li><a href = "/cgi-bin/SPGDB/genome_map.pl"> Genome map </a></li> 
                        </ul>
		    </li>
            <li> Tools &nbsp &nbsp<img src="/SPGDB/images/dropdownicon.png" />
            	<ul><li><a href = "/cgi-bin/SPGDB/blast.pl"> BLAST </a></li>
            		<li><a href = "/cgi-bin/SPGDB/motif.pl"> DNA Motif search </li>
            		<li><a href = "/cgi-bin/SPGDB/gbrowse.pl"> GBrowse </li>
            		</ul>
            </li>		
            <li><a href = "/cgi-bin/SPGDB/structures.pl?pagenum=1"> Protein structures </a></li>
            <li><a href = "reference.pl"> References </a></li>
            <li><a href = "links.pl"> Related links </a></li>
	    <li><a href = "/cgi-bin/SPGDB/contact.pl"> Contact Us </a></li>		    
        </ul>
    </div> <br />
</body>
</html>
EOF
}
1;
