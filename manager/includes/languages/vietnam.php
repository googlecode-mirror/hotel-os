<?php
/*
  $Id: english.php,v 1.114 2003/07/09 18:13:39 dgw_ Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

// look in your $PATH_LOCALE/locale directory for available locales
// or type locale -a on the server.
// Examples:
// on RedHat try 'en_US'
// on FreeBSD try 'en_US.ISO_8859-1'
// on Windows try 'en', or 'English'
@setlocale(LC_TIME, 'en_US');

define('DATE_FORMAT_SHORT', '%m/%d/%Y');  // this is used for strftime()
define('DATE_FORMAT_LONG', '%A %d %B, %Y'); // this is used for strftime()
define('DATE_FORMAT', 'm/d/Y'); // this is used for date()
define('DATE_TIME_FORMAT', DATE_FORMAT_SHORT . ' %H:%M:%S');

////
// Return date in raw format
// $date should be in format mm/dd/yyyy
// raw date is in format YYYYMMDD, or DDMMYYYY
function tep_date_raw($date, $reverse = false) {
  if ($reverse) {
    return substr($date, 3, 2) . substr($date, 0, 2) . substr($date, 6, 4);
  } else {
    return substr($date, 6, 4) . substr($date, 0, 2) . substr($date, 3, 2);
  }
}

// if USE_DEFAULT_LANGUAGE_CURRENCY is true, use the following currency, instead of the applications default currency (used when changing language)
define('LANGUAGE_CURRENCY', 'VND');

// Global entries for the <html> tag
define('HTML_PARAMS','dir="LTR" lang="vn"');

// charset for web pages and emails
define('CHARSET', 'UTF-8');

// page title
define('TITLE', STORE_NAME);

// header text in includes/header.php
define('HEADER_TITLE_CREATE_ACCOUNT', 'Tạo tài khoản');
define('HEADER_TITLE_MY_ACCOUNT', 'Tài khỏan');
define('HEADER_TITLE_CART_CONTENTS', 'Giỏ hàng');
define('HEADER_TITLE_CHECKOUT', 'Tính tiền');
define('HEADER_TITLE_TOP', 'Trang chủ');
define('HEADER_TITLE_CATALOG', 'Chủng loại');
define('HEADER_TITLE_LOGOFF', 'Thoát');
define('HEADER_TITLE_LOGIN', 'Ðang nhập');

// footer text in includes/footer.php
define('FOOTER_TEXT_REQUESTS_SINCE', 'Lượt truy cập từ');

// text for gender
define('MALE', 'Nam');
define('FEMALE', 'Nữ');
define('MALE_ADDRESS', 'Ông.');
define('FEMALE_ADDRESS', 'Cô.');

// text for date of birth example
define('DOB_FORMAT_STRING', 'mm/dd/yyyy');

// categories box text in includes/boxes/categories.php
define('BOX_HEADING_CATEGORIES', 'Chủng loại');

// manufacturers box text in includes/boxes/manufacturers.php
define('BOX_HEADING_MANUFACTURERS', 'Nhà cung cấp');

// whats_new box text in includes/boxes/whats_new.php
define('BOX_HEADING_WHATS_NEW', 'Có gì mới?');

// quick_find box text in includes/boxes/quick_find.php
define('BOX_HEADING_SEARCH', 'Tìm nhanh');
define('BOX_SEARCH_TEXT', 'Dùng từ khóa để tìm nhanh sản phẩm.');
define('BOX_SEARCH_ADVANCED_SEARCH', 'Nâng cao');

// specials box text in includes/boxes/specials.php
define('BOX_HEADING_SPECIALS', 'Khuyến mãi');

// reviews box text in includes/boxes/reviews.php
define('BOX_HEADING_REVIEWS', 'Nhận xét');
define('BOX_REVIEWS_WRITE_REVIEW', 'Nhận xét về sản phẩm này!');
define('BOX_REVIEWS_NO_REVIEWS', 'Hiện tại không có nhận xét nào cho sản phẩm này');
define('BOX_REVIEWS_TEXT_OF_5_STARS', '%s trong 5 sao!');

// shopping_cart box text in includes/boxes/shopping_cart.php
define('BOX_HEADING_SHOPPING_CART', 'Giỏ hàng');
define('BOX_SHOPPING_CART_EMPTY', '0 sản phẩm');

// order_history box text in includes/boxes/order_history.php
define('BOX_HEADING_CUSTOMER_ORDERS', 'Lịch sử giỏ hàng');

// best_sellers box text in includes/boxes/best_sellers.php
define('BOX_HEADING_BESTSELLERS', 'Bán chạy nhất!');
define('BOX_HEADING_BESTSELLERS_IN', 'Bán chạy nhất trong<br>&nbsp;&nbsp;');

// notifications box text in includes/boxes/products_notifications.php
define('BOX_HEADING_NOTIFICATIONS', 'Thông báo');
define('BOX_NOTIFICATIONS_NOTIFY', 'Thông báo cho tôi khi có thay đổi gì của sản phẩm <b>%s</b>');
define('BOX_NOTIFICATIONS_NOTIFY_REMOVE', 'Không cần thông báo cho tôi khi có thay đổi của sản phẩm <b>%s</b>');

// manufacturer box text
define('BOX_HEADING_MANUFACTURER_INFO', 'Nhà cung cấp');
define('BOX_MANUFACTURER_INFO_HOMEPAGE', 'Website của: &nbsp; %s');
define('BOX_MANUFACTURER_INFO_OTHER_PRODUCTS', 'DS sản phẩm');

// languages box text in includes/boxes/languages.php
define('BOX_HEADING_LANGUAGES', 'Ngôn ngữ');

// currencies box text in includes/boxes/currencies.php
define('BOX_HEADING_CURRENCIES', 'Tiền tệ');

// information box text in includes/boxes/information.php
define('BOX_HEADING_INFORMATION', 'Thông tin');
define('BOX_INFORMATION_PRIVACY', 'Thông báo');
define('BOX_INFORMATION_CONDITIONS', 'Hướng dẫn sử dụng');
define('BOX_INFORMATION_SHIPPING', 'Giao và nhận hàng');
define('BOX_INFORMATION_CONTACT', 'Liên hệ');

// tell a friend box text in includes/boxes/tell_a_friend.php
define('BOX_HEADING_TELL_A_FRIEND', 'Gửi cho bạn bè');
define('BOX_TELL_A_FRIEND_TEXT', 'Giới thiệu cho người quen của bạn về sản phẩm này.');

// checkout procedure text
define('CHECKOUT_BAR_DELIVERY', 'Thông tin Giao và Nhận hàng');
define('CHECKOUT_BAR_PAYMENT', 'Thông tin thanh tóan');
define('CHECKOUT_BAR_CONFIRMATION', 'Xác nhận đơn hàng');
define('CHECKOUT_BAR_FINISHED', 'Hoàn tất!');

// pull down default text
define('PULL_DOWN_DEFAULT', 'Hãy chọn');
define('TYPE_BELOW', 'Kiểu bên dưới');

// javascript messages
define('JS_ERROR', 'Có lỗi xảy ra trong quá trình xử lý.\n\n Bạn hãy kiểm tra lại các thông tin sau:\n\n');

define('JS_REVIEW_TEXT', '* Phần \'Nhận xét\' phải có ít nhất' . REVIEW_TEXT_MIN_LENGTH . ' characters.\n');
define('JS_REVIEW_RATING', '* Bạn phải đánh dấu bình chọn cho sản phẩm trong nhận xét của bạn.\n');

define('JS_ERROR_NO_PAYMENT_MODULE_SELECTED', '* Bạn hãy chọn 1 phương thức thanh toán cho giỏ hàng.\n');

define('JS_ERROR_SUBMITTED', 'Thông tin này đã được gửi đi. Bạn hãy nhấn OK và chờ tiến trình xử lý hoàn tất.');

define('ERROR_NO_PAYMENT_MODULE_SELECTED', 'Hãy chọn 1 phương thức thanh toán cho giỏ hàng.');

define('CATEGORY_COMPANY', 'Công ty');
define('CATEGORY_PERSONAL', 'Cá nhân');
define('CATEGORY_ADDRESS', 'Địa chỉ');
define('CATEGORY_CONTACT', 'Thông tin liên hệ');
define('CATEGORY_OPTIONS', 'Tùy chọn');
define('CATEGORY_PASSWORD', 'Mật khẩu');

define('ENTRY_COMPANY', 'Tên Công ty:');
define('ENTRY_COMPANY_ERROR', '');
define('ENTRY_COMPANY_TEXT', '');
define('ENTRY_GENDER', 'Giới tính:');
define('ENTRY_GENDER_ERROR', 'Hãy chọn giới tính.');
define('ENTRY_GENDER_TEXT', '*');
define('ENTRY_FIRST_NAME', 'Họ:');
define('ENTRY_FIRST_NAME_ERROR', '\'Họ\' phải có ít nhất ' . ENTRY_FIRST_NAME_MIN_LENGTH . ' ký tự.');
define('ENTRY_FIRST_NAME_TEXT', '*');
define('ENTRY_LAST_NAME', 'Tên:');
define('ENTRY_LAST_NAME_ERROR', 'Tên của bạn phải có ít nhất ' . ENTRY_LAST_NAME_MIN_LENGTH . ' ký tự.');
define('ENTRY_LAST_NAME_TEXT', '*');
define('ENTRY_DATE_OF_BIRTH', 'Ngày sinh:');
define('ENTRY_DATE_OF_BIRTH_ERROR', 'Ngày sinh phải nhập theo dạng: Tháng/Ngày/Năm (ví dụ : 05/21/1970)');
define('ENTRY_DATE_OF_BIRTH_TEXT', '* (ví dụ: 05/21/1970)');
define('ENTRY_EMAIL_ADDRESS', 'E-Mail:');
define('ENTRY_EMAIL_ADDRESS_ERROR', 'Địa chỉ E-Mail phải có ít nhất' . ENTRY_EMAIL_ADDRESS_MIN_LENGTH . ' ký tự.');
define('ENTRY_EMAIL_ADDRESS_CHECK_ERROR', 'E-Mail của bạn không đúng - Phiền bạn hãy kiểm tra lại.');
define('ENTRY_EMAIL_ADDRESS_ERROR_EXISTS', 'E-Mail này đã tồn tại trong danh sách của chúng tôi. Bạn có thể đăng nhập hoặc tạo 1 tài khỏan mới bằng 1 địa chỉ email khác.');
define('ENTRY_EMAIL_ADDRESS_TEXT', '*');
define('ENTRY_STREET_ADDRESS', 'Đường phố:');
define('ENTRY_STREET_ADDRESS_ERROR', 'Đường phố phải có ít nhất ' . ENTRY_STREET_ADDRESS_MIN_LENGTH . ' ký tự.');
define('ENTRY_STREET_ADDRESS_TEXT', '*');
define('ENTRY_SUBURB', 'Ngoại thành:');
define('ENTRY_SUBURB_ERROR', '');
define('ENTRY_SUBURB_TEXT', '');
define('ENTRY_POST_CODE', 'Mã vùng:');
define('ENTRY_POST_CODE_ERROR', 'Mã vùng phải có ít nhất ' . ENTRY_POSTCODE_MIN_LENGTH . ' ký tự.');
define('ENTRY_POST_CODE_TEXT', '*');
define('ENTRY_CITY', 'Tỉnh/Thành phố:');
define('ENTRY_CITY_ERROR', 'Tên Thành phố phải có ít nhất ' . ENTRY_CITY_MIN_LENGTH . ' ký tự.');
define('ENTRY_CITY_TEXT', '*');
define('ENTRY_STATE', 'Quận/Huyện:');
define('ENTRY_STATE_ERROR', 'Quận/Huyện phải có ít nhất ' . ENTRY_STATE_MIN_LENGTH . ' ký tự.');
define('ENTRY_STATE_ERROR_SELECT', 'Bạn hãy chọn từ danh sách bên dưới.');
define('ENTRY_STATE_TEXT', '*');
define('ENTRY_COUNTRY', 'Quốc gia:');
define('ENTRY_COUNTRY_ERROR', 'Bạn hãy chọn từ danh sách bên dưới.');
define('ENTRY_COUNTRY_TEXT', '*');
define('ENTRY_TELEPHONE_NUMBER', 'Điện thoại:');
define('ENTRY_TELEPHONE_NUMBER_ERROR', 'Điện thoại phải có ít nhất' . ENTRY_TELEPHONE_MIN_LENGTH . ' ký tự.');
define('ENTRY_TELEPHONE_NUMBER_TEXT', '*');
define('ENTRY_FAX_NUMBER', 'Fax :');
define('ENTRY_FAX_NUMBER_ERROR', '');
define('ENTRY_FAX_NUMBER_TEXT', '');
define('ENTRY_NEWSLETTER', 'Tin mới:');
define('ENTRY_NEWSLETTER_TEXT', '');
define('ENTRY_NEWSLETTER_YES', 'Nhận');
define('ENTRY_NEWSLETTER_NO', 'Không nhận');
define('ENTRY_NEWSLETTER_ERROR', '');
define('ENTRY_PASSWORD', 'Mật khẩu:');
define('ENTRY_PASSWORD_ERROR', 'Mật khẩu của bạn phải có ít nhất ' . ENTRY_PASSWORD_MIN_LENGTH . ' ký tự.');
define('ENTRY_PASSWORD_ERROR_NOT_MATCHING', 'Mật khẩu xác nhận phải giống với Mật khẩu.');
define('ENTRY_PASSWORD_TEXT', '*');
define('ENTRY_PASSWORD_CONFIRMATION', 'Nhập lại Mật khẩu:');
define('ENTRY_PASSWORD_CONFIRMATION_TEXT', '*');
define('ENTRY_PASSWORD_CURRENT', 'Mật khẩu hiện tại:');
define('ENTRY_PASSWORD_CURRENT_TEXT', '*');
define('ENTRY_PASSWORD_CURRENT_ERROR', 'Mật khẩu phải có ít nhất ' . ENTRY_PASSWORD_MIN_LENGTH . ' ký tự.');
define('ENTRY_PASSWORD_NEW', 'Mật khẩu mới:');
define('ENTRY_PASSWORD_NEW_TEXT', '*');
define('ENTRY_PASSWORD_NEW_ERROR', 'Mật khẩu mới phải có ít nhất ' . ENTRY_PASSWORD_MIN_LENGTH . ' ký tự.');
define('ENTRY_PASSWORD_NEW_ERROR_NOT_MATCHING', 'Mật khẩu xác nhận phải giống với Mật khẩu.');
define('PASSWORD_HIDDEN', '--HIDDEN--');

define('FORM_REQUIRED_INFORMATION', '* Bắt buộc phải nhập');

// constants for use in tep_prev_next_display function
define('TEXT_RESULT_PAGE', 'Kết quả:');
define('TEXT_DISPLAY_NUMBER_OF_PRODUCTS', 'Xem từ <b>%d</b> đến <b>%d</b> (của <b>%d</b> sản phẩm)');
define('TEXT_DISPLAY_NUMBER_OF_ORDERS', 'Xem từ <b>%d</b> đến <b>%d</b> (của <b>%d</b> đơn hàng)');
define('TEXT_DISPLAY_NUMBER_OF_REVIEWS', 'Xem từ <b>%d</b> đến <b>%d</b> (của <b>%d</b> nhận xét)');
define('TEXT_DISPLAY_NUMBER_OF_PRODUCTS_NEW', 'Xem từ <b>%d</b> đến <b>%d</b> (của <b>%d</b> sản phẩm mới)');
define('TEXT_DISPLAY_NUMBER_OF_SPECIALS', 'Xem từ <b>%d</b> đến <b>%d</b> (của <b>%d</b> Hàng khuyến mãi)');

define('PREVNEXT_TITLE_FIRST_PAGE', 'Trang đầu');
define('PREVNEXT_TITLE_PREVIOUS_PAGE', 'Trang trước');
define('PREVNEXT_TITLE_NEXT_PAGE', 'Trang kế');
define('PREVNEXT_TITLE_LAST_PAGE', 'Trang cuối');
define('PREVNEXT_TITLE_PAGE_NO', 'Trang %d');
define('PREVNEXT_TITLE_PREV_SET_OF_NO_PAGE', 'Về trước %d trang');
define('PREVNEXT_TITLE_NEXT_SET_OF_NO_PAGE', 'Tới %d trang');
define('PREVNEXT_BUTTON_FIRST', '&lt;&lt;Đầu');
define('PREVNEXT_BUTTON_PREV', '[&lt;&lt;&nbsp;Trước]');
define('PREVNEXT_BUTTON_NEXT', '[Kế&nbsp;&gt;&gt;]');
define('PREVNEXT_BUTTON_LAST', 'Cuối&gt;&gt;');

define('IMAGE_BUTTON_ADD_ADDRESS', 'Thêm địa chỉ');
define('IMAGE_BUTTON_ADDRESS_BOOK', 'Sổ địa chỉ');
define('IMAGE_BUTTON_BACK', 'Quay lại');
define('IMAGE_BUTTON_BUY_NOW', 'Chọn mua');
define('IMAGE_BUTTON_CHANGE_ADDRESS', 'Đổi địa chỉ');
define('IMAGE_BUTTON_CHECKOUT', 'Hoàn tất');
define('IMAGE_BUTTON_CONFIRM_ORDER', 'Xác nhận đơn hàng');
define('IMAGE_BUTTON_CONTINUE', 'Tiếp tục');
define('IMAGE_BUTTON_CONTINUE_SHOPPING', 'Tiếp tục chọn hàng');
define('IMAGE_BUTTON_DELETE', 'Xóa');
define('IMAGE_BUTTON_EDIT_ACCOUNT', 'Sửa tài khỏan');
define('IMAGE_BUTTON_HISTORY', 'Lịch sử đơn hàng');
define('IMAGE_BUTTON_LOGIN', 'Đăng nhập');
define('IMAGE_BUTTON_IN_CART', 'Thêm vào giỏ');
define('IMAGE_BUTTON_NOTIFICATIONS', 'Thông báo');
define('IMAGE_BUTTON_QUICK_FIND', 'Tìm nhanh');
define('IMAGE_BUTTON_REMOVE_NOTIFICATIONS', 'Xóa thông báo');
define('IMAGE_BUTTON_REVIEWS', 'Nhận xét');
define('IMAGE_BUTTON_SEARCH', 'Tìm kiếm');
define('IMAGE_BUTTON_SHIPPING_OPTIONS', 'Thông tin vận chuyển');
define('IMAGE_BUTTON_TELL_A_FRIEND', 'Gửi cho bạn bè');
define('IMAGE_BUTTON_UPDATE', 'Cập nhật');
define('IMAGE_BUTTON_UPDATE_CART', 'Cập nhật Giỏ');
define('IMAGE_BUTTON_WRITE_REVIEW', 'Ghi nhận xét');

define('SMALL_IMAGE_BUTTON_DELETE', 'Xóa');
define('SMALL_IMAGE_BUTTON_EDIT', 'Sửa');
define('SMALL_IMAGE_BUTTON_VIEW', 'Xem');

define('ICON_ARROW_RIGHT', 'Thêm');
define('ICON_CART', 'Trong giỏ');
define('ICON_ERROR', 'Lỗi');
define('ICON_SUCCESS', 'Thành công');
define('ICON_WARNING', 'Cảnh báo');

define('TEXT_GREETING_PERSONAL', 'Xin chào <span class="greetUser">%s!</span> bạn có muốn xem những <a href="%s"><u>mặt hàng mới</u></a> để mua không?');
define('TEXT_GREETING_PERSONAL_RELOGON', '<small>Nếu bạn không phải là %s, phiền bạn hãy <a href="%s"><u>Đăng nhập lại</u></a> bằng tài khỏan của bạn.</small>');
define('TEXT_GREETING_GUEST', 'Xin chào <span class="greetUser">khách hàng thân mến!</span> Bạn có muốn <a href="%s"><u>Đăng nhập</u></a> không? Hoặc có thể tạo <a href="%s"><u>1 Tài khỏan mới</u></a>?');

define('TEXT_SORT_PRODUCTS', 'Sắp xếp sản phẩm');
define('TEXT_DESCENDINGLY', 'Từ dưới lên');
define('TEXT_ASCENDINGLY', 'Ngược lại');
define('TEXT_BY', ' Theo ');

define('TEXT_REVIEW_BY', 'theo %s');
define('TEXT_REVIEW_WORD_COUNT', '%s Tên');
define('TEXT_REVIEW_RATING', 'Mức bình chọn: %s [%s]');
define('TEXT_REVIEW_DATE_ADDED', 'Ngày thêm vào: %s');
define('TEXT_NO_REVIEWS', 'Hiện tại không có nhận xét nào.');

define('TEXT_NO_NEW_PRODUCTS', 'Hiện tại không có sản phẩm nào.');

define('TEXT_UNKNOWN_TAX_RATE', 'Không xác định thuế');

define('TEXT_REQUIRED', '<span class="errorText">Yêu cầu</span>');

define('ERROR_TEP_MAIL', '<font face="Verdana, Arial" size="2" color="#ff0000"><b><small>Lỗi:</small> Không thế gửi email thông qua máy chủ SMTP.</b></font>');
define('WARNING_INSTALL_DIRECTORY_EXISTS', 'Cảnh báo 1: Thư mục Install còn tồn tại : ' . dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/install. Hãy xóa thư mục này để đảm bảo tính an toàn.');
define('WARNING_CONFIG_FILE_WRITEABLE', 'Cảnh báo: Tôi vẫn có thể ghi được vào file cấu hình : ' . dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/includes/configure.php. Hãy đặt chế độ ReadOnly - Hoặc chỉ định quyền truy cập cho file này để đảm bảo tính an toàn.');
define('WARNING_SESSION_DIRECTORY_NON_EXISTENT', 'Cảnh báo: Thư mục sessions không tồn tại: ' . tep_session_save_path() . '. Sessions sẽ không hoạt động được cho đến khi thư mục này được tạo.');
define('WARNING_SESSION_DIRECTORY_NOT_WRITEABLE', 'Cảnh báo: Tôi vẫn không thể ghi được vào thư mục sessions: ' . tep_session_save_path() . '. Sessions sẽ không thể hoạt động được cho đến khi bạn thiết lập quyền truy cập cho nó.');
define('WARNING_SESSION_AUTO_START', 'Cảnh báo: session.auto_start is enabled - please disable this php feature in php.ini and restart the web server.');
define('WARNING_DOWNLOAD_DIRECTORY_NON_EXISTENT', 'Cảnh báo: The downloadable products directory does not exist: ' . DIR_FS_DOWNLOAD . '. Downloadable products will not work until this directory is valid.');

define('TEXT_CCVAL_ERROR_INVALID_DATE', 'The expiry date entered for the credit card is invalid.<br>Please check the date and try again.');
define('TEXT_CCVAL_ERROR_INVALID_NUMBER', 'The credit card number entered is invalid.<br>Please check the number and try again.');
define('TEXT_CCVAL_ERROR_UNKNOWN_CARD', 'The first four digits of the number entered are: %s<br>If that number is correct, we do not accept that type of credit card.<br>If it is wrong, please try again.');

define('FOOTER_TEXT_BODY', 'Bản quyền &copy; ' . date('Y') . ' <a href="' . tep_href_link(FILENAME_DEFAULT) . '">' . STORE_NAME . '</a><br>Phát triển từ mã nguồn mở <a href="http://www.oscommerce.com" target="_blank">osCommerce</a><br>Xem đẹp nhất ở độ phân giải <b>1024 x 768</b>');
?>
