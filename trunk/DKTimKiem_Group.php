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
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
 <title><?php echo TITLE;?> </title>   
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="stylesheet.css"/>
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="newstyle.css" rel="stylesheet" type="text/css" />

<link href="css/smoothness/jquery-ui-1.8.2.custom.css" rel="stylesheet" type="text/css"/>
  <script src="js/jquery-1.4.2.min.js"></script>
  <script src="js/jquery-ui-1.8.2.custom.min.js"></script>
 
<!-- Load the CloudCarousel JavaScript file -->

<script type="text/javascript" src="js/cloud-carousel.1.0.3.js"></script>
<script src="js/MyScript.js" type="text/javascript"></script>

</head>
<body>
<div id="main">
		<!-- header //-->
	<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
	<!-- header_eof //-->
	<div id="content">
		<!-- left_navigation //-->
		<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
		<!-- left_navigation_eof //-->
		<div id="mainContent">
			<?php 
				$step = $_GET['step'];
				switch ($step) {
				case 2:
					require(DIR_WS_INCLUDES . 'mainContent_Ketqua.php'); 
					break;
				case 3:
					require(DIR_WS_INCLUDES . 'mainContent_ThongTin.php'); 
					break;
				case 4:
					require(DIR_WS_INCLUDES . 'mainContent_KetThuc.php'); 
					break;
				default:
					require(DIR_WS_INCLUDES . 'mainContent_TimKiem.php'); 
				}
			?>
		</div>
	</div>
	<!-- footer //-->
	<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
	<!-- footer_eof //-->
</div>
</body>

<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
</html>