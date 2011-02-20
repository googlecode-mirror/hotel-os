<?php
/*
  $Id: product_listing.php,v 1.44 2003/06/09 22:49:59 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/
?>

<?php 
  $listing_split = new splitPageResults($listing_sql, MAX_DISPLAY_SEARCH_RESULTS, 'rt.room_type_categories');
  if ( ($listing_split->number_of_rows > 0) && ( (PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '2') ) ) {
?>
<?php
  }
  $list_box_contents = array();
  for ($col=0, $n=sizeof($column_list); $col<$n; $col++) {
    switch ($column_list[$col]) {
      case 'PRODUCT_LIST_IMAGE':
        $lc_text = "Hình ảnh";
        $lc_align = '';
        break;
      case 'PRODUCT_LIST_NAME':
        $lc_text = 'Loại phòng';
        $lc_align = '';
        break;     
      case 'PRODUCT_LIST_PRICE':
        $lc_text = 'Giá';
        $lc_align = 'center';
        break;       
      case 'PRODUCT_LIST_BUY_NOW':
        $lc_text = 'Đặt phòng';
        $lc_align = 'center';
        break;
    }

    if ( ($column_list[$col] != 'PRODUCT_LIST_BUY_NOW') && ($column_list[$col] != 'PRODUCT_LIST_IMAGE') ) {
      $lc_text = tep_create_sort_heading($HTTP_GET_VARS['sort'], $col+1, $lc_text);
    }

    $list_box_contents[0][] = array('align' => $lc_align,
                                    'params' => 'class="productListing-heading"',
                                    'text' => '&nbsp;' . $lc_text . '&nbsp;');
   }
  	if ($listing_split->number_of_rows > 0) {
    $rows = 0;
    $listing_query = tep_db_query($listing_split->sql_query);
    while ($listing = tep_db_fetch_array($listing_query)) {
      $rows++;
	
      if (($rows/2) == floor($rows/2)) {
        $list_box_contents[] = array('params' => 'class="productListing-even"');
      } else {
        $list_box_contents[] = array('params' => 'class="productListing-odd"');
      }

      $cur_row = sizeof($list_box_contents) - 1;
      for ($col=0, $n=sizeof($column_list); $col<$n; $col++) {
        $lc_align = '';   
        switch ($column_list[$col]) {        
          case 'PRODUCT_LIST_NAME':
            $lc_align = '';
            if (isset($HTTP_GET_VARS['room_type_categories'])) {
            $p_name = $lc_text =  '<a href="' . tep_href_link("chitietphong.php", 'room_type_id=' . $listing['room_type_id']) . '">' . $listing['room_type_name'] . '</a>';
            } else {
            $p_name = $lc_text =  '<a href="' . tep_href_link("chitietphong.php", 'room_type_id=' . $listing['room_type_id']) . '">' . $listing['room_type_name'] . '</a>';
            }
            break;        
          case 'PRODUCT_LIST_PRICE':
            $lc_align = 'center';
            if (tep_not_null($listing['specials_new_products_price'])) {
           $p_price = $lc_text = '<s>' .  $currencies->display_price($listing['room_type_price'], tep_get_tax_rate($listing['products_tax_class_id'])) . '</s>&nbsp; <span class="productSpecialPrice">' . $currencies->display_price($listing['specials_new_products_price'], tep_get_tax_rate($listing['products_tax_class_id'])) . '</span>';
          	
            } else {
           $p_price = $lc_text =$currencies->display_price($listing['room_type_price'], tep_get_tax_rate($listing['products_tax_class_id'])) . '</span>';
          
            }
            break;         
          case 'PRODUCT_LIST_IMAGE':
          	  $lc_align = 'center';
     	   if (isset($HTTP_GET_VARS['room_type_categories'])) {
              $p_pic = $lc_text =  '<a href="' . tep_href_link("chitietphong.php", 'room_type_id=' . $listing['room_type_id'] ) .  '">' .tep_image(DIR_WS_IMAGES . "phongkhachsan/".$listing['room_type_image'],$listing['room_type_image'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '</a>';
             // $lc_text = '<a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'manufacturers_id=' . $HTTP_GET_VARS['manufacturers_id'] . '&products_id=' . $listing['products_id']) . '">' . tep_image(DIR_WS_IMAGES . $listing['room_image'], $listing['room_name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '</a>';                         
            } else {
             $lc_text = '<a href="' . tep_href_link(FILENAME_PRODUCT_INFO, ($cPath ? 'cPath=' . $cPath . '&' : '') ) . '">' . tep_image(DIR_WS_IMAGES . $listing['room_type_image'], $listing['room_type_id'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '</a>';             
            }
             break;       
          case 'PRODUCT_LIST_BUY_NOW':
            $lc_align = 'center';
            //$lc_text = '<a href="' . tep_href_link(basename($PHP_SELF), tep_get_all_get_params(array('action')) . 'action=buy_now&products_id=' . $listing['products_id']) . '">' . tep_image_button('button_buy_now.gif', IMAGE_BUTTON_BUY_NOW) . '</a>&nbsp;';
             $lc_text = '<a class="product_list" href="' . tep_href_link("addcartnew.php",'room_type_id=' . $listing['room_type_id'].'&count_room='.$num_room) . '">' . tep_image_button('book_room.gif', IMAGE_BUTTON_BUY_NOW) . '</a>&nbsp;';
           // $lc_text='<input type="text" class="mintext" style="width:10px;"/>';
            break;
        }
	$list_box_contents[$cur_row][] = array('align' => $lc_align,
                                               'params' => 'class="productListing-data"',
                                               'text'  => $lc_text); 

 }
    }
     new productListingBox($list_box_contents);
  } else {
    $list_box_contents = array();

    $list_box_contents[0] = array('params' => 'class="productListing-odd"');
    $list_box_contents[0][] = array('params' => 'class="productListing-data"',
                                   'text' => TEXT_NO_PRODUCTS);

    new productListingBox($list_box_contents);
  }
  if ( ($listing_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3')) ) {
?>

<?php echo tep_draw_result_bottom(); ?>
<?php echo tep_draw_result_top_2(); ?>
<table border="0" width="100%" cellspacing="0" cellpadding="0" class="result">
  <tr>
    <td><?php echo $listing_split->display_count(TEXT_DISPLAY_NUMBER_OF_PRODUCTS); ?></td>
    <td class="result_right" align="right"><?php echo TEXT_RESULT_PAGE . ' ' . $listing_split->display_links(MAX_DISPLAY_PAGE_LINKS, tep_get_all_get_params(array('page', 'info', 'x', 'y'))); ?></td>
  </tr>
</table>
<?php echo tep_draw_result_bottom_2(); ?>
<?php
  }
?>
