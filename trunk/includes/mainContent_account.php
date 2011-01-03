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
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">  
<head>
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
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
  
  
  <script type="text/javascript" src="black_and_white_js/domready_fix.js"></script>
  <script type="text/javascript" src="black_and_white_js/modal.js"></script>

  <script type="text/javascript" src="black_and_white_js/k2.js"></script>
  <script type="text/javascript" src="black_and_white_js/caption.js"></script>
  <script type="text/javascript" src="black_and_white_js/gk.script.js"></script>
  <script type="text/javascript" src="black_and_white_js/engine-mootools-11.js"></script>
  <script type="text/javascript" src="black_and_white_js/k2store.js"></script>
  <script type="text/javascript" src="black_and_white_js/gk_image_show.js"></script>
  
  <script type="text/javascript" src="black_and_white_js/mootools.js"></script>

<script src="js/jquery-1.4.2.min.js"></script>
<script src="js/jquery-ui-1.8.2.custom.min.js"></script>
<script src="js/loopedslider.js"></script>
<script src="js/jquery.lightboxLib.js"></script>
<script src="js/MyScript.js"></script>
<link rel="stylesheet" type="text/css" href="smoothness/jquery-ui-1.8.2.custom.css">

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
var K2RatingURL = 'http://localhost/Khotel/';
  </script>




<!--[if IE 8.0]><link rel="stylesheet" href="http://localhost/Khotel/templates/gk_blackandwhite/css/ie8.css" type="text/css" /><![endif]-->
<!--[if IE 7.0]><link rel="stylesheet" href="http://localhost/Khotel/templates/gk_blackandwhite/css/ie.css" type="text/css" /><![endif]-->
<!--[if IE 7.0]><style>.clearfix { display: inline-block; } /* IE7xhtml*/</style><![endif]-->

<script type="text/javascript">
var siteurl='http://localhost/Temp_NuTrang/';
var tmplurl='http://localhost/Khotel/templates/gk_blackandwhite';
</script>


<link href="http://localhost/Khotel/templates/gk_blackandwhite/css/menu/mega.css" rel="stylesheet" type="text/css" /><script src="http://localhost/Khotel/templates/gk_blackandwhite/js/menu/mega.js" language="javascript" type="text/javascript"></script>

<link href="http://localhost/Khotel/templates/gk_blackandwhite/fonts/DroidSans/stylesheet.css" rel="stylesheet" type="text/css" /><link href="http://localhost/Khotel/templates/gk_blackandwhite/fonts/League_Gothic/stylesheet.css" rel="stylesheet" type="text/css" />
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
		font-family: DroidSans;
	}

	.gk_is_text h4,
	.moduletable.bigtitle h3 {
		font-family: LeagueGothic;
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
            								<span class="gk_is_slide">http://localhost/Temp_NuTrang/black_and_white_images/175244front2.jpg</span>
            								<span class="gk_is_slide">http://localhost/Temp_NuTrang/black_and_white_images/630481img1.jpg</span>
            								<span class="gk_is_slide">http://localhost/Temp_NuTrang/black_and_white_images/285113img2.jpg</span>
            
            								<span class="gk_is_slide">http://localhost/Temp_NuTrang/black_and_white_images/484496slide5.jpg</span>
            								<span class="gk_is_slide">http://localhost/Temp_NuTrang/black_and_white_images/916235slide6.jpg</span>
            								<span class="gk_is_slide">http://localhost/Temp_NuTrang/black_and_white_images/750852slide3.jpg</span>
            								<span class="gk_is_slide">http://localhost/Temp_NuTrang/black_and_white_images/797216slide8.jpg</span>
            								<span class="gk_is_slide">http://localhost/Temp_NuTrang/black_and_white_images/664703bedroom.jpg</span>
            			
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
		
	
	</div>
  </div>	
</div>
<!-- footer //-->
	<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
</body>

<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
</html>