<?php
/*
  $Id: specials.php,v 1.31 2003/06/09 22:21:03 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

  if ($random_product = tep_random_select("select p.products_id, pd.products_name, p.products_price, p.products_tax_class_id, p.products_image, s.specials_new_products_price from " . TABLE_PRODUCTS . " p, " . TABLE_PRODUCTS_DESCRIPTION . " pd, " . TABLE_SPECIALS . " s where p.products_status = '1' and p.products_id = s.products_id and pd.products_id = s.products_id and pd.language_id = '" . (int)$languages_id . "' and s.status = '1' order by s.specials_date_added desc limit " . MAX_RANDOM_SELECT_SPECIALS)) {
?>
<!-- specials //-->
          <tr>
            <td>
<?php
    $info_box_contents = array();
    $info_box_contents[] = array('text' => BOX_HEADING_SPECIALS);

    new infoBoxHeading4($info_box_contents, false, false, tep_href_link(FILENAME_SPECIALS));
	
	$name_prod = '<span><a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $random_product['products_id']) . '">' . $random_product['products_name'] . '</a></span>';
	
	$pic_prod = '<a href="' . tep_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $random_product['products_id']) . '">' . tep_image(DIR_WS_IMAGES . $random_product['products_image'], $random_product['products_name'], HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT) . '</a>';

	$sp_price_1 = '<span class="productSpecialPrice">' . $currencies->display_price($random_product['specials_new_products_price'], tep_get_tax_rate($random_product['products_tax_class_id'])).'</span>';
	
	$sp_price_2 = '<del>' . $currencies->display_price($random_product['products_price'], tep_get_tax_rate($random_product['products_tax_class_id'])) . '</del>';
	 
	 $sp_price = $sp_price_2.'<br />'.tep_draw_separator('spacer.gif', '1', '9').'<br />'.$sp_price_1;
				
    $info_box_contents = array();
    $info_box_contents[] = array('align' => 'center',
                                 'text' => '
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td>'.tep_draw_box_prod_top().''.$pic_prod.''.tep_draw_box_prod_bottom().'</td>
                    <td>'.tep_draw_separator('spacer.gif', '10', '1').'</td>
					<td style="width:100%">
                      <table cellpadding="0" cellspacing="0" border="0" class="box_body">
                            <tr>
                                <td class="vam" style="height:31px ">'.$name_prod.'</td>
                            </tr>
                            <tr>
                                <td class="vam" style="height:46px ">'.$sp_price.'</td>
                            </tr>
                        </table> 
                    </td>
                </tr>
            </table>');

    new infoBox4($info_box_contents);
?>
            </td>
          </tr>
<!-- specials_eof //-->
<?php
  }
?>
