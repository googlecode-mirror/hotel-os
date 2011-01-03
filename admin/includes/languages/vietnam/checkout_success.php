<?php
/*
  $Id: checkout_success.php,v 1.12 2003/04/15 17:47:42 dgw_ Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2002 osCommerce

  Released under the GNU General Public License
*/

define('NAVBAR_TITLE_1', 'Hoàn tất');
define('NAVBAR_TITLE_2', 'Thành công');

define('HEADING_TITLE', 'Đơn hàng của bạn đã được xử lý!');

define('TEXT_SUCCESS', 'Đơn hàng của bạn đã được xử lý thành công! Những sản phẩm mà bạn đã chọn và đặt mua, chúng tôi sẽ gửi đến nhà cung cấp. Họ sẽ liên lạc với bạn trong thời gian sớm nhất có thể để thảo luận về việc giao/nhận hàng.');
define('TEXT_NOTIFY_PRODUCTS', 'Bạn có muốn nhận những thông tin thay đổi về những sản phẩm mà  đã chọn dưới đây không ?<br><i>Nếu không muốn nhận thông tin cập nhật của sản phẩm nào, bạn chỉ cần bỏ dấu chọn trước tên của sản phẩm là được.</i>');
define('TEXT_SEE_ORDERS', 'Bạn có thể xem lại lịch sử đơn hàng của bạn bằng liên kết vào trang : <a href="' . tep_href_link(FILENAME_ACCOUNT, '', 'SSL') . '">\'Tài khoản cá nhân\'</a> và nhấp vào <a href="' . tep_href_link(FILENAME_ACCOUNT_HISTORY, '', 'SSL') . '">\'Lịch sử đơn hàng\'</a>.');
define('TEXT_CONTACT_STORE_OWNER', 'Bạn có thể gửi trực tiếp những câu hỏi, những góp ý về website, hay bất cứ gì bạn quan tâm cho <a href="' . tep_href_link(FILENAME_CONTACT_US) . '">chúng tôi</a>.');
define('TEXT_THANKS_FOR_SHOPPING', 'Cám ơn bạn đã xem và đặt hàng tại website của chúng tôi!');

define('TABLE_HEADING_COMMENTS', 'Nhập 1 chú thích cho đơn hàng đã xử lý');

define('TABLE_HEADING_DOWNLOAD_DATE', 'Ngày hết hạn: ');
define('TABLE_HEADING_DOWNLOAD_COUNT', ' Đang chờ download');
define('HEADING_DOWNLOAD', 'Download sản phẩm của bạn ở đây:');
define('FOOTER_DOWNLOAD', 'Bạn có thể download sản phẩm của bạn sau \'%s\'');
?>