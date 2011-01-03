<?php
/*
  $Id: index.php,v 1.1 2003/06/11 17:38:00 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

define('TEXT_MAIN', '');
define('TABLE_HEADING_NEW_PRODUCTS', 'Sản phẩm mới trong tháng');
define('TABLE_HEADING_UPCOMING_PRODUCTS', 'Sản phẩm');
define('TABLE_HEADING_DATE_EXPECTED', 'Ngày hết hạn');

if ( ($category_depth == 'products') || (isset($HTTP_GET_VARS['manufacturers_id'])) ) {
  define('HEADING_TITLE', 'Xem những gì chúng tôi có ở đây');
  define('TABLE_HEADING_IMAGE', '');
  define('TABLE_HEADING_MODEL', 'Model');
  define('TABLE_HEADING_PRODUCTS', 'Tên sản phẩm');
  define('TABLE_HEADING_MANUFACTURER', 'Nhà cung cấp');
  define('TABLE_HEADING_QUANTITY', 'Khối lượng');
  define('TABLE_HEADING_PRICE', 'Giá');
  define('TABLE_HEADING_WEIGHT', 'Trọng lượng');
  define('TABLE_HEADING_BUY_NOW', 'Đặt mua');
  define('TEXT_NO_PRODUCTS', 'Không có sản phẩm nào trong chủng loại này.');
  define('TEXT_NO_PRODUCTS2', 'Không có sản phẩm nào từ nhà cung cấp này.');
  define('TEXT_NUMBER_OF_PRODUCTS', 'Số sản phẩm: ');
  define('TEXT_SHOW', '<b>Xem :</b>');
  define('TEXT_BUY', 'Đặt mua 1 \'');
  define('TEXT_NOW', '\' ngay');
  define('TEXT_ALL_CATEGORIES', 'Tất cả chủng loại');
  define('TEXT_ALL_MANUFACTURERS', 'Tầt cả Nhà cung cấp');
} elseif ($category_depth == 'Trang chủ') {
  define('HEADING_TITLE', 'Có gì mới?');
} elseif ($category_depth == 'nested') {
  define('HEADING_TITLE', 'Chủng loại');
}
?>
