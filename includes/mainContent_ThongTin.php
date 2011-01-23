<?php
	require('includes/application_top.php');
	require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_CREATE_ACCOUNT);
?>

<link href="css/smoothness/jquery-ui-1.8.2.custom.css" rel="stylesheet" type="text/css"/>
  <script src="js/jquery-1.4.2.min.js"></script>
  <script src="js/jquery-ui-1.8.2.custom.min.js"></script>
  
<script src="js/cmxforms.js" type="text/javascript"></script>  
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/MyScript.js" type="text/javascript"></script>
<div class="steps">
<ul>
<li id="step1" class="nonactive">T&igrave;m ki&#7871;m </li>
<li id="step2" class="nonactive">Ch&#7885;n ph&ograve;ng </li>
<li id="step3" class="active">Th&ocirc;ng tin </li>
<li id="step4" class="nonactive">K&#7871;t th&uacute;c </li>
</ul>
</div>
	
<form id="signupForm" method="get" action="">
	<div id="thongtinkhach">
		<h2> TH&Ocirc;NG TIN KH&Aacute;CH H&Agrave;NG </h2>
		<a class="slide" href="javascript:showForm('khachForm');">Open</a>
		<div id="khachForm">
			<div class="line">
			<label for="email">&#272;&#7883;a ch&#7881; email </label>
			<input id="email" type="text" class="text" name="email"/>
			</div>
			
			<div class="line">
			<label for="reemail">X&aacute;c nh&#7853;n &#273;&#7883;a ch&#7881; email </label>
			<input id="reemail" type="text" class="text" name="reemail" />
			
			</div>
			
			<div class="line">
			<label for="ho"> H&#7885; </label>
			<input id="ho" type="text" class="text" name="ho" />
			</div>
			
			<div class="line">
			<label for="ten"> T&ecirc;n </label>
			<input id="ten" type="text" class="text" name="ten"/>
			</div>
			
			<div class="line">
			<label for="diachi"> &#272;&#7883;a ch&#7881;  </label>
			<input id="diachi" type="text" class="text" name="diachi"/>
			</div>
			
			<div class="line">
			<label for="thanhpho"> Th&agrave;nh ph&#7889; </label>
			<input id="thanhpho" type="text" class="text" name="thanhpho"/>
			</div>
			
			<div class="line">
			<label for="quocgia"> Qu&#7889;c gia </label>
			<select id="quocgia" name="quocgia" size="1"
			onchange="document.ex.state.value = document.ex.s.options[document.ex.s.selectedIndex]
			continued from previous line.value;document.ex.s.value=''">
			<option selected="selected"></option>	
			<?php 	$conn = mysql_connect("localhost","root","");
			if(!$conn){
				die('Loi' . mysql_error());
			}
			//mysql_select_db("my_db", $conn);
			$result = tep_db_query("SELECT * FROM  countries");
			while($row = tep_db_fetch_array($result)){
				$id = $row['countries_id'];
				$name = $row['countries_name'];
				echo "<option value=\"{$id}\"> {$name} </option>\n";
			}
			?>
			</select>
			</div>
			
			<div class="line">
			<label for="dienthoai">&#272;i&#7879;n tho&#7841;i li&ecirc;n l&#7841;c </label>
			<input id="dienthoai" type="text" class="text" name="dienthoai"/>
			</div>
			
			<div class="line">
			<label> Gi&#7899;i t&iacute;nh </label>
			<select name="s" size="1"
			onchange="document.ex.state.value = document.ex.s.options[document.ex.s.selectedIndex]
			continued from previous line.value;document.ex.s.value=''">
			<option value="Nam" selected="selected">Nam</option>	
			<option value="nu"> Nu</option>
			</select>
			</div>
			
			<div class="line">
			<label> Y&ecirc;u c&#7847;u c&#7911;a kh&aacute;ch </label>
			<!-- <input type="checkbox"  runat="server" id="chkBox" <option value="test">  Loi di rieng cho nguoi tan tat</option /> 
					<asp:Label ID="lblCheckboxValue" runat="server" /> -->	
				<ul class="checkbox">
						<li><INPUT TYPE="checkbox" NAME="checkbox" VALUE="checkbox">
					L&#7889;i &#273;i ri&ecirc;ng cho ng&#432;&#7901;i t&agrave;n t&#7853;t		</input></li>
						<li><INPUT TYPE="checkbox" NAME="checkbox" VALUE="checkbox"> 
				   Ph&ograve;ng kh&ocirc;ng h&uacute;t thu&#7889;c           		</input></li>
						<li><INPUT TYPE="checkbox" NAME="checkbox" VALUE="checkbox"> 
					Ph&ograve;ng h&uacute;t thu&#7889;c							</input>
						</li>
				</ul>		
		  </div>		
			<div class="line">		
			<label> Y&ecirc;u c&#7847;u kh&aacute;c </label> 
				<ul class="checkbox">
					<li><INPUT TYPE="RADIO" NAME="RADIOBUTTON" VALUE="RADIOBUTTON"> 
			Gi&#432;&#7901;ng &#273;&ocirc;i</input></li>
					<li><INPUT TYPE="RADIO" NAME="RADIOBUTTON" VALUE="RADIOBUTTON"> 
			2 gi&#432;&#7901;ng &#273;&#417;n</input></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="thongtinthe">
		<h2> Th&ocirc;ng Tin Th&#7867; Card </h2>
		<a class="slide" href="javascript:showForm('theForm');">Open</a>
		<div id="theForm">
			<div class="line">
			<label for="tenchuthe"> T&ecirc;n Ch&#7911; Th&#7867; </label>
			<input id="tenchuthe" type="text" class="text" name="tenchuthe"/>
			</div>
			
			<div class="line">
			<label for="ngayhethan"> Ng&agrave;y h&#7871;t h&#7841;n </label>
			<input id="ngayhethan" type="text" class="text" name="ngayhethan"/>
			</div>
			<div class="line">
			<label> Lo&#7841;i th&#7867; </label>
			<select name="s" size="1"	>
			<option value="1" selected="selected">Mater Card</option>		
			<option value="2"> Visa Card</option>
			
			</select>
			</div>
			<div class="line">
			
			<label for="sothe">  S&#7889; th&#7867; </label>
			<input id="sothe" type="text" class="text" name="sothe"/>
			</div>
			<div> 			
			   <INPUT TYPE="checkbox" NAME="checkbox" VALUE="checkbox"> 
			   T&ocirc;i ch&#7845;p nh&#7853;n v&#7899;i c&aacute;c &#273;i&#7873;u kho&#7843;n tr&ecirc;n
			</div>
		</div>
	</div>
		<input type="submit" value="&#272;&#7863;t ph&ograve;ng" onclick="javascript:window.location='/hotelbooking/DKTimKiem_Group.php?step=4'"/>
</form>