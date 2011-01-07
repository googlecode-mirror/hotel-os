<?php
/*
  $Id: index.php,v 1.1 2003/06/11 17:37:59 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License

*/

  require('includes/application_top.php');
  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_DEFAULT);
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>  
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
 <title>Form dat phong </title>   
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<link href="style.css" rel="stylesheet" type="text/css" >
<link rel="stylesheet" href="css/carousel.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="smoothness/jquery-ui-1.8.2.custom.css">
<link href="newstyle.css" rel="stylesheet" type="text/css" >
<!-- black and white-->
<link href="/Khotel/templates/gk_blackandwhite/favicon.ico" rel="shortcut icon" type="image/x-icon" />
  <link rel="stylesheet" href="black_and_white_css/modal.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/k2.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/system.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/general.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/addons.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/layout.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/template.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/joomla.css" type="text/css" />

  <link rel="stylesheet" href="black_and_white_css/gk_stuff.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/typo.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/css3.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/style1.css" type="text/css" >
  
  <script type="text/javascript" src="black_and_white_js/mootools.js"></script>
<script type="text/javascript" src="black_and_white_js/domready_fix.js"></script>
<script type="text/javascript" src="black_and_white_js/modal.js"></script>
 <script type="text/javascript" src="black_and_white_js/k2.js"></script>
 <script type="text/javascript" src="black_and_white_js/caption.js"></script>
 <script type="text/javascript" src="black_and_white_js/gk.script.js"></script>
 <script type="text/javascript" src="black_and_white_js/engine-mootools-11.js"></script>
 <script type="text/javascript" src="black_and_white_js/k2store.js"></script>
 <script type="text/javascript" src="black_and_white_js/gk_image_show.js"></script>
 


  <script type="text/javascript">
window.addEvent("domready", function() {
	SqueezeBox.initialize({});
	$$("a.modal").each(function(el) {
		el.addEvent("click", function(e) {
			new Event(e).stop();
			SqueezeBox.fromElement(el);
		});
	});
});
var K2RatingURL = '<?php echo HTTPS_SERVER.DIR_WS_HTTP_CATALOG ?>';
  </script>




<!--[if IE 8.0]><link rel="stylesheet" href="http://localhost/Khotel/templates/gk_blackandwhite/css/ie8.css" type="text/css" /><![endif]-->
<!--[if IE 7.0]><link rel="stylesheet" href="http://localhost/Khotel/templates/gk_blackandwhite/css/ie.css" type="text/css" /><![endif]-->
<!--[if IE 7.0]><style>.clearfix { display: inline-block; } /* IE7xhtml*/</style><![endif]-->

<script type="text/javascript">
var siteurl='<?php echo HTTPS_SERVER.DIR_WS_HTTP_CATALOG ?>';
var tmplurl='templates/gk_blackandwhite';
</script>

<script src="js/jquery-1.4.2.min.js"></script>
<script src="js/jquery-ui-1.8.2.custom.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/loopedslider.js"></script>
<!--<script src="js/jquery.lightboxLib.js"></script>
-->
<script>
jQuery.noConflict();
</script>
<script src="js/MyScript.js"></script>



<link href="templates/gk_blackandwhite/css/menu/mega.css" rel="stylesheet" type="text/css" /><script src="templates/gk_blackandwhite/js/menu/mega.js" language="javascript" type="text/javascript"></script>

<link href="templates/gk_blackandwhite/fonts/DroidSans/stylesheet.css" rel="stylesheet" type="text/css" /><link href="templates/gk_blackandwhite/fonts/League_Gothic/stylesheet.css" rel="stylesheet" type="text/css" />
<style type="text/css">	

/*	body {
		font-family: Arial, Helvetica, sans-serif;
	}
	
    .moduletable_menu h3,
    .moduletable_text h3,
    .moduletable h3,
    #gk-popup h3,
    #gk-mainnav .level0>li>a,
	.itemRelated h3, 
	.itemAuthorLatest h3
	{
		font-family: DroidSans;
	}

	.gk_is_text h4,
	.moduletable.bigtitle h3 {
		font-family: LeagueGothic;
	}
*/
</style>
<!--Width of template -->
<style type="text/css">
.main { width: 1002px; margin: 0 auto; }
</style>

</head>
<body id="bd" class="fs3 FF">
<div id="main">
    <?php require(DIR_WS_INCLUDES . 'header_top.php'); ?>
	<!-- header //-->
	<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
	<!-- header_eof //-->
	<div id="content">
		<!-- left_navigation //-->
		<?php require(DIR_WS_INCLUDES . 'column_left_chitiet.php'); ?>
		<!-- left_navigation_eof //-->
		
		<?php /*require(DIR_WS_INCLUDES . 'mainContent_ThongTin.php'); */?>
		<div id="mainContent">
		      <h2 style="text-align: center;">THÔNG TIN ĐĂNG KÝ ĐẶT PHÒNG</h2>
           <div id="datphongForm" title="THÔNG TIN ĐẶT PHÒNG">
           <!--check chọn người đặt phòng-->
           <?php ?>
           <input id="setMyself" type="radio" name="setRoom" class="payment" value="0"/>Đặt phòng cho chính bạn
           <input id="setFor" type="radio" name="setRoom" class="payment" value="1"/>Đặt phòng cho người khác
           
           
                <form id="signupForm" method="post" action="xulydangky.php">
                	<div id="thongtinkhach">
                            <div class="line">
                			<label for="hoten"> Họ tên KH </label>
                			<input id="hoten" type="text" class="text" name="hoten" />
                			</div>
                			<div class="line">
                			<label for="email">&#272;&#7883;a ch&#7881; email </label>
                			<input id="email" type="text" class="text" name="email"/>
                			</div>
                			<div class="line">
                			<label for="diachi"> &#272;&#7883;a ch&#7881;  </label>
                			<input id="diachi" type="text" class="text" name="diachi"/>
                			</div>      
                			<div class="line">
                			<label for="dienthoai">&#272;i&#7879;n tho&#7841;i li&ecirc;n l&#7841;c </label>
                			<input id="dienthoai" type="text" class="text" name="dienthoai"/>
                			</div>
                            
                            <div class="line">
                			<label for="dateden"> Ngày đến  </label>
                			<input id="dateden" type="text" class="text" name="dateden"/>
                			</div> 
                            <div class="line">
                			<label for="datedi"> Ngày đi  </label>
                			<input id="datedi" type="text" class="text" name="datedi"/>
                			</div>
                            <div class="line">
                			<label for="datedi"> Số lượng phòng  </label>
                			<input id="datedi" type="text" class="text" name="datedi"/>
                			</div>
                            <div class="line">
                			<label for="nguoilon"> Số người lớn  </label>
                			<input id="nguoilon" type="text" class="text" name="nguoilon"/>
                			</div>
                             
                             <div class="line">
                			<label for="treem"> Số trẻ em  </label>
                			<input id="treem" type="text" class="text" name="treem"/>
                			</div>
                            
                            <div class="line">
                            <p>Phương thức thanh toán</p>                			
                			<input id="cash" type="radio" name="payment" class="payment" value="0"/>Tiền mặt
                            <input id="card" type="radio" name="payment" class="payment" value="1"/>Thẻ tín dụng
                			</div>
                	</div>
                	<div id="thongtinthe" class="hidden">                		
                			<div class="line">
                			<label for="tenchuthe"> T&ecirc;n Ch&#7911; Th&#7867; </label>
                			<input id="tenchuthe" type="text" class="text" name="tenchuthe"/>
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
                		<input type="submit" value="&#272;&#7863;t ph&ograve;ng" onclick="success.php">
                </form>
            </div>
            <div class="clear"></div>
		</div>
	</div>
	<!-- footer //-->
	<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
	<!-- footer_eof //-->
</div>
</body>

<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
</html>