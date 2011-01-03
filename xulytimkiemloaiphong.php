<?php
 require('includes/application_top.php');
  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_DEFAULT);
    //require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_NEW_PRODUCTSW);
  if(isset($HTTP_GET_VARS['room_type'])){
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
	          $select_column_list .= 'r.room_image, ';
	          break;
	        case 'PRODUCT_LIST_NAME':
	          $select_column_list .= 'r.room_name, ';
	          break;        
	      }
	    }
	    
	   if (isset($HTTP_GET_VARS['room_type'])){
	   	$listing_sql = "select  " . $select_column_list . " r.room_id, r.room_description,r.room_price, r.room_image from " . room .  " r where r.room_type= '" . (int)$HTTP_GET_VARS['room_type'] . "' ";
	   }
	   else {
	   	$listing_sql = "select  " . $select_column_list . " r.room_id, r.room_name, r.room_description,r.room_price, r.room_image from " . room .  " r ";
	   }
	  include(DIR_WS_MODULES . FILENAME_PRODUCT_LISTING); 
  }
?>
