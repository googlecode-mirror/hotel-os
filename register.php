<?php
/*
  $Id: index.php,v 1.1 2003/06/11 17:37:59 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License

*/

  require('includes/application_top.php');

// the following cPath references come from application_top.php
  $category_depth = 'top';
  if (isset($cPath) && tep_not_null($cPath)) {
    $categories_products_query = tep_db_query("select count(*) as total from " . TABLE_PRODUCTS_TO_CATEGORIES . " where categories_id = '" . (int)$current_category_id . "'");
    $cateqories_products = tep_db_fetch_array($categories_products_query);
    if ($cateqories_products['total'] > 0) {
      $category_depth = 'products'; // display products
    } else {
      $category_parent_query = tep_db_query("select count(*) as total from " . TABLE_CATEGORIES . " where parent_id = '" . (int)$current_category_id . "'");
      $category_parent = tep_db_fetch_array($category_parent_query);
      if ($category_parent['total'] > 0) {
        $category_depth = 'nested'; // navigate through the categories
      } else {
        $category_depth = 'products'; // category has no products, but display the 'no products' message
      }
    }
  }

  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_DEFAULT);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-gb" lang="en-gb">
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <meta name="robots" content="index, follow" />
  <meta name="keywords" content="joomla, Joomla" />
  <meta name="description" content="Joomla! - the dynamic portal engine and content management system" />
  <meta name="generator" content="Joomla! 1.5 - Open Source Content Management" />
    
 <title><?php echo TITLE;?> </title>   
<!--
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
-->
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<link href="style.css" rel="stylesheet" type="text/css" >
<link href="newstyle.css" rel="stylesheet" type="text/css" >
<link rel="stylesheet" href="css/carousel.css" type="text/css" />

<link rel="stylesheet" type="text/css" href="smoothness/jquery-ui-1.8.2.custom.css">

<!-- For Black and White template -->
 
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
  <link rel="stylesheet" href="black_and_white_css/style1.css" type="text/css" />
  

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

<!--[if IE 8.0]><link rel="stylesheet" href="black_and_white_css/ie8.css" type="text/css" /><![endif]-->
<!--[if IE 7.0]><link rel="stylesheet" href="black_and_white_css/ie.css" type="text/css" /><![endif]-->

<!--[if IE 7.0]><style>.clearfix { display: inline-block; } /* IE7xhtml*/</style><![endif]-->
<script type="text/javascript">
var siteurl='<?php echo HTTPS_SERVER.DIR_WS_HTTP_CATALOG ?>';
var tmplurl='templates/gk_blackandwhite';
</script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/loopedslider.js"></script>
<!--<script src="js/jquery.lightboxLib.js"></script>
-->
<script type="text/javascript">
jQuery.noConflict();
</script>
<script  type="text/javascript" src="js/MyScript.js"></script>
<link href="black_and_white_css/mega.css" rel="stylesheet" type="text/css" /><script src="templates/gk_blackandwhite/js/menu/mega.js" language="javascript" type="text/javascript"></script>
<link href="black_and_white_css/DroidSans/stylesheet.css" rel="stylesheet" type="text/css" /><link href="templates/gk_blackandwhite/fonts/League_Gothic/stylesheet.css" rel="stylesheet" type="text/css" />
<style type="text/css">	
	body {
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
		font-family: Arial,Helvetica,sans-serif,DroidSans;
	}

	.gk_is_text h4,
	.moduletable.bigtitle h3 {
		font-family: Arial,Helvetica,sans-serif,LeagueGothic;
	}

</style>
<!--Width of template -->
<style type="text/css">
.main { width: 1002px; margin: 0 auto; }
</style>
<!-- end head -->
</head>
<body id="bd" class="fs3 IE7">
<?php require(DIR_WS_INCLUDES . 'popup.php'); ?>
	
<div id="bg-wrap">
	<!-- header top //--><?php require(DIR_WS_INCLUDES . 'header_top.php'); ?>
	<!-- header top_eof //-->
    <div id="gk-wrapper-content" class="main"> 
        <div id="gk-wrapper-content2">

	        <a name="Top" id="top"></a> 
            
            <!-- header -->
            <?php require(DIR_WS_INCLUDES . 'header.php'); ?>
            <!-- end header -->      

	<div id="gk-container">
		<!-- left_navigation //-->
		<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
		<!-- left_navigation_eof //-->
		
	<!--*******************************************main content about register*******************************-->
    

	<div id="mainContent">
<form id="registeringForm" action="<?php echo tep_href_link('xulydangky.php') ?>" enctype="multipart/form-data" method="post" name="registeringForm" class="form-validate">

  <h2>ĐĂNG KÝ</h2> 
  
<div id="k2Container" class="k2AccountPage">

       <!--
 <form id="signupForm" method="get" action="xulydangky.php">
-->
        	<div id="thongtinkhach">
        		<h2> TH&Ocirc;NG TIN tài khoản </h2>
        		<a class="slide" href="javascript:showForm('khachForm');">Open</a>
        		<div id="khachForm">
        			<div class="line">
        			<label for="email">&#272;&#7883;a ch&#7881; email </label>
        			<input id="email" type="text" class="text" name="email"/>
        			</div>
        			
                    <div class="line">
        			<label for="matkhau">Mật khẩu </label>
        			<input id="matkhau" type="password" class="text" name="password"/>
        			</div>
                    
                    <div class="line">
        			<label for="rematkhau">Nhập lại mật khẩu </label>
        			<input id="rematkhau" type="password" class="text" name="repassword"/>
        			</div>
        		</div>
        	</div>
            <div id="thongtincanthiet">
        		<h2> Th&ocirc;ng Tin Cá nhân </h2>
        		<a class="slide" href="javascript:showForm('theCanthiet');">Open</a>
        		<div id="theCanthiet">
        			<div class="line">
        			<label for="tenchuthe"> Họ tên </label>
        			<input id="tenchuthe" type="text" class="text" name="name"/>
        			</div>
        			
        			<div class="line">
        			<label for="ngaysinh"> Ng&agrave;y sinh </label>
        			<input id="ngaysinh" type="text" class="text" name="dob"/>
        			</div>
        			
                    <div class="line">
        			<label> Gi&#7899;i t&iacute;nh </label>
        			<select name="gender" size="1">        			
        			<option value="Nam" selected="selected">Nam</option>	
        			<option value="nu"> Nu</option>
        			</select>
        			</div>
        			
                    <div class="line">
        			<label for="diachi"> &#272;&#7883;a ch&#7881;  </label>
        			<input id="diachi" type="text" class="text" name="address"/>
        			</div>
                    
                    <div class="line">
        			<label for="dienthoai">&#272;i&#7879;n tho&#7841;i li&ecirc;n l&#7841;c </label>
        			<input id="dienthoai" type="text" class="text" name="telephone"/>
        			</div>
        		</div>
        	</div>
          		<input type="submit" value="Đăng ký"/>
  <!--
      </form>
-->
    <div class="clear"></div>

  </div>



  <input type="hidden" name="task" value="register_save" />

  <input type="hidden" name="id" value="0" />

  <input type="hidden" name="gid" value="0" />

  <input type="hidden" name="K2UserForm" value="1" />

  <input type="hidden" name="eeab1b16b3091aa2dede7e21fe2a10f6" value="1" />


</form>
</div>
    <!--end main-->
	</div>
  </div>	
</div>
</div>

<!-- footer //-->
	<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
</body>

<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
</html>