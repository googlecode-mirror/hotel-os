﻿<?php
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


<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>  
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
 <title>Bang chi tiet phong </title>   
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
	<!-- header_eof //-->
	<div id="gk-container">
		<!-- left_navigation //-->
		<?php require(DIR_WS_INCLUDES . 'column_left_chitiet.php'); ?>
		<!-- left_navigation_eof //-->
		
		<?php /*require(DIR_WS_INCLUDES . 'mainContent_ThongTin.php'); */?>
		<div id="mainContent">
		<?php 
			if (isset($HTTP_GET_VARS['room_type_id'])){
	   		$listing_sql1 = "select  room_type_description,room_type_price,room_type_image from " . room_type .  "  where room_type_id= '" . (int)$HTTP_GET_VARS['room_type_id'] . "' ";
	  	    }
	  	    $listing_split1 = new splitPageResults($listing_sql1, MAX_DISPLAY_SEARCH_RESULTS);
      		$listing_query1 = tep_db_query($listing_split1->sql_query);
	        $listing1 = tep_db_fetch_array($listing_query1);     
	         
//			$image=images.'/'.$HTTP_GET_VARS['room_image'];
//			$description=$HTTP_GET_VARS['room_description'];	
//			$price='$'.$HTTP_GET_VARS['room_price'];
//			$a= $HTTP_GET_VARS['customer_id'];
			//echo $customer_id;			
			if (tep_session_is_registered('customer_first_name') && tep_session_is_registered('customer_id')){
				$listing_sql = "select  customers_email_address, customers_telephone,customers_lastname from " .TABLE_CUSTOMERS.  "  where customers_id= '" . $customer_id . "' ";			
			$listing_split = new splitPageResults($listing_sql, MAX_DISPLAY_SEARCH_RESULTS);
	      	$listing_query = tep_db_query($listing_split->sql_query);
	        $listing = tep_db_fetch_array($listing_query);
			}
			//echo $listing['customers_email_address'];
		?>
        <div class="itemHeader">
        <?php
		echo tep_customer_greeting(); 
        //echo "\r\n customer :".$_SESSION['customer_id'];
		 ?>
            <h2 class="itemTitle">A1</h2>
        </div>
			
			<!--
<dl>
				<dt>Tên phòng: A1</dt>
				<dd class="image"><img class="detail" src="images/phong 3.jpg" alt="phong 3" /></dd>
				
				<dd><b>Lo?i phòng: </b> A</dd>				
				<dd><input type="submit" value="Ð?t phòng" onclick="javascript:showDatphongForm();"/></dd>
			</dl>
-->
        <div class="itemBody">
            <div class="itemImageBlock">
		      <span class="itemImage">
    		  	<a title="Click to preview image" href="http://localhost/Khotel/media/k2/items/cache/4965657af186b9092c7a96976ffe881c_XL.jpg" class="modal">
		  		  <img style="width: 600px; height: 400px;" alt="A1" src="<?php echo images.'/'.$listing1['room_type_image'];?>"/>
                </a>
              </span>
            </div>
                <div class="itemIntroText">
                    <p class="gioithieu"><b>Giới thiệu: </b></p>
				<?php echo $listing1['room_type_description'];?>;
                </div>            
        </div>				
                <div class="k2store_item_price">
                    <span class="item_price_label">Giá phòng : </span>
                    <span class="k2store_item_price_value">&nbsp;<?php echo '$'.$listing1['room_type_price'] ;?> </span>                    
                </div>
                <input type="submit" value="Đặt phòng" onclick="javascript:showDatphongForm();" />
				<div class="view">
					<h2>Góc ảnh</h2>
					<ul> 
							<li><a href="#"><img src="images/noithat1.jpg"/></a></li>
							<li><a href="#"><img src="images/noithat2.jpg"/></a></li>
							<li><a href="#"><img src="images/noithat3.jpg"/></a></li>
							<li><a href="#"><img src="images/phong 8.jpg"/></a></li>
					</ul>
				</div>
			<div class="clear"></div>
            
           <div id="datphongForm" title="THÔNG TIN ĐẶT PHÒNG" class="hidden">
           
           <p style="font-weight: bold;margin: 7px 0;">Xin vui lòng chọn ngày đến và đi của bạn.</p>
                
            <form id="signupForm" class="cart_form" method="post" action="newcart.php">

                	<div id="thongtinkhach">
                            <div class="line">
                			<label for="dateden"> Ngày đến  </label>
                			<input id="dateden" type="text" class="text" name="dateden"/>
                			</div> 
                            <div class="line">
                			<label for="datedi"> Ngày đi  </label>
                			<input id="datedi" type="text" class="text" name="datedi"/>
                			</div>
                   </div>
                   <input type="submit" value="Chấp nhận">
               
 </form>

                    <!--
<div class="mycart">
					<form id="cart_form" class="cart_form" action="index.php?option=com_k2store&view=mycart&format=ajax&order_code=$item->id" method="post">
					<input type="hidden" name="option" value="com_k2store" />
					<input type="hidden" name="task" value="cartaction" />
					<input type="hidden" name="Itemid" value="$Itemid" />
					<input type="hidden" id="order_code" name="order_code" value="$item->id" />
					<label><b> $item->title : </b> <input class="center" type="text" id="quantity" name="quantity" value="1" size="3" /></label>
					<label><b> $currency </b> $item_price </label>
					<input type="submit" name="submit" value="$add_to_cart_text" />
					
					<input type="button" value="$checkout_text " onclick="window.location = '$link'"/>
					</form>
					</div>
-->
            </div>
		</div>
	</div>
 </div>
 </div>
	<!-- footer //-->
	<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
	<!-- footer_eof //-->
 </div>
</body>

<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
</html>