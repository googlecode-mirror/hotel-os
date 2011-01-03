<?php
/*
  $Id: tell_a_friend.php,v 1.7 2003/06/10 18:20:39 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

define('NAVBAR_TITLE', 'Giới thiệu cho bạn bè');

define('HEADING_TITLE', 'Giới thiệu cho người quen về \'%s\'');

define('FORM_TITLE_CUSTOMER_DETAILS', 'Thông tin của bạn');
define('FORM_TITLE_FRIEND_DETAILS', 'Thông tin Người quen');
define('FORM_TITLE_FRIEND_MESSAGE', 'Thông điệp của bạn');

define('FORM_FIELD_CUSTOMER_NAME', 'Tên:');
define('FORM_FIELD_CUSTOMER_EMAIL', 'E-Mail:');
define('FORM_FIELD_FRIEND_NAME', 'Tên:');
define('FORM_FIELD_FRIEND_EMAIL', 'E-Mail:');

define('TEXT_EMAIL_SUCCESSFUL_SENT', 'Email của bạn về <b>%s</b> đã được gửi đến<b>%s</b> thành công.');

define('TEXT_EMAIL_SUBJECT', '%s muon gioi thieu voi ban sp tu website %s');
define('TEXT_EMAIL_INTRO', 'Chào %s!' . "\n\n" . 'Người quen của bạn, %s, hi vọng bạn sẽ cảm thấy thích %s từ %s.');
define('TEXT_EMAIL_LINK', 'Để xem sản phẩm này, bạn có thể nhấp chuột vào liên kết sau hoặc có thể copy và paste vào thanh địa chỉ của trình duyệt :' . "\n\n" . '%s');
define('TEXT_EMAIL_SIGNATURE', 'Regards,' . "\n\n" . '%s');

define('ERROR_TO_NAME', 'Lỗi: Tên người quen không được để trống.');
define('ERROR_TO_ADDRESS', 'Lỗi: Email của bạn phải là 1 địa chỉ email thực.');
define('ERROR_FROM_NAME', 'Lỗi: Tên của bạn không được để trống.');
define('ERROR_FROM_ADDRESS', 'Lỗi: Địa chỉ email của người quen phải là 1 địa chỉ email thực.');
?>
