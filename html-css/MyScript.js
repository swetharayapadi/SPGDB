function show1() {
	document.getElementById('strain_input').style.display = 'block';
	document.getElementById('gene_input').style.display = 'none';
	document.getElementById('protein_input').style.display = 'none';
	document.getElementById('protein_result').style.display = 'none';
	document.getElementById('gene_result').style.display = 'none';
	document.getElementById('myForm_Gene').reset();
	document.getElementById('myForm_Protein').reset();
}

function show2() {
	document.getElementById('strain_input').style.display = 'none';
	document.getElementById('gene_input').style.display = 'block';
	document.getElementById('protein_input').style.display = 'none';
	document.getElementById('strain_result').style.display = 'none';
	document.getElementById('protein_result').style.display = 'none';
	document.getElementById('myForm_Strain').reset();
	document.getElementById('myForm_Protein').reset();
}

function show3() {
	document.getElementById('strain_input').style.display = 'none';
	document.getElementById('gene_input').style.display = 'none';
	document.getElementById('protein_input').style.display = 'block';
	document.getElementById('strain_result').style.display = 'none';
	document.getElementById('gene_result').style.display = 'none';
	document.getElementById('myForm_Strain').reset();
	document.getElementById('myForm_Gene').reset();
}

function show4() {
	//document.getElementById('strain_input').style.display = 'none';
	document.getElementById('gene_input').style.display = 'block';
	document.getElementById('protein_input').style.display = 'none';
	//document.getElementById('strain_result').style.display = 'none';
	document.getElementById('protein_result').style.display = 'none';
	//document.getElementById('myForm_Strain').reset();
	document.getElementById('myForm_Protein').reset();
}

function show5() {
	//document.getElementById('strain_input').style.display = 'none';
	document.getElementById('gene_input').style.display = 'none';
	document.getElementById('protein_input').style.display = 'block';
	//document.getElementById('strain_result').style.display = 'none';
	document.getElementById('gene_result').style.display = 'none';
	//document.getElementById('myForm_Strain').reset();
	document.getElementById('myForm_Gene').reset();
}

function go_Strain(strain) {
	//alert(strain);
	var url = "strainsearch.pl?strain="+strain;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
  	{
	  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
    		document.getElementById('strain_result').innerHTML=xmlhttp.responseText;
    	}		
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('strain_result').style.display = 'block';
}

function go_Gene(gene) {
	//alert(gene);
	var url = "genesearch.pl?gene="+gene;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
    		document.getElementById('gene_result').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('gene_result').style.display = 'block';
}

function go_Protein(protein) {	
	//alert(protein);
	var url = "proteinsearch.pl?protein="+protein;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
  	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
		    document.getElementById('protein_result').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('protein_result').style.display = 'block';
}

function reset_strain() {
	document.getElementById('strain_result').style.display = 'none';
	document.getElementById('strain_result').innerHTML = '';
}

function reset_gene() {
	document.getElementById('gene_result').style.display = 'none';
	document.getElementById('gene_result').innerHTML = '';
}

function reset_protein() {
	document.getElementById('protein_result').style.display = 'none';
	document.getElementById('protein_result').innerHTML = '';
}

function Protein_Seq(entry) {	
	//alert(entry);
	var url = "ProtSeqSearch.pl.pl?entry="+entry;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
  	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
		    document.getElementById('seqbox').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	//document.getElementById('protein_result').style.display = 'block';
}

function shownseq(seq) {
//alert("seq");
	var header = "<p style=\"background-color: rgba(128,128,128,0.5); font: 14px verdana bold; text-align: center; border-radius: 5px;padding: 5px;\"> Nucleotide Sequence <img class = \"closepop\" onclick = closepop() src=\"/SPGDB/images/close.png\"/></p></br>";
 	document.getElementById('popup1').style.display = 'block';
	document.getElementById('popup1').innerHTML= header+seq;
}

function showpseq(seq) {
	var header = "<p style=\"background-color: rgba(128,128,128,0.5); font: 14px verdana bold; text-align: center; border-radius: 5px;padding: 5px;\"> Protein Sequence <img class = \"closepop\" onclick = closepop() src=\"/SPGDB/images/close.png\"/></p></br>";
	document.getElementById('popup2').style.display = 'block';
	document.getElementById('popup2').innerHTML = header+seq;
}

function closepop(){
	document.getElementById('popup1').style.display = 'none';
	document.getElementById('popup2').style.display = 'none';
}

function go_Gene_Adv(gene,organism) {
	//alert(gene);
	//alert(organism);
	var url = "genesearch_adv.pl?gene="+gene+"&organism="+organism;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
    		document.getElementById('gene_result').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('gene_result').style.display = 'block';
}

function go_Protein_Adv(protein,organism){
	//alert(protein);
	//alert(organism);
	var url = "proteinsearch_adv.pl?protein="+protein+"&organism="+organism;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
    		document.getElementById('protein_result').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('protein_result').style.display = 'block';
}

function go_Protein_Rev(pagenum,status,organism){
	//alert(status);
	//alert(organism);
	var url = "proteinsearch_advr.pl?pagenum="+pagenum+"&organism="+organism+"&status="+status;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
    		document.getElementById('unreview_result').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('unreview_result').style.display = 'block';
}

function go_locate(pagenum,locate,organism){
	//alert(pagenum);
	//alert(locate);
	//alert(organism);
	var url = "proteinsearch_advl.pl?pagenum="+pagenum+"&organism="+organism+"&locate="+locate;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
    		document.getElementById('location_result').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('location_result').style.display = 'block';
}

function go_Virule(pagenum,virulence,organism){
	//alert(pagenum);
	//alert(virulence);
	//alert(organism);
	var url = "virulent_gene_adv.pl?pagenum="+pagenum+"&virulence="+virulence+"&organism="+organism;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
    		document.getElementById('virulence_result').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('virulence_result').style.display = 'block';
}

function go_Virule(pagenum,virulence,organism){
	//alert(pagenum);
	//alert(virulence);
	//alert(organism);
	var url = "virulent_gene_adv.pl?pagenum="+pagenum+"&virulence="+virulence+"&organism="+organism;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
    		document.getElementById('virulence_result').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('virulence_result').style.display = 'block';
}

function go_Domain(pagenum,domain,organism){
	//alert(pagenum);
	//alert(domain);
	//alert(organism);
	var url = "domain_search_adv.pl?pagenum="+pagenum+"&domain="+domain+"&organism="+organism;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
    		document.getElementById('domain_result').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('domain_result').style.display = 'block';
}

function go_Cog(pagenum,cog,organism){
	//alert(pagenum);
	//alert(cog);
	//alert(organism);
	var url = "cog_search_adv.pl?pagenum="+pagenum+"&cog="+cog+"&organism="+organism;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
    		document.getElementById('COG_result').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('COG_result').style.display = 'block';
}

function go_Motifsearch(pagenum,sequence,organism) {
	//alert(pagenum);
	//alert(organism);
	//alert(sequence);
	var url = "motifsearch_result.pl?pagenum="+pagenum+"&sequence="+sequence+"&organism="+organism;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
    		document.getElementById('motifsearch_result').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('motifsearch_result').style.display = 'block';
}

function show_Adv() {
	//alert("hello");
	document.getElementById('search1').style.display = 'block';
	document.getElementById('search2').style.display = 'none';
	document.getElementById('search3').style.display = 'none';
	document.getElementById('search4').style.display = 'none';
	document.getElementById('search5').style.display = 'none';
	document.getElementById('search6').style.display = 'none';
	document.getElementById('review_result').style.display = 'none';
	document.getElementById('review_result').innerHTML = '';
	document.getElementById('unreview_result').style.display = 'none';
	document.getElementById('unreview_result').innerHTML = '';
	document.getElementById('location_result').style.display = 'none';
	document.getElementById('location_result').innerHTML = '';
	document.getElementById('domain_result').style.display = 'none';
	document.getElementById('domain_result').innerHTML = '';
	document.getElementById('COG_result').style.display = 'none';
	document.getElementById('COG_result').innerHTML = '';
	document.getElementById('virulence_result').style.display = 'none';
	document.getElementById('virulence_result').innerHTML = '';
}

function show_Adv1(){
	document.getElementById('search2').style.display = 'block';
	document.getElementById('search1').style.display = 'none';
	document.getElementById('search3').style.display = 'none';
	document.getElementById('search4').style.display = 'none';
	document.getElementById('search5').style.display = 'none';
	document.getElementById('search6').style.display = 'none';
	document.getElementById('gene_result').style.display = 'none';
	document.getElementById('gene_result').innerHTML = '';
	document.getElementById('protein_result').style.display = 'none';
	document.getElementById('protein_result').innerHTML = '';
	document.getElementById('location_result').style.display = 'none';
	document.getElementById('location_result').innerHTML = '';
	document.getElementById('domain_result').style.display = 'none';
	document.getElementById('domain_result').innerHTML = '';
	document.getElementById('COG_result').style.display = 'none';
	document.getElementById('COG_result').innerHTML = '';
	document.getElementById('virulence_result').style.display = 'none';
	document.getElementById('virulence_result').innerHTML = '';
}

function show_Adv2(){
	//alert('show');
	document.getElementById('search3').style.display = 'block';
	document.getElementById('search1').style.display = 'none';
	document.getElementById('search2').style.display = 'none';
	document.getElementById('search4').style.display = 'none';
	document.getElementById('search5').style.display = 'none';
	document.getElementById('search6').style.display = 'none';
	document.getElementById('review_result').style.display = 'none';
	document.getElementById('review_result').innerHTML = '';
	document.getElementById('unreview_result').style.display = 'none';
	document.getElementById('unreview_result').innerHTML = '';
	document.getElementById('gene_result').style.display = 'none';
	document.getElementById('gene_result').innerHTML = '';
	document.getElementById('protein_result').style.display = 'none';
	document.getElementById('protein_result').innerHTML = '';
	document.getElementById('domain_result').style.display = 'none';
	document.getElementById('domain_result').innerHTML = '';
	document.getElementById('COG_result').style.display = 'none';
	document.getElementById('COG_result').innerHTML = '';
	document.getElementById('virulence_result').style.display = 'none';
	document.getElementById('virulence_result').innerHTML = '';
}

function show_Adv3(){
	//alert('show');
	document.getElementById('search4').style.display = 'block';
	document.getElementById('search1').style.display = 'none';
	document.getElementById('search2').style.display = 'none';
	document.getElementById('search3').style.display = 'none';
	document.getElementById('search5').style.display = 'none';
	document.getElementById('search6').style.display = 'none';
	document.getElementById('review_result').style.display = 'none';
	document.getElementById('review_result').innerHTML = '';
	document.getElementById('unreview_result').style.display = 'none';
	document.getElementById('unreview_result').innerHTML = '';
	document.getElementById('gene_result').style.display = 'none';
	document.getElementById('gene_result').innerHTML = '';
	document.getElementById('protein_result').style.display = 'none';
	document.getElementById('protein_result').innerHTML = '';
	document.getElementById('location_result').style.display = 'none';
	document.getElementById('location_result').innerHTML = '';
	document.getElementById('COG_result').style.display = 'none';
	document.getElementById('COG_result').innerHTML = '';
	document.getElementById('virulence_result').style.display = 'none';
	document.getElementById('virulence_result').innerHTML = '';
}

function show_Adv4(){
	//alert('show');
	document.getElementById('search5').style.display = 'block';
	document.getElementById('search1').style.display = 'none';
	document.getElementById('search2').style.display = 'none';
	document.getElementById('search3').style.display = 'none';
	document.getElementById('search4').style.display = 'none';
	document.getElementById('search6').style.display = 'none';
	document.getElementById('review_result').style.display = 'none';
	document.getElementById('review_result').innerHTML = '';
	document.getElementById('unreview_result').style.display = 'none';
	document.getElementById('unreview_result').innerHTML = '';
	document.getElementById('gene_result').style.display = 'none';
	document.getElementById('gene_result').innerHTML = '';
	document.getElementById('protein_result').style.display = 'none';
	document.getElementById('protein_result').innerHTML = '';
	document.getElementById('domain_result').style.display = 'none';
	document.getElementById('domain_result').innerHTML = '';
	document.getElementById('location_result').style.display = 'none';
	document.getElementById('location_result').innerHTML = '';
	document.getElementById('virulence_result').style.display = 'none';
	document.getElementById('virulence_result').innerHTML = '';
}

function show_Adv5(){
	//alert('show');
	document.getElementById('search6').style.display = 'block';
	document.getElementById('search1').style.display = 'none';
	document.getElementById('search2').style.display = 'none';
	document.getElementById('search3').style.display = 'none';
	document.getElementById('search4').style.display = 'none';
	document.getElementById('search5').style.display = 'none';
	document.getElementById('review_result').style.display = 'none';
	document.getElementById('review_result').innerHTML = '';
	document.getElementById('unreview_result').style.display = 'none';
	document.getElementById('unreview_result').innerHTML = '';
	document.getElementById('gene_result').style.display = 'none';
	document.getElementById('gene_result').innerHTML = '';
	document.getElementById('protein_result').style.display = 'none';
	document.getElementById('protein_result').innerHTML = '';
	document.getElementById('domain_result').style.display = 'none';
	document.getElementById('domain_result').innerHTML = '';
	document.getElementById('location_result').style.display = 'none';
	document.getElementById('location_result').innerHTML = '';
	document.getElementById('COG_result').style.display = 'none';
	document.getElementById('COG_result').innerHTML = '';
}
function close1() {
	document.getElementById('search1').style.display = 'none';
	document.getElementById('gene_result').style.display = 'none';
	document.getElementById('gene_result').innerHTML = '';
	document.getElementById('protein_result').style.display = 'none';
	document.getElementById('protein_result').innerHTML = '';
}

function close2() {
	document.getElementById('search2').style.display = 'none';
	document.getElementById('review_result').style.display = 'none';
	document.getElementById('review_result').innerHTML = '';
	document.getElementById('unreview_result').style.display = 'none';
	document.getElementById('unreview_result').innerHTML = '';
}

function close3() {
	document.getElementById('search3').style.display = 'none';
	document.getElementById('location_result').style.display = 'none';
	document.getElementById('location_result').innerHTML = '';
}

function close4() {
	document.getElementById('search4').style.display = 'none';
	document.getElementById('domain_result').style.display = 'none';
	document.getElementById('domain_result').innerHTML = '';
}

function close5() {
	document.getElementById('search5').style.display = 'none';
	document.getElementById('COG_result').style.display = 'none';
	document.getElementById('COG_result').innerHTML = '';
}
function close6() {
	document.getElementById('search6').style.display = 'none';
	document.getElementById('virulence_result').style.display = 'none';
	document.getElementById('virulence_result').innerHTML = '';
}

function patpro(dom){
	//alert(dom);
	if (dom == "profile") {
		profileList();
	}
	if (dom == "pattern") {
		patternList();
	}
}

function profileList() {
	//alert("show");
	document.getElementById('profile_list').style.display = 'block';
	document.getElementById('profile_head').style.display = 'block';
	document.getElementById('pattern_list').style.display = 'none';
	document.getElementById('pattern_head').style.display = 'none';
}

function patternList() {
	document.getElementById('pattern_list').style.display = 'block';
	document.getElementById('pattern_head').style.display = 'block';
	document.getElementById('profile_list').style.display = 'none';
	document.getElementById('profile_head').style.display = 'none';	
}

function winsize(pdb_id) {
	//alert(pdb_id);
	myWindow = window.open("display.pl?pdb_id="+pdb_id,"display.pl?pdb_id="+pdb_id,"width=750,height=650");
}

function gbrowse(strain) {
	//alert(strain);
	//myWindow = window.open("http://10.132.1.14/cgi-bin/gb2/gbrowse/"+strain);
	myWindow = window.open("http://pranag.physics.iisc.ernet.in/cgi-bin/gb2/gbrowse/"+strain);
}

function winsize_Gram() {
	//alert("show");
	myWindow = window.open("gram_stain.pl","","width=500,height=500");
}

function winsize_Catalase() {
	//alert("show");
	myWindow = window.open("catalase.pl","","width=500,height=500");
}

function winsize_Optochin() {
	//alert("show");
	myWindow = window.open("optochin.pl","","width=500,height=500");
}

function winsize_Bile() {
	//alert("show");
	myWindow = window.open("bile.pl","","width=500,height=500");
}

function winsize_Parameter() {
	//alert("show");
	myWindow = window.open("count.pl","","width=500,height=500");
}

function downpdb(pdb_id) {
	alert(pdb_id);
	//myWindow = window.open("display.pl?pdb_id="+pdb_id,"display.pl?pdb_id="+pdb_id,"width=500,height=500");
}

function show_mat() {
	document.getElementById('parameter').style.display = 'block';
	document.getElementById('proteinmat').style.display = 'block';
	document.getElementById('proteinws1').selected = 'true';
	document.getElementById('proteinws1').style.display = 'block';
	document.getElementById('proteinws2').style.display = 'block';
	document.getElementById('nucleows1').style.display = 'none';
	document.getElementById('nucleows2').style.display = 'none';
	document.getElementById('nucleows3').style.display = 'none';
	document.getElementById('nucleows4').style.display = 'none';
	document.getElementById('nucleows5').style.display = 'none';
	document.getElementById('gapmain').style.display = 'block';
	document.getElementById('gapmain1').style.display = 'block';
}

function hide_mat() {
	document.getElementById('parameter').style.display = 'block';
	document.getElementById('proteinmat').style.display = 'none';
	document.getElementById('proteinws1').style.display = 'none';
	document.getElementById('proteinws2').style.display = 'none';
	document.getElementById('nucleows1').selected = 'true';
	document.getElementById('nucleows1').style.display = 'block';
	document.getElementById('nucleows2').style.display = 'block';
	document.getElementById('nucleows3').style.display = 'block';
	document.getElementById('nucleows4').style.display = 'block';
	document.getElementById('nucleows5').style.display = 'block';
	document.getElementById('gap1').style.display = 'block';
	document.getElementById('gap2').style.display = 'block';
	document.getElementById('gap3').style.display = 'block';
	document.getElementById('gap4').selected = 'true';
	document.getElementById('gap4').style.display = 'block';
	document.getElementById('gap5').style.display = 'block';
	document.getElementById('gap6').style.display = 'block';
	document.getElementById('gap7').style.display = 'block';
	document.getElementById('gap8').style.display = 'block';
	document.getElementById('gap9').style.display = 'none';
	document.getElementById('gap10').style.display = 'none';
	document.getElementById('gap11').style.display = 'none';
	document.getElementById('gap12').style.display = 'none';
	document.getElementById('gap13').style.display = 'none';
	document.getElementById('gap14').style.display = 'none';
	document.getElementById('gap15').style.display = 'none';
	document.getElementById('gapmain').style.display = 'block';
	document.getElementById('gapmain1').style.display = 'block';
}

function mat(matrix) {
	//alert(matrix);
	if (matrix == "PAM30") {
		pam30();
	}
	if (matrix == "PAM70") {
		pam70();
	}
	if (matrix == "BLOSUM80") {
		blosum80();
	}
	if (matrix == "BLOSUM62") {
		blosum62();
	}
	if (matrix == "BLOSUM45") {
		blosum45();
	}
}

function pam30(){
	//alert("hello");
	//document.getElementById('gapmain').style.display = 'block';
	//document.getElementById('gapmain1').style.display = 'block';
	document.getElementById('dummy').style.display = 'none';
	document.getElementById('gap1').style.display = 'none';
	document.getElementById('gap2').style.display = 'none';
	document.getElementById('gap3').style.display = 'none';
	document.getElementById('gap4').style.display = 'none';
	document.getElementById('gap5').style.display = 'none';
	document.getElementById('gap6').style.display = 'none';
	document.getElementById('gap7').style.display = 'block';
	document.getElementById('gap7').selected = 'true';
	document.getElementById('gap8').style.display = 'block';
	document.getElementById('gap9').style.display = 'none';
	document.getElementById('gap10').style.display = 'none';
	document.getElementById('gap11').style.display = 'none';
	document.getElementById('gap12').style.display = 'none';
	document.getElementById('gap13').style.display = 'none';
	document.getElementById('gap14').style.display = 'block';
	document.getElementById('gap15').style.display = 'block';	
}

function pam70(){
	//alert("hello");
	//document.getElementById('gapmain').style.display = 'block';
	//document.getElementById('gapmain1').style.display = 'block';
	document.getElementById('dummy').style.display = 'none';
	document.getElementById('gap1').style.display = 'none';
	document.getElementById('gap2').style.display = 'none';
	document.getElementById('gap3').style.display = 'none';
	document.getElementById('gap4').style.display = 'none';
	document.getElementById('gap5').style.display = 'none';
	document.getElementById('gap6').selected = 'true';
	document.getElementById('gap6').style.display = 'block';
	document.getElementById('gap7').style.display = 'block';
	document.getElementById('gap8').style.display = 'block';
	document.getElementById('gap9').style.display = 'none';
	document.getElementById('gap10').style.display = 'none';
	document.getElementById('gap11').style.display = 'none';
	document.getElementById('gap12').style.display = 'none';
	document.getElementById('gap13').style.display = 'block';
	document.getElementById('gap14').style.display = 'block';
	document.getElementById('gap15').style.display = 'block';	
}

function blosum80(){
	//alert("hello");
	//document.getElementById('gapmain').style.display = 'block';
	//document.getElementById('gapmain1').style.display = 'block';
	document.getElementById('dummy').style.display = 'none';
	document.getElementById('gap1').style.display = 'block';
	document.getElementById('gap2').style.display = 'none';
	document.getElementById('gap3').style.display = 'none';
	document.getElementById('gap4').style.display = 'none';
	document.getElementById('gap5').style.display = 'block';
	document.getElementById('gap6').style.display = 'block';
	document.getElementById('gap7').style.display = 'block';
	document.getElementById('gap8').selected = 'true';
	document.getElementById('gap8').style.display = 'block';
	document.getElementById('gap9').style.display = 'none';
	document.getElementById('gap10').style.display = 'none';
	document.getElementById('gap11').style.display = 'none';
	document.getElementById('gap12').style.display = 'none';
	document.getElementById('gap13').style.display = 'block';
	document.getElementById('gap14').style.display = 'block';
	document.getElementById('gap15').style.display = 'block';	
}

function blosum62(){
	//alert("hello");
	//document.getElementById('gapmain').style.display = 'block';
	//document.getElementById('gapmain1').style.display = 'block';
	document.getElementById('dummy').style.display = 'none';
	document.getElementById('gap1').style.display = 'none';
	document.getElementById('gap2').style.display = 'none';
	document.getElementById('gap3').style.display = 'block';
	document.getElementById('gap3').selected = 'true';
	document.getElementById('gap4').style.display = 'block';
	document.getElementById('gap5').style.display = 'block';
	document.getElementById('gap6').style.display = 'block';
	document.getElementById('gap7').style.display = 'block';
	document.getElementById('gap8').style.display = 'block';
	document.getElementById('gap9').style.display = 'none';
	document.getElementById('gap10').style.display = 'none';
	document.getElementById('gap11').style.display = 'block';
	document.getElementById('gap12').style.display = 'block';
	document.getElementById('gap13').style.display = 'block';
	document.getElementById('gap14').style.display = 'block';
	document.getElementById('gap15').style.display = 'block';	
}

function blosum45(){
	//alert("hello");
	//document.getElementById('gapmain').style.display = 'block';
	//document.getElementById('gapmain1').style.display = 'block';
	document.getElementById('dummy').style.display = 'none';
	document.getElementById('gap1').selected = 'true';
	document.getElementById('gap1').style.display = 'block';
	document.getElementById('gap2').style.display = 'block';
	document.getElementById('gap3').style.display = 'none';
	document.getElementById('gap4').style.display = 'none';
	document.getElementById('gap5').style.display = 'none';
	document.getElementById('gap6').style.display = 'none';
	document.getElementById('gap7').style.display = 'none';
	document.getElementById('gap8').style.display = 'none';
	document.getElementById('gap9').style.display = 'none';
	document.getElementById('gap10').style.display = 'block';
	document.getElementById('gap11').style.display = 'none';
	document.getElementById('gap12').style.display = 'none';
	document.getElementById('gap13').style.display = 'none';
	document.getElementById('gap14').style.display = 'none';
	document.getElementById('gap15').style.display = 'none';	
}

function show_matex(){
	document.getElementById('parameter').style.display = 'block';
	document.getElementById('proteinmat').style.display = 'block';
	document.getElementById('proteinws1').selected = 'true';
	document.getElementById('proteinws1').style.display = 'block';
	document.getElementById('proteinws2').style.display = 'block';
	document.getElementById('gapmain').style.display = 'none';
	document.getElementById('gapmain1').style.display = 'none';
}

function backtopage() {
    window.history.back();
}

function resetblast() {
	document.getElementById('myForm_blast').reset();
}

function resetmotif() {
	document.getElementById('myForm_motif').reset();
	document.getElementById('motifsearch_result').style.display = 'none';
}

function show_Example() {
	//alert('hello');
	document.getElementById('examplediv').style.display = 'block';
}

function close_Example() {
	document.getElementById('examplediv').style.display = 'none';
}

function profileList() {
	//alert("show");
	document.getElementById('profile_list').style.display = 'block';
	document.getElementById('profile_head').style.display = 'block';
	document.getElementById('pattern_list').style.display = 'none';
	document.getElementById('pattern_head').style.display = 'none';
}

function patternList() {
	document.getElementById('pattern_list').style.display = 'block';
	document.getElementById('pattern_head').style.display = 'block';
	document.getElementById('profile_list').style.display = 'none';
	document.getElementById('profile_head').style.display = 'none';	
}

function show_Iupac() {
	//alert("show");
	document.getElementById('example_IUPAC').style.display = 'block';
}

function close_Iupac() {
	document.getElementById('example_IUPAC').style.display = 'none';
}

function display_Nseq() {
	//alert("show");
	document.getElementById('Nsequence_box_motif').style.display = 'block';
}

function category_Wise(pagenum,organism,category) {
	document.getElementById("category_form").submit();
}

function genome_Map(organism) {
	//alert(organism);
	var url = "genome_map_result.pl?organism="+organism;
	var xmlhttp;    
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp=new XMLHttpRequest();
  	}
	else
	{// code for IE6, IE5
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	xmlhttp.onreadystatechange=function()
  	{
  		if (xmlhttp.readyState==4 && xmlhttp.status==200)
    	{
			//alert(xmlhttp.responseText);
		    document.getElementById('genome_map_image').innerHTML=xmlhttp.responseText;
    	}
  	}
	xmlhttp.open("GET",url,true);
	xmlhttp.send();
	document.getElementById('genome_map_image').style.display = 'block';
}

function display_Map(){
	document.getElementById('refer_map').style.display = 'block';
}

function download(path) 
{
	alert(path);
    var ifrm = document.getElementById("frame");
    ifrm.src = path;
}
