<?php
/*
  $Id: create_account.php,v 1.11 2003/07/05 13:58:31 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

define('NAVBAR_TITLE', 'Tạo tài khoản');

define('HEADING_TITLE', 'Thông tin tài khoản');

define('TEXT_ORIGIN_LOGIN', '<font color="#FF0000"><small><b>LƯU Ý:</b></font></small> Nếu bạn đã có 1 tài khoản thì bạn hãy <a href="%s"><u>đăng nhập</u></a> ở đây.');

define('EMAIL_SUBJECT', 'Hoan nghênh bạn đến với ' . STORE_NAME);
define('EMAIL_GREET_MR', 'Ông %s,' . "\n\n");
define('EMAIL_GREET_MS', 'Cô %s,' . "\n\n");
define('EMAIL_GREET_NONE', '%s' . "\n\n");
define('EMAIL_WELCOME', 'Chúng tôi rất hoan nghênh bạn đến với <b>' . STORE_NAME . '</b>.' . "\n\n");
define('EMAIL_TEXT', 'Từ giờ trở đi bạn được thừa hưởng nhiều dịch vụ từ website của chúng tôi. Những dịch vụ như :' . "\n\n" . '<li><b>Giỏ hàng</b> - Bất kỳ sản phẩm nào được thêm vào giỏ đều tồn tại cho đến khi bạn xóa nó đi, hoặc chính thức hoàn tất thao tác đặt mua nó.' . "\n" . '<li><b>Sổ địa chỉ</b> - Chúng tôi có thể giao hàng của bạn đến địa chỉ khác mà bạn muốn! Nó rất hiệu quả để gửi quà sinh nhật cho bạn thân của bạn.' . "\n" . '<li><b>Lịch sử giỏ hàng</b> - Xem lại lịch sử đặt hàng của bạn với chúng tôi trong những lần trước.' . "\n" . '<li><b>Nhận xét sản phẩm</b> - Cho mọi người biết ý kiến của bạn về nào sản phẩm đó..' . "\n\n");
define('EMAIL_CONTACT', 'Để được hỗ trợ từ dịch vụ trực tuyến của chúng tôi, bạn hãy gửi email đến : ' . STORE_OWNER_EMAIL_ADDRESS . '.' . "\n\n");
define('EMAIL_WARNING', '<b>Lưu ý:</b> Email được gửi từ khách hàng của chúng tôi. Nếu bạn không  muốn đăng nhập, bạn có thể gửi email đến địa chỉ email : ' . STORE_OWNER_EMAIL_ADDRESS . '.' . "\n");
?>
