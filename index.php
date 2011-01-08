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


<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>  
<head>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <meta name="robots" content="index, follow" />
  <meta name="keywords" content="joomla, Joomla" />
  <meta name="description" content="Joomla! - the dynamic portal engine and content management system" />
  <meta name="generator" content="Joomla! 1.5 - Open Source Content Management" />
    
 <title><?php echo TITLE;?> </title>   
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
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

<!-- ---------------------------- -->

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
            	<!--****************************************** centered image ********************************************-->
         <div id="gk-header" class="normal clearfix clear">
            <div class="moduletable clear">
                <div class="moduletable_content">
         <div id="gk_is-newsimage1" class="gk_is_wrapper gk_is_wrapper-template slide-links">
            	<div class="gk_is_preloader">Loading...</div>
            	<div class="gk_is_slides" style="width: 978px;height: 362px;">
            								<span class="gk_is_slide"><?php echo ( DIR_WS_HTTP_CATALOG.'black_and_white_images/175244front2.jpg' ); ?></span>
            								<span class="gk_is_slide"><?php echo ( DIR_WS_HTTP_CATALOG.'black_and_white_images/630481img1.jpg' ); ?></span>
            								<span class="gk_is_slide"><?php echo ( DIR_WS_HTTP_CATALOG.'black_and_white_images/285113img2.jpg' ); ?></span>
            
            								<span class="gk_is_slide"><?php echo ( DIR_WS_HTTP_CATALOG.'black_and_white_images/484496slide5.jpg' ); ?></span>
            								<span class="gk_is_slide"><?php echo ( DIR_WS_HTTP_CATALOG.'black_and_white_images/916235slide6.jpg' ); ?></span>
            								<span class="gk_is_slide"><?php echo ( DIR_WS_HTTP_CATALOG.'black_and_white_images/750852slide3.jpg' ); ?></span>
            								<span class="gk_is_slide"><?php echo ( DIR_WS_HTTP_CATALOG.'black_and_white_images/797216slide8.jpg' ); ?></span>
            								<span class="gk_is_slide"><?php echo ( DIR_WS_HTTP_CATALOG.'black_and_white_images/664703bedroom.jppg' ); ?></span>
            			
            	</div>
            
            	
            		<div class="gk_is_text" style="bottom:20px;right:20px;width:300px;">Text</div>
            		
            	    <ul class="gk_is_pagination" style="top:375px;left:75px;">
                            <li>1</li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
            
                            <li>5</li>
                            <li>6</li>
                            <li>7</li>
                            <li>8</li>
                        </ul>
                	
            	<div class="gk_is_text_data">
            				
            				
            		<div class="gk_is_text_item">
            
            			<h4><a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;layout=item&amp;id=1&amp;Itemid=95"><span>Star</span> Qualmark</a></h4>
            			<p>accommodation in the city centre provides 5 star qualmark accommodation <a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;layout=item&amp;id=1&amp;Itemid=95" class="readon">&raquo;</a></p>
            		</div>
            				
            				
            		<div class="gk_is_text_item">
            			<h4><a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=10:monte-santos-living-room&amp;Itemid=102"><span>Design</span> Sponge</a></h4>
            
            			<p>new and innovative furniture for your house <a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=10:monte-santos-living-room&amp;Itemid=102" class="readon">&raquo;</a></p>
            		</div>
            				
            				
            		<div class="gk_is_text_item">
            			<h4><a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=6:chicago-bulls-eastern-conference-of-the-nba&amp;Itemid=103"><span>Rusty</span> Wallace Villa</a></h4>
            			<p>handmade primitive, folk art and seasonal rusty house <a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=6:chicago-bulls-eastern-conference-of-the-nba&amp;Itemid=103" class="readon">&raquo;</a></p>
            		</div>
            
            				
            				
            		<div class="gk_is_text_item">
            			<h4><a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=9:let-the-sunlight-in-on-your-house&amp;Itemid=102"><span>Moco</span> Loco</a></h4>
            			<p>complete your imagination, with new sofa furniture collection <a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=9:let-the-sunlight-in-on-your-house&amp;Itemid=102" class="readon">&raquo;</a></p>
            		</div>
            				
            				
            		<div class="gk_is_text_item">
            			<h4><a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=4:villa-near-paraiso&amp;Itemid=119"><span>Yerger</span> Residence</a></h4>
            
            			<p>American most popular, beautiful &amp; affordable home. <a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=4:villa-near-paraiso&amp;Itemid=119" class="readon">&raquo;</a></p>
            		</div>
            				
            				
            		<div class="gk_is_text_item">
            			<h4><a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=19:debmoor-yellow-dream&amp;Itemid=130"><span>Fiana</span> bedroom</a></h4>
            			<p>superb modern designer furniture including bedroom balance design <a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=19:debmoor-yellow-dream&amp;Itemid=130" class="readon">&raquo;</a></p>
            
            		</div>
            				
            				
            		<div class="gk_is_text_item">
            			<h4><a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=5:heidi-fleiss-real-mansion&amp;Itemid=119"><span>Meriton</span> luxury</a></h4>
            			<p>Sleek modern design with luxury internals, realise your property dreams <a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=5:heidi-fleiss-real-mansion&amp;Itemid=119" class="readon">&raquo;</a></p>
            		</div>
            				
            				
            		<div class="gk_is_text_item">
            			<h4><a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=18:red-imperial-living-room&amp;Itemid=102"><span>Sinica</span> bedroom suite</a></h4>
            
            			<p>solid hardwood dining room tables, bedroom suites, furniture for your &hellip;<a href="/Khotel/index.php?option=com_k2&amp;view=item&amp;id=18:red-imperial-living-room&amp;Itemid=102" class="readon">&raquo;</a></p>
            		</div>
            			</div>
            </div>
          </div>
        </div>
       </div>
       	
            <script type="text/javascript">
            	try {$Gavick;}catch(e){$Gavick = {};};
            	$Gavick["gk_is-newsimage1"] = {
            		"anim_speed": 1800,
            		"anim_interval": 5000,
            		"autoanim": true,
            		"anim_type": "stripes-height",
            		"slide_links": true,
            		"stripe_width": 60	};
            </script>

	<div id="gk-container">
		<!-- left_navigation //-->
		<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
		<!-- left_navigation_eof //-->
		
		<?php /*require(DIR_WS_INCLUDES . 'mainContent_index.php'); */?>
		<div id="mainContent">
		<?php
		echo tep_customer_greeting(); 
       // echo "\r\n customer :".$_SESSION['customer_id'];
		 ?>
		<?php 
		if(isset($HTTP_GET_VARS['room_type_categories'])){
			// include(DIR_WS_MODULES . FILENAME_SEARCH_TYPE_ROOM);
			 $define_list = array('PRODUCT_LIST_IMAGE' => PRODUCT_LIST_IMAGE,
	                         'PRODUCT_LIST_NAME' => PRODUCT_LIST_NAME,                         
	                         'PRODUCT_LIST_PRICE' => PRODUCT_LIST_PRICE,   			 				                                  
	                         'PRODUCT_LIST_BUY_NOW' => PRODUCT_LIST_BUY_NOW);
	
	    asort($define_list);
	      $column_list = array();
	    reset($define_list);
	    while (list($key, $value) = each($define_list)) {
	      if ($value > 0) $column_list[] = $key;
	    }
	    $select_column_list = '';	
	    for ($i=0, $n=sizeof($column_list); $i<$n; $i++) {
	      switch ($column_list[$i]) {
	        case 'PRODUCT_LIST_IMAGE':
	          $select_column_list .= 'rt.room_type_image, ';
	          break;
	        case 'PRODUCT_LIST_NAME':
	          $select_column_list .= 'rt.room_type_name, ';
	          break;        
	      }
	    }	    
	    if (isset($HTTP_GET_VARS['room_type_categories'])){
	   	$listing_sql = "select  " . $select_column_list . " rt.room_type_id, rt.room_type_description,rt.room_type_price, rt.room_type_image from " . room_type .  " rt where rt.room_type_categories= '" . (int)$HTTP_GET_VARS['room_type_categories'] . "' ";
	    }
	    else {
	   	$listing_sql = "select  " . $select_column_list . " rt.room_type_id, rt.room_type_description,rt.room_type_price, rt.room_type_image from " . room_type .  " rt ";
	    }
		?>
		<h6> Khách hàng : <?php echo $customer_first_name;?> </h6>
		<?php 
	    include(DIR_WS_MODULES . FILENAME_PRODUCT_LISTING); 	  
		}
		else { ?>	
		<?php
		//Lấy số phòng còn trống của mỗi loại của ngày hiện tại
		$datecurent=date("Y-m-d"); 
		//echo $datecurent; 			
		$listing_sql2="select * from  status_room  where  status_room_dayofyear ='".$datecurent."'";		
		$listing_split2 = new splitPageResults($listing_sql2, MAX_DISPLAY_SEARCH_RESULTS);
	    $listing_query2 = tep_db_query($listing_split2->sql_query);
	    $listing2 = tep_db_fetch_array($listing_query2);
	   // echo $listing2['status_room_number_room_type_luxury1']; 
	    //Lấy sluong fong
	    function getroomtype($a){
	    	$listing_sql2="select * from  room_type  where  room_type_id ='".$a."'";		
		$listing_split2 = new splitPageResults($listing_sql2, MAX_DISPLAY_SEARCH_RESULTS);
	    $listing_query2 = tep_db_query($listing_split2->sql_query);
	    $listing2 = tep_db_fetch_array($listing_query2);
	    return $listing2[room_type_count];
	    }
	    echo getroomtype($listing2['status_room_number_room_type_luxury1']);
		?>
			<h3 class="welcome">Chào mừng quý khách đã đến với hệ thống Booking online của khách sạn chúng tôi. Đến với khách sạn quý khách sẽ bắt gặp thái độ phục vụ chuyên nghiệp, nhanh chóng. Kính chúc các bạn có kỳ nghỉ 	thoải mái ở khách sạn chúng tôi.</h3>
			<div id="showloaiphong">
				<p>Hiện tại khách sạn cung cấp một số loại phòng sau: </p>
				<div class="loaiphong">
					<h3>Loại A( phòng hội nghị): 1500$ <input type="submit" value="Đặt phòng"/></h3>
					<ul> 
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_type_id=1');?>"><img src="images/phongsangtrong1.jpg"/><span>Price:$1500</span></a></li>
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_type_id=2');?>"><img src="images/phongsangtrong2.jpg"/><span>Price:$1500</span></a></li>
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_type_id=3');?>"><img src="images/phongsangtrong3.jpg"/><span>Price:$1500</span></a></li>
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_type_id=4');?>"><img src="images/phongsangtrong4.jpg"/><span>Price:$1500</span></a></li>
					</ul>
					
					<a href="#" class="more">Xem thêm...</a>
					<div class="clear"></div>
				</div>
				<div class="loaiphong">
					<h3>Loại B: 1200$ <input type="submit" value="Đặt phòng"/></h3>
					<ul> 
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_id=5');?>"><img src="images/phongcaocap2.jpg"/><span>Price:$1200</span></a></li>
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_id=6');?>"><img src="images/phongcaocap2.jpg"/><span>Price:$1200</span></a></li>
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_id=7');?>"><img src="images/phongcaocap3.jpg"/><span>Price:$1200</span></a></li>
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_id=8');?>"><img src="images/phongcaocap8.jpg"/><span>Price:$1200</span></a></li>
					</ul>
					<a href="#" class="more">Xem thêm...</a>
					<div class="clear"></div>
				</div>
				<div class="loaiphong">
					<h3>Loại C: 800$ <input type="submit" value="Đặt phòng"/></h3>
					<ul> 
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_id=9');?>"><img src="images/phongsangtrong4.jpg"/><span>Price:$800</span></a></li>
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_id=10');?>"><img src="images/phong 10.jpg"/><span>Price:$800</span></a></li>
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_id=11');?>"><img src="images/phong 11.jpg"/><span>Price:$800</span></a></li>
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_id=12');?>"><img src="images/phong 12.jpg"/><span>Price:$800</span></a></li>
					</ul>
					<a href="#" class="more">Xem thêm...</a>
				</div>
				<div class="loaiphong">
					<h3>Loại D: 400$ <input type="submit" value="Đặt phòng"/></h3>
					<ul> 
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_id=13');?>"><img src="images/phong 16.jpg"/><span>Price:$400</span></a></li>
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_id=14');?>"><img src="images/phong 13.jpg"/><span>Price:$400</span></a></li>
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_id=15');?>"><img src="images/phong 14.jpg"/><span>Price:$400</span></a></li>
						<li><a href="<?php echo tep_href_link('chitietphong.php','room_id=16');?>"><img src="images/phong 15.jpg"/><span>Price:$400</span></a></li>
					</ul>
					<a href="#" class="more">Xem thêm...</a>
				</div>
				<!--<ul>
					<li>
						<div class="roomType">
							<a href="javascript:showphongOfRoomType(1);"><img src="images/phong 1.jpg" alt="Phòng VIP"></a>
							<p>Loại A: 1500$</p>
						</div>
					</li>
					 <li>
						<div class="roomType">
							<a href="javascript:showphongOfRoomType(2);"><img src="images/phong 2.jpg" alt="Phòng Tot"></a>
							<p>Loại B: 1200$</p>
						</div>
					</li>
					<li>
						<div class="roomType">
						
							<a href="javascript:showphongOfRoomType(3);"><img src="images/phong 3.jpg" alt="Phòng Dep"></a>
							<p>Loại C: 800$</p>
					</li>
					 <li>
						<div class="roomType">
							<a href="javascript:showphongOfRoomType(4);"><img src="images/phong 5.jpg" alt="Phòng TB"></a>
							<p>Loại D: 400$</p>
						</div>
					</li>
				 </ul>-->
			 </div>
			<?php }?>  
             <div id="showphongDiv" class="hidden">
                 <p id="showphongHeader"></p>
                <div id="showphong">
                    <div class="container">
        				<ul class="slides">
        					<li><a href="javascript:detail(1)"><img id="1" src="images/phong 1.jpg"></a></li>
        					<li><a href="javascript:detail(2)"><img id="2" src="images/phong 2.jpg"></a></li>
        					<li><a href="javascript:detail(3)"><img id="3" src="images/phong 3.jpg"></a></li>
        					<li><a href="javascript:detail(4)"><img id="4" src="images/phong 4.jpg"></a></li>
        					<li><a href="javascript:detail(5)"><img id="5" src="images/phong 5.jpg"></a></li>
        					<li><a href="javascript:detail(6)"><img id="6" src="images/phong 6.jpg"></a></li>
        				</ul>
    			     </div>
					 
    				<p><a href="#" class="prev">Previous</a></p>
    				<p><a href="#" class="next">Next</a></p>
    				<!--<ul class="pagination">
    					<li><a href="#">1</a></li>
    					<li><a href="#">2</a></li>
    					<li><a href="#">3</a></li>
    					<li><a href="#">4</a></li>
    					<li><a href="#">5</a></li>
    					<li><a href="#">6</a></li>				
    				</ul>	-->
                </div>
             </div>
			
			<div class="clear"></div>
		</div>
	</div>
  </div>	
</div>
<!-- footer //-->
	<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
</div>
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
