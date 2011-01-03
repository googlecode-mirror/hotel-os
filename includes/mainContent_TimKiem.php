<link href="css/smoothness/jquery-ui-1.8.2.custom.css" rel="stylesheet" type="text/css"/>
  <script src="js/jquery-1.4.2.min.js"></script>
  <script src="js/jquery-ui-1.8.2.custom.min.js"></script>

<div class="steps">
<ul>
<li id="Tim kiem" class="active">T&igrave;m ki&#7871;m </li>
<li id="step2" class="nonactive">Ch&#7885;n ph&ograve;ng </li>
<li id="step3" class="nonactive">Th&ocirc;ng tin </li>
<li id="step4" class="nonactive">K&#7871;t th&uacute;c </li>
</ul>

</div>
	<h2>&#272;I&#7872;U KI&#7878;N T&Igrave;M KI&#7870;M </h2>
	<div class="line">
		<label> Ng&agrave;y &#273;&#7871;n </label>
		<input type="text" id="dateden" class="text"/>
	</div>
	<div class="line">
		<label> Ng&agrave;y &#273;i </label>
		<input type="text" id="datedi" />
	</div>
	<div class="line">
		<label> S&#7889; &#273;&ecirc;m &#7903; </label>
		
		
		<select name="s" size="1"
onchange="document.ex.state.value = document.ex.s.options[document.ex.s.selectedIndex]
continued from previous line.value;document.ex.s.value=''">
<option value="1" selected="selected">1</option>
<option value="2"> 2</option>
<option value="3"> 3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
</select>
	</div>
	<div class="line">
		<label> S&#7889; l&#432;&#7907;ng ng&#432;&#7901;i l&#7899;n/ph&ograve;ng </label>
		<select name="s" size="1"
onchange="document.ex.state.value = document.ex.s.options[document.ex.s.selectedIndex]
continued from previous line.value;document.ex.s.value=''">
<option value="1" selected="selected">1</option>
<option value="2"> 2</option>
<option value="3"> 3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
</select>
	</div>
	
	<div class="line">
		<label> S&#7889; l&#432;&#7907;ng tr&#7867; em/ph&ograve;ng </label>
		<select name="s" size="1"
onchange="document.ex.state.value = document.ex.s.options[document.ex.s.selectedIndex]
continued from previous line.value;document.ex.s.value=''">
<option value="1" selected="selected">1</option>
<option value="2"> 2</option>
<option value="3"> 3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option> 
<option value="7">7</option>
<option value="8">8</option>
</select>
	</div>
	
	<div class="line">
		<label> S&#7889; ph&ograve;ng </label>
		<select name="s" size="1"
onchange="document.ex.state.value = document.ex.s.options[document.ex.s.selectedIndex]
continued from previous line.value;document.ex.s.value=''">
<option value="1" selected="selected">1</option>
<option value="2"> 2</option>
<option value="3"> 3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
</select>
	</div>
	
	<div class="line">
	<label> M&atilde; khuy&#7871;n m&atilde;i </label>
		<input type='text' class='text'/>
	</div>
	
	<input type="submit" onclick="javascript:window.location='/Temp_NuTrang/DKTimKiem_Group.php?step=2'" value="T&igrave;m ki&#7871;m"/>
	