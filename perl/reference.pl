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
   	<p class = \"bhead\"> References </p>
   	<div class = \"bcontent\">
   	<p class = \"bcontenttext\"> <ol style = "font:12px verdana; text-align: justify; line-height: 20px; margin-right: 5px;">
   	<li> Abeyta M, Hardy GG, Yother J. Genetic alteration of capsule type but not PspA type affects accessibility of surface-bound complement and surface antigens of <i> Streptococcus pneumoniae </i>. Infect Immun 2003, 71:218–225. </li> 
	<li> Allegrucci M, Sauer K. Characterization of colony morphology variants isolated from <i> Streptococcus pneumoniae </i> biofilms. J Bacteriol. 2007, 189:2030-8. </li>
	<li> AlonsoDeVelasco E, Verheul AF, Verhoef J, Snippe H. <i> Streptococcus pneumoniae </i>: virulence factors, pathogenesis, and vaccines. Microbiol Rev. 1995, 59:591-603. </li>
	<li> Barichello T, Generoso JS, Collodel A, Moreira AP, Almeida SM. Pathophysiology of acute meningitis caused by <i> Streptococcus pneumoniae </i> and adjunctive therapy approaches. Arq Neuropsiquiatr. 2012, 70:366-72. </li>
	<li> Bogaert D, De Groot R, Hermans PW. <i> Streptococcus pneumoniae </i> colonisation: the key to pneumococcal disease. Lancet Infect Dis. 2004, 4:144-54. </li>
	<li> Briese T and Hakenbeck R. Interaction of the pneumococcal amidase with lipoteichoic acids and choline. Eur J Biochem. 1985, 146:417–427. </li>
	<li> Brown EJ, Joiner KA, Cole RM, Berger M. Localization of complement component 3 on <i> Streptococcus pneumoniae </i>: anti-capsular antibody causes complement deposition on the pneumococcal capsule. Infect Immun. 1983, 39:403–409. </li>
	<li> Charpentier E, Tuomanen E. Mechanisms of antibiotic resistance and tolerance in <i> Streptococcus pneumoniae </i>. Microbes Infect. 2000, 15:1855-64.</li>
	<li> Cundell DR, Weiser JN, Shen J, Young A, Tuomanen EI. Relationship between colonial morphology and adherence of <i> Streptococcus pneumoniae </i>. Infect Immun. 1995, 63:757-61.</li>
	<li> Faden H, Duffy L, Wasielewski R, Wolf J, Krystofik D, Tung Y. Relationship between nasopharyngeal colonization and the development of otitis media in children. Tonawanda/Williamsville Pediatrics. J Infect Dis. 1997, 175:1440-5.</li>
	<li> Gasc AM, Kauc L, Barraille P, Sicard M, Goodgal S. Gene localization, size, and physical map of the chromosome of <i> Streptococcus pneumoniae </i>. J Bacteriol. 1991, 173:7361-7.</li>
	<li> Gray BM, Converse GM, Dillon HC Jr. Epidemiologic studies of <i> Streptococcus pneumoniae </i> in infants: acquisition, carriage, and infection during the first 24 months of life. J Infect Dis. 1980, 142:923-33.</li>
	<li> Honsa ES, Johnson MD, Rosch JW. The roles of transition metals in the physiology and pathogenesis of <i> Streptococcus pneumoniae </i>. Front Cell Infect Microbiol. 2013, 4;92.</li>
	<li> Hoskins J, Alborn WE Jr, Arnold J, Blaszczak LC, Burgett S, DeHoff BS, Estrem ST, Fritz L, Fu DJ, Fuller W, Geringer C, Gilmour R, Glass JS, Khoja H, Kraft AR, Lagace RE, LeBlanc DJ, Lee LN, Lefkowitz EJ, Lu J, Matsushima P, McAhren SM, McHenney M, McLeaster K, Mundy CW, Nicas TI, Norris FH, O'Gara M, Peery RB, Robertson GT, Rockey P, Sun PM, Winkler ME, Yang Y, Young-Bellido M, Zhao G, Zook CA, Baltz RH, Jaskunas SR, Rosteck PR Jr, Skatrud PL, Glass JI. Genome of the bacterium <i> Streptococcus pneumoniae </i> strain R6. J Bacteriol. 2001, 183:5709-17. </li>
	<li> Hyams C, Camberlein E, Cohen JM, Bax K, Brown JS: The <i> Streptococcus pneumoniae </i> capsule inhibits complement activity and neutrophil phagocytosis by multiple mechanisms. Infect Immun 2010, 78:704–715. </li>
	<li> Kadioglu A, Weiser JN, Paton JC, Andrew PW: The role of <i> Streptococcus pneumoniae </i> virulence factors in host respiratory colonization and disease. Nat Rev Microbiol. 2008, 6:288–301. </li>
	<li> Krivan HC, Roberts DD, Ginsburg V. Many pulmonary pathogenic bacteria bind specifically to the carbohydrate sequence GalNAc beta 1-4Gal found in some glycolipids. Proc Natl Acad Sci U S A. 1988, 85(16):6157-61.</li>
	<li> Lutcke H. Signal recognition particle (SRP), a ubiquitous initiator of protein translocation. Eur J Biochem. 1995, 15:228(3):531-50.</li>
	<li> Mitchell AM, Mitchell TJ. <i> Streptococcus pneumoniae </i>: virulence factors and variation. Clin Microbiol Infect 2010, 16:411–418. </li>
	<li> Pace NR, Brown JW. Evolutionary perspective on the structure and function of ribonuclease P, a ribozyme. J Bacteriol. 1995, 177:1919-28.</li>
	<li> Pallares R, Fenoll A, Liñares J; Spanish Pneumococcal Infection Study Network. The epidemiology of antibiotic resistance in <i> Streptococcus pneumoniae </i> and the clinical relevance of resistance to cephalosporins, macrolides and quinolones. Int J Antimicrob Agents. 2003, 22: S15-24; </li>
	<li> Paulsen IT1, Nguyen L, Sliwinski MK, Rabus R, Saier MH Jr. Microbial genome analyses: comparative transport capabilities in eighteen prokaryotes. J Mol Biol. 2000, 301:75-100.</li>
	<li> Ricci S, Gerlini A, Pammolli A, Chiavolini D, Braione V, Tripodi SA, Colombari B, Blasi E, Oggioni MR, Peppoloni S, Pozzi G. Contribution of different pneumococcal virulence factors to experimental meningitis in mice. BMC Infect Dis. 2013, 24;13:444.</li>
	<li> Rosenow C, Ryan P, Weiser JN, Johnson S, Fontan P, Ortqvist A, Masure HR. Contribution of novel choline-binding proteins to adherence, colonization and immunogenicity of <i> Streptococcus pneumoniae </i>. Mol Microbiol. 1997, 25:819-29.</li>
	<li> Tettelin H, Nelson KE, Paulsen IT, Eisen JA, Read TD, Peterson S, Heidelberg J, DeBoy RT, Haft DH, Dodson RJ, Durkin AS, Gwinn M, Kolonay JF, Nelson WC, Peterson JD, Umayam LA, White O, Salzberg SL, Lewis MR, Radune D, Holtzapple E, Khouri H, Wolf AM, Utterback TR, Hansen CL, McDonald LA, Feldblyum TV, Angiuoli S, Dickinson T, Hickey EK, Holt IE, Loftus BJ, Yang F, Smith HO, Venter JC, Dougherty BA, Morrison DA, Hollingshead SK, Fraser CM. Complete genome sequence of a virulent isolate of <i> Streptococcus pneumoniae </i>. Science. 2001, 293:498-506.</li>
	<li> The Center for Disease Control (CDC) - Laboratory methods for the diagnosis of meningitis, Chapter 8: Identification and characterization of <i> Streptococcuc pneumoniae </i></li>
	<li> Verma R, Khanna P. Pneumococcal conjugate vaccine: a newer vaccine available in India. Hum Vaccin Immunother. 2012, 8:1317-20. </li>
	<li> Weiser JN, Austrian R, Sreenivasan PK, Masure HR. Phase variation in pneumococcal opacity: relationship between colonial morphology and nasopharyngeal colonization. Infect Immun. 1994, 62:2582-9.</li>
	<li> Weiser JN, Markiewicz Z, Tuomanen EI, Wani JH. Relationship between phase variation in colony morphology, intrastrain variation in cell wall physiology, and nasopharyngeal colonization by <i> Streptococcus pneumoniae </i>. Infect Immun. 1996, 64:2240-5.</li>
	</ol>
   	</p>
	</div>
	</div>	
</body>
</html>
EOF





