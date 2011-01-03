<?php
/*
  $Id: advanced_search.php,v 1.15 2003/07/08 16:45:35 dgw_ Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

define('NAVBAR_TITLE_1', 'Tìm nâng cao');
define('NAVBAR_TITLE_2', 'Kết quả tìm kiếm');

define('HEADING_TITLE_1', 'Tìm nâng cao');
define('HEADING_TITLE_2', 'Tìm các sản phẩm theo tiêu chuẩn dặt ra');

define('HEADING_SEARCH_CRITERIA', 'Tiêu chuẩn tìm');

define('TEXT_SEARCH_IN_DESCRIPTION', 'Tìm trong mô tả sản phẩm');
define('ENTRY_CATEGORIES', 'Chủng loại:');
define('ENTRY_INCLUDE_SUBCATEGORIES', 'Bao gồm cả chủng loại con');
define('ENTRY_MANUFACTURERS', 'Nhà cung cấp:');
define('ENTRY_PRICE_FROM', 'Giá từ:');
define('ENTRY_PRICE_TO', 'Đến giá:');
define('ENTRY_DATE_FROM', 'Từ ngày:');
define('ENTRY_DATE_TO', 'Đến ngày:');

define('TEXT_SEARCH_HELP_LINK', '<u>Hướng dẫn</u> [?]');

define('TEXT_ALL_CATEGORIES', 'Tất cả chủng loại');
define('TEXT_ALL_MANUFACTURERS', 'Tất cả nhà cung cấp');

define('HEADING_SEARCH_HELP', 'Hướng dẫn');
define('TEXT_SEARCH_HELP', 'Từ khóa có thể kết hợp bằng các toán tử AND và/hoặc OR để điều khiển kết quả tìm thấy theo ý của mình.<br><br>Ví dụ: <u>Microsoft AND mouse</u> Bạn sẽ tìm thấy những sản phẩm phải chứa cả 2 từ khóa đó. Tuy nhiên, với <u>mouse OR keyboard</u>, thì kết quả lại chỉ cần có chứa 1 trong 2 từ đó hoặc chứa cả 2 từ.<br><br>Ngoài ra bạn còn có thể đóng dấu nháy kép cho cụm từ mà bạn cần tìm.<br><br>Ví dụ: <u>"notebook computer"</u> kết quả là phải chứa cụm từ này.<br><br>Hoặc bạn cũng có thể dùng dấu đóng ngoặc đơn, ngoặc vuông hay dấu ngoặc móc kết hợp với những toán tử ở trên để điều khiển kết quả tìm thấy.<br><br>Ví dụ : <u>Microsoft and (keyboard or mouse or "visual basic")</u>.');
define('TEXT_CLOSE_WINDOW', '<u>Đóng</u> [x]');

define('TABLE_HEADING_IMAGE', '');
define('TABLE_HEADING_MODEL', 'Model');
define('TABLE_HEADING_PRODUCTS', 'Tên sản phẩm');
define('TABLE_HEADING_MANUFACTURER', 'Nhà cung cấp');
define('TABLE_HEADING_QUANTITY', 'Khối lượng');
define('TABLE_HEADING_PRICE', 'Giá');
define('TABLE_HEADING_WEIGHT', 'Trọng lượng');
define('TABLE_HEADING_BUY_NOW', 'Đặt mua');

define('TEXT_NO_PRODUCTS', 'Không tìm thấy sản phẩm nào thỏa tiêu chuẩn đưa ra.');

define('ERROR_AT_LEAST_ONE_INPUT', 'Ít nhất phải có 1 thông tin nhập vào để tìm.');
define('ERROR_INVALID_FROM_DATE', '\"Từ Ngày\" nhập sai.');
define('ERROR_INVALID_TO_DATE', '\"Đến ngày\" nhập sai.');
define('ERROR_TO_DATE_LESS_THAN_FROM_DATE', '\"Đến ngày\" phải sau hoặc trùng với \"Từ ngày\".');
define('ERROR_PRICE_FROM_MUST_BE_NUM', '\"Giá từ\" phải là chữ số.');
define('ERROR_PRICE_TO_MUST_BE_NUM', '\"Đến giá\" phải là chữ số.');
define('ERROR_PRICE_TO_LESS_THAN_PRICE_FROM', '\"Đến giá\" phải lớn hơn hoặc bằng với \"Giá từ\".');
define('ERROR_INVALID_KEYWORDS', 'Từ khóa nhập vào không đúng.');
?>
