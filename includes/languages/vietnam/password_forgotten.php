<?php
/*
  $Id: password_forgotten.php,v 1.8 2003/06/09 22:46:46 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

define('NAVBAR_TITLE_1', 'Đăng nhập');
define('NAVBAR_TITLE_2', 'Quên mật khẩu');

define('HEADING_TITLE', 'Tôi đã quên mật khẩu!');

define('TEXT_MAIN', 'Nếu bạn đã quên mật khẩu, bạn hãy nhập vào dưới đây. Chúng tôi sẽ gửi cho bạn 1 email có mật khẩu mới.');

define('TEXT_NO_EMAIL_ADDRESS_FOUND', 'Lỗi: Email này không tồn tại trong hệ thống, phiền bạn hãy kiểm tra lại.');

define('EMAIL_PASSWORD_REMINDER_SUBJECT', STORE_NAME . ' - Mật khẩu mới');
define('EMAIL_PASSWORD_REMINDER_BODY', 'Một mật khẩu mới được yêu cầu từ ' . $REMOTE_ADDR . '.' . "\n\n" . 'Mật khẩu mới để truy cập \'' . STORE_NAME . '\' is:' . "\n\n" . '   %s' . "\n\n");

define('SUCCESS_PASSWORD_SENT', 'Thành công: Một mật khẩu mới đã được gửi đến Email của bạn.');
?>