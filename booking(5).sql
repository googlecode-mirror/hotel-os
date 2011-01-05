-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 05, 2011 at 01:20 AM
-- Server version: 5.1.36
-- PHP Version: 5.2.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

CREATE TABLE IF NOT EXISTS `address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `entry_gender` char(1) NOT NULL,
  `entry_company` varchar(32) DEFAULT NULL,
  `entry_firstname` varchar(32) NOT NULL,
  `entry_lastname` varchar(32) NOT NULL,
  `entry_street_address` varchar(64) NOT NULL,
  `entry_suburb` varchar(32) DEFAULT NULL,
  `entry_postcode` varchar(10) NOT NULL,
  `entry_city` varchar(32) NOT NULL,
  `entry_state` varchar(32) DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id` (`customers_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `address_book`
--

INSERT INTO `address_book` (`address_book_id`, `customers_id`, `entry_gender`, `entry_company`, `entry_firstname`, `entry_lastname`, `entry_street_address`, `entry_suburb`, `entry_postcode`, `entry_city`, `entry_state`, `entry_country_id`, `entry_zone_id`) VALUES
(1, 1, 'm', 'ACME Inc.', 'John', 'Doe', '1 Way Street', '', '12345', 'NeverNever', '', 223, 12),
(2, 2, 'm', 'FPT Online', 'Vo', 'Nhan', '100/53 Thien Phuoc', '', '08444', 'HCM', '112', 230, 0);

-- --------------------------------------------------------

--
-- Table structure for table `address_format`
--

CREATE TABLE IF NOT EXISTS `address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) NOT NULL,
  `address_summary` varchar(48) NOT NULL,
  PRIMARY KEY (`address_format_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `address_format`
--

INSERT INTO `address_format` (`address_format_id`, `address_format`, `address_summary`) VALUES
(1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country'),
(2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country'),
(3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country'),
(4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country'),
(5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country');

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE IF NOT EXISTS `administrators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `user_password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`id`, `user_name`, `user_password`) VALUES
(1, 'vonhan', '5ae5480fa76bea9ce8d449ad65e39faf:bd');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) NOT NULL,
  `banners_url` varchar(255) NOT NULL,
  `banners_image` varchar(64) NOT NULL,
  `banners_group` varchar(10) NOT NULL,
  `banners_html_text` text,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`banners_id`),
  KEY `idx_banners_group` (`banners_group`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`banners_id`, `banners_title`, `banners_url`, `banners_image`, `banners_group`, `banners_html_text`, `expires_impressions`, `expires_date`, `date_scheduled`, `date_added`, `date_status_change`, `status`) VALUES
(1, 'osCommerce', 'http://www.oscommerce.com', 'banners/oscommerce.gif', '468x50', '', 0, NULL, NULL, '2010-11-08 12:00:12', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `banners_history`
--

CREATE TABLE IF NOT EXISTS `banners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL,
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL,
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_history_banners_id` (`banners_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `banners_history`
--

INSERT INTO `banners_history` (`banners_history_id`, `banners_id`, `banners_shown`, `banners_clicked`, `banners_history_date`) VALUES
(1, 1, 3, 0, '2010-11-08 12:00:52'),
(2, 1, 16, 0, '2010-11-07 22:49:41'),
(3, 1, 3, 0, '2010-11-09 01:58:18'),
(4, 1, 37, 0, '2010-11-21 18:06:20'),
(5, 1, 43, 0, '2010-11-22 01:11:50'),
(6, 1, 204, 0, '2010-11-24 17:49:22'),
(7, 1, 97, 0, '2010-11-25 18:21:56'),
(8, 1, 132, 0, '2010-11-28 18:22:21'),
(9, 1, 74, 0, '2010-11-29 00:30:57'),
(10, 1, 7, 0, '2010-12-06 00:05:21'),
(11, 1, 58, 0, '2010-12-07 19:57:05'),
(12, 1, 96, 0, '2010-12-09 19:56:17'),
(13, 1, 2, 0, '2010-12-13 01:43:52'),
(14, 1, 6, 0, '2010-12-15 00:49:50'),
(15, 1, 20, 0, '2010-12-16 01:37:25'),
(16, 1, 35, 0, '2010-12-17 01:29:50'),
(17, 1, 26, 0, '2010-12-19 17:25:07'),
(18, 1, 69, 0, '2010-12-20 00:45:04'),
(19, 1, 2, 0, '2010-12-21 17:11:18');

-- --------------------------------------------------------

--
-- Table structure for table `booking_form`
--

CREATE TABLE IF NOT EXISTS `booking_form` (
  `booking_form_id` int(20) NOT NULL AUTO_INCREMENT,
  `booking_form_dateset` date NOT NULL,
  `booking_form_dateto` date NOT NULL,
  `booking_form_datego` date NOT NULL,
  `booking_form_custommers_id` int(20) DEFAULT NULL,
  `booking_form_account_id` int(20) NOT NULL,
  `booking_form_payment_methods_id` varchar(20) NOT NULL,
  `booking_form_number_room` int(20) NOT NULL,
  PRIMARY KEY (`booking_form_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `booking_form`
--

INSERT INTO `booking_form` (`booking_form_id`, `booking_form_dateset`, `booking_form_dateto`, `booking_form_datego`, `booking_form_custommers_id`, `booking_form_account_id`, `booking_form_payment_methods_id`, `booking_form_number_room`) VALUES
(2, '2010-12-27', '2010-12-29', '2010-12-30', 13, 0, 'cash', 2),
(3, '2010-12-27', '2010-12-30', '2010-12-31', 18, 0, 'cash', 5),
(4, '2010-12-28', '0000-00-00', '0000-00-00', 19, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(64) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`categories_id`),
  KEY `idx_categories_parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_image`, `parent_id`, `sort_order`, `date_added`, `last_modified`) VALUES
(1, 'category_hardware.gif', 0, 1, '2010-11-08 12:00:12', NULL),
(2, 'category_software.gif', 0, 2, '2010-11-08 12:00:12', NULL),
(3, 'category_dvd_movies.gif', 0, 3, '2010-11-08 12:00:12', NULL),
(4, 'subcategory_graphic_cards.gif', 1, 0, '2010-11-08 12:00:12', NULL),
(5, 'subcategory_printers.gif', 1, 0, '2010-11-08 12:00:12', NULL),
(6, 'subcategory_monitors.gif', 1, 0, '2010-11-08 12:00:12', NULL),
(7, 'subcategory_speakers.gif', 1, 0, '2010-11-08 12:00:12', NULL),
(8, 'subcategory_keyboards.gif', 1, 0, '2010-11-08 12:00:12', NULL),
(9, 'subcategory_mice.gif', 1, 0, '2010-11-08 12:00:12', NULL),
(10, 'subcategory_action.gif', 3, 0, '2010-11-08 12:00:12', NULL),
(11, 'subcategory_science_fiction.gif', 3, 0, '2010-11-08 12:00:12', NULL),
(12, 'subcategory_comedy.gif', 3, 0, '2010-11-08 12:00:12', NULL),
(13, 'subcategory_cartoons.gif', 3, 0, '2010-11-08 12:00:12', NULL),
(14, 'subcategory_thriller.gif', 3, 0, '2010-11-08 12:00:12', NULL),
(15, 'subcategory_drama.gif', 3, 0, '2010-11-08 12:00:12', NULL),
(16, 'subcategory_memory.gif', 1, 0, '2010-11-08 12:00:12', NULL),
(17, 'subcategory_cdrom_drives.gif', 1, 0, '2010-11-08 12:00:12', NULL),
(18, 'subcategory_simulation.gif', 2, 0, '2010-11-08 12:00:12', NULL),
(19, 'subcategory_action_games.gif', 2, 0, '2010-11-08 12:00:12', NULL),
(20, 'subcategory_strategy.gif', 2, 0, '2010-11-08 12:00:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories_description`
--

CREATE TABLE IF NOT EXISTS `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) NOT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name` (`categories_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories_description`
--

INSERT INTO `categories_description` (`categories_id`, `language_id`, `categories_name`) VALUES
(1, 1, 'Hardware'),
(2, 1, 'Software'),
(3, 1, 'DVD Movies'),
(4, 1, 'Graphics Cards'),
(5, 1, 'Printers'),
(6, 1, 'Monitors'),
(7, 1, 'Speakers'),
(8, 1, 'Keyboards'),
(9, 1, 'Mice'),
(10, 1, 'Action'),
(11, 1, 'Science Fiction'),
(12, 1, 'Comedy'),
(13, 1, 'Cartoons'),
(14, 1, 'Thriller'),
(15, 1, 'Drama'),
(16, 1, 'Memory'),
(17, 1, 'CDROM Drives'),
(18, 1, 'Simulation'),
(19, 1, 'Action'),
(20, 1, 'Strategy'),
(1, 2, 'Hardware'),
(2, 2, 'Software'),
(3, 2, 'DVD Filme'),
(4, 2, 'Grafikkarten'),
(5, 2, 'Drucker'),
(6, 2, 'Bildschirme'),
(7, 2, 'Lautsprecher'),
(8, 2, 'Tastaturen'),
(9, 2, 'Mäuse'),
(10, 2, 'Action'),
(11, 2, 'Science Fiction'),
(12, 2, 'Komödie'),
(13, 2, 'Zeichentrick'),
(14, 2, 'Thriller'),
(15, 2, 'Drama'),
(16, 2, 'Speicher'),
(17, 2, 'CDROM Laufwerke'),
(18, 2, 'Simulation'),
(19, 2, 'Action'),
(20, 2, 'Strategie'),
(1, 3, 'Hardware'),
(2, 3, 'Software'),
(3, 3, 'Peliculas DVD'),
(4, 3, 'Tarjetas Graficas'),
(5, 3, 'Impresoras'),
(6, 3, 'Monitores'),
(7, 3, 'Altavoces'),
(8, 3, 'Teclados'),
(9, 3, 'Ratones'),
(10, 3, 'Accion'),
(11, 3, 'Ciencia Ficcion'),
(12, 3, 'Comedia'),
(13, 3, 'Dibujos Animados'),
(14, 3, 'Suspense'),
(15, 3, 'Drama'),
(16, 3, 'Memoria'),
(17, 3, 'Unidades CDROM'),
(18, 3, 'Simulacion'),
(19, 3, 'Accion'),
(20, 3, 'Estrategia');

-- --------------------------------------------------------

--
-- Table structure for table `categories_room`
--

CREATE TABLE IF NOT EXISTS `categories_room` (
  `categories_room_id` int(2) NOT NULL AUTO_INCREMENT,
  `categories_room_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `categories_room_image` varchar(50) NOT NULL,
  `categories_room_description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`categories_room_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `categories_room`
--

INSERT INTO `categories_room` (`categories_room_id`, `categories_room_name`, `categories_room_image`, `categories_room_description`) VALUES
(1, 'Phòng Sang trọng', 'phong1.jpg', 'Phòng sang trọng tạo cho du khách không gian ấm cúng và thân thuộc như ở căn phòng của chính mình. Miễn phí sử dụng internet không dây tại tất cả các phòng và khu vực công cộng trong khách sạn • Miễn phí trà, cà phê, cùng với các dụng cụ pha chế và hai chai nước suối mỗi ngày • Các phòng đều có phòng tắm đứng, bồn và vòi hoa sen • Hầu hết các phòng đều có ban công riêng • Cung cấp truyền hình cáp vệ tinh với trên 50 kênh truyền hình chọn lọc hấp dẫn • Cung cấp các dịch vụ IDD, mini bar và két sắt an toàn trong mỗi phòng • Các phòng đều có máy điều hòa với điều khiển riêng và bàn làm việc có ngăn kéo nhỏ • Cung cấp dịch vụ sử dụng hồ bơi (5700 m2) và tham gia câu lạc bộ sức khỏe miễn phí tại mỗi tòa nhà'),
(2, 'Phòng Cao cấp', 'phong2.jpg', 'Phòng cao cấp tại Hotel chúng tôi sang trọng và khoáng đạt, giúp bạn khám phá những cảm giác mới lạ trong mình và cảm thấy hạnh phúc ở ngay bên bạn.Miễn phí sử dụng internet không dây tại tất cả các phòng và khu vực công cộng trong khách sạn • Miễn phí trà, cà phê, cùng với các dụng cụ pha chế và hai chai nước suối mỗi ngày • Các phòng đều có phòng tắm đứng, bồn và vòi hoa sen • Hầu hết các phòng đều có ban công riêng • Cung cấp truyền hình cáp vệ tinh với trên 50 kênh truyền hình chọn lọc hấp dẫn • Cung cấp các dịch vụ IDD, mini bar và két sắt an toàn trong mỗi phòng • Các phòng đều có máy điều hòa với điều khiển riêng và bàn làm việc có ngăn kéo nhỏ • Cung cấp dịch vụ sử dụng hồ bơi (5700 m2) và tham gia câu lạc bộ sức khỏe miễn phí tại mỗi tòa nhà'),
(3, 'Phòng Gia đình', 'phong3.jpg', 'Phòng gia đình tại khách sạn chúng tôi sang trọng và tiện nghi, giúp quý khách có một kỳ nghỉ thoải mái và hạnh phúc cùng những người thân yêu. Phòng gia đình tại đây bao gồm:Miễn phí sử dụng internet không dây tại tất cả các phòng và khu vực công cộng trong khách sạn  · Miễn phí trà, cà phê, cùng với các dụng cụ pha chế và hai chai nước suối mỗi ngày  · Các phòng đều có phòng tắm đứng, bồn và vòi hoa sen  · Hầu hết các phòng đều có ban công riêng  · Cung cấp truyền hình cáp vệ tinh với trên 50 kênh truyền hình chọn lọc hấp dẫn  · Cung cấp các dịch vụ IDD, mini bar và két sắt an toàn trong mỗi phòng  · Các phòng đều có máy điều hòa với điều khiển riêng và bàn làm việc có ngăn kéo nhỏ  · Cung cấp dịch vụ sử dụng hồ bơi (5700 m2) và tham gia câu lạc bộ sức khỏe miễn phí tại mỗi tòa nhà'),
(4, 'Phòng Hội nghị', 'phong4.jpg', 'Nhằm mục đích các yêu cầu của loại hình du lịch MICE và mong muốn đưa Vinpearl trở thành một trung tâm tổ chức sự kiện và nghệ thuật biểu diễn... nhà đầu tư đã thiết lập nhiều loại hình phòng, hội trường và sân khấu với đầy đủ phương tiện kỹ thuật có khả năng tương thích và linh hoạt với nhiều hình thức sự kiện khác nhau.');

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE IF NOT EXISTS `configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` varchar(255) NOT NULL,
  `configuration_key` varchar(255) NOT NULL,
  `configuration_value` varchar(255) NOT NULL,
  `configuration_description` varchar(255) NOT NULL,
  `configuration_group_id` int(11) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `use_function` varchar(255) DEFAULT NULL,
  `set_function` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=144 ;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, 'Store Name', 'STORE_NAME', 'book', 'The name of my store', 1, 1, NULL, '2010-11-08 12:00:12', NULL, NULL),
(2, 'Store Owner', 'STORE_OWNER', 'vo thanh nhan', 'The name of my store owner', 1, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(3, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'thanhnhan_kg2000@yahoo.com', 'The e-mail address of my store owner', 1, 3, NULL, '2010-11-08 12:00:12', NULL, NULL),
(4, 'E-Mail From', 'EMAIL_FROM', '"vo thanh nhan" <thanhnhan_kg2000@yahoo.com>', 'The e-mail address used in (sent) e-mails', 1, 4, NULL, '2010-11-08 12:00:12', NULL, NULL),
(5, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br><br><b>Note: Please remember to update the store zone.</b>', 1, 6, NULL, '2010-11-08 12:00:12', 'tep_get_country_name', 'tep_cfg_pull_down_country_list('),
(6, 'Zone', 'STORE_ZONE', '18', 'The zone my store is located in', 1, 7, NULL, '2010-11-08 12:00:12', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list('),
(7, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''asc'', ''desc''), '),
(8, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''products_name'', ''date_expected''), '),
(9, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language''s currency when it is changed', 1, 10, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(10, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, NULL, '2010-11-08 12:00:12', NULL, NULL),
(11, 'Use Search-Engine Safe URLs (still in development)', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 1, 12, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(12, 'Display Cart After Adding Product', 'DISPLAY_CART', 'true', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(13, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', 1, 15, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(14, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''and'', ''or''), '),
(15, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_textarea('),
(16, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(17, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2010-11-08 12:00:12', NULL, NULL),
(18, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(19, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2010-11-08 12:00:12', NULL, NULL),
(20, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(21, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2010-11-08 12:00:12', NULL, NULL),
(22, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2010-11-08 12:00:12', NULL, NULL),
(23, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2010-11-08 12:00:12', NULL, NULL),
(24, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', 2, 6, NULL, '2010-11-08 12:00:12', NULL, NULL),
(25, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2010-11-08 12:00:12', NULL, NULL),
(26, 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', 2, 8, NULL, '2010-11-08 12:00:12', NULL, NULL),
(27, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2010-11-08 12:00:12', NULL, NULL),
(28, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2010-11-08 12:00:12', NULL, NULL),
(29, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', 2, 11, NULL, '2010-11-08 12:00:12', NULL, NULL),
(30, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2010-11-08 12:00:12', NULL, NULL),
(31, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2010-11-08 12:00:12', NULL, NULL),
(32, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', 2, 14, NULL, '2010-11-08 12:00:12', NULL, NULL),
(33, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, NULL, '2010-11-08 12:00:12', NULL, NULL),
(34, 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the ''This Customer Also Purchased'' box', 2, 16, NULL, '2010-11-08 12:00:12', NULL, NULL),
(35, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2010-11-08 12:00:12', NULL, NULL),
(36, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '20', 'Amount of products to list', 3, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(37, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of ''number'' links use for page-sets', 3, 3, NULL, '2010-11-08 12:00:12', NULL, NULL),
(38, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '9', 'Maximum number of products on special to display', 3, 4, NULL, '2010-11-08 12:00:12', NULL, NULL),
(39, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '9', 'Maximum number of new products to display in a category', 3, 5, NULL, '2010-11-08 12:00:12', NULL, NULL),
(40, 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', 3, 6, NULL, '2010-11-08 12:00:12', NULL, NULL),
(41, 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', 3, 7, NULL, '2010-11-08 12:00:12', NULL, NULL),
(42, 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is ''1'' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', 3, 7, NULL, '2010-11-08 12:00:12', NULL, NULL),
(43, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', 3, 8, NULL, '2010-11-08 12:00:12', NULL, NULL),
(44, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 3, 9, NULL, '2010-11-08 12:00:12', NULL, NULL),
(45, 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', 3, 10, NULL, '2010-11-08 12:00:12', NULL, NULL),
(46, 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', 3, 11, NULL, '2010-11-08 12:00:12', NULL, NULL),
(47, 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'How many records to select from to choose one random product special to display', 3, 12, NULL, '2010-11-08 12:00:12', NULL, NULL),
(48, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '3', 'How many categories to list per row', 3, 13, NULL, '2010-11-08 12:00:12', NULL, NULL),
(49, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '10', 'Maximum number of new products to display in new products page', 3, 14, NULL, '2010-11-08 12:00:12', NULL, NULL),
(50, 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '10', 'Maximum number of best sellers to display', 3, 15, NULL, '2010-11-08 12:00:12', NULL, NULL),
(51, 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the ''This Customer Also Purchased'' box', 3, 16, NULL, '2010-11-08 12:00:12', NULL, NULL),
(52, 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', 3, 17, NULL, '2010-11-08 12:00:12', NULL, NULL),
(53, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, NULL, '2010-11-08 12:00:12', NULL, NULL),
(54, 'Product Quantities In Shopping Cart', 'MAX_QTY_IN_CART', '99', 'Maximum number of product quantities that can be added to the shopping cart (0 for no limit)', 3, 19, NULL, '2010-11-08 12:00:12', NULL, NULL),
(55, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2010-11-08 12:00:12', NULL, NULL),
(56, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '80', 'The pixel height of small images', 4, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(57, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '57', 'The pixel width of heading images', 4, 3, NULL, '2010-11-08 12:00:12', NULL, NULL),
(58, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '40', 'The pixel height of heading images', 4, 4, NULL, '2010-11-08 12:00:12', NULL, NULL),
(59, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2010-11-08 12:00:12', NULL, NULL),
(60, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '57', 'The pixel height of subcategory images', 4, 6, NULL, '2010-11-08 12:00:12', NULL, NULL),
(61, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'true', 'Calculate the size of images?', 4, 7, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(62, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(63, 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', 5, 1, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(64, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', 5, 2, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(65, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', 5, 3, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(66, 'Suburb', 'ACCOUNT_SUBURB', 'true', 'Display suburb in the customers account', 5, 4, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(67, 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', 5, 5, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(68, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cc.php;cod.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cc.php;cod.php;paypal.php)', 6, 0, NULL, '2010-11-08 12:00:12', NULL, NULL),
(69, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2010-11-08 12:00:12', NULL, NULL),
(70, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2010-11-08 12:00:12', NULL, NULL),
(71, 'Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', 6, 1, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(72, 'Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2010-11-08 12:00:12', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes('),
(73, 'Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2010-11-08 12:00:12', NULL, NULL),
(74, 'Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2010-11-08 12:00:12', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses('),
(75, 'Enable Credit Card Module', 'MODULE_PAYMENT_CC_STATUS', 'True', 'Do you want to accept credit card payments?', 6, 0, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(76, 'Split Credit Card E-Mail Address', 'MODULE_PAYMENT_CC_EMAIL', '', 'If an e-mail address is entered, the middle digits of the credit card number will be sent to the e-mail address (the outside digits are stored in the database with the middle digits censored)', 6, 0, NULL, '2010-11-08 12:00:12', NULL, NULL),
(77, 'Sort order of display.', 'MODULE_PAYMENT_CC_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2010-11-08 12:00:12', NULL, NULL),
(78, 'Payment Zone', 'MODULE_PAYMENT_CC_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2010-11-08 12:00:12', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes('),
(79, 'Set Order Status', 'MODULE_PAYMENT_CC_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2010-11-08 12:00:12', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses('),
(80, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(81, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2010-11-08 12:00:12', NULL, NULL),
(82, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2010-11-08 12:00:12', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes('),
(83, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2010-11-08 12:00:12', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes('),
(84, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2010-11-08 12:00:12', NULL, NULL),
(85, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2010-11-08 12:00:12', NULL, NULL),
(86, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2010-11-08 12:00:12', NULL, NULL),
(87, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2010-11-08 12:00:12', NULL, NULL),
(88, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(89, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', 6, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(90, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(91, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2010-11-08 12:00:12', 'currencies->format', NULL),
(92, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''national'', ''international'', ''both''), '),
(93, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(94, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', 6, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(95, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(96, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', 6, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(97, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(98, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', 6, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(99, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2010-11-08 12:00:12', 'tep_get_country_name', 'tep_cfg_pull_down_country_list('),
(100, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(101, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2010-11-08 12:00:12', NULL, NULL),
(102, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, NULL, '2010-11-08 12:00:12', NULL, NULL),
(103, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, NULL, '2010-11-08 12:00:12', NULL, NULL),
(104, 'Display Product Image', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, NULL, '2010-11-08 12:00:12', NULL, NULL),
(105, 'Display Product Manufaturer Name', 'PRODUCT_LIST_MANUFACTURER', '0', 'Do you want to display the Product Manufacturer Name?', 8, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(106, 'Display Product Model', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, NULL, '2010-11-08 12:00:12', NULL, NULL),
(107, 'Display Product Name', 'PRODUCT_LIST_NAME', '2', 'Do you want to display the Product Name?', 8, 4, NULL, '2010-11-08 12:00:12', NULL, NULL),
(108, 'Display Product Price', 'PRODUCT_LIST_PRICE', '3', 'Do you want to display the Product Price', 8, 5, NULL, '2010-11-08 12:00:12', NULL, NULL),
(109, 'Display Product Quantity', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, NULL, '2010-11-08 12:00:12', NULL, NULL),
(110, 'Display Product Weight', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, NULL, '2010-11-08 12:00:12', NULL, NULL),
(111, 'Display Buy Now column', 'PRODUCT_LIST_BUY_NOW', '4', 'Do you want to display the Buy Now column?', 8, 8, NULL, '2010-11-08 12:00:12', NULL, NULL),
(112, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2010-11-08 12:00:12', NULL, NULL),
(113, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '2', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, NULL, '2010-11-08 12:00:12', NULL, NULL),
(114, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(115, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(116, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(117, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2010-11-08 12:00:12', NULL, NULL),
(118, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2010-11-08 12:00:12', NULL, NULL),
(119, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(120, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(121, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2010-11-08 12:00:12', NULL, NULL),
(122, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', 10, 4, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(123, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log (PHP4 only)', 10, 5, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(124, 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', 11, 1, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(125, 'Cache Directory', 'DIR_FS_CACHE', '/tmp/', 'The directory where the cached files are saved', 11, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(126, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''sendmail'', ''smtp''),'),
(127, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''LF'', ''CRLF''),'),
(128, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(129, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 12, 4, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(130, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(131, 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', 13, 1, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(132, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(133, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2010-11-08 12:00:12', NULL, ''),
(134, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2010-11-08 12:00:12', NULL, ''),
(135, 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', 14, 1, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(136, 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', 14, 2, NULL, '2010-11-08 12:00:12', NULL, NULL),
(137, 'Session Directory', 'SESSION_WRITE_DIRECTORY', '/tmp', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2010-11-08 12:00:12', NULL, NULL),
(138, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(139, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(140, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(141, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(142, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'True', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(143, 'Recreate Session', 'SESSION_RECREATE', 'False', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2010-11-08 12:00:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), ');

-- --------------------------------------------------------

--
-- Table structure for table `configuration_group`
--

CREATE TABLE IF NOT EXISTS `configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) NOT NULL,
  `configuration_group_description` varchar(255) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `configuration_group`
--

INSERT INTO `configuration_group` (`configuration_group_id`, `configuration_group_title`, `configuration_group_description`, `sort_order`, `visible`) VALUES
(1, 'My Store', 'General information about my store', 1, 1),
(2, 'Minimum Values', 'The minimum values for functions / data', 2, 1),
(3, 'Maximum Values', 'The maximum values for functions / data', 3, 1),
(4, 'Images', 'Image parameters', 4, 1),
(5, 'Customer Details', 'Customer account configuration', 5, 1),
(6, 'Module Options', 'Hidden from configuration', 6, 0),
(7, 'Shipping/Packaging', 'Shipping options available at my store', 7, 1),
(8, 'Product Listing', 'Product Listing    configuration options', 8, 1),
(9, 'Stock', 'Stock configuration options', 9, 1),
(10, 'Logging', 'Logging configuration options', 10, 1),
(11, 'Cache', 'Caching configuration options', 11, 1),
(12, 'E-Mail Options', 'General setting for E-Mail transport and HTML E-Mails', 12, 1),
(13, 'Download', 'Downloadable products options', 13, 1),
(14, 'GZip Compression', 'GZip compression options', 14, 1),
(15, 'Sessions', 'Session options', 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE IF NOT EXISTS `counter` (
  `startdate` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`startdate`, `counter`) VALUES
('20101108', 930);

-- --------------------------------------------------------

--
-- Table structure for table `counter_history`
--

CREATE TABLE IF NOT EXISTS `counter_history` (
  `month` char(8) DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `counter_history`
--


-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(64) NOT NULL,
  `countries_iso_code_2` char(2) NOT NULL,
  `countries_iso_code_3` char(3) NOT NULL,
  `address_format_id` int(11) NOT NULL,
  PRIMARY KEY (`countries_id`),
  KEY `IDX_COUNTRIES_NAME` (`countries_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=240 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countries_id`, `countries_name`, `countries_iso_code_2`, `countries_iso_code_3`, `address_format_id`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 1),
(2, 'Albania', 'AL', 'ALB', 1),
(3, 'Algeria', 'DZ', 'DZA', 1),
(4, 'American Samoa', 'AS', 'ASM', 1),
(5, 'Andorra', 'AD', 'AND', 1),
(6, 'Angola', 'AO', 'AGO', 1),
(7, 'Anguilla', 'AI', 'AIA', 1),
(8, 'Antarctica', 'AQ', 'ATA', 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 1),
(10, 'Argentina', 'AR', 'ARG', 1),
(11, 'Armenia', 'AM', 'ARM', 1),
(12, 'Aruba', 'AW', 'ABW', 1),
(13, 'Australia', 'AU', 'AUS', 1),
(14, 'Austria', 'AT', 'AUT', 5),
(15, 'Azerbaijan', 'AZ', 'AZE', 1),
(16, 'Bahamas', 'BS', 'BHS', 1),
(17, 'Bahrain', 'BH', 'BHR', 1),
(18, 'Bangladesh', 'BD', 'BGD', 1),
(19, 'Barbados', 'BB', 'BRB', 1),
(20, 'Belarus', 'BY', 'BLR', 1),
(21, 'Belgium', 'BE', 'BEL', 1),
(22, 'Belize', 'BZ', 'BLZ', 1),
(23, 'Benin', 'BJ', 'BEN', 1),
(24, 'Bermuda', 'BM', 'BMU', 1),
(25, 'Bhutan', 'BT', 'BTN', 1),
(26, 'Bolivia', 'BO', 'BOL', 1),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', 1),
(28, 'Botswana', 'BW', 'BWA', 1),
(29, 'Bouvet Island', 'BV', 'BVT', 1),
(30, 'Brazil', 'BR', 'BRA', 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', 1),
(33, 'Bulgaria', 'BG', 'BGR', 1),
(34, 'Burkina Faso', 'BF', 'BFA', 1),
(35, 'Burundi', 'BI', 'BDI', 1),
(36, 'Cambodia', 'KH', 'KHM', 1),
(37, 'Cameroon', 'CM', 'CMR', 1),
(38, 'Canada', 'CA', 'CAN', 1),
(39, 'Cape Verde', 'CV', 'CPV', 1),
(40, 'Cayman Islands', 'KY', 'CYM', 1),
(41, 'Central African Republic', 'CF', 'CAF', 1),
(42, 'Chad', 'TD', 'TCD', 1),
(43, 'Chile', 'CL', 'CHL', 1),
(44, 'China', 'CN', 'CHN', 1),
(45, 'Christmas Island', 'CX', 'CXR', 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', 1),
(47, 'Colombia', 'CO', 'COL', 1),
(48, 'Comoros', 'KM', 'COM', 1),
(49, 'Congo', 'CG', 'COG', 1),
(50, 'Cook Islands', 'CK', 'COK', 1),
(51, 'Costa Rica', 'CR', 'CRI', 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', 1),
(53, 'Croatia', 'HR', 'HRV', 1),
(54, 'Cuba', 'CU', 'CUB', 1),
(55, 'Cyprus', 'CY', 'CYP', 1),
(56, 'Czech Republic', 'CZ', 'CZE', 1),
(57, 'Denmark', 'DK', 'DNK', 1),
(58, 'Djibouti', 'DJ', 'DJI', 1),
(59, 'Dominica', 'DM', 'DMA', 1),
(60, 'Dominican Republic', 'DO', 'DOM', 1),
(61, 'East Timor', 'TP', 'TMP', 1),
(62, 'Ecuador', 'EC', 'ECU', 1),
(63, 'Egypt', 'EG', 'EGY', 1),
(64, 'El Salvador', 'SV', 'SLV', 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', 1),
(66, 'Eritrea', 'ER', 'ERI', 1),
(67, 'Estonia', 'EE', 'EST', 1),
(68, 'Ethiopia', 'ET', 'ETH', 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 1),
(70, 'Faroe Islands', 'FO', 'FRO', 1),
(71, 'Fiji', 'FJ', 'FJI', 1),
(72, 'Finland', 'FI', 'FIN', 1),
(73, 'France', 'FR', 'FRA', 1),
(74, 'France, Metropolitan', 'FX', 'FXX', 1),
(75, 'French Guiana', 'GF', 'GUF', 1),
(76, 'French Polynesia', 'PF', 'PYF', 1),
(77, 'French Southern Territories', 'TF', 'ATF', 1),
(78, 'Gabon', 'GA', 'GAB', 1),
(79, 'Gambia', 'GM', 'GMB', 1),
(80, 'Georgia', 'GE', 'GEO', 1),
(81, 'Germany', 'DE', 'DEU', 5),
(82, 'Ghana', 'GH', 'GHA', 1),
(83, 'Gibraltar', 'GI', 'GIB', 1),
(84, 'Greece', 'GR', 'GRC', 1),
(85, 'Greenland', 'GL', 'GRL', 1),
(86, 'Grenada', 'GD', 'GRD', 1),
(87, 'Guadeloupe', 'GP', 'GLP', 1),
(88, 'Guam', 'GU', 'GUM', 1),
(89, 'Guatemala', 'GT', 'GTM', 1),
(90, 'Guinea', 'GN', 'GIN', 1),
(91, 'Guinea-bissau', 'GW', 'GNB', 1),
(92, 'Guyana', 'GY', 'GUY', 1),
(93, 'Haiti', 'HT', 'HTI', 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', 1),
(95, 'Honduras', 'HN', 'HND', 1),
(96, 'Hong Kong', 'HK', 'HKG', 1),
(97, 'Hungary', 'HU', 'HUN', 1),
(98, 'Iceland', 'IS', 'ISL', 1),
(99, 'India', 'IN', 'IND', 1),
(100, 'Indonesia', 'ID', 'IDN', 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', 1),
(102, 'Iraq', 'IQ', 'IRQ', 1),
(103, 'Ireland', 'IE', 'IRL', 1),
(104, 'Israel', 'IL', 'ISR', 1),
(105, 'Italy', 'IT', 'ITA', 1),
(106, 'Jamaica', 'JM', 'JAM', 1),
(107, 'Japan', 'JP', 'JPN', 1),
(108, 'Jordan', 'JO', 'JOR', 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', 1),
(110, 'Kenya', 'KE', 'KEN', 1),
(111, 'Kiribati', 'KI', 'KIR', 1),
(112, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 1),
(113, 'Korea, Republic of', 'KR', 'KOR', 1),
(114, 'Kuwait', 'KW', 'KWT', 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', 1),
(117, 'Latvia', 'LV', 'LVA', 1),
(118, 'Lebanon', 'LB', 'LBN', 1),
(119, 'Lesotho', 'LS', 'LSO', 1),
(120, 'Liberia', 'LR', 'LBR', 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 1),
(122, 'Liechtenstein', 'LI', 'LIE', 1),
(123, 'Lithuania', 'LT', 'LTU', 1),
(124, 'Luxembourg', 'LU', 'LUX', 1),
(125, 'Macau', 'MO', 'MAC', 1),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', 1),
(127, 'Madagascar', 'MG', 'MDG', 1),
(128, 'Malawi', 'MW', 'MWI', 1),
(129, 'Malaysia', 'MY', 'MYS', 1),
(130, 'Maldives', 'MV', 'MDV', 1),
(131, 'Mali', 'ML', 'MLI', 1),
(132, 'Malta', 'MT', 'MLT', 1),
(133, 'Marshall Islands', 'MH', 'MHL', 1),
(134, 'Martinique', 'MQ', 'MTQ', 1),
(135, 'Mauritania', 'MR', 'MRT', 1),
(136, 'Mauritius', 'MU', 'MUS', 1),
(137, 'Mayotte', 'YT', 'MYT', 1),
(138, 'Mexico', 'MX', 'MEX', 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', 1),
(141, 'Monaco', 'MC', 'MCO', 1),
(142, 'Mongolia', 'MN', 'MNG', 1),
(143, 'Montserrat', 'MS', 'MSR', 1),
(144, 'Morocco', 'MA', 'MAR', 1),
(145, 'Mozambique', 'MZ', 'MOZ', 1),
(146, 'Myanmar', 'MM', 'MMR', 1),
(147, 'Namibia', 'NA', 'NAM', 1),
(148, 'Nauru', 'NR', 'NRU', 1),
(149, 'Nepal', 'NP', 'NPL', 1),
(150, 'Netherlands', 'NL', 'NLD', 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', 1),
(152, 'New Caledonia', 'NC', 'NCL', 1),
(153, 'New Zealand', 'NZ', 'NZL', 1),
(154, 'Nicaragua', 'NI', 'NIC', 1),
(155, 'Niger', 'NE', 'NER', 1),
(156, 'Nigeria', 'NG', 'NGA', 1),
(157, 'Niue', 'NU', 'NIU', 1),
(158, 'Norfolk Island', 'NF', 'NFK', 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', 1),
(160, 'Norway', 'NO', 'NOR', 1),
(161, 'Oman', 'OM', 'OMN', 1),
(162, 'Pakistan', 'PK', 'PAK', 1),
(163, 'Palau', 'PW', 'PLW', 1),
(164, 'Panama', 'PA', 'PAN', 1),
(165, 'Papua New Guinea', 'PG', 'PNG', 1),
(166, 'Paraguay', 'PY', 'PRY', 1),
(167, 'Peru', 'PE', 'PER', 1),
(168, 'Philippines', 'PH', 'PHL', 1),
(169, 'Pitcairn', 'PN', 'PCN', 1),
(170, 'Poland', 'PL', 'POL', 1),
(171, 'Portugal', 'PT', 'PRT', 1),
(172, 'Puerto Rico', 'PR', 'PRI', 1),
(173, 'Qatar', 'QA', 'QAT', 1),
(174, 'Reunion', 'RE', 'REU', 1),
(175, 'Romania', 'RO', 'ROM', 1),
(176, 'Russian Federation', 'RU', 'RUS', 1),
(177, 'Rwanda', 'RW', 'RWA', 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', 1),
(179, 'Saint Lucia', 'LC', 'LCA', 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1),
(181, 'Samoa', 'WS', 'WSM', 1),
(182, 'San Marino', 'SM', 'SMR', 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', 1),
(184, 'Saudi Arabia', 'SA', 'SAU', 1),
(185, 'Senegal', 'SN', 'SEN', 1),
(186, 'Seychelles', 'SC', 'SYC', 1),
(187, 'Sierra Leone', 'SL', 'SLE', 1),
(188, 'Singapore', 'SG', 'SGP', 4),
(189, 'Slovakia (Slovak Republic)', 'SK', 'SVK', 1),
(190, 'Slovenia', 'SI', 'SVN', 1),
(191, 'Solomon Islands', 'SB', 'SLB', 1),
(192, 'Somalia', 'SO', 'SOM', 1),
(193, 'South Africa', 'ZA', 'ZAF', 1),
(194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 1),
(195, 'Spain', 'ES', 'ESP', 3),
(196, 'Sri Lanka', 'LK', 'LKA', 1),
(197, 'St. Helena', 'SH', 'SHN', 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', 1),
(199, 'Sudan', 'SD', 'SDN', 1),
(200, 'Suriname', 'SR', 'SUR', 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 1),
(202, 'Swaziland', 'SZ', 'SWZ', 1),
(203, 'Sweden', 'SE', 'SWE', 1),
(204, 'Switzerland', 'CH', 'CHE', 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', 1),
(206, 'Taiwan', 'TW', 'TWN', 1),
(207, 'Tajikistan', 'TJ', 'TJK', 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', 1),
(209, 'Thailand', 'TH', 'THA', 1),
(210, 'Togo', 'TG', 'TGO', 1),
(211, 'Tokelau', 'TK', 'TKL', 1),
(212, 'Tonga', 'TO', 'TON', 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', 1),
(214, 'Tunisia', 'TN', 'TUN', 1),
(215, 'Turkey', 'TR', 'TUR', 1),
(216, 'Turkmenistan', 'TM', 'TKM', 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', 1),
(218, 'Tuvalu', 'TV', 'TUV', 1),
(219, 'Uganda', 'UG', 'UGA', 1),
(220, 'Ukraine', 'UA', 'UKR', 1),
(221, 'United Arab Emirates', 'AE', 'ARE', 1),
(222, 'United Kingdom', 'GB', 'GBR', 1),
(223, 'United States', 'US', 'USA', 2),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', 1),
(225, 'Uruguay', 'UY', 'URY', 1),
(226, 'Uzbekistan', 'UZ', 'UZB', 1),
(227, 'Vanuatu', 'VU', 'VUT', 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', 1),
(229, 'Venezuela', 'VE', 'VEN', 1),
(230, 'Viet Nam', 'VN', 'VNM', 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', 1),
(234, 'Western Sahara', 'EH', 'ESH', 1),
(235, 'Yemen', 'YE', 'YEM', 1),
(236, 'Yugoslavia', 'YU', 'YUG', 1),
(237, 'Zaire', 'ZR', 'ZAR', 1),
(238, 'Zambia', 'ZM', 'ZMB', 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` char(3) NOT NULL,
  `symbol_left` varchar(12) DEFAULT NULL,
  `symbol_right` varchar(12) DEFAULT NULL,
  `decimal_point` char(1) DEFAULT NULL,
  `thousands_point` char(1) DEFAULT NULL,
  `decimal_places` char(1) DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`),
  KEY `idx_currencies_code` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currencies_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_point`, `thousands_point`, `decimal_places`, `value`, `last_updated`) VALUES
(1, 'US Dollar', 'USD', '$', '', '.', ',', '2', 1.00000000, '2010-11-08 12:00:12'),
(2, 'Euro', 'EUR', '', 'EUR', '.', ',', '2', 1.10360003, '2010-11-08 12:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(5) NOT NULL,
  `customers_firstname` varchar(32) NOT NULL,
  `customers_lastname` varchar(32) NOT NULL,
  `customers_dob` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customers_email_address` varchar(96) NOT NULL,
  `customers_default_address_id` int(11) DEFAULT NULL,
  `customers_telephone` varchar(32) NOT NULL,
  `customers_fax` varchar(32) DEFAULT NULL,
  `customers_password` varchar(40) NOT NULL,
  `customers_newsletter` char(1) DEFAULT NULL,
  PRIMARY KEY (`customers_id`),
  KEY `idx_customers_email_address` (`customers_email_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customers_id`, `customers_gender`, `customers_firstname`, `customers_lastname`, `customers_dob`, `customers_email_address`, `customers_default_address_id`, `customers_telephone`, `customers_fax`, `customers_password`, `customers_newsletter`) VALUES
(9, '', 'vo nhan', 'hcm', '2010-12-21 00:00:00', 'thanhnhan_kg@yahoo.com', NULL, '123456', NULL, '0f2901bc73546f082d0c7b2b3e532eff:2a', NULL),
(10, 'Nam', 'vo nhan', 'fdfsd', '0000-00-00 00:00:00', 'thanhnhan_kg@yahoo.com', NULL, 'dfjkhj', NULL, '2dbcd310a8bb62bb19664adf9d802772:59', NULL),
(11, 'Nam', 'vdfd', 'efd', '0000-00-00 00:00:00', 'thanhnhan_kg@yahoo.com', NULL, '3432', NULL, 'f90f1f3f37e84635a2fa407c4b008ec2:e9', NULL),
(12, '', '', '', '0000-00-00 00:00:00', '', NULL, '', NULL, '68c42382c8b93fc29c2fcb6a444aeda5:a8', NULL),
(13, '', 'nhan', '100/53 Thien Phuoc ,HCM', '2010-12-17 00:00:00', 'thanhnhan_kg2000@yahoo.com', NULL, '0938318629', NULL, 'df11610d78ac8999df06297a50b089c0:30', NULL),
(14, '', 'gdfgfd', '', '0000-00-00 00:00:00', 'fgdgd.@dfd.d', NULL, '', NULL, '1e3bf12fa22e3a1745acb95b1915197b:7f', NULL),
(15, '', 'dfgd', '', '0000-00-00 00:00:00', 'd', NULL, '', NULL, '2008f0e5828d906bd21610b729ebc83b:4d', NULL),
(16, '', 'g', '', '0000-00-00 00:00:00', 'g', NULL, '', NULL, '002b26a710fa59bee334b254ead9cd2e:e1', NULL),
(17, '', 'r', '', '0000-00-00 00:00:00', 'r', NULL, '', NULL, 'd4b6066ae7e0b3092dd3ef49349d0c73:21', NULL),
(18, '', 'david', 'Hue', '0000-00-00 00:00:00', '', NULL, '1234567', NULL, '14ef8abfe3ae0194a39de558fbcfa765:5b', NULL),
(19, '', '', '', '0000-00-00 00:00:00', '', NULL, '', NULL, 'd9d4f495e875a2e075a1a4a6e1b9770f:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket`
--

CREATE TABLE IF NOT EXISTS `customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext NOT NULL,
  `customers_basket_quantity` int(2) NOT NULL,
  `final_price` decimal(15,4) DEFAULT NULL,
  `customers_basket_date_added` char(8) DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_basket_customers_id` (`customers_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `customers_basket`
--

INSERT INTO `customers_basket` (`customers_basket_id`, `customers_id`, `products_id`, `customers_basket_quantity`, `final_price`, `customers_basket_date_added`) VALUES
(4, 2, '16', 2, NULL, '20101125'),
(3, 2, '8', 1, NULL, '20101125'),
(5, 13, '27', 2, NULL, '20101220');

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket_attributes`
--

CREATE TABLE IF NOT EXISTS `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext NOT NULL,
  `products_options_id` int(11) NOT NULL,
  `products_options_value_id` int(11) NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_customers_basket_att_customers_id` (`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customers_basket_attributes`
--


-- --------------------------------------------------------

--
-- Table structure for table `customers_info`
--

CREATE TABLE IF NOT EXISTS `customers_info` (
  `customers_info_id` int(11) NOT NULL,
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  PRIMARY KEY (`customers_info_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers_info`
--

INSERT INTO `customers_info` (`customers_info_id`, `customers_info_date_of_last_logon`, `customers_info_number_of_logons`, `customers_info_date_account_created`, `customers_info_date_account_last_modified`, `global_product_notifications`) VALUES
(1, NULL, 0, '2010-11-08 12:00:12', NULL, 0),
(2, '2010-11-25 19:51:54', 23, '2010-11-07 22:51:47', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `detail_booking_form`
--

CREATE TABLE IF NOT EXISTS `detail_booking_form` (
  `detail_booking_form_id` int(20) NOT NULL,
  `detail_booking_form_type_room_id` int(20) NOT NULL,
  `detail_booking_form_number_room` int(20) NOT NULL,
  `detail_booking_form_price` int(20) NOT NULL,
  PRIMARY KEY (`detail_booking_form_id`,`detail_booking_form_type_room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detail_booking_form`
--


-- --------------------------------------------------------

--
-- Table structure for table `geo_zones`
--

CREATE TABLE IF NOT EXISTS `geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) NOT NULL,
  `geo_zone_description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `geo_zones`
--

INSERT INTO `geo_zones` (`geo_zone_id`, `geo_zone_name`, `geo_zone_description`, `last_modified`, `date_added`) VALUES
(1, 'Florida', 'Florida local sales tax zone', NULL, '2010-11-08 12:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` char(2) NOT NULL,
  `image` varchar(64) DEFAULT NULL,
  `directory` varchar(32) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `IDX_LANGUAGES_NAME` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`languages_id`, `name`, `code`, `image`, `directory`, `sort_order`) VALUES
(1, 'English', 'en', 'icon.gif', 'english', 1),
(2, 'Deutsch', 'de', 'icon.gif', 'german', 2),
(3, 'Español', 'es', 'icon.gif', 'espanol', 3);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE IF NOT EXISTS `manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) NOT NULL,
  `manufacturers_image` varchar(64) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `IDX_MANUFACTURERS_NAME` (`manufacturers_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturers_id`, `manufacturers_name`, `manufacturers_image`, `date_added`, `last_modified`) VALUES
(1, 'Matrox', 'manufacturer_matrox.gif', '2010-11-08 12:00:12', NULL),
(2, 'Microsoft', 'manufacturer_microsoft.gif', '2010-11-08 12:00:12', NULL),
(3, 'Warner', 'manufacturer_warner.gif', '2010-11-08 12:00:12', NULL),
(4, 'Fox', 'manufacturer_fox.gif', '2010-11-08 12:00:12', NULL),
(5, 'Logitech', 'manufacturer_logitech.gif', '2010-11-08 12:00:12', NULL),
(6, 'Canon', 'manufacturer_canon.gif', '2010-11-08 12:00:12', NULL),
(7, 'Sierra', 'manufacturer_sierra.gif', '2010-11-08 12:00:12', NULL),
(8, 'GT Interactive', 'manufacturer_gt_interactive.gif', '2010-11-08 12:00:12', NULL),
(9, 'Hewlett Packard', 'manufacturer_hewlett_packard.gif', '2010-11-08 12:00:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers_info`
--

CREATE TABLE IF NOT EXISTS `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `manufacturers_url` varchar(255) NOT NULL,
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturers_info`
--

INSERT INTO `manufacturers_info` (`manufacturers_id`, `languages_id`, `manufacturers_url`, `url_clicked`, `date_last_click`) VALUES
(1, 1, 'http://www.matrox.com', 0, NULL),
(1, 2, 'http://www.matrox.de', 0, NULL),
(1, 3, 'http://www.matrox.com', 0, NULL),
(2, 1, 'http://www.microsoft.com', 0, NULL),
(2, 2, 'http://www.microsoft.de', 0, NULL),
(2, 3, 'http://www.microsoft.es', 0, NULL),
(3, 1, 'http://www.warner.com', 0, NULL),
(3, 2, 'http://www.warner.de', 0, NULL),
(3, 3, 'http://www.warner.com', 0, NULL),
(4, 1, 'http://www.fox.com', 0, NULL),
(4, 2, 'http://www.fox.de', 0, NULL),
(4, 3, 'http://www.fox.com', 0, NULL),
(5, 1, 'http://www.logitech.com', 0, NULL),
(5, 2, 'http://www.logitech.com', 0, NULL),
(5, 3, 'http://www.logitech.com', 0, NULL),
(6, 1, 'http://www.canon.com', 0, NULL),
(6, 2, 'http://www.canon.de', 0, NULL),
(6, 3, 'http://www.canon.es', 0, NULL),
(7, 1, 'http://www.sierra.com', 0, NULL),
(7, 2, 'http://www.sierra.de', 0, NULL),
(7, 3, 'http://www.sierra.com', 0, NULL),
(8, 1, 'http://www.infogrames.com', 0, NULL),
(8, 2, 'http://www.infogrames.de', 0, NULL),
(8, 3, 'http://www.infogrames.com', 0, NULL),
(9, 1, 'http://www.hewlettpackard.com', 0, NULL),
(9, 2, 'http://www.hewlettpackard.de', 0, NULL),
(9, 3, 'http://welcome.hp.com/country/es/spa/welcome.htm', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE IF NOT EXISTS `newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `module` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `newsletters`
--


-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `customers_name` varchar(64) NOT NULL,
  `customers_company` varchar(32) DEFAULT NULL,
  `customers_street_address` varchar(64) NOT NULL,
  `customers_suburb` varchar(32) DEFAULT NULL,
  `customers_city` varchar(32) NOT NULL,
  `customers_postcode` varchar(10) NOT NULL,
  `customers_state` varchar(32) DEFAULT NULL,
  `customers_country` varchar(32) NOT NULL,
  `customers_telephone` varchar(32) NOT NULL,
  `customers_email_address` varchar(96) NOT NULL,
  `customers_address_format_id` int(5) NOT NULL,
  `delivery_name` varchar(64) NOT NULL,
  `delivery_company` varchar(32) DEFAULT NULL,
  `delivery_street_address` varchar(64) NOT NULL,
  `delivery_suburb` varchar(32) DEFAULT NULL,
  `delivery_city` varchar(32) NOT NULL,
  `delivery_postcode` varchar(10) NOT NULL,
  `delivery_state` varchar(32) DEFAULT NULL,
  `delivery_country` varchar(32) NOT NULL,
  `delivery_address_format_id` int(5) NOT NULL,
  `billing_name` varchar(64) NOT NULL,
  `billing_company` varchar(32) DEFAULT NULL,
  `billing_street_address` varchar(64) NOT NULL,
  `billing_suburb` varchar(32) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL,
  `billing_postcode` varchar(10) NOT NULL,
  `billing_state` varchar(32) DEFAULT NULL,
  `billing_country` varchar(32) NOT NULL,
  `billing_address_format_id` int(5) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `cc_owner` varchar(64) DEFAULT NULL,
  `cc_number` varchar(32) DEFAULT NULL,
  `cc_expires` varchar(4) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL,
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `idx_orders_customers_id` (`customers_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `customers_id`, `customers_name`, `customers_company`, `customers_street_address`, `customers_suburb`, `customers_city`, `customers_postcode`, `customers_state`, `customers_country`, `customers_telephone`, `customers_email_address`, `customers_address_format_id`, `delivery_name`, `delivery_company`, `delivery_street_address`, `delivery_suburb`, `delivery_city`, `delivery_postcode`, `delivery_state`, `delivery_country`, `delivery_address_format_id`, `billing_name`, `billing_company`, `billing_street_address`, `billing_suburb`, `billing_city`, `billing_postcode`, `billing_state`, `billing_country`, `billing_address_format_id`, `payment_method`, `cc_type`, `cc_owner`, `cc_number`, `cc_expires`, `last_modified`, `date_purchased`, `orders_status`, `orders_date_finished`, `currency`, `currency_value`) VALUES
(1, 2, 'Vo Nhan', 'FPT Online', '100/53 Thien Phuoc', '', 'HCM', '08444', '112', 'Viet Nam', '0938318629', 'thanhnhan_kg2000@yahoo.com', 1, 'Vo Nhan', 'FPT Online', '100/53 Thien Phuoc', '', 'HCM', '08444', '112', 'Viet Nam', 1, 'Vo Nhan', 'FPT Online', '100/53 Thien Phuoc', '', 'HCM', '08444', '112', 'Viet Nam', 1, 'Cash on Delivery', '', '', '', '', NULL, '2010-11-07 22:52:22', 1, NULL, 'USD', 1.000000);

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

CREATE TABLE IF NOT EXISTS `orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `products_model` varchar(12) DEFAULT NULL,
  `products_name` varchar(64) NOT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `final_price` decimal(15,4) NOT NULL,
  `products_tax` decimal(7,4) NOT NULL,
  `products_quantity` int(2) NOT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_products_orders_id` (`orders_id`),
  KEY `idx_orders_products_products_id` (`products_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `orders_products`
--

INSERT INTO `orders_products` (`orders_products_id`, `orders_id`, `products_id`, `products_model`, `products_name`, `products_price`, `final_price`, `products_tax`, `products_quantity`) VALUES
(1, 1, 8, 'DVD-ABUG', 'A Bug''s Life', 35.9900, 35.9900, 0.0000, 1),
(2, 1, 20, 'DVD-BELOVED', 'Beloved', 54.9900, 54.9900, 0.0000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_attributes`
--

CREATE TABLE IF NOT EXISTS `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_products_id` int(11) NOT NULL,
  `products_options` varchar(32) NOT NULL,
  `products_options_values` varchar(32) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_products_att_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `orders_products_attributes`
--


-- --------------------------------------------------------

--
-- Table structure for table `orders_products_download`
--

CREATE TABLE IF NOT EXISTS `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_products_download_orders_id` (`orders_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `orders_products_download`
--


-- --------------------------------------------------------

--
-- Table structure for table `orders_status`
--

CREATE TABLE IF NOT EXISTS `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) NOT NULL,
  `public_flag` int(11) DEFAULT '1',
  `downloads_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name` (`orders_status_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_status`
--

INSERT INTO `orders_status` (`orders_status_id`, `language_id`, `orders_status_name`, `public_flag`, `downloads_flag`) VALUES
(1, 1, 'Pending', 1, 0),
(1, 2, 'Offen', 1, 0),
(1, 3, 'Pendiente', 1, 0),
(2, 1, 'Processing', 1, 1),
(2, 2, 'In Bearbeitung', 1, 1),
(2, 3, 'Proceso', 1, 1),
(3, 1, 'Delivered', 1, 1),
(3, 2, 'Versendet', 1, 1),
(3, 3, 'Entregado', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_status_history`
--

CREATE TABLE IF NOT EXISTS `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_status_id` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  `customer_notified` int(1) DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_status_history_orders_id` (`orders_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `orders_status_history`
--

INSERT INTO `orders_status_history` (`orders_status_history_id`, `orders_id`, `orders_status_id`, `date_added`, `customer_notified`, `comments`) VALUES
(1, 1, 1, '2010-11-07 22:52:22', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `orders_total`
--

CREATE TABLE IF NOT EXISTS `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `class` varchar(32) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_orders_total_orders_id` (`orders_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `orders_total`
--

INSERT INTO `orders_total` (`orders_total_id`, `orders_id`, `title`, `text`, `value`, `class`, `sort_order`) VALUES
(1, 1, 'Sub-Total:', '$90.98', 90.9800, 'ot_subtotal', 1),
(2, 1, 'Flat Rate (Best Way):', '$5.00', 5.0000, 'ot_shipping', 2),
(3, 1, 'Total:', '<b>$95.98</b>', 95.9800, 'ot_total', 4);

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE IF NOT EXISTS `payment_methods` (
  `payment_methods_id` int(20) NOT NULL,
  `payment_methods_name` varchar(100) NOT NULL,
  `payment_methods_description` varchar(500) NOT NULL,
  `payment_methods_costs_arising` int(20) NOT NULL,
  PRIMARY KEY (`payment_methods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_methods`
--


-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_quantity` int(4) NOT NULL,
  `products_model` varchar(12) DEFAULT NULL,
  `products_image` varchar(64) DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `products_date_added` datetime NOT NULL,
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` decimal(5,2) NOT NULL,
  `products_status` tinyint(1) NOT NULL,
  `products_tax_class_id` int(11) NOT NULL,
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_products_model` (`products_model`),
  KEY `idx_products_date_added` (`products_date_added`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`products_id`, `products_quantity`, `products_model`, `products_image`, `products_price`, `products_date_added`, `products_last_modified`, `products_date_available`, `products_weight`, `products_status`, `products_tax_class_id`, `manufacturers_id`, `products_ordered`) VALUES
(1, 32, 'MG200MMS', 'matrox/mg200mms.gif', 299.9900, '2010-11-08 12:00:12', NULL, NULL, 23.00, 1, 1, 1, 0),
(2, 32, 'MG400-32MB', 'matrox/mg400-32mb.gif', 499.9900, '2010-11-08 12:00:12', NULL, NULL, 23.00, 1, 1, 1, 0),
(3, 2, 'MSIMPRO', 'microsoft/msimpro.gif', 49.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 3, 0),
(4, 13, 'DVD-RPMK', 'dvd/replacement_killers.gif', 42.0000, '2010-11-08 12:00:12', NULL, NULL, 23.00, 1, 1, 2, 0),
(5, 17, 'DVD-BLDRNDC', 'dvd/blade_runner.gif', 35.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 3, 0),
(6, 10, 'DVD-MATR', 'dvd/the_matrix.gif', 39.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 3, 0),
(7, 10, 'DVD-YGEM', 'dvd/youve_got_mail.gif', 34.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 3, 0),
(8, 9, 'DVD-ABUG', 'dvd/a_bugs_life.gif', 35.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 3, 1),
(9, 10, 'DVD-UNSG', 'dvd/under_siege.gif', 29.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 3, 0),
(10, 10, 'DVD-UNSG2', 'dvd/under_siege2.gif', 29.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 3, 0),
(11, 10, 'DVD-FDBL', 'dvd/fire_down_below.gif', 29.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 3, 0),
(12, 10, 'DVD-DHWV', 'dvd/die_hard_3.gif', 39.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 4, 0),
(13, 10, 'DVD-LTWP', 'dvd/lethal_weapon.gif', 34.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 3, 0),
(14, 10, 'DVD-REDC', 'dvd/red_corner.gif', 32.0000, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 3, 0),
(15, 10, 'DVD-FRAN', 'dvd/frantic.gif', 35.0000, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 3, 0),
(16, 10, 'DVD-CUFI', 'dvd/courage_under_fire.gif', 38.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 4, 0),
(17, 10, 'DVD-SPEED', 'dvd/speed.gif', 39.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 4, 0),
(18, 10, 'DVD-SPEED2', 'dvd/speed_2.gif', 42.0000, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 4, 0),
(19, 10, 'DVD-TSAB', 'dvd/theres_something_about_mary.gif', 49.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 4, 0),
(20, 9, 'DVD-BELOVED', 'dvd/beloved.gif', 54.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 3, 1),
(21, 16, 'PC-SWAT3', 'sierra/swat_3.gif', 79.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 7, 0),
(22, 13, 'PC-UNTM', 'gt_interactive/unreal_tournament.gif', 89.9900, '2010-11-08 12:00:12', NULL, NULL, 7.00, 1, 1, 8, 0),
(23, 16, 'PC-TWOF', 'gt_interactive/wheel_of_time.gif', 99.9900, '2010-11-08 12:00:12', NULL, NULL, 10.00, 1, 1, 8, 0),
(24, 17, 'PC-DISC', 'gt_interactive/disciples.gif', 90.0000, '2010-11-08 12:00:12', NULL, NULL, 8.00, 1, 1, 8, 0),
(25, 16, 'MSINTKB', 'microsoft/intkeyboardps2.gif', 69.9900, '2010-11-08 12:00:12', NULL, NULL, 8.00, 1, 1, 2, 0),
(26, 10, 'MSIMEXP', 'microsoft/imexplorer.gif', 64.9500, '2010-11-08 12:00:12', NULL, NULL, 8.00, 1, 1, 2, 0),
(27, 8, 'HPLJ1100XI', 'hewlett_packard/lj1100xi.gif', 499.9900, '2010-11-08 12:00:12', NULL, NULL, 45.00, 1, 1, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE IF NOT EXISTS `products_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `options_id` int(11) NOT NULL,
  `options_values_id` int(11) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) NOT NULL,
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_products_attributes_products_id` (`products_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`products_attributes_id`, `products_id`, `options_id`, `options_values_id`, `options_values_price`, `price_prefix`) VALUES
(1, 1, 4, 1, 0.0000, '+'),
(2, 1, 4, 2, 50.0000, '+'),
(3, 1, 4, 3, 70.0000, '+'),
(4, 1, 3, 5, 0.0000, '+'),
(5, 1, 3, 6, 100.0000, '+'),
(6, 2, 4, 3, 10.0000, '-'),
(7, 2, 4, 4, 0.0000, '+'),
(8, 2, 3, 6, 0.0000, '+'),
(9, 2, 3, 7, 120.0000, '+'),
(10, 26, 3, 8, 0.0000, '+'),
(11, 26, 3, 9, 6.0000, '+'),
(26, 22, 5, 10, 0.0000, '+'),
(27, 22, 5, 13, 0.0000, '+');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes_download`
--

CREATE TABLE IF NOT EXISTS `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL,
  `products_attributes_filename` varchar(255) NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_attributes_download`
--

INSERT INTO `products_attributes_download` (`products_attributes_id`, `products_attributes_filename`, `products_attributes_maxdays`, `products_attributes_maxcount`) VALUES
(26, 'unreal.zip', 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products_description`
--

CREATE TABLE IF NOT EXISTS `products_description` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) NOT NULL DEFAULT '',
  `products_description` text,
  `products_url` varchar(255) DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `products_name` (`products_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `products_description`
--

INSERT INTO `products_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`) VALUES
(1, 1, 'Matrox G200 MMS', 'Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br><br>With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br><br>Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters & Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.', 'www.matrox.com/mga/products/g200_mms/home.cfm', 2),
(2, 1, 'Matrox G400 32MB', '<b>Dramatically Different High Performance Graphics</b><br><br>Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry''s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC''s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br><br><b>Key features:</b><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>', 'www.matrox.com/mga/products/mill_g400/home.htm', 0),
(3, 1, 'Microsoft IntelliMouse Pro', 'Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft''s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.', 'www.microsoft.com/hardware/mouse/intellimouse.asp', 0),
(4, 1, 'The Replacement Killers', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>Languages: English, Deutsch.<br>Subtitles: English, Deutsch, Spanish.<br>Audio: Dolby Surround 5.1.<br>Picture Format: 16:9 Wide-Screen.<br>Length: (approx) 80 minutes.<br>Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.replacement-killers.com', 0),
(5, 1, 'Blade Runner - Director''s Cut', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>Languages: English, Deutsch.<br>Subtitles: English, Deutsch, Spanish.<br>Audio: Dolby Surround 5.1.<br>Picture Format: 16:9 Wide-Screen.<br>Length: (approx) 112 minutes.<br>Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.bladerunner.com', 0),
(6, 1, 'The Matrix', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch.\r<br>\nAudio: Dolby Surround.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 131 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Making Of.', 'www.thematrix.com', 1),
(7, 1, 'You''ve Got Mail', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch, Spanish.\r<br>\nSubtitles: English, Deutsch, Spanish, French, Nordic, Polish.\r<br>\nAudio: Dolby Digital 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 115 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.youvegotmail.com', 0),
(8, 1, 'A Bug''s Life', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Digital 5.1 / Dobly Surround Stereo.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 91 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.abugslife.com', 0),
(9, 1, 'Under Siege', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 98 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(10, 1, 'Under Siege 2 - Dark Territory', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 98 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 1),
(11, 1, 'Fire Down Below', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 100 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(12, 1, 'Die Hard With A Vengeance', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 122 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(13, 1, 'Lethal Weapon', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 100 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(14, 1, 'Red Corner', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 117 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 1),
(15, 1, 'Frantic', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 115 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(16, 1, 'Courage Under Fire', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 112 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 3),
(17, 1, 'Speed', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 112 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 2),
(18, 1, 'Speed 2: Cruise Control', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 120 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 1),
(19, 1, 'There''s Something About Mary', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 114 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 1),
(20, 1, 'Beloved', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 164 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 2),
(21, 1, 'SWAT 3: Close Quarters Battle', '<b>Windows 95/98</b><br><br>211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and "When needed" to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!', 'www.swat3.com', 0),
(22, 1, 'Unreal Tournament', 'From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br><br>This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It''s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of ''bots'' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.', 'www.unrealtournament.net', 1),
(23, 1, 'The Wheel Of Time', 'The world in which The Wheel of Time takes place is lifted directly out of Jordan''s pages; it''s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you''re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter''angreal, Portal Stones, and the Ways. However you move around, though, you''ll quickly discover that means of locomotion can easily become the least of the your worries...<br><br>During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time''s main characters. Some of these places are ripped directly from the pages of Jordan''s books, made flesh with Legend''s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you''ll have this year.', 'www.wheeloftime.com', 1),
(24, 1, 'Disciples: Sacred Lands', 'A new age is dawning...<br><br>Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br><br>The day of reckoning has come... and only the chosen will survive.', '', 4),
(25, 1, 'Microsoft Internet Keyboard PS/2', 'The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!', '', 1),
(26, 1, 'Microsoft IntelliMouse Explorer', 'Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!', 'www.microsoft.com/hardware/mouse/explorer.asp', 7),
(27, 1, 'Hewlett Packard LaserJet 1100Xi', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP''s Resolution Enhancement technology (REt) makes every document more professional.<br><br>Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br><br>HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 1),
(1, 2, 'Matrox G200 MMS', '<b>Unterstützung für zwei bzw. vier analoge oder digitale Monitore</b><br><br>\r\nDie Matrox G200 Multi-Monitor-Serie führt die bewährte Matrox Tradition im Multi-Monitor- Bereich fort und bietet flexible und fortschrittliche Lösungen.Matrox stellt als erstes Unternehmen einen vierfachen digitalen PanelLink® DVI Flachbildschirm Ausgang zur Verfügung. Mit den optional erhältlichen TV Tuner und Video-Capture Möglichkeiten stellt die Matrox G200 MMS eine alles umfassende Mehrschirm-Lösung dar.<br><br>\r\n<b>Leistungsmerkmale:</b>\r\n<ul>\r\n<li>Preisgekrönter Matrox G200 128-Bit Grafikchip</li>\r\n<li>Schneller 8 MB SGRAM-Speicher pro Kanal</li>\r\n<li>Integrierter, leistungsstarker 250 MHz RAMDAC</li>\r\n<li>Unterstützung für bis zu 16 Bildschirme über 4 Quad-Karten (unter Win NT,ab Treiber 4.40)</li>\r\n<li>Unterstützung von 9 Monitoren unter Win 98</li>\r\n<li>2 bzw. 4 analoge oder digitale Ausgabekanäle pro PCI-Karte</li>\r\n<li>Desktop-Darstellung von 1800 x 1440 oder 1920 x 1200 pro Chip</li>\r\n<li>Anschlußmöglichkeit an einen 15-poligen VGA-Monitor oder an einen 30-poligen digitalen DVI-Flachbildschirm plus integriertem Composite-Video-Eingang (bei der TV-Version)</li>\r\n<li>PCI Grafikkarte, kurze Baulänge</li>\r\n<li>Treiberunterstützung: Windows® 2000, Windows NT® und Windows® 98</li>\r\n<li>Anwendungsbereiche: Börsenumgebung mit zeitgleich großem Visualisierungsbedarf, Videoüberwachung, Video-Conferencing</li>\r\n</ul>', 'www.matrox.com/mga/deutsch/products/g200_mms/home.cfm', 0),
(2, 2, 'Matrox G400 32 MB', '<b>Neu! Matrox G400 &quot;all inclusive&quot; und vieles mehr...</b><br><br>\r\nDie neue Millennium G400-Serie - Hochleistungsgrafik mit dem sensationellen Unterschied. Ausgestattet mit dem neu eingeführten Matrox G400 Grafikchip, bietet die Millennium G400-Serie eine überragende Beschleunigung inklusive bisher nie dagewesener Bildqualitat und enorm flexibler Darstellungsoptionen bei allen Ihren 3D-, 2D- und DVD-Anwendungen.<br><br>\r\n<ul>\r\n<li>DualHead Display und TV-Ausgang</li>\r\n<li>Environment Mapped Bump Mapping</li>\r\n<li>Matrox G400 256-Bit DualBus</li>\r\n<li>3D Rendering Array Prozessor</li>\r\n<li>Vibrant Color Quality² (VCQ²)</li>\r\n<li>UltraSharp DAC</li>\r\n</ul>\r\n<i>&quot;Bleibt abschließend festzustellen, daß die Matrox Millennium G400 Max als Allroundkarte für den Highend-PC derzeit unerreicht ist. Das ergibt den Testsieg und unsere wärmste Empfehlung.&quot;</i><br>\r\n<b>GameStar 8/99 (S.184)</b>', 'www.matrox.com/mga/deutsch/products/mill_g400/home.cfm', 0),
(3, 2, 'Microsoft IntelliMouse Pro', 'Die IntelliMouse Pro hat mit der IntelliRad-Technologie einen neuen Standard gesetzt. Anwenderfreundliche Handhabung und produktiveres Arbeiten am PC zeichnen die IntelliMouse aus. Die gewölbte Oberseite paßt sich natürlich in die Handfläche ein, die geschwungene Form erleichtert das Bedienen der Maus. Sie ist sowohl für Rechts- wie auch für Linkshänder geeignet. Mit dem Rad der IntelliMouse kann der Anwender einfach und komfortabel durch Dokumente navigieren.<br><br>\r\n<b>Eigenschaften:</b>\r\n<ul>\r\n<li><b>ANSCHLUSS:</b> PS/2</li>\r\n<li><b>FARBE:</b> weiß</li>\r\n<li><b>TECHNIK:</b> Mauskugel</li>\r\n<li><b>TASTEN:</b> 3 (incl. Scrollrad)</li>\r\n<li><b>SCROLLRAD:</b> Ja</li>\r\n</ul>', '', 0),
(4, 2, 'Die Ersatzkiller', 'Originaltitel: &quot;The Replacement Killers&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 80 minutes.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998). Til Schweiger schießt auf Hongkong-Star Chow Yun-Fat (&quot;Anna und der König&quot;) ­ ein Fehler ...', 'www.replacement-killers.com', 0),
(5, 2, 'Blade Runner - Director''s Cut', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 112 minutes.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n<b>Sci-Fi-Klassiker, USA 1983, 112 Min.</b><br><br>\r\nLos Angeles ist im Jahr 2019 ein Hexenkessel. Dauerregen und Smog tauchen den überbevölkerten Moloch in ewige Dämmerung. Polizeigleiter schwirren durch die Luft und überwachen das grelle Ethnogemisch, das sich am Fuße 400stöckiger Stahlbeton-Pyramiden tummelt. Der abgehalfterte Ex-Cop und "Blade Runner" Rick Deckard ist Spezialist für die Beseitigung von Replikanten, künstlichen Menschen, geschaffen für harte Arbeit auf fremden Planeten. Nur ihm kann es gelingen, vier flüchtige, hochintelligente "Nexus 6"-Spezialmodelle zu stellen. Die sind mit ihrem starken und brandgefährlichen Anführer Batty auf der Suche nach ihrem Schöpfer. Er soll ihnen eine längere Lebenszeit schenken. Das muß Rick Deckard verhindern.  Als sich der eiskalte Jäger in Rachel, die Sekretärin seines Auftraggebers, verliebt, gerät sein Weltbild jedoch ins Wanken. Er entdeckt, daß sie - vielleicht wie er selbst - ein Replikant ist ...<br><br>\r\nDie Konfrontation des Menschen mit "Realität" und "Virtualität" und das verstrickte Spiel mit getürkten Erinnerungen zieht sich als roter Faden durch das Werk von Autor Philip K. Dick ("Die totale Erinnerung"). Sein Roman "Träumen Roboter von elektrischen Schafen?" liefert die Vorlage für diesen doppelbödigen Thriller, der den Zuschauer mit faszinierenden\r\nZukunftsvisionen und der gigantischen Kulisse des Großstadtmolochs gefangen nimmt.', 'www.bladerunner.com', 0),
(6, 2, 'Matrix', 'Originaltitel: &quot;The Matrix&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 136 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1999) Der Geniestreich der Wachowski-Brüder. In dieser technisch perfekten Utopie kämpft Hacker Keanu Reeves gegen die Diktatur der Maschinen...', 'www.whatisthematrix.com', 0),
(7, 2, 'e-m@il für Dich', 'Original: &quot;You''ve got mail&quot;<br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 112 minutes.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998) von Nora Ephron (&qout;Schlaflos in Seattle&quot;). Meg Ryan und Tom Hanks knüpfen per E-Mail zarte Bande. Dass sie sich schon kennen, ahnen sie nicht ...', 'www.youvegotmail.com', 0),
(8, 2, 'Das Große Krabbeln', 'Originaltitel: &quot;A Bug''s Life&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA 1998). Ameise Flik zettelt einen Aufstand gegen gefräßige Grashüpfer an ... Eine fantastische Computeranimation des "Toy Story"-Teams. ', 'www.abugslife.com', 0),
(9, 2, 'Alarmstufe: Rot', 'Originaltitel: &quot;Under Siege&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n<b>Actionthriller. Smutje Steven Seagal versalzt Schurke Tommy Lee Jones die Suppe</b><br><br>\r\nKatastrophe ahoi: Kurz vor Ausmusterung der "U.S.S. Missouri" kapert die High-tech-Bande von Ex-CIA-Agent Strannix (Tommy Lee Jones) das Schlachtschiff. Strannix will die Nuklearraketen des Kreuzers klauen und verscherbeln. Mit Hilfe des irren Ersten Offiziers Krill (lustig: Gary Busey) killen die Gangster den Käpt’n und sperren seine Crew unter Deck. Blöd, dass sie dabei Schiffskoch Rybak (Steven Seagal) vergessen. Der Ex-Elitekämpfer knipst einen Schurken nach dem anderen aus. Eine Verbündete findet er in Stripperin Jordan (Ex-"Baywatch"-Biene Erika Eleniak). Die sollte eigentlich aus Käpt’ns Geburtstagstorte hüpfen ... Klar: Seagal ist kein Edelmime. Dafür ist Regisseur Andrew Davis ("Auf der Flucht") ein Könner: Er würzt die Action-Orgie mit Ironie und nutzt die imposante Schiffskulisse voll aus. Für Effekte und Ton gab es 1993 Oscar-Nominierungen. ', '', 0),
(10, 2, 'Alarmstufe: Rot 2', 'Originaltitel: &quot;Under Siege 2: Dark Territory&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n(USA ’95). Von einem gekaperten Zug aus übernimmt Computerspezi Dane die Kontrolle über einen Kampfsatelliten und erpresst das Pentagon. Aber auch Ex-Offizier Ryback (Steven Seagal) ist im Zug ...\r\n', '', 0),
(11, 2, 'Fire Down Below', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEin mysteriöser Mordfall führt den Bundesmarschall Jack Taggert in eine Kleinstadt im US-Staat Kentucky. Doch bei seinen Ermittlungen stößt er auf eine Mauer des Schweigens. Angst beherrscht die Stadt, und alle Spuren führen zu dem undurchsichtigen Minen-Tycoon Orin Hanner. Offenbar werden in der friedlichen Berglandschaft gigantische Mengen Giftmülls verschoben, mit unkalkulierbaren Risiken. Um eine Katastrophe zu verhindern, räumt Taggert gnadenlos auf ...', '', 0),
(12, 2, 'Stirb Langsam - Jetzt Erst Recht', 'Originaltitel: &quot;Die Hard With A Vengeance&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nSo explosiv, so spannend, so rasant wie nie zuvor: Bruce Willis als Detectiv John McClane in einem Action-Thriller der Superlative! Das ist heute nicht McClanes Tag. Seine Frau hat ihn verlassen, sein Boß hat ihn vom Dienst suspendiert und irgendein Verrückter hat ihn gerade zum Gegenspieler in einem teuflischen Spiel erkoren - und der Einsatz ist New York selbst. Ein Kaufhaus ist explodiert, doch das ist nur der Auftakt. Der geniale Superverbrecher Simon droht, die ganze Stadt Stück für Stück in die Luft zu sprengen, wenn McClane und sein Partner wider Willen seine explosiven" Rätsel nicht lösen. Eine mörderische Hetzjagd quer durch New York beginnt - bis McClane merkt, daß der Bombenterror eigentlich nur ein brillantes Ablenkungsmanöver ist...!<br><i>"Perfekt gemacht und stark besetzt. Das Action-Highlight des Jahres!"</i> <b>(Bild)</b>', '', 0),
(13, 2, 'Zwei stahlharte Profis', 'Originaltitel: &quot;Lethal Weapon&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nSie sind beide Cops in L.A.. Sie haben beide in Vietnam für eine Spezialeinheit gekämpft. Und sie hassen es beide, mit einem Partner arbeiten zu müssen. Aber sie sind Partner: Martin Riggs, der Mann mit dem Todeswunsch, für wen auch immer. Und Roger Murtaugh, der besonnene Polizist. Gemeinsam enttarnen sie einen gigantischen Heroinschmuggel, hinter dem sich eine Gruppe ehemaliger CIA-Söldner verbirgt. Eine Killerbande gegen zwei Profis ...', '', 0),
(14, 2, 'Labyrinth ohne Ausweg', 'Originaltitel: &quot;Red Corner&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nDem Amerikaner Jack Moore wird in China der bestialische Mord an einem Fotomodel angehängt. Brutale Gefängnisschergen versuchen, ihn durch Folter zu einem Geständnis zu zwingen. Vor Gericht fordert die Anklage die Todesstrafe - Moore''s Schicksal scheint besiegelt. Durch einen Zufall gelingt es ihm, aus der Haft zu fliehen, doch aus der feindseligen chinesischen Hauptstadt gibt es praktisch kein Entkommen ...', '', 0),
(15, 2, 'Frantic', 'Originaltitel: &quot;Frantic&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEin romantischer Urlaub in Paris, der sich in einen Alptraum verwandelt. Ein Mann auf der verzweifelten Suche nach seiner entführten Frau. Ein düster-bedrohliches Paris, in dem nur ein Mensch Licht in die tödliche Affäre bringen kann.', '', 0),
(16, 2, 'Mut Zur Wahrheit', 'Originaltitel: &quot;Courage Under Fire&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nLieutenant Colonel Nathaniel Serling (Denzel Washington) lässt während einer Schlacht im Golfkrieg versehentlich auf einen US-Panzer schießen, dessen Mannschaft dabei ums Leben kommt. Ein Jahr nach diesem Vorfall wird Serling, der mittlerweile nach Washington D.C. versetzt wurde, die Aufgabe übertragen, sich um einen Kandidaten zu kümmern, der während des Krieges starb und dem der höchste militärische Orden zuteil werden soll. Allerdings sind sowohl der Fall und als auch der betreffende Soldat ein politisch heißes Eisen -- Captain Karen Walden (Meg Ryan) ist Amerikas erster weiblicher Soldat, der im Kampf getötet wurde.<br><br>\r\nSerling findet schnell heraus, dass es im Fall des im felsigen Gebiet von Kuwait abgestürzten Rettungshubschraubers Diskrepanzen gibt. In Flashbacks werden von unterschiedlichen Personen verschiedene Versionen von Waldens Taktik, die Soldaten zu retten und den Absturz zu überleben, dargestellt (à la Kurosawas Rashomon). Genau wie in Glory erweist sich Regisseur Edward Zwicks Zusammenstellung von bekannten und unbekannten Schauspielern als die richtige Mischung. Waldens Crew ist besonders überzeugend. Matt Damon als der Sanitäter kommt gut als der leichtfertige Typ rüber, als er Washington seine Geschichte erzählt. Im Kampf ist er ein mit Fehlern behafteter, humorvoller Soldat.<br><br>\r\nDie erstaunlichste Arbeit in Mut zur Wahrheit leistet Lou Diamond Phillips (als der Schütze der Gruppe), dessen Karriere sich auf dem Weg in die direkt für den Videomarkt produzierten Filme befand. Und dann ist da noch Ryan. Sie hat sich in dramatischen Filmen in der Vergangenheit gut behauptet (Eine fast perfekte Liebe, Ein blutiges Erbe), es aber nie geschafft, ihrem Image zu entfliehen, das sie in die Ecke der romantischen Komödie steckte. Mit gefärbtem Haar, einem leichten Akzent und der von ihr geforderten Darstellungskunst hat sie endlich einen langlebigen dramatischen Film. Obwohl sie nur halb so oft wie Washington im Film zu sehen ist, macht ihre mutige und beeindruckend nachhaltige Darstellung Mut zur Wahrheit zu einem speziellen Film bis hin zu dessen seltsamer, aber lohnender letzter Szene.', '', 0),
(17, 2, 'Speed', 'Originaltitel: &quot;Speed&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nEr ist ein Cop aus der Anti-Terror-Einheit von Los Angeles. Und so ist der Alarm für Jack Traven nichts Ungewöhnliches: Ein Terrorist will drei Millionen Dollar erpressen, oder die zufälligen Geiseln in einem Aufzug fallen 35 Stockwerke in die Tiefe. Doch Jack schafft das Unmögliche - die Geiseln werden gerettet und der Terrorist stirbt an seiner eigenen Bombe. Scheinbar. Denn schon wenig später steht Jack (Keanu Reeves) dem Bombenexperten Payne erneut gegenüber. Diesmal hat sich der Erpresser eine ganz perfide Mordwaffe ausgedacht: Er plaziert eine Bombe in einem öffentlichen Bus. Der Mechanismus der Sprengladung schaltet sich automatisch ein, sobald der Bus schneller als 50 Meilen in der Stunde fährt und detoniert sofort, sobald die Geschwindigkeit sinkt. Plötzlich wird für eine Handvoll ahnungsloser Durchschnittsbürger der Weg zur Arbeit zum Höllentrip - und nur Jack hat ihr Leben in der Hand. Als der Busfahrer verletzt wird, übernimmt Fahrgast Annie (Sandra Bullock) das Steuer. Doch wohin mit einem Bus, der nicht bremsen kann in der Stadt der Staus? Doch es kommt noch schlimmer: Payne (Dennis Hopper) will jetzt nicht nur seine drei Millionen Dollar. Er will Jack. Um jeden Preis.', '', 0),
(18, 2, 'Speed 2: Cruise Control', 'Originaltitel: &quot;Speed 2 - Cruise Control&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nHalten Sie ihre Schwimmwesten bereit, denn die actiongeladene Fortsetzung von Speed begibt sich auf Hochseekurs. Erleben Sie Sandra Bullock erneut in ihrer Star-Rolle als Annie Porter. Die Karibik-Kreuzfahrt mit ihrem Freund Alex entwickelt sich unaufhaltsam zur rasenden Todesfahrt, als ein wahnsinniger Computer-Spezialist den Luxusliner in seine Gewalt bringt und auf einen mörderischen Zerstörungskurs programmiert. Eine hochexplosive Reise, bei der kein geringerer als Action-Spezialist Jan De Bont das Ruder in die Hand nimmt. Speed 2: Cruise Controll läßt ihre Adrenalin-Wellen in rasender Geschwindigkeit ganz nach oben schnellen.', '', 0),
(19, 2, 'Verrückt nach Mary', 'Originaltitel: &quot;There''s Something About Mary&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\n13 Jahre nachdem Teds Rendezvous mit seiner angebeteten Mary in einem peinlichen Fiasko endete, träumt er immer noch von ihr und engagiert den windigen Privatdetektiv Healy um sie aufzuspüren. Der findet Mary in Florida und verliebt sich auf den ersten Blick in die atemberaubende Traumfrau. Um Ted als Nebenbuhler auszuschalten, tischt er ihm dicke Lügen über Mary auf. Ted läßt sich jedoch nicht abschrecken, eilt nach Miami und versucht nun alles, um Healy die Balztour zu vermasseln. Doch nicht nur Healy ist verrückt nach Mary und Ted bekommt es mit einer ganzen Legion liebeskranker Konkurrenten zu tun ...', '', 0),
(20, 2, 'Menschenkind', 'Originaltitel: &quot;Beloved&quot;<br><br>\r\nRegional Code: 2 (Japan, Europe, Middle East, South Africa).<br>\r\nSprachen: English, Deutsch.<br>\r\nUntertitel: English, Deutsch, Spanish.<br>\r\nAudio: Dolby Surround 5.1.<br>\r\nBildformat: 16:9 Wide-Screen.<br>\r\nDauer: (approx) 96 minuten.<br>\r\nAußerdem: Interaktive Menus, Kapitelauswahl, Untertitel.<br><br>\r\nDieser vielschichtige Film ist eine Arbeit, die Regisseur Jonathan Demme und dem amerikanischen Talkshow-Star Oprah Winfrey sehr am Herzen lag. Der Film deckt im Verlauf seiner dreistündigen Spielzeit viele Bereiche ab. Menschenkind ist teils Sklavenepos, teils Mutter-Tochter-Drama und teils Geistergeschichte.<br><br>\r\nDer Film fordert vom Publikum höchste Aufmerksamkeit, angefangen bei seiner dramatischen und etwas verwirrenden Eingangssequenz, in der die Bewohner eines Hauses von einem niederträchtigen übersinnlichen Angriff heimgesucht werden. Aber Demme und seine talentierte Besetzung bereiten denen, die dabei bleiben ein unvergessliches Erlebnis. Der Film folgt den Spuren von Sethe (in ihren mittleren Jahren von Oprah Winfrey dargestellt), einer ehemaligen Sklavin, die sich scheinbar ein friedliches und produktives Leben in Ohio aufgebaut hat. Aber durch den erschreckenden und sparsamen Einsatz von Rückblenden deckt Demme, genau wie das literarische Meisterwerk von Toni Morrison, auf dem der Film basiert, langsam die Schrecken von Sethes früherem Leben auf und das schreckliche Ereignis, dass dazu führte, dass Sethes Haus von Geistern heimgesucht wird.<br><br>\r\nWährend die Gräuel der Sklaverei und das blutige Ereignis in Sethes Familie unleugbar tief beeindrucken, ist die Qualität des Film auch in kleineren, genauso befriedigenden Details sichtbar. Die geistlich beeinflusste Musik von Rachel Portman ist gleichzeitig befreiend und bedrückend, und der Einblick in die afro-amerikanische Gemeinschaft nach der Sklaverei -- am Beispiel eines Familienausflugs zu einem Jahrmarkt, oder dem gospelsingenden Nähkränzchen -- machen diesen Film zu einem speziellen Vergnügen sowohl für den Geist als auch für das Herz. Die Schauspieler, besonders Kimberley Elise als Sethes kämpfende Tochter und Thandie Newton als der mysteriöse Titelcharakter, sind sehr rührend. Achten Sie auch auf Danny Glover (Lethal Weapon) als Paul D.', '', 0),
(21, 2, 'SWAT 3: Elite Edition', '<b>KEINE KOMPROMISSE!</b><br><i>Kämpfen Sie Seite an Seite mit Ihren LAPD SWAT-Kameraden gegen das organisierte Verbrechen!</i><br><br>\r\nEine der realistischsten 3D-Taktiksimulationen der letzten Zeit jetzt mit Multiplayer-Modus, 5 neuen Missionen und jede Menge nützliche Tools!<br><br>\r\nLos Angeles, 2005. In wenigen Tagen steht die Unterzeichnung des Abkommens der Vereinten Nationen zur Atom-Ächtung durch Vertreter aller Nationen der Welt an. Radikale terroristische Vereinigungen machen sich in der ganzen Stadt breit. Verantwortlich für die Sicherheit der Delegierten zeichnet sich eine Eliteeinheit der LAPD: das SWAT-Team. Das Schicksal der Stadt liegt in Ihren Händen.<br><br>\r\n<b>Neue Features:</b>\r\n<ul>\r\n<li>Multiplayer-Modus (Co op-Modus, Deathmatch in den bekannten Variationen)</li>\r\n<li>5 neue Missionen an original Örtlichkeiten Las (U-Bahn, Whitman Airport, etc.)</li>\r\n<li>neue Charakter</li>\r\n<li>neue Skins</li>\r\n<li>neue Waffen</li>\r\n<li>neue Sounds</li>\r\n<li>verbesserte KI</li>\r\n<li>Tools-Package</li>\r\n<li>Scenario-Editor</li>\r\n<li>Level-Editor</li>\r\n</ul>\r\nDie dritte Folge der Bestseller-Reihe im Bereich der 3D-Echtzeit-Simulationen präsentiert sich mit einer neuen Spielengine mit extrem ausgeprägtem Realismusgrad. Der Spieler übernimmt das Kommando über eine der besten Polizei-Spezialeinheiten oder einer der übelsten Terroristen-Gangs der Welt. Er durchläuft - als "Guter" oder "Böser" - eine der härtesten und elitärsten Kampfausbildungen, in der er lernt, mit jeder Art von Krisensituationen umzugehen. Bei diesem Action-Abenteuer geht es um das Leben prominenter Vertreter der Vereinten Nationen und bei 16 Missionen an Originalschauplätzen in LA gibt die "lebensechte" KI den Protagonisten jeder Seite so einige harte Nüsse zu knacken.', 'www.swat3.com', 0),
(22, 2, 'Unreal Tournament', '2341: Die Gewalt ist eine Lebensweise, die sich ihren Weg durch die dunklen Risse der Gesellschaft bahnt. Sie bedroht die Macht und den Einfluss der regierenden Firmen, die schnellstens ein Mittel finden müssen, die tobenden Massen zu besänftigen - ein profitables Mittel ... Gladiatorenkämpfe sind die Lösung. Sie sollen den Durst der Menschen nach Blut stillen und sind die perfekte Gelegenheit, die Aufständischen, Kriminellen und Aliens zu beseitigen, die die Firmenelite bedrohen.<br><br>\r\nDas Turnier war geboren - ein Kampf auf Leben und Tod. Galaxisweit live und in Farbe! Kämpfen Sie für Freiheit, Ruhm und Ehre. Sie müssen stark, schnell und geschickt sein ... oder Sie bleiben auf der Strecke.<br><br>\r\nKämpfen Sie allein oder kommandieren Sie ein Team gegen Armeen unbarmherziger Krieger, die alle nur ein Ziel vor Augen haben: Die Arenen lebend zu verlassen und sich dem Grand Champion zu stellen ... um ihn dann zu bezwingen!<br><br>\r\n<b>Features:</b>\r\n<ul>\r\n<li>Auf dem PC mehrfach als Spiel des Jahres ausgezeichnet!</li>\r\n<li>Mehr als 50 faszinierende Level - verlassene Raumstationen, gotische Kathedralen und graffitibedeckte Großstädte.</li>\r\n<li>Vier actionreiche Spielmodi - Deathmatch, Capture the Flag, Assault und Domination werden Ihren Adrenalinpegel in die Höhe schnellen lassen.</li>\r\n<li>Dramatische Mehrspieler-Kämpfe mit 2, 3 und 4 Spielern, auch über das Netzwerk</li>\r\n<li>Gnadenlos aggressive Computergegner verlangen Ihnen das Äußerste ab.</li>\r\n<li>Neuartiges Benutzerinterface und verbesserte Steuerung - auch mit USB-Maus und -Tastatur spielbar.</li>\r\n</ul>\r\nDer Nachfolger des Actionhits "Unreal" verspricht ein leichtes, intuitives Interface, um auch Einsteigern schnellen Zugang zu den Duellen gegen die Bots zu ermöglichen. Mit diesen KI-Kriegern kann man auch Teams bilden und im umfangreichen Multiplayermodus ohne Onlinekosten in den Kampf ziehen. 35 komplett neue Arenen und das erweiterte Waffenangebot bilden dazu den würdigen Rahmen.', 'www.unrealtournament.net', 0),
(23, 2, 'The Wheel Of Time', '<b><i>"Wheel Of Time"(Das Rad der Zeit)</i></b> basiert auf den Fantasy-Romanen von Kultautor Robert Jordan und stellt einen einzigartigen Mix aus Strategie-, Action- und Rollenspielelementen dar. Obwohl die Welt von "Wheel of Time" eng an die literarische Vorlage der Romane angelehnt ist, erzählt das Spiel keine lineare Geschichte. Die Story entwickelt sich abhängig von den Aktionen der Spieler, die jeweils die Rollen der Hauptcharaktere aus dem Roman übernehmen. Jede Figur hat den Oberbefehl über eine große Gefolgschaft, militärische Einheiten und Ländereien. Die Spieler können ihre eigenen Festungen konstruieren, individuell ausbauen, von dort aus das umliegende Land erforschen, magische Gegenstände sammeln oder die gegnerischen Zitadellen erstürmen. Selbstverständlich kann man sich auch über LAN oder Internet gegenseitig Truppen auf den Hals hetzen und die Festungen seiner Mitspieler in Schutt und Asche legen. Dreh- und Anlegepunkt von "Wheel of Time" ist der Kampf um die finstere Macht "The Dark One", die vor langer Zeit die Menschheit beinahe ins Verderben stürzte und nur mit Hilfe gewaltiger magischer Energie verbannt werden konnte. "The Amyrlin Seat" und "The Children of the Night" kämpfen nur gegen "The Forsaken" und "The Hound" um den Besitz des Schlüssels zu "Shayol Ghul" - dem magischen Siegel, mit dessen Hilfe "The Dark One" seinerzeit gebannt werden konnte.<br><br>\r\n<b>Features:</b> \r\n<ul>\r\n<li>Ego-Shooter mit Strategie-Elementen</li>\r\n<li>Spielumgebung in Echtzeit-3D</li>\r\n<li>Konstruktion aud Ausbau der eigenen Festung</li>\r\n<li>Einsatz von über 100 Artefakten und Zaubersprüchen</li>\r\n<li>Single- und Multiplayermodus</li>\r\n</ul>\r\nIm Mittelpunkt steht der Kampf gegen eine finstere Macht namens The Dark One. Deren Schergen müssen mit dem Einsatz von über 100 Artefakten und Zaubereien wie Blitzschlag oder Teleportation aus dem Weg geräumt werden. Die opulente 3D-Grafik verbindet Strategie- und Rollenspielelemente. \r\n\r\n<b>Voraussetzungen</b>\r\nmind. P200, 32MB RAM, 4x CD-Rom, Win95/98, DirectX 5.0 komp.Grafikkarte und Soundkarte. ', 'www.wheeloftime.com', 0),
(24, 2, 'Disciples: Sacred Land', 'Rundenbasierende Fantasy/RTS-Strategie mit gutem Design (vor allem die Levels, 4 versch. Rassen, tolle Einheiten), fantastischer Atmosphäre und exzellentem Soundtrack. Grafisch leider auf das Niveau von 1990.', 'www.strategyfirst.com/disciples/welcome.html', 0),
(25, 2, 'Microsoft Internet Tastatur PS/2', '<i>Microsoft Internet Keyboard,Windows-Tastatur mit 10 zusätzl. Tasten,2 selbst programmierbar, abnehmbareHandgelenkauflage. Treiber im Lieferumfang.</i><br><br>\r\nEin-Klick-Zugriff auf das Internet und vieles mehr! Das Internet Keyboard verfügt über 10 zusätzliche Abkürzungstasten auf einer benutzerfreundlichen Standardtastatur, die darüber hinaus eine abnehmbare Handballenauflage aufweist. Über die Abkürzungstasten können Sie durch das Internet surfen oder direkt von der Tastatur aus auf E-Mails zugreifen. Die IntelliType Pro-Software ermöglicht außerdem das individuelle Belegen der Tasten.', '', 0),
(26, 2, 'Microsof IntelliMouse Explorer', 'Die IntelliMouse Explorer überzeugt durch ihr modernes Design mit silberfarbenem Gehäuse, sowie rot schimmernder Unter- und Rückseite. Die neuartige IntelliEye-Technologie sorgt für eine noch nie dagewesene Präzision, da statt der beweglichen Teile (zum Abtasten der Bewegungsänderungen an der Unterseite der Maus) ein optischer Sensor die Bewegungen der Maus erfaßt. Das Herzstück der Microsoft IntelliEye-Technologie ist ein kleiner Chip, der einen optischen Sensor und einen digitalen Signalprozessor (DSP) enthält.<br><br>\r\nDa auf bewegliche Teile, die Staub, Schmutz und Fett aufnehmen können, verzichtet wurde, muß die IntelliMouse Explorer nicht mehr gereinigt werden. Darüber hinaus arbeitet die IntelliMouse Explorer auf nahezu jeder Arbeitsoberfläche, so daß kein Mauspad mehr erforderlich ist. Mit dem Rad und zwei neuen zusätzlichen Maustasten ermöglicht sie effizientes und komfortables Arbeiten am PC.<br><br>\r\n<b>Eigenschaften:</b>\r\n<ul>\r\n<li><b>ANSCHLUSS:</b> USB (PS/2-Adapter enthalten)</li>\r\n<li><b>FARBE:</b> metallic-grau</li>\r\n<li><b>TECHNIK:</b> Optisch (Akt.: ca. 1500 Bilder/s)</li>\r\n<li><b>TASTEN:</b> 5 (incl. Scrollrad)</li>\r\n<li><b>SCROLLRAD:</b> Ja</li>\r\n</ul>\r\n<i><b>BEMERKUNG:</b><br>Keine Reinigung bewegter Teile mehr notwendig, da statt der Mauskugel ein Fotoempfänger benutzt wird.</i>', '', 0),
(27, 2, 'Hewlett-Packard LaserJet 1100Xi', '<b>HP LaserJet für mehr Produktivität und Flexibilität am Arbeitsplatz</b><br><br>\r\nDer HP LaserJet 1100Xi Drucker verbindet exzellente Laserdruckqualität mit hoher Geschwindigkeit für mehr Effizienz.<br><br>\r\n<b>Zielkunden</b>\r\n<ul><li>Einzelanwender, die Wert auf professionelle Ausdrucke in Laserqualität legen und schnelle Ergebnisse auch bei komplexen Dokumenten erwarten.</li>\r\n<li>Der HP LaserJet 1100 sorgt mit gestochen scharfen Texten und Grafiken für ein professionelles Erscheinungsbild Ihrer Arbeit und Ihres Unternehmens. Selbst bei komplexen Dokumenten liefert er schnelle Ergebnisse. Andere Medien - wie z.B. Transparentfolien und Briefumschläge, etc. - lassen sich problemlos bedrucken. Somit ist der HP LaserJet 1100 ein Multifunktionstalent im Büroalltag.</li>\r\n</ul>\r\n<b>Eigenschaften</b>\r\n<ul>\r\n<li><b>Druckqualität</b> Schwarzweiß: 600 x 600 dpi</li>\r\n<li><b>Monatliche Druckleistung</b> Bis zu 7000 Seiten</li>\r\n<li><b>Speicher</b> 2 MB Standardspeicher, erweiterbar auf 18 MB</li>\r\n<li><b>Schnittstelle/gemeinsame Nutzung</b> Parallel, IEEE 1284-kompatibel</li>\r\n<li><b>Softwarekompatibilität</b> DOS/Win 3.1x/9x/NT 4.0</li>\r\n<li><b>Papierzuführung</b> 125-Blatt-Papierzuführung</li>\r\n<li><b>Druckmedien</b> Normalpapier, Briefumschläge, Transparentfolien, kartoniertes Papier, Postkarten und Etiketten</li>\r\n<li><b>Netzwerkfähig</b> Über HP JetDirect PrintServer</li>\r\n<li><b>Lieferumfang</b> HP LaserJet 1100Xi Drucker (Lieferumfang: Drucker, Tonerkassette, 2 m Parallelkabel, Netzkabel, Kurzbedienungsanleitung, Benutzerhandbuch, CD-ROM, 3,5"-Disketten mit Windows® 3.1x, 9x, NT 4.0 Treibern und DOS-Dienstprogrammen)</li>\r\n<li><b>Gewährleistung</b> Ein Jahr</li>\r\n</ul>\r\n', 'www.hp.com', 0),
(1, 3, 'Matrox G200 MMS', 'Reinforcing its position as a multi-monitor trailblazer, Matrox Graphics Inc. has once again developed the most flexible and highly advanced solution in the industry. Introducing the new Matrox G200 Multi-Monitor Series; the first graphics card ever to support up to four DVI digital flat panel displays on a single 8&quot; PCI board.<br><br>With continuing demand for digital flat panels in the financial workplace, the Matrox G200 MMS is the ultimate in flexible solutions. The Matrox G200 MMS also supports the new digital video interface (DVI) created by the Digital Display Working Group (DDWG) designed to ease the adoption of digital flat panels. Other configurations include composite video capture ability and onboard TV tuner, making the Matrox G200 MMS the complete solution for business needs.<br><br>Based on the award-winning MGA-G200 graphics chip, the Matrox G200 Multi-Monitor Series provides superior 2D/3D graphics acceleration to meet the demanding needs of business applications such as real-time stock quotes (Versus), live video feeds (Reuters & Bloombergs), multiple windows applications, word processing, spreadsheets and CAD.', 'www.matrox.com/mga/products/g200_mms/home.cfm', 0);
INSERT INTO `products_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`) VALUES
(2, 3, 'Matrox G400 32MB', '<b>Dramatically Different High Performance Graphics</b><br><br>Introducing the Millennium G400 Series - a dramatically different, high performance graphics experience. Armed with the industry''s fastest graphics chip, the Millennium G400 Series takes explosive acceleration two steps further by adding unprecedented image quality, along with the most versatile display options for all your 3D, 2D and DVD applications. As the most powerful and innovative tools in your PC''s arsenal, the Millennium G400 Series will not only change the way you see graphics, but will revolutionize the way you use your computer.<br><br><b>Key features:</b><ul><li>New Matrox G400 256-bit DualBus graphics chip</li><li>Explosive 3D, 2D and DVD performance</li><li>DualHead Display</li><li>Superior DVD and TV output</li><li>3D Environment-Mapped Bump Mapping</li><li>Vibrant Color Quality rendering </li><li>UltraSharp DAC of up to 360 MHz</li><li>3D Rendering Array Processor</li><li>Support for 16 or 32 MB of memory</li></ul>', 'www.matrox.com/mga/products/mill_g400/home.htm', 0),
(3, 3, 'Microsoft IntelliMouse Pro', 'Every element of IntelliMouse Pro - from its unique arched shape to the texture of the rubber grip around its base - is the product of extensive customer and ergonomic research. Microsoft''s popular wheel control, which now allows zooming and universal scrolling functions, gives IntelliMouse Pro outstanding comfort and efficiency.', 'www.microsoft.com/hardware/mouse/intellimouse.asp', 0),
(4, 3, 'The Replacement Killers', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>Languages: English, Deutsch.<br>Subtitles: English, Deutsch, Spanish.<br>Audio: Dolby Surround 5.1.<br>Picture Format: 16:9 Wide-Screen.<br>Length: (approx) 80 minutes.<br>Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.replacement-killers.com', 0),
(5, 3, 'Blade Runner - Director''s Cut', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).<br>Languages: English, Deutsch.<br>Subtitles: English, Deutsch, Spanish.<br>Audio: Dolby Surround 5.1.<br>Picture Format: 16:9 Wide-Screen.<br>Length: (approx) 112 minutes.<br>Other: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.bladerunner.com', 0),
(6, 3, 'The Matrix', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch.\r<br>\nAudio: Dolby Surround.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 131 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Making Of.', 'www.thematrix.com', 0),
(7, 3, 'You''ve Got Mail', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch, Spanish.\r<br>\nSubtitles: English, Deutsch, Spanish, French, Nordic, Polish.\r<br>\nAudio: Dolby Digital 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 115 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.youvegotmail.com', 0),
(8, 3, 'A Bug''s Life', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Digital 5.1 / Dobly Surround Stereo.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 91 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', 'www.abugslife.com', 0),
(9, 3, 'Under Siege', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 98 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(10, 3, 'Under Siege 2 - Dark Territory', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 98 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(11, 3, 'Fire Down Below', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 100 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(12, 3, 'Die Hard With A Vengeance', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 122 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(13, 3, 'Lethal Weapon', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 100 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(14, 3, 'Red Corner', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 117 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(15, 3, 'Frantic', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 115 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(16, 3, 'Courage Under Fire', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 112 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(17, 3, 'Speed', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 112 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(18, 3, 'Speed 2: Cruise Control', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 120 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(19, 3, 'There''s Something About Mary', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 114 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(20, 3, 'Beloved', 'Regional Code: 2 (Japan, Europe, Middle East, South Africa).\r<br>\nLanguages: English, Deutsch.\r<br>\nSubtitles: English, Deutsch, Spanish.\r<br>\nAudio: Dolby Surround 5.1.\r<br>\nPicture Format: 16:9 Wide-Screen.\r<br>\nLength: (approx) 164 minutes.\r<br>\nOther: Interactive Menus, Chapter Selection, Subtitles (more languages).', '', 0),
(21, 3, 'SWAT 3: Close Quarters Battle', '<b>Windows 95/98</b><br><br>211 in progress with shots fired. Officer down. Armed suspects with hostages. Respond Code 3! Los Angles, 2005, In the next seven days, representatives from every nation around the world will converge on Las Angles to witness the signing of the United Nations Nuclear Abolishment Treaty. The protection of these dignitaries falls on the shoulders of one organization, LAPD SWAT. As part of this elite tactical organization, you and your team have the weapons and all the training necessary to protect, to serve, and "When needed" to use deadly force to keep the peace. It takes more than weapons to make it through each mission. Your arsenal includes C2 charges, flashbangs, tactical grenades. opti-Wand mini-video cameras, and other devices critical to meeting your objectives and keeping your men free of injury. Uncompromised Duty, Honor and Valor!', 'www.swat3.com', 0),
(22, 3, 'Unreal Tournament', 'From the creators of the best-selling Unreal, comes Unreal Tournament. A new kind of single player experience. A ruthless multiplayer revolution.<br><br>This stand-alone game showcases completely new team-based gameplay, groundbreaking multi-faceted single player action or dynamic multi-player mayhem. It''s a fight to the finish for the title of Unreal Grand Master in the gladiatorial arena. A single player experience like no other! Guide your team of ''bots'' (virtual teamates) against the hardest criminals in the galaxy for the ultimate title - the Unreal Grand Master.', 'www.unrealtournament.net', 0),
(23, 3, 'The Wheel Of Time', 'The world in which The Wheel of Time takes place is lifted directly out of Jordan''s pages; it''s huge and consists of many different environments. How you navigate the world will depend largely on which game - single player or multipayer - you''re playing. The single player experience, with a few exceptions, will see Elayna traversing the world mainly by foot (with a couple notable exceptions). In the multiplayer experience, your character will have more access to travel via Ter''angreal, Portal Stones, and the Ways. However you move around, though, you''ll quickly discover that means of locomotion can easily become the least of the your worries...<br><br>During your travels, you quickly discover that four locations are crucial to your success in the game. Not surprisingly, these locations are the homes of The Wheel of Time''s main characters. Some of these places are ripped directly from the pages of Jordan''s books, made flesh with Legend''s unparalleled pixel-pushing ways. Other places are specific to the game, conceived and executed with the intent of expanding this game world even further. Either way, they provide a backdrop for some of the most intense first person action and strategy you''ll have this year.', 'www.wheeloftime.com', 0),
(24, 3, 'Disciples: Sacred Lands', 'A new age is dawning...<br><br>Enter the realm of the Sacred Lands, where the dawn of a New Age has set in motion the most momentous of wars. As the prophecies long foretold, four races now clash with swords and sorcery in a desperate bid to control the destiny of their gods. Take on the quest as a champion of the Empire, the Mountain Clans, the Legions of the Damned, or the Undead Hordes and test your faith in battles of brute force, spellbinding magic and acts of guile. Slay demons, vanquish giants and combat merciless forces of the dead and undead. But to ensure the salvation of your god, the hero within must evolve.<br><br>The day of reckoning has come... and only the chosen will survive.', '', 0),
(25, 3, 'Microsoft Internet Keyboard PS/2', 'The Internet Keyboard has 10 Hot Keys on a comfortable standard keyboard design that also includes a detachable palm rest. The Hot Keys allow you to browse the web, or check e-mail directly from your keyboard. The IntelliType Pro software also allows you to customize your hot keys - make the Internet Keyboard work the way you want it to!', '', 0),
(26, 3, 'Microsoft IntelliMouse Explorer', 'Microsoft introduces its most advanced mouse, the IntelliMouse Explorer! IntelliMouse Explorer features a sleek design, an industrial-silver finish, a glowing red underside and taillight, creating a style and look unlike any other mouse. IntelliMouse Explorer combines the accuracy and reliability of Microsoft IntelliEye optical tracking technology, the convenience of two new customizable function buttons, the efficiency of the scrolling wheel and the comfort of expert ergonomic design. All these great features make this the best mouse for the PC!', 'www.microsoft.com/hardware/mouse/explorer.asp', 0),
(27, 3, 'Hewlett Packard LaserJet 1100Xi', 'HP has always set the pace in laser printing technology. The new generation HP LaserJet 1100 series sets another impressive pace, delivering a stunning 8 pages per minute print speed. The 600 dpi print resolution with HP''s Resolution Enhancement technology (REt) makes every document more professional.<br><br>Enhanced print speed and laser quality results are just the beginning. With 2MB standard memory, HP LaserJet 1100xi users will be able to print increasingly complex pages. Memory can be increased to 18MB to tackle even more complex documents with ease. The HP LaserJet 1100xi supports key operating systems including Windows 3.1, 3.11, 95, 98, NT 4.0, OS/2 and DOS. Network compatibility available via the optional HP JetDirect External Print Servers.<br><br>HP LaserJet 1100xi also features The Document Builder for the Web Era from Trellix Corp. (featuring software to create Web documents).', 'www.pandi.hp.com/pandi-db/prodinfo.main?product=laserjet1100', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_notifications`
--

CREATE TABLE IF NOT EXISTS `products_notifications` (
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_notifications`
--


-- --------------------------------------------------------

--
-- Table structure for table `products_options`
--

CREATE TABLE IF NOT EXISTS `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`products_options_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_options`
--

INSERT INTO `products_options` (`products_options_id`, `language_id`, `products_options_name`) VALUES
(1, 1, 'Color'),
(2, 1, 'Size'),
(3, 1, 'Model'),
(4, 1, 'Memory'),
(1, 2, 'Farbe'),
(2, 2, 'Größe'),
(3, 2, 'Modell'),
(4, 2, 'Speicher'),
(1, 3, 'Color'),
(2, 3, 'Talla'),
(3, 3, 'Modelo'),
(4, 3, 'Memoria'),
(5, 3, 'Version'),
(5, 2, 'Version'),
(5, 1, 'Version');

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values`
--

CREATE TABLE IF NOT EXISTS `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`products_options_values_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_options_values`
--

INSERT INTO `products_options_values` (`products_options_values_id`, `language_id`, `products_options_values_name`) VALUES
(1, 1, '4 mb'),
(2, 1, '8 mb'),
(3, 1, '16 mb'),
(4, 1, '32 mb'),
(5, 1, 'Value'),
(6, 1, 'Premium'),
(7, 1, 'Deluxe'),
(8, 1, 'PS/2'),
(9, 1, 'USB'),
(1, 2, '4 MB'),
(2, 2, '8 MB'),
(3, 2, '16 MB'),
(4, 2, '32 MB'),
(5, 2, 'Value Ausgabe'),
(6, 2, 'Premium Ausgabe'),
(7, 2, 'Deluxe Ausgabe'),
(8, 2, 'PS/2 Anschluss'),
(9, 2, 'USB Anschluss'),
(1, 3, '4 mb'),
(2, 3, '8 mb'),
(3, 3, '16 mb'),
(4, 3, '32 mb'),
(5, 3, 'Value'),
(6, 3, 'Premium'),
(7, 3, 'Deluxe'),
(8, 3, 'PS/2'),
(9, 3, 'USB'),
(10, 1, 'Download: Windows - English'),
(10, 2, 'Download: Windows - Englisch'),
(10, 3, 'Download: Windows - Inglese'),
(13, 1, 'Box: Windows - English'),
(13, 2, 'Box: Windows - Englisch'),
(13, 3, 'Box: Windows - Inglese');

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values_to_products_options`
--

CREATE TABLE IF NOT EXISTS `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL,
  `products_options_values_id` int(11) NOT NULL,
  PRIMARY KEY (`products_options_values_to_products_options_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `products_options_values_to_products_options`
--

INSERT INTO `products_options_values_to_products_options` (`products_options_values_to_products_options_id`, `products_options_id`, `products_options_values_id`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 4, 3),
(4, 4, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 5, 10),
(13, 5, 13);

-- --------------------------------------------------------

--
-- Table structure for table `products_to_categories`
--

CREATE TABLE IF NOT EXISTS `products_to_categories` (
  `products_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`products_id`,`categories_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products_to_categories`
--

INSERT INTO `products_to_categories` (`products_id`, `categories_id`) VALUES
(1, 4),
(2, 4),
(3, 9),
(4, 10),
(5, 11),
(6, 10),
(7, 12),
(8, 13),
(9, 10),
(10, 10),
(11, 10),
(12, 10),
(13, 10),
(14, 15),
(15, 14),
(16, 15),
(17, 10),
(18, 10),
(19, 12),
(20, 15),
(21, 18),
(22, 19),
(23, 20),
(24, 20),
(25, 8),
(26, 9),
(27, 5);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(64) NOT NULL,
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_reviews_products_id` (`products_id`),
  KEY `idx_reviews_customers_id` (`customers_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviews_id`, `products_id`, `customers_id`, `customers_name`, `reviews_rating`, `date_added`, `last_modified`, `reviews_read`) VALUES
(1, 19, 1, 'John doe', 5, '2010-11-08 12:00:12', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reviews_description`
--

CREATE TABLE IF NOT EXISTS `reviews_description` (
  `reviews_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `reviews_text` text NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews_description`
--

INSERT INTO `reviews_description` (`reviews_id`, `languages_id`, `reviews_text`) VALUES
(1, 1, 'this has to be one of the funniest movies released for 1999!');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `room_id` int(100) NOT NULL,
  `room_type` int(5) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `room_description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `room_price` int(20) NOT NULL,
  `room_size` varchar(20) NOT NULL,
  `room_image` varchar(50) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `room_type`, `room_name`, `room_description`, `room_price`, `room_size`, `room_image`) VALUES
(1, 1, 'Deluxe ', ' Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. ', 79, '4m*4m', 'NoiThat1.jpg'),
(2, 2, 'Primier Deluxe', 'Spacious room of  48 square meter wooden floor room overlooking greenery mountain view. 32 inch LCD TV shower/ bath tub/ DVD player/ complimentary wireless internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities and balcony. Includes BREAKFAST, LUNCH & DINNER.', 90, '3m*5m', 'Phong1.jpg'),
(3, 3, 'Executive Deluxe', 'Room of  35 square meter wooden floor room overlooking the ocean view. 21 inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ 24 hour room service/ coffee and tea making facilities and balcony. Includes BREAKFAST, LUNCH & DINNER.', 120, '3.5m*5m', 'phong7.jpg'),
(6, 2, 'Primier Deluxe', NULL, 90, '', 'Phong2.jpg'),
(4, 1, 'Deluxe ', NULL, 79, '', 'NoiThat2.jpg'),
(5, 1, 'Deluxe', NULL, 79, '', 'NoiThat3.jpg'),
(7, 2, 'Primier Deluxe', NULL, 90, '', 'Phong3.jpg'),
(8, 3, 'Executive Deluxe', NULL, 120, '', 'phong5.jpg'),
(9, 3, 'Executive Deluxe', NULL, 120, '', 'phong6.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE IF NOT EXISTS `room_type` (
  `room_type_id` int(2) NOT NULL AUTO_INCREMENT,
  `room_type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `room_type_image` varchar(50) NOT NULL,
  `room_type_description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `room_type_count` int(5) NOT NULL,
  `room_type_price` int(10) NOT NULL,
  `room_type_categories` int(2) NOT NULL,
  `image1` varchar(50) NOT NULL,
  `image2` varchar(50) NOT NULL,
  `image3` varchar(50) NOT NULL,
  `image4` varchar(50) NOT NULL,
  PRIMARY KEY (`room_type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`room_type_id`, `room_type_name`, `room_type_image`, `room_type_description`, `room_type_count`, `room_type_price`, `room_type_categories`, `image1`, `image2`, `image3`, `image4`) VALUES
(1, 'Phòng Sang trọng hướng đồi', 'phongsangtrong1.jpg', 'Phòng rộng rãi của 30 mét vuông.Nhìn ra cảnh quan núi xanh. LCD 21inch / vòi sen / bồn tắm / miễn phí không dây / cắm và chơi internet / cá nhân an toàn / mini bar / dịch vụ 24 giờ / cà phê và các cơ sở pha trà. Bao gồm ăn sáng, trưa và bữa tối.', 20, 79, 1, '', '', '', ''),
(2, 'Phòng Sang trọng hướng biền', 'phongsangtrong2.jpg', 'Phòng rộng rãi của 48 mét vuông, sàn gỗ phòng hướng ra đại dương. TV LCD 32 inch / vòi sen / bồn tắm / DVD / miễn phí internet không dây / cá nhân an toàn / mini bar / dịch vụ phòng 24 giờ / cà phê và trà các cơ sở lập và ban công. Bao gồm ăn sáng, trưa và bữa tối.', 25, 100, 1, '', '', '', ''),
(3, 'Phòng Sang trọng hướng vườn', 'phongsangtrong3.jpg', 'Phòng 35 mét vuông với sàn gỗ. Nhìn tòa nhà điều hành và Dương. Cơ sở vật chất bao gồm màn hình LCD 21inch / vòi sen / bồn tắm / miễn phí không dây / cắm và chơi internet / cá nhân an toàn / mini bar / dịch vụ 24 giờ / cà phê và các cơ sở pha trà. Bao gồm ăn sáng, trưa & tối', 20, 65, 1, '', '', '', ''),
(4, 'Grand Ballroom', 'phonghop1.jpg', 'Với sức chứa hơn 600 chỗ ngồi, có thể chia thành phòng Ballroom 1 rộng 441m2, phòng Ballroom 2 với diện tích 294m2, được trang bị đầy đủ các thiết bị nghe nhìn, phương tiện thông tin liên lạc hiện đại bậc nhất ở Việt Nam. Đây là nơi lý tưởng để tổ chức hội thảo, hội nghị, những bữa tiệc lớn hay triển lãm trưng bày. Hội trường được thiết kế riêng biệt bên cạnh khu vườn xinh đẹp với hành lang rộng và khu chuẩn bị tiệc cocktail. Grand Ballroom có thể phục vụ 360 suất tiệc ngồi, 250 suất tiệc Buffet và 600 suất tiệc Cocktail.', 3, 1000, 4, '', '', '', ''),
(5, 'Phòng họp Diamond & Ruby', 'phonghop2.jpg', 'Hai phòng họp có đầy đủ trang thiết bị hiện đại và Internet không dây. Phòng rộng 150m2 thích hợp cho những cuộc họp có quy mô vừa và nhỏ của doanh nghiệp', 3, 800, 4, '', '', '', ''),
(6, 'Trung tâm Hội nghị & Biểu diễn đa năng', 'phonghop3.jpg', 'Với sức chứa 1350 người, được trang bị những phương tiện kỹ thuật âm thanh, ánh sáng tối tân với 240m2 diện tích sân khấu. Đây là nơi đã diễn ra nhiều sự kiện lớn....', 2, 1200, 4, '', '', '', ''),
(7, 'Phòng cao cấp hướng biển', 'phongcaocap1.jpg', 'Phòng rộng rãi của 48 mét vuông, sàn gỗ phòng hướng ra đại dương. TV LCD 32 inch / vòi sen / bồn tắm / DVD / miễn phí internet không dây / cá nhân an toàn / mini bar / dịch vụ phòng 24 giờ / cà phê và trà các cơ sở lập và ban công. Bao gồm ăn sáng, trưa và bữa tối.', 10, 80, 2, '', '', '', ''),
(8, 'Phòng cao cấp hướng đồi', 'phongcaocap2.jpg', 'Phòng rộng rãi của 48 phòng mét vuông sàn nhà bằng gỗ nhìn ra thấy núi xanh. TV LCD 32 inch tắm bồn / DVD / miễn phí internet không dây / an toàn mini cá nhân / bar / dịch vụ phòng 24 giờ / cà phê và trà các cơ sở xây dựng và ban công. Bao gồm ăn sáng, trưa và bữa tối.', 10, 75, 2, '', '', '', ''),
(9, 'Phòng cao cấp hướng đồi', 'phongcaocap3.jpg', 'Phòng 35 mét vuông với sàn gỗ. Nhìn tòa nhà điều hành và Dương. Cơ sở vật chất bao gồm màn hình LCD 21inch / vòi sen / bồn tắm / miễn phí không dây / cắm và chơi internet / cá nhân an toàn / mini bar / dịch vụ 24 giờ / cà phê và các cơ sở pha trà. Bao gồm ăn sáng, trưa và bữa tối.', 10, 78, 2, '', '', '', ''),
(10, 'Phòng gia đình huống biền', 'phonggiadinh1.jpg', 'Phòng gia đình hướng biển sang trọng và tiện nghi, giúp quý khách có một kỳ nghỉ thoải mái và hạnh phúc cùng những người thân yêu.Phòng 35 mét vuông với sàn gỗ. Nhìn tòa nhà điều hành và Dương. Cơ sở vật chất bao gồm màn hình LCD 21inch / vòi sen / bồn tắm / miễn phí không dây / cắm và chơi internet / cá nhân an toàn / mini bar / dịch vụ 24 giờ / cà phê và các cơ sở pha trà. Bao gồm ăn sáng, trưa và bữa tối.', 5, 90, 3, '', '', '', ''),
(11, 'Phòng gia đình hướng vườn', 'phonggiadinh2.jpg', 'Phòng gia đình hướng vườn sang trọng và tiện nghi, giúp quý khách có một kỳ nghỉ thoải mái và hạnh phúc cùng những người thân yêu.Phòng rộng rãi của 48 phòng mét vuông sàn nhà bằng gỗ nhìn ra thấy núi xanh. TV LCD 32 inch tắm bồn / DVD / miễn phí internet không dây / an toàn mini cá nhân / bar / dịch vụ phòng 24 giờ / cà phê và trà các cơ sở xây dựng và ban công. Bao gồm ăn sáng, trưa và bữa tối.', 5, 85, 3, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `sesskey` varchar(32) NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('6o29apmv43ashtv89chb28oo36', 1292903172, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('g63ehssgouviugetc9snjksnr2', 1292903158, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('59a14r9v48rp9cfpqet67affb3', 1292901657, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('fioa2brrb0vhltfmqqiamudc16', 1292903143, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2f2ec2fuqhmc5b8b138vgrslh7', 1292899994, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ei55vmfgeerp8n8qn8ajph5cp0', 1292910747, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"ei55vmfgeerp8n8qn8ajph5cp0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('l1100adb8m8clk2ie24unoql86', 1292901652, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"l1100adb8m8clk2ie24unoql86";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('20gbfnsgrnoqncq00mrf4odg46', 1292899990, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"20gbfnsgrnoqncq00mrf4odg46";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('v8fdfob3offp13v0ocm0jqqgg7', 1292899928, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('t6dm0493qvijav226dthfibe96', 1292899911, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:239:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. ";s:10:"room_price";s:2:"79";s:6:"osCsid";s:26:"t6dm0493qvijav226dthfibe96";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('v8b5254h8ltlu7puf51an820g5', 1292896110, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('9dbnpum33atd8pf5jqvo14guf0', 1292841987, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('0j4aegv3ju6udgvm6qok4e8qd7', 1292841989, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qbjkk0i5q3a5esk9tm1rscedi3', 1292841996, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('u1hrb9i5j6slqpnjc0kc5qc3n7', 1292841967, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ulko670m1d4jka41fl9e8tv1a5', 1292841962, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:12:"register.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('du0uimdho170rlrnvhpdok6c41', 1292841959, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"du0uimdho170rlrnvhpdok6c41";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('8lgdn3e6p0r7hc56dnl7tgd5e2', 1292841954, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:10:"logoff.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"8lgdn3e6p0r7hc56dnl7tgd5e2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('803bv1hk0psb87t6o31ckqc3o6', 1292841906, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('bo17e7csp15eb904e8v2m53o74', 1292841914, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('tbch0nsna8m25hlle1efcu4t92', 1292841923, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3iilsbisqhasbcuk2hvc3c9i41', 1292841930, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('uo3s4njsp8sf76cod4l9j0kvd0', 1292841944, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"uo3s4njsp8sf76cod4l9j0kvd0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('o8sr3431h4o30v8hvchtsgeu13', 1292841898, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('11ttc37srmsc2ko2gdir7s2fi2', 1292841891, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"11ttc37srmsc2ko2gdir7s2fi2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('d2agvlvf3f8ihc12n6t5913e35', 1292840919, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('k807vibl99kr5c974ej0etgs90', 1292840929, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('kmtrdrl8md8b8sslj5v3qc9vf5', 1292840923, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"kmtrdrl8md8b8sslj5v3qc9vf5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('5cvpqb9g6r133p4gklt8lf1n66', 1292840896, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('59r2q4p5v4qi83e02jgn2gbvq4', 1292840887, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:239:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. ";s:10:"room_price";s:2:"79";s:6:"osCsid";s:26:"59r2q4p5v4qi83e02jgn2gbvq4";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('jik14g0p6r5su048195orou2c5', 1292840875, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"jik14g0p6r5su048195orou2c5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('b2p1lvi0n0f9o9jp7g0881sr73', 1292839920, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('sc9jgcvfncltev8mfucuegkto4', 1292839907, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ge9325691tt3irv5slsfkpotp6', 1292839907, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('45159j0ckbl8qv62tj0nlcmm23', 1292839907, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('3njtvjeacu63sah9g3sgn9blu7', 1292840844, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"3njtvjeacu63sah9g3sgn9blu7";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('kb2rh6d442euj85jt8kasl0j07', 1292839810, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6j2hte902k8ltipln3llkodb14', 1292839804, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"6j2hte902k8ltipln3llkodb14";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('cut3a9banbi1cfhf9lcsocphe2', 1292839598, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('cfnbuan4fn417rdruirfmeshv7', 1292839595, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"cfnbuan4fn417rdruirfmeshv7";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('huh7joipnrhtlnk3jo6bqbvcm3', 1292839576, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('dlftrn5a2i9l5jpsoevh75rk90', 1292839566, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:239:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. ";s:10:"room_price";s:2:"79";s:6:"osCsid";s:26:"dlftrn5a2i9l5jpsoevh75rk90";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qu1tkl471l7e0j73dj5eim9dh2', 1292839467, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('42g6vbou89mnq7bqjgd8lu3d10', 1292839428, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5joa052dec48puajm744kt6jm2', 1292839433, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:239:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. ";s:10:"room_price";s:2:"79";s:6:"osCsid";s:26:"5joa052dec48puajm744kt6jm2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('snf55dhucg68ehd2ncodus5a66', 1292839424, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:239:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. ";s:12:"room_price79";s:0:"";s:6:"osCsid";s:26:"snf55dhucg68ehd2ncodus5a66";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mmu6iv69ncghd5kdhri8blsj70', 1292839386, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('hkhojdfqjh31t6mie956qj2nr5', 1292839383, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:3:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:238:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities.";s:6:"osCsid";s:26:"hkhojdfqjh31t6mie956qj2nr5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('822lcfhbhe86a1h9bh9l23hga6', 1292838470, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('119kd7l8dt41dgdbnbhpsqmhk2', 1292838729, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"119kd7l8dt41dgdbnbhpsqmhk2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('m3b6s7ktfqul3o54a5uv9i6o73', 1292838463, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('p53u4dkvjvsokr0ceosojva1m5', 1292838467, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"p53u4dkvjvsokr0ceosojva1m5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('sckgkksv7p9ge097mqn80vj3p4', 1292838444, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('rntk1t3hec41j3a526bbk548k4', 1292838428, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"2";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:10:"Phong1.jpg";s:16:"room_description";s:285:"Spacious room of  48 square meter wooden floor room overlooking greenery mountain view. 32 inch LCD TV shower/ bath tub/ DVD player/ complimentary wireless internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities and balcony. Includes BREAKFAST, LUNCH ";s:7:"DINNER_";s:0:"";s:6:"osCsid";s:26:"rntk1t3hec41j3a526bbk548k4";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('femn25982a3h50lh4d1vre8bu5', 1292838422, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('pge78dins16q3fq1e4i9t4a301', 1292838350, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:3:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:238:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities.";s:6:"osCsid";s:26:"pge78dins16q3fq1e4i9t4a301";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('gfnoip1p097gg7916ma2h9a7r6', 1292838268, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('b1hop2n1nos06ftu6i8je2vfi3', 1292840864, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:10:"logoff.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"b1hop2n1nos06ftu6i8je2vfi3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mligqeif5ouhd86js9g7ld50h7', 1292838188, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('b51spr0js1a1l5b9kuhjijs966', 1292838263, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:265:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. Includes BREAKFAST, LUNCH ";s:7:"DINNER_";s:0:"";s:6:"osCsid";s:26:"b51spr0js1a1l5b9kuhjijs966";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('cd6bmcs71456qv034er285rb07', 1292837305, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('4pl8drsglbmlqr2gsedn3u3qf4', 1292837304, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ekqnl9vnnmitn01a50u80j10o3', 1292837304, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('tb5ho1144749e45gf2just7vs7', 1292837187, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('k8u42u0p4cjiplbf2nlkiq7r45', 1292837186, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('11otsvdqj1enntp1g41c101se4', 1292837148, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('uir72nnjd77qmkttbif1s3gen2', 1292837144, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('50vhq2sr55oa4iqhpcklj8cob7', 1292837139, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('94lqmenpej37kbqggo3un9gpg7', 1292837142, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('hdh4oika30vmcdvotsf5akpiq2', 1292837074, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7lgv37fc1rf75b57k5d2prvsa2', 1292837073, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('4irs00qbd7u74gvb9hfaplloi2', 1292837073, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('tln3f4093tm8qo3fnlr8una1m5', 1292837066, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('1f1gv6bns3q89o3pnfecebn2h6', 1292837070, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('fmsf5ql13j2l3if8rieidgtng5', 1292837062, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('9ojjfcd8cuhuofd58u4ffcj9d6', 1292836755, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:12:"NoiThat2.jpg";s:6:"osCsid";s:26:"9ojjfcd8cuhuofd58u4ffcj9d6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qh1qak5j8uken50n97i7veva80', 1292836749, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:12:"NoiThat1.jpg";s:6:"osCsid";s:26:"qh1qak5j8uken50n97i7veva80";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6to7n08uu89k5pmbn5j64tibo5', 1292836743, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('s9qvd3a5pv3jr3dqj1ahuq5026', 1292836741, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"product_info.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:7:"room_id";s:0:"";s:6:"osCsid";s:26:"s9qvd3a5pv3jr3dqj1ahuq5026";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5pkjfd4t0nqb3qd1ln1s4954c1', 1292836170, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6pi5mcsur0n6om3nn0o81lasb7', 1292835965, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"2";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:10:"Phong3.jpg";s:6:"osCsid";s:26:"6pi5mcsur0n6om3nn0o81lasb7";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('8u9srl67b7ssskq7nv3oflboj6', 1292835904, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"2";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:10:"Phong1.jpg";s:6:"osCsid";s:26:"8u9srl67b7ssskq7nv3oflboj6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('d9grida4ql669ee9k9rtb5pa26', 1292835897, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qonqhcgc456rr6d0rk1icttsq0', 1292835892, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:12:"NoiThat1.jpg";s:6:"osCsid";s:26:"qonqhcgc456rr6d0rk1icttsq0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('1vtbhsi9qdn4nq0lhu9ieo2980', 1292835554, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:12:"NoiThat1.jpg";s:6:"osCsid";s:26:"1vtbhsi9qdn4nq0lhu9ieo2980";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('fkmtcd8ei41lp7kad1bfi7h293', 1292835545, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('lndoc3up56tfeql375bpr259j6', 1292835461, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('rj0apn33vdkqp9drpoicir3rr5', 1292835458, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('alfrftbcgafba5v4torc8n8fv5', 1292835442, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mtes88cuce34ntccmpvvihmh43', 1292835461, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:12:"NoiThat1.jpg";s:6:"osCsid";s:26:"mtes88cuce34ntccmpvvihmh43";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('41bvviqtja34elsmul57p3tuc1', 1292835087, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('9vgldrr24m2hc77pj2tctnsj14', 1292835083, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:12:"NoiThat1.jpg";s:6:"osCsid";s:26:"9vgldrr24m2hc77pj2tctnsj14";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('f9g3fosiv7s0h05vi2c2295nf0', 1292834983, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('bsvcs7ksg10be69phse69g0ps7', 1292834879, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:12:"NoiThat1.jpg";s:6:"osCsid";s:26:"bsvcs7ksg10be69phse69g0ps7";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}');
INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('8giim73vqbvu0m2o2uabq9ndi5', 1292834873, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('duamiulh318q3h5qni25no98v5', 1292834871, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:12:"NoiThat1.jpg";s:6:"osCsid";s:26:"duamiulh318q3h5qni25no98v5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ckr138ll0mejstes9j9531utj4', 1292834648, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qpg4hu0d8fd4sg96tk0i76v9j0', 1292834646, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:0:"";s:6:"osCsid";s:26:"qpg4hu0d8fd4sg96tk0i76v9j0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('r4h791l2tparjurquohtrm4uv6', 1292834632, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:0:"";s:6:"osCsid";s:26:"r4h791l2tparjurquohtrm4uv6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ur88q9gesf77kl9s3kak3hf341', 1292834554, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:0:"";s:6:"osCsid";s:26:"ur88q9gesf77kl9s3kak3hf341";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('c9unddo09ki8h3v0740nuckt92', 1292834544, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:0:"";s:6:"osCsid";s:26:"c9unddo09ki8h3v0740nuckt92";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ecjqe0fg129b5poog68rvrjja5', 1292833533, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('tgtmp7vfge3tni3tbdan8m03f2', 1292834534, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('kn24kpngu78jjdvtr6v784pvn1', 1292833481, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('t02uad2cdjmdflul6l9sj9i8q7', 1292833385, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('8cc5kgmfanhauj71sitndr7335', 1292833385, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('c5al3pcm03lhdcd5pg3ljkhee0', 1292833371, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('iscf357i3k1pc2sltumu841eq7', 1292833364, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('npqdlla542m0icti7gphlq8nh7', 1292832706, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5noav2kifnsseb7svlkbc54sv7', 1292832704, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('pcblt7efehiq7d7a2h0m7lfff2', 1292832694, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ksvb5qjkjgd0h7q5n0iof69v87', 1292832693, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('bk685vfv6l84smc8l95k3d6q52', 1292832682, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('378pirckdf5pp0jhdjmkcrvui5', 1292832680, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('s04hu4tnenoahoft2g99n2k816', 1292832678, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('k499p9mhjj4k1082qmc82f73s0', 1292832676, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('akgo0iisk5oo0670gp45hkfcc1', 1292832644, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('acr53j2olul1kjo9lghcrj5vj4', 1292832646, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('kv1i1e8sepi5hget6olat5j3c7', 1292832639, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ulr56ki7h1ds8mf3p6uehcfsp4', 1292832642, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('r8hk1r4e3nf5ip3oe61skqa8u0', 1292832631, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6s0jmgc2tt10hjegs94lp0j2g5', 1292832637, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('bn714dgl3hq6hs0ig7o58mbub5', 1292832626, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('0edt0l9o7d1lf1dkpdorqppjl2', 1292832629, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qabn6oqjhj28jtsuh9br89hm25', 1292832623, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('575h4fa4rv0a6nebqb495sg212', 1292832620, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('t9nha7oot1b657q1oufs8gjev3', 1292832617, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('utn8anm38825o96ku6e2q25uv1', 1292832570, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('reu1r9pprbqdrraiangliocnf3', 1292832533, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('k18q97mu4mq8eis1udgsfn6le0', 1292832509, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('4tuu1eh92ffs3hjqrm7a29tmd0', 1292832445, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ilhuouprv85448oi3hudc60l92', 1292832441, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('0d70bahc4k9m4bf8ilnmu763o6', 1292832438, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('b8q7l0uk6jjjmld22pgov038r7', 1292832435, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('be64ehm29pubc3uj9hfeqsaeb0', 1292832433, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('hnq3v9v1njosejbkur9mssib84', 1292832432, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7q2klaea648h7mv2tbsihuviv2', 1292832427, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('m7k9rptv1f9cebb2ornq8rr6e1', 1292832421, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('vh9m761t1nov3egdetuhgmmis1', 1292832363, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('72o10qarfiq31cfj3cjgk9mj73', 1292832279, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7no11r77emkr7v464nsg5pt4t3', 1292832274, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('8ue5atkvf80u76u66u4io1a122', 1292832266, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('avinfl6lq91tfjq5rc81o2tjs2', 1292832262, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qv4t94hb4sb42cftbmmp8dcec7', 1292831569, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7e7upooir89nj1b9akoc6lrf33', 1292831564, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qvko2lj4pph71e5r02vcv36l66', 1292831424, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('d1ij5dvjdkqohp096oln84jql1', 1292831549, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('1g7cfsf9n2dbntpsgonk17vc61', 1292831320, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mble9su0vmgv5sca173eg7mm72', 1292831313, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qv7b3f1ol3rieqn4o8dc48jp67', 1292831311, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('hgnd09sf42g74gm66f8fcdgs37', 1292831310, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:9:"room_type";s:1:"1";s:6:"action";s:7:"buy_now";s:11:"products_id";s:0:"";s:6:"osCsid";s:26:"hgnd09sf42g74gm66f8fcdgs37";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:17:"shopping_cart.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:9:"room_type";s:1:"1";s:6:"osCsid";s:26:"hgnd09sf42g74gm66f8fcdgs37";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('n84dmvcm72agtshu6uda7q3jd0', 1292831005, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mmb683bldsu2ls19mviir5msb7', 1292831001, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('4v9erao71g73u9aib474t3cu52', 1292831001, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ops8co3ec68ekoioi2louiltl7', 1292831000, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('rj8isclkaggpqaag7hohnfst80', 1292830644, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('e37as24c3d9mij9p8oqugh0c36', 1292830642, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:9:"room_type";s:1:"1";s:6:"action";s:7:"buy_now";s:11:"products_id";s:0:"";s:6:"osCsid";s:26:"e37as24c3d9mij9p8oqugh0c36";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:17:"shopping_cart.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:9:"room_type";s:1:"1";s:6:"osCsid";s:26:"e37as24c3d9mij9p8oqugh0c36";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('vl6mrquag6l15fgrmq4iun2is7', 1292830630, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"product_info.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:7:"room_id";s:0:"";s:6:"osCsid";s:26:"vl6mrquag6l15fgrmq4iun2is7";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5nkni6sds2d7bf92ardteli7u7', 1292830601, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qqi33j1be5pmi7m1lj96nd0347', 1292830132, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ho2ercv7r5i08015on1t8pan35', 1292830500, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('9lste9cge6v8bjprqdjps1dj13', 1292830115, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('dd5bu8831d9fsergavg5kie9k7', 1292830126, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('j7c3tdctvc6dhq4ndvcs3p25e4', 1292830129, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('866offi6ccmm8e6jptu7ooegt5', 1292830071, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('cnuqmbs079qomph5cni3psaqp6', 1292830107, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('p561k2dkvdut578s9i5v8p09n0', 1292830111, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('cc5vhpb1q1mb6dc25k5dgnn384', 1292830011, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('7udsvh8j6m1jetolk2dv56ej81', 1292830046, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('gjoa2bcftv79545rcs1hp7hai2', 1292830011, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('gak37ijgmeed133asfkooivvn4', 1292830011, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('g0ns9v2of757ok029pcmn3nj05', 1292830011, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('drqpjms2jb9s7gls7omn15vk67', 1292830000, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('pp7dpqdkpis6rk2p9msdrcbp15', 1292829821, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('fdi3j3irvb2ih6eb3kdmonnbq4', 1292829812, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('nkd368o4v7nfkos0ck0nhln0m3', 1292829810, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ki5rb0jsd8bcmqlkieit9sgd12', 1292829798, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('slumc6t99ocgrf8ch25d9tvnj2', 1292829804, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('np71qm2tdoqd775ht7kn3edlr0', 1292829624, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('1sm8i6cbmumgki0ilpdgqoo233', 1292829417, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('uv1nr7iuh8sji0psj134hiohc5', 1292829604, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('524qd2b8ai3a79s7rve0dlodu6', 1292829412, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('4253grnj68i6p4ot8f2ptm7183', 1292829330, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('am19aouot0hamvaq3jhjbb6jk7', 1292829326, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('eitv3m5d7jvhg1hegl418evav4', 1292829241, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5n1s4u6n6sv6bsko4nr8qv8050', 1292829238, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('bfe9h9hb9de1anj841hmlcjh73', 1292828964, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('l265fbv9v8ij6k8tcd762mand2', 1292828965, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('dc4jv8ota6f8v1lan4vua40kf1', 1292827730, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('m3kvkmg25m83affds0mdff7re6', 1292824089, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('5tsb398mscp9i3bhe83u0nd410', 1292824033, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1uautq0va9fveot9jj1qgas2d0', 1292824086, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('en0ia8uu0vtgtlougf2dh2gs42', 1292824030, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('pfqgt9ua49a49913l2umbfvih1', 1292824019, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ho5s3kmq0uaun9b1ik7el286h2', 1292824019, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('vrh46h5b8jbmev4l90ab41cfh7', 1292824019, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('jlei4parlajdat32dbl7nj65t7', 1292824019, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('oug2u3ug66gp99p30shi208m42', 1292824019, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('7en5ttvmr2jv4keov2kh44idq7', 1292824019, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ukam57p3210bn30hmepm4oio01', 1292824018, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('8em7aspm3u3scvl8p4ooisbg36', 1292824018, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('31k6ugmq2p9hurve4e276jrfb4', 1292824017, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('at6vtagqgqr7ngclnk1pvt2i34', 1292824018, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('boef5ps4d3srrt484tt0ert3s0', 1292824018, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('hb611rr0u1d93momctheuqh5p4', 1292824011, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('hatcqj1bt4m19ssp6kpednevq0', 1292824011, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('03hofs52b9hp1r3bdabfu3gq00', 1292824011, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('f2d3icudg98mobdqp9ir59a395', 1292822178, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('g828ndavldnt67vcrk2liiojv1', 1292824009, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('s0casqv091g35dvoqitqn8ecg1', 1292824010, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('nc5sgnlgiqk9m2e03qh9hvnnc6', 1292822176, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('vrhv4dfhjlkgarb53rajn1pq72', 1292821820, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('sm88vdb1jjiu70arlfs8t1o6l6', 1292821758, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('g7ik5fcmolamnq4ht9f4c9rvi0', 1292821768, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7bt5lhskppu130q4a67ckbvbt0', 1292821755, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('cnn9lmameacrdg92sm982bguk1', 1292821751, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('988d9ll5c8h0vsm05esvj9bj13', 1292821672, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('aje8n3vgvlnqiflmda2f1np6q7', 1292821663, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ara37g0o178erl2n63lpamuvb1', 1292821580, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('545qp7b3pi0g7lhb97u40n7ok6', 1292821585, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('e4qjih811cid3ognhtg83f3552', 1292821312, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('hg763pfk606pj0ls0vf11ufc17', 1292821312, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('um6i5amg54vobqo5amp0e4pqc3', 1292821577, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('g84609pph9rtlc1tqbu0emrb62', 1292821311, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('c73roa03vm49deq66fumlb8034', 1292821311, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('qflbss0i3hm3d5faquanvsrv37', 1292821311, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('7hmns4oh783gs2032va20gpq70', 1292821312, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('qgn1m4v8rvj174b01ulv0kbn62', 1292821312, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('s33vjd16emufj3o15tuoppij84', 1292821312, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('e36fpri76g6eiollmtud9rj211', 1292821281, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1ejh81tm3o4d1un1hmnua49vk5', 1292821310, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3t9cp3g5ev7to5qdpht7lvmt12', 1292821311, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('b3odio2gnb7dq5ge0bqssshtl7', 1292821111, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('eaoeqduvgo5mo5ad3frahh4a15', 1292821111, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('70q6njsgrsj03aen1jbpbpe0c3', 1292821112, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('2o9rd8r754be82h1b9mq2agcm4', 1292821112, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('bophs6636hvd1cah4urhom1kh7', 1292821112, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1grq9e78d6uhn5te45m7n3sml5', 1292821126, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('q3unvj1nj6ok565bmkcrmfpdr6', 1292821279, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('n1ee0ibfk61qr4mleo4mu2vsh2', 1292821111, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('03t91fqu0ib3egqpbgbkj4e576', 1292821111, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('segf8q1lvmeegdbrinm7r0sqv2', 1292821003, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('6kja8f30b09lbstd0g9alone31', 1292821004, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('isoh0b96ses9ff578jslha9884', 1292821110, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('690ub98kahfnaedrnkpv2ehdi3', 1292821110, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('kebb5l7sq62bj2gqhqgrmpkf71', 1292821110, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ifbii3fncoti39knhhbej1usu2', 1292821111, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3vfpkc5u2of3pu8v47r0r88gs7', 1292820960, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('iusasbsd3c128pj5nj9igi8n73', 1292820999, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('j1k7jaukrj45u4lggif94tqjt1', 1292820958, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('6qukubev91jie0krnp7gbceqg1', 1292820958, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('hc9i9cpfbh0q54b657jvth4em7', 1292820959, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('u44a7d1ddlf3trce2b1uelmsh6', 1292820959, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('23cm49bu0jcuosvo1g9u5j6lm2', 1292820959, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('89jjp1t0sm9sogccne6tc6q5h3', 1292820959, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('o918i97sctj2l7rj5tbbqetri1', 1292820959, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('rkkjj9eip9fote3gh24ft5pni3', 1292820958, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('mvjt5t31c14va44vbp3ps4l9u6', 1292820958, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('bqhtnt6hqeohlb8g4qelg5flg7', 1292820958, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('o3i790gefqm6f4di1pdk9u5366', 1292820888, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('lha061b7275rc659ag05292m37', 1292820956, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('9fjp1nfpp3gfnc11puhufoals7', 1292820957, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1hn9fuogntcn0saa5gl1b5jvj2', 1292820957, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ps6ppe8tnnds9239jb8uahos60', 1292820957, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('dcnogsi43kbscgume9mibveb42', 1292820958, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('qcc9k0h1ovpq8uakeqle3icpn1', 1292820888, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ou7amr47m3515iub494efrdg64', 1292820888, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('642v8f9n3oc0hebmh8t63sqsb0', 1292820888, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('96n880hum6port7bcc93hsck37', 1292820870, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('sou796s2bg9g1h8hr9fbb1oev7', 1292820870, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('6ll1efatcep8e7hu94esq2ms54', 1292820871, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('0psh07nkrs2ov1s0oreh338f77', 1292820871, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3gnvs54jja90c3gimbhf61ej17', 1292820871, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('5cnuiapoc24qfoq9sp963h05j4', 1292820886, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('icr91md1g6npv2dge8flikm2j6', 1292820887, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;');
INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('j3hf59dddg4894dl5gre98s8d3', 1292820870, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('6v91bbi6b6tnn26h3f54dq7m56', 1292820870, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('4lg9gfnl9uf0empl17n902krv4', 1292820868, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('p3o22edkjg48le28et8jb46md0', 1292820868, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('cidltgkd8p45vtj67fnprv5743', 1292820868, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('9l5upf325ue4rkbj9b2q1jt6k6', 1292820868, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('8mbhq2sbaoktqf8krh148evpl1', 1292820869, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('gs30h5lgim7kf5ojj3a14e7l13', 1292820869, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1qsmj4q75vc5547r8qfdeohd50', 1292820870, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('sje6vpk32jf8sgtsa9h527vj04', 1292820867, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ar14v09718ag5tt2tvu6vs19d1', 1292820867, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('pj7or2fu8ic5e2m97u9agr7q35', 1292820867, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('2cf5o1obckhl5j8proit0fbt43', 1292820769, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('dk5oa7buu9te7kfm7aebudi176', 1292820769, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('4c7cum2o8q0g0harpkl2emkdg0', 1292820769, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('a2hnkat0imumu51gsil4v3og86', 1292820866, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('u8stjs4523rc4r2l9dco894fi6', 1292820867, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ih227jt6pqrskiqo3ibks1i4p1', 1292820867, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('k4lqv5fp777l5nghr9drot5ke0', 1292820768, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('pg4u90u4ibogb5h5sgcvcu8gq1', 1292820769, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('l153cp4f576ecop0rve1nidgp3', 1292820769, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('k5845u3oqvea16774ec1mubu22', 1292820719, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('e0h6r2rk10641okee0amqts4s4', 1292820722, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ujb1shnt0pmqluev12vav76432', 1292820768, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('a7j7rrtngie3h1hnnfdlgkklc0', 1292820768, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('gq37ej31slj6gj4h65f3qgsb03', 1292820768, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('r9ith4ddddorked77q10gqm2t6', 1292820718, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('84r2q1g0ucku2pi762mf1uum03', 1292820718, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('o5auvjtsh9bqtb5tts3oi2gu95', 1292820718, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('u4g0a779b5nhpmps907lj2tap4', 1292820522, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('grldf73ikuvk2tksvtv0tct6m0', 1292820717, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('kaqrkadcnn4p6rs77uba3mc1m0', 1292820518, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('n6ph540asf6snagqvuebft8rc6', 1292820519, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6g2of34am2gb3oqg2g46ral6v4', 1292820518, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ppmdkqi2tibjm68tun38qhadb1', 1292820518, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('k5411v03rh4n4592lg7hp5uvn6', 1292820518, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('h0apdthadnpdq5hroipu71o0h6', 1292820517, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('nijme1t27qqkkpl0re7k7jom37', 1292820517, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('obk3snp4cf9enl338thsiqmhc6', 1292820517, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('lin2sn3k7t6ltvk817bv3lqpv6', 1292820516, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('r0o73aeh4k7gc7jfghubhiu6l4', 1292820517, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('qlfam5cgn2g6bln6apkccofdb1', 1292820517, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('44qk290m3bm09v49j2t5d8fdj4', 1292820383, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('99vnsakf2tf24sf2u3m6c6pf26', 1292820383, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('tubemk8pcdtds3fj2h9jgm2294', 1292820383, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('2288qbbaeg50n7k71620n1ca13', 1292820383, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3lp9jlb8aackfuuvmgqhmbjp27', 1292820383, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('k06tdnrm39val67se657qd29c0', 1292820382, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ak1ale3k08psp1n9bg7ue2js33', 1292820382, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('q6l7kjjjjf9d78q469f5801002', 1292820382, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('rftjp995klg2rs6gcg6qmc2fg2', 1292820381, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('i92umfrd2vdfufc678v9p2jvi6', 1292820382, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('87rgh0tmm4opibbol049r7hqt2', 1292820382, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('qnvckbbksp3such7bq38s6fmk0', 1292820376, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('h20rr04auvmap67mrud2thoub2', 1292820377, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('bmahv70gn1598og274288rndg5', 1292820350, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1vob4fkvvr60f6f7unck09usm1', 1292820376, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('5dffj3kqbpv4jo8cg573f8kd50', 1292820376, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('927bptp38o5u06jjh3tqfb8976', 1292820350, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('9f9hh4o0joo9fu5okn5ji417h0', 1292820350, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('0aj12onbhlnsatmevcas5h4132', 1292820350, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('9qmip4bcpvlg759irubnl4m3a6', 1292820348, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('vcdscrq7r4rn8f6lsoq9g0lbg7', 1292820349, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('mjfs56jb9sb5i1k7lorbta5f55', 1292820349, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('kipsvb547u82o2bf00mtuv4136', 1292820349, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('nb85clm47vtk1rrtneua5k5v67', 1292820349, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('plkcv8m2tdhndj0auu6vt4bav1', 1292820348, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('fjell25v9r1i6df4fv4u4uka34', 1292820348, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('h7q76qimovr8576t8j5u65nrh3', 1292820348, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('o9uhvgjdkjfs8lr4b37ofom4a5', 1292820346, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('d5ujpuhplmb2vbfor7evdd0vu2', 1292820347, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('pvokm5iu5gamo8frd79vfnntl0', 1292820347, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('utsqnl49rfaj7ar1qgg2kl89l2', 1292820347, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('0sj3sgvs8rei8j18vdb55eug60', 1292820347, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('h3o1t6t7dmuiqvjuo92sosfsm2', 1292820348, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('46lmer0mnsgndml80r4srf01m6', 1292820346, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('2ildhg11v223a1kpnkm7jk7j04', 1292820346, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('s5lqagn37k4jb41lofnts4cg35', 1292820344, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('mmj3arjhlf6p9h5s9fvl5325i7', 1292820345, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('j6g6l3p2s23r0urr67o4mgv294', 1292820346, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ufgvju3sqkntai3m6fet5pu217', 1292820307, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ejjc0v76caqfslj1fcqp56rn17', 1292820308, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('53ga93elobbqnmu7k4n2iotn92', 1292820308, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('lqogaglib21l035h6cp5336gr2', 1292820307, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('gvlpthaggnu376t2pak200qjb1', 1292820165, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('5n0df992fo5fp25u7icrau8ah7', 1292820307, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('m1gmiht3lisu17pgq8oh3rh2f7', 1292820307, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3uselhije9upkbd8hn0cfl29i0', 1292820164, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('0mbjgr3ke4svnr0fkbfce33e72', 1292820165, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('dedscstiqg15n596po632p9ss4', 1292820135, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('2ci8v3td00bbpm2l3acbgsg6g4', 1292820135, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('7e1dbl3cdvp9aks1o7e1914ft7', 1292820135, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('s0j21r7upklkn0r9i3o6jrht45', 1292820129, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('n3q0gtvoil89rkr6g3fq6jq531', 1292820134, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ge36mc7qp5tb3jggj8s88lv2f5', 1292820134, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('04h5040jct5dhac2nf67q4m0j6', 1292820129, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('v1ofmot4qb423t2tiinh0b9cf7', 1292820129, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('18fjafjo8bfela4gra0j5gb984', 1292820129, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('cndumu4k4h9eagi1tisaa2guu4', 1292820128, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('r5ko4cvgi59c85n7hgvvdo9eo6', 1292820128, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('sr18dk5rag4ct446pime7k8gr6', 1292820128, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('mm6um22hsil5isas0eihmma2v1', 1292820128, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('04u5vt4uk7ue3cleokq5pj34n5', 1292820128, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('usg718olmm6eg1ca68e1gfpjo3', 1292820128, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('9ugs7n6r5hmp94o9djbeihdep3', 1292820061, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('bh0j99g6ol9dpnbmtqjccbcpr0', 1292820098, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('j140qki03u7rifck9e569sa816', 1292820127, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('qtqc0hjf90ahuic59s91cd69k4', 1292820059, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('gllkug6ov2719ahulokrftvv21', 1292820054, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('4vpp0vt9etdrqn4illistkj2k2', 1292820054, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('i5okemehbhpsqirk4d1cfrrdc7', 1292820052, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('i1ve369fdcupnuvan84kmvu9n3', 1292820053, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('836mnaamjm87lvmaglqulvt1p0', 1292820052, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('97fufqcjf2fvdaoc0ig5fi6u42', 1292820052, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('k3obmgjvr5u9rt1ibbbpuq6ih3', 1292820052, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('c1luaatni60341r3a5b0bk8hn1', 1292820051, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('tmf902ql9jj3dkktg6aijot7r5', 1292820051, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('nqqldupeu9gurhrl56kdfm8r20', 1292820051, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('qc34pci3fj1dg8otrpparm2sb2', 1292820051, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('s16nt773ntfa3teg4ufotfntv3', 1292820051, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('du6flt0qbn44rpmeuhc8sgi1m3', 1292819973, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('40jrg4qgj8s6eg4ndcb0ectdt0', 1292820050, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1rq41vs5m6mkjrtdjc3bcehnt7', 1292820051, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('jj2er52da1qgnr746bjsk5q1n3', 1292819973, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('kkess86nj8l84v4og3u2fqlgk0', 1292819973, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ub4q4mj340ofn97tbdnsqp5kd0', 1292819973, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('94454ntbcoouot99nkesmpa686', 1292819972, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('74qbuas69uqrot9v4f8tscdng3', 1292819972, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('kmmea44nbcur9e3lpj7e35aiq5', 1292819973, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('eqnuanl0n9m9kkh3gjlb9c4pd7', 1292819846, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('l4gjiuqgm4j5bhi7g7cgmohkb6', 1292819847, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('boafvcbio869mbo8tc9nn04tk6', 1292819972, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('pa4sg2b1a6hshns9era9uptm96', 1292819825, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('0kuapuka3ad1vk5cu8ibgjb1m6', 1292819845, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('55suasjsi52ssu6lphqa8n92e3', 1292819822, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('siebdg3olu60ngmf8m2jiv5dm3', 1292819823, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('rf9ah6brchl5660m8qd3h19q17', 1292819821, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('8vd9uj6003r2ed6ncieq9fd8d6', 1292819821, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('8uefvh1ajdgkcnrcs55eseqht2', 1292819822, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('qdqurkft0vaf3afejpb343d0n6', 1292819821, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('fle75ueheoetv909c0g6uga7a0', 1292819821, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('o6bu89g3348dengt6f5iimj8p4', 1292819821, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('da888m4vj4gl65fcu3nuous943', 1292819493, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('q524o0btqg8svs63seji4ra900', 1292819493, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('qhg7vpk1o19d7e4hjfnpn3k8o2', 1292819820, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('eo81u9t3skadr3tj9egrj7q0m6', 1292819492, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('vd6jp6i1sopv6q4jcdgh9bumn5', 1292819493, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1qnpv3fb71q3b0hgnp3usg5c53', 1292819493, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('jim2k10t5q1eallptu6om16521', 1292819492, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('4487m6ie5qmm2rnoip7rapego3', 1292819492, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('g8g7lp1655pqngek8l5ud92ud3', 1292819492, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('47i6votisg69g6kg874df7fmo1', 1292819491, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('r2ikdu0h02itj27t1g6nuvg1v5', 1292819491, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('c748rnvajje5f4qeh9gv9stc45', 1292819492, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('4u430rqlkj5qasa89cj2k8h7v4', 1292819488, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('o1g0h2srbkq6lirhc64kcqr6q2', 1292819491, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('hds2tsedhs9ui389aqpfo7ug07', 1292819491, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('caqit67tkss9nogg0kt9nkk0v7', 1292819444, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('qf20d4vkhn95c5chmt5b2fi9q7', 1292819487, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('acltp2or3jjlg5g94ca82gtrn0', 1292819488, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1bv3tkafgm3il3a9jvv1nn9l12', 1292819401, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('i874ktpfg9le45no5etr572i01', 1292818179, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('hu9d0o01913j0dqphgkeavkv77', 1292818445, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('0pq76149htdmq5c3ficoe7o8d1', 1292819398, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('hrj5g70okh51cailoqjc757b42', 1292817973, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('23a5sakrrl6gi00j3af7vmot57', 1292817966, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('4tbogsslvqtnme5qrd6dhtvmu7', 1292817966, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('j6i23f25fglb5fgiuedp2mcm30', 1292817966, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('r2v0esej1fkhqtgrmq9kb8qp76', 1292817965, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('8kmpok73jsf84sq8gj0sbl4oh7', 1292817966, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('apl3tbkdgeto9lamnqrf6jvus0', 1292817966, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('u4qmpo3qr0of30emrsiv2aia76', 1292817965, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('52ktjuqpi9v4fem5iir4ivg6d5', 1292817965, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('448n5m5ibvrpb1eh070o58ofe5', 1292817965, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('lek7s67dv9agnmjt9c99dnpip7', 1292817963, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('b5vhm2na19pgt7e9fsb00gbu54', 1292817720, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('tipsguri9d2phhkpgvqq0bfbo0', 1292817723, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('n2radnc41qldgvi3766gsmja24', 1292817408, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('65nvjh3e9q68hkh2na5vtm9d14', 1292817405, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ohaaj90b1cf49c48kh8gts2825', 1292817029, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('fiq3591bn29hmeojtkj90q13p1', 1292817402, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('0pse7q12b9f1nu83ssli6r7q80', 1292817027, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('nc189s2ael3tni9llj9svkrg12', 1292816996, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('q10pi3h8vgfhk9rk60cf4aeks6', 1292816997, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('dej5kjkf3snskc0b7vtm8lft73', 1292816994, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('pn1cc8hljdqsasvf9enuour5a1', 1292816991, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('l9cs89ratjnd1b93bipo8m9k30', 1292816990, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2k9sn1tg4ail2k13r3ci8iu707', 1292816969, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('9e0b4r5ler4ap9986vcm25nl47', 1292816973, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6g60s8bk7snc6180sici8hlsi3', 1292816966, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('pramagivveenut8rdp1hciq6g7', 1292816869, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('rsjserk6k36donb7fmatt6pbn0', 1292816867, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('i41043cqha5u4mqsll6tl3v4r2', 1292816861, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('hbklv6g4srto4as89b5prq67m7', 1292816863, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ksmifgoj26an9hseq77n06lnf3', 1292816708, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('6i8mqmqshq0bhiil9h45f73s65', 1292816858, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ot2p2085m805jrn6ogmgehb3i0', 1292816703, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('vcjj01g58faac0i54n62uhhuq5', 1292816697, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('kepl6epi5m7mqk8aj6bmsrg762', 1292816683, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('s7hmsobkk1mk449eev0lapuhq7', 1292816672, 'language|s:7:"english";languages_id|s:1:"1";redirect_origin|a:2:{s:4:"page";s:13:"customers.php";s:3:"get";a:4:{s:12:"selected_box";s:9:"customers";s:4:"page";s:1:"1";s:3:"cID";s:0:"";s:6:"action";s:4:"edit";}}selected_box|s:13:"configuration";'),
('5d25j8u4n233cr4s4obpo20hb3', 1292816670, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('cc48fcetsjcq0uem44sqtoev33', 1292816536, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ih9c0nj155ssrt6d4ri5q88d05', 1292816537, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('754rsqivv53f3jdo900hhttd36', 1292816528, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('41e98il90qakha2hass6f6e5b5', 1292816531, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('nsjehfqrco6hjggmbchj1pb8f6', 1292816380, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('j7v989dukd1o012m43f3is87o7', 1292816378, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('6jpa9iv33dobhk4rj4p7tgsju5', 1292816342, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('9h0okmr0i1qu87s0s7vfv2bd04', 1292816375, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('hahq6denk3vmt1m26c97746j86', 1292830497, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('rvkmd3dd0rd90uag2o94egrd64', 1292816336, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('fv9kfjms833lam8mlqsi113756', 1292813947, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('9g5bivoemieuv1heqabdt086t6', 1292813944, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('1eq087qq75dp12nql364p7rhm5', 1292813801, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('fntuci3qq4v489rsgu3paheu85', 1292813779, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('kvkp722ennn1tqponm8tlqnba6', 1292813785, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ac0gngpa6e66bcl4ffrb6p13j1', 1292813775, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('4n8u4pb7mr0bgb7vco0c97ad74', 1292813648, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('r6aa93ssglglg2ipp03gs42621', 1292813645, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('grcn39orn5bobnsvffrf47k4n4', 1292813381, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('iohr4ftrjie1seuon5kqoc8o50', 1292813641, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('32habpkalquae8ruae6pq4vpm0', 1292813381, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('afcidn03dfa5ct9t1en8derjv0', 1292813381, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('0s7dgnp1fh1rdmm6cf34u5v5v0', 1292813381, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('uut2g5e90rk5bjcgagjtq66k83', 1292813369, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1r2oibvfqi3om4o2694k3hkqi0', 1292813380, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1kq3vl0mggmgih9ogh4bsn9qv2', 1292813320, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('prr4nf45p9cr03jlq3s8sp0122', 1292813327, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('l9q76r4q96udi9nl4g0n50e3k7', 1292813319, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('rfqihnrb6q7lo4r8itn9rjgsf3', 1292813316, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"product_info.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:11:"products_id";s:34:"?osCsid=l2h07tcu4sb3j2sfdgcvc1it57";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('i5uhfc95ccr7c7kpm9jn9j9ss2', 1292813306, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('2colht5dl78iebr35j3cmaran4', 1292813306, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('l2h07tcu4sb3j2sfdgcvc1it57', 1292813306, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3jbmgcskhhm5n1vr6147i5ttl0', 1292813305, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('hsp83mjpda744n5m6v20pqc6h6', 1292813306, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('0rbrdkvs8ecn98604n8is6p124', 1292813306, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('4n0j7c118c66hhr8tgq59cts95', 1292813303, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('kf7854r781gjschs8cm660q6v7', 1292813303, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('rr5ijd9vkrmnioq22us9c4lot5', 1292813304, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('74mdbu73fftbcpn1b2kmqrot87', 1292813304, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('gp6o4beoq9f2n1iem07u4vrji0', 1292910734, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:10:"logoff.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"gp6o4beoq9f2n1iem07u4vrji0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5vmbjumbvdpi52t85vsk7ibrt5', 1292811216, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('bkqvesg13n765i0n1iiuj0snf4', 1292811221, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('n3fu0lur1mogh1lav1bgei4b36', 1292809745, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('r0bfifbnbn9qpv8og85s4mfbi1', 1292811227, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ftl4n99mv86larlbc9jqnsi717', 1292811256, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('mkov8bmdd5orq162l99nti96l0', 1292811257, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('rpjkrtltv8iu85iukancgk3pa5', 1292811257, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('din79fe323q0h0qpinglih08v2', 1292811258, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('cvid37dd1mrqh6pdd146fbi7o5', 1292811258, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('efdodibr5ifujdsk3csaeptll3', 1292811259, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('fnasm8qserupmn0glbgubt5o56', 1292811259, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('cps1tc7cjc757n5pvqo7p0m563', 1292811259, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('2mkjscn4kibk7hqu21uv14eeh4', 1292811259, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('lod55c7k1if2f0kj3u0c1bnna4', 1292811287, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ig0n76d33qlgfrt9ud941sjhn3', 1292811287, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('fmvs89l8ah287d10illb9109f1', 1292811287, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('vveujn9s6tes55k2mm3ruoqbm3', 1292811288, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('018atg4af7ssgkt093reqem965', 1292811289, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('4tr94871r108c1hsipv74e1ul6', 1292811292, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('jalfsjt016gg5n74fahh54dkt0', 1292811326, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('el4er81gegtv3p7lul1q2qkjj2', 1292811326, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('r89h7p2lq3snt0b5cgpmvrcbb4', 1292811326, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('nagi3sjh6mpnqitschfpbtmlv1', 1292811327, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('k4iahl7evfm50qengehdlg9241', 1292811328, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('dc5lq3qd58bi8ing9h32dkku70', 1292811331, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('oemn7jg0d8bp6ukkrdpgjpje74', 1292811357, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('6modkd9p5fp626hjt73c0tgsf5', 1292811357, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('kikll3o1v8sdvgaa3tn1gin507', 1292811357, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('hkj8gku7qn47vqavlsgr764fb1', 1292811358, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('dhs22kpqvr4mo5ilmng8b9fc03', 1292811361, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('tn72q6qnqq2fkni2955vq4fas5', 1292811407, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('jnnq551tibvnl4a9jaok4hmo72', 1292811409, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('lb3m33chllrdtblc5cv348qht4', 1292811518, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('fotvqt14eo7bpep445bfqpck66', 1292811522, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('pfh2dro5noda1duomtp6gpubg0', 1292811522, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('klk8en8ijb3c7emncpqovkd8t2', 1292811523, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('dpkm66eud9tng633uv7f3tsls2', 1292811523, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('hnb5flkpjefn227pt0e7t1vis4', 1292811523, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('arc3sic60nu9tl96ier3gahud7', 1292811524, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('u8iphoia05im5jo5q77cfjfbe2', 1292811524, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('oebjen5rbbhfooqh4j2tup2im7', 1292811524, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('pbrikd6k0a1mq9iv6s5si3af42', 1292811525, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('jb9hunfblmi59j4f34o2trckb6', 1292811525, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3n6ghctn9pmknr8ftqu6nojku2', 1292811526, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('bafkiguep9pa4h9brvhl2qlai1', 1292811527, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"product_info.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:11:"products_id";s:34:"?osCsid=3n6ghctn9pmknr8ftqu6nojku2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('9ig3ffk5m87hbj54o9l6n7m3v3', 1292811528, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('7mqudhhfa8c4npmfe64jp8vup1', 1292811879, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('25oevidraac3insljk78d5m9r7', 1292811882, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}');
INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('fpsopc1fn3olstt8g86v82opr2', 1292811884, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('tgrqv18lvrsdkoia8pb8sehql4', 1292812029, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('j5qpvqkpg3m9dfigrms2fid585', 1292812031, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('mtsp407f5d5t0j99cofjd8e8l4', 1292812034, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('cqq1i7kqnlq6sn4koqcqe1vme0', 1292812034, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('85bdqboksdi0df9pojk32kmr65', 1292812034, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('0fb68e4k0gh2ognpcip3f7ja40', 1292812034, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('64bmqp2e17n94dkrg47mt3f5m1', 1292812035, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('6t5i8qljpul5ugnn0b5vlnbnh2', 1292812035, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('lr601tlir3lmj4mk2g8ch5son4', 1292812035, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ti47op900febvgcipmen39t7p7', 1292812035, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('4kv0i2athb48rd1eg8mlu3mge6', 1292812035, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('a2s88tmafaprk422deja2qs8m4', 1292812036, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('el8ckgvaifacrroni25qafad76', 1292812036, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('10smce5m56e5nr631pl9ffof14', 1292812036, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('sp19d5mbncuvgj4826vft1chf2', 1292812036, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('5klh8l050pqkhehlq8pnmgab32', 1292812036, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('b5ertcofq6qbr68lfvf6a2j3i4', 1292812037, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('7k9n7vi7q617ts3n0eafsvpss4', 1292812037, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('i5himsem2b22h4jul2li31m0s3', 1292812037, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('v4j2hea5h82hr650hgbi6nu0u7', 1292812038, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('fgllggl0hse3sa9pe374hjbip5', 1292812038, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ppsse72s4frg5doaq2hab5o787', 1292812038, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('hft0a0ajfuk8bf1ujael90hcs6', 1292812039, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('28mqo0rod7t0siequ6q9kgi357', 1292812039, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('8l32a1ug75omuic7uq3403q3r6', 1292812039, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('jpcefc2eea3er5l240b527jpc1', 1292812039, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('03s7qbjrqtoch87s7v3larjhk0', 1292812039, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('7a124h19dfjl73382baegu9vl1', 1292812039, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('vlsgj8mco5pst5i58bvt9458l1', 1292812040, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3gnne9virp91r38l637q3f4jk0', 1292812040, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('liijf06cpgcnrdartf4h714hs3', 1292812040, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('mnhnlh6h6ehq0t3eht1rk1e6n2', 1292812041, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('69pp1nf3ti0uh82hvk2b98qr04', 1292812041, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3sae0n2bsq7bevmjpqdain7990', 1292812041, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('t3no703m98c0qd0oabso9jl8a7', 1292812041, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('o83bijo63eum598kudnb60mdd6', 1292812042, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('9gd50ph3v0755vf74god9nq6p3', 1292812042, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('mhc21ekaa2rajgt3svfo02e6r0', 1292812042, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('cqp4pqbtgia98b0u895nr7s3u5', 1292812042, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('qk8s858gkvqn8pii9g8hch5106', 1292812043, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('p3kiiavps3si8ua1vit4t5p801', 1292812047, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('femd82o8gcb1sq3vdtlts9fmh5', 1292812116, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('jtj7tb5vgdoq3t0pla0tpmqg60', 1292812116, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ovfe8khvee99ppgsdid5pt58k0', 1292812120, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('dkqgpiu3ne8gq9nk4rmt1ehe04', 1292812123, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('gevkmhclbba06eoc5mo25v7p80', 1292812245, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('l7778tlnt87c27nttmr1r2b4r0', 1292812254, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1tua1bvtc31sb53p29dlssimj1', 1292812254, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('731taepolnpclh4qlrobl3r0n5', 1292812255, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('nmqnnl86d7fqbuqfje04blo7k4', 1292812269, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ln6m1mvutedlcd1fu4he7gbph4', 1292812272, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('j7oehnul7ieebv26fscmtfscf0', 1292812471, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6huuibb69g9fthu81tlnrn41c1', 1292812473, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1lb3v4ccd76kit6kuepjtgt700', 1292812526, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('14u4geui3pce88473g9odur9q7', 1292812527, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('trg27ugd30i01samljjmiect04', 1292812527, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('5fki3q9d96kffmaqavspnedv11', 1292812528, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('aha0cqblhs841ugsnnelhesok1', 1292812531, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('v69v4lq7qa7sbqm7ia6mp2frk0', 1292812533, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('t57hg9f3lj12fr3mtn72k4gcm7', 1292812536, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3u3d5mmdv4b0qm1qun8sbihbt3', 1292812538, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('gq21namvcadsj7na1c2varkt64', 1292812726, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('q6i4sq2ndqi31k0f4qbk2f53h7', 1292812728, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('selffc6d4mkbqu1cf271cudkq2', 1292812729, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('p1vttnb7798726lkc25mmor152', 1292812729, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('jaqebjqrvrd7e24pboh5i8r736', 1292812729, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('g4jmrs81mfa2ke9ouqdmsgf8h0', 1292812729, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('4j50l0boerdbearpt796bg1g93', 1292812729, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1kdoje2p4h5k31b9vpsacdgba1', 1292812730, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('tg7918sico7qsa7m3426k16921', 1292812730, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('162o42ijbfcmprqirotema11q1', 1292812730, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('n7f1qmp70j363s5qnb7guguil5', 1292812750, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3trp01uink09frbdmsupbnfco0', 1292812750, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('iegofhnqm4r77c5b3b6pqmvbo4', 1292812750, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('nuapijpgtmvblh4nn1d5nb7200', 1292812750, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('fhifhs5tflrgvbaav2ktqeavb4', 1292812751, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('kbbhnkgg7uesievlmvhh8iijk4', 1292812751, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('6obing08g0p20o909b42uu8d86', 1292812751, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('njcn5v3eio4qf0uhtrjlcmclr5', 1292812751, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('9rl93kdi6qcc65datd20r5mao5', 1292812752, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('mbeh5uj8d9g7gnm6ghsbp5ocj5', 1292812752, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('93n10vd1q71i1818ev2ha6hk56', 1292812752, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('g32ddd9t4835rfkgk3j5vfn9p0', 1292812752, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('s4vt7o3kn179317fq1619r6an1', 1292812753, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('s4a5a9s7b1t70k0o4e6c02jc16', 1292812753, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('pda8qrickhjbppkfpj355a0gl0', 1292812753, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('celmhrumhmb9j79boq7gkdcof7', 1292812753, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('6fg3um2444r309c7sfo6iufhf4', 1292812754, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('gbejvsighf65sps3rf0cvmj9g2', 1292812754, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('c6c60mirvchem8cl8ndsltjn65', 1292812754, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('64gmujitnlcmvktu17ki6ij514', 1292812754, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ip7d2srafjruanivdt7jt9ir35', 1292812754, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('d9h45lnmgo7da4js727ti4tjo2', 1292812754, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('leuuih6go128hn34v6jdrmmlm1', 1292812755, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('7ogoqod1cesi2lm4ogfkqltot4', 1292812755, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ii16phgriblg94557vpqsclgv4', 1292812755, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('rns9c9j08v84suufo9l3gbkkb7', 1292812755, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('cb4nra63o0dmv1tcfkd4gf9vc1', 1292812755, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('kte0s9mfvg8j02tl3mkpct18i1', 1292812756, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('02fs6qouga0gsec5rlbnbpbk23', 1292812756, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('udlslih8k9f0frpppejbgbugq5', 1292812756, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('4j30g435h5cc6erj4qrqtg09b0', 1292812757, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('sa9gldopopi8g9dv2fssqd3pm5', 1292812760, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ssa8mvdul7s9e1njj9t4nboq57', 1292812761, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('991m1ccm06hpvf5p8gb38te6u1', 1292812761, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('h0sa1kd1dljeus2ur265qkqn67', 1292812761, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('t9occsf298sqn7rcndhm58ch85', 1292812761, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('f5nendcrcu0t9m8qtola215pj4', 1292812761, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('8uammj6ma23dt7r3ke5e55ke00', 1292812762, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('0f5ag3ktlbf4tfrnm1bc693tg5', 1292812762, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('pg26o55pi3iphcdtj65vbd7q93', 1292812762, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('30hnj2sgn510ani913lmaln8b5', 1292812763, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('9mcj6a4cve756t210hugqrjug5', 1292812770, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('a7oijcd4puir40ihj6vfkfnbu4', 1292812917, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('lblmp140gba2eg261fmgs3rls1', 1292812918, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('os023k5vo08qlbuee8k70q15k3', 1292812919, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ae46jkiotgbvhohsv27uijs037', 1292812919, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('k3pahbsqqniubl5tunlsqmru26', 1292812920, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ctj1610l71f6mfetfhfb5enk00', 1292812920, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('mh5lnlgb6l6nes84ooo9oh5f83', 1292812920, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('nupbtffvh2ebn3p9a8p7q4pa80', 1292812921, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('6c68hol6nk792h57bbnig8a1n0', 1292812921, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('jr96du0obsp3pqig6c2ueil0q7', 1292812921, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('2ilubeflbd39p6jcpkj7h59l01', 1292812922, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('t6j8nsiu4801sg1e8ae3fma1v5', 1292812922, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('jtsq5q2aa7p6u6hqmguabbjbv2', 1292812922, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('p3oro5irhpreip63u476kmj3l3', 1292812923, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('8vojpnbv73e7eneprgh3b5kor3', 1292812923, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('87isepftv7q8unfpv07p0rlt25', 1292812924, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('lab77vjbn7srq5e3h38snhfu10', 1292812924, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('vnuo9f8p152vni75h5di72clv7', 1292812924, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('k4p4b7vb9gf7slj9mmeucb6bm6', 1292812925, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('5lleeo2qnrb0qaa962vojmc0k0', 1292812925, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('tqgjh83dk6r227gpkqu7t6toe5', 1292812925, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('8m5e0v2agtn1bcfuhffh0os672', 1292812929, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1hq6ttk00pnnha4ln1t0bgto04', 1292812929, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('fjv0jh69q5g71got6t2mq81cd5', 1292812929, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('u37e1psqnkr1snis4bluj8jal0', 1292812930, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3sgd4l2v6dqfeqapgikkr6sq65', 1292812930, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('jm4t2rs4dd28ruqc4ruima9e51', 1292812930, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('g6oglmemr0fkeg6quvn9jug2g3', 1292812930, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('p4cu3vrgd8he6ceedif2cocru4', 1292812931, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('5ap2d7ke7brm9toqe15e14sif3', 1292812931, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('gj3llo66j7p7eeet3e1q6107m0', 1292812931, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('9tg9i624s6jnuqq90c0e4a4624', 1292812932, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('68815vp6q4mucl0gie2boq3qi6', 1292812932, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3bftfhvtomr09lgvojrej6u4o2', 1292812932, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ebm2m6vv16prcc86b5hdm3le87', 1292812932, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('992janj92bvckdhvkujs99ulu4', 1292812932, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1vfived38tfudonq4ue39370q0', 1292812933, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('vqj61nlcvnf177bvedr4oa3i52', 1292812933, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('72ep3a1canf0h5sbauno6600p3', 1292812933, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('i6rr6mkkrl88l7pf7jtr58i2n5', 1292812933, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('apid44pafi2md3cb4k5bvea811', 1292812933, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('cma31r9pmrscjmrnkcie21ddu5', 1292812934, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('fih71ged38snk8867ffl5v38h4', 1292812934, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('9egioo619ft257uk1732u8okb0', 1292812934, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('amfapv80935bi500jum5navbr2', 1292812934, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('htqu1hau37jcf7alr61kn4k2d0', 1292812934, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ufsoo15mu5dekh2ur7ci3t6q16', 1292812935, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('mlug733irnl7ni7rk363hpmur3', 1292812935, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('190hm05ek97f8i32f8klghh461', 1292813094, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('c6am9ju83duopf6mt9od27tku2', 1292813302, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ib8gt4iulvaijqdcu1hldm8hl3', 1292578761, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('n1uedki9sgnm66q2renlktcf05', 1292578776, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2urt8fl068mqotho1a544l2ue0', 1292905199, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('hicvdg74seqsb1bq2htctesvo1', 1292905208, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"hicvdg74seqsb1bq2htctesvo1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('tgrhjsnmgqn8umd618463c06t1', 1292905226, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('hgoegsd9kv8ocsgccokfv9gal2', 1292905234, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"hgoegsd9kv8ocsgccokfv9gal2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('0ufg2f3akv128h7bq0g30vk7j2', 1292905250, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('f7cq92k7mgpm5jj7fo5v25fb95', 1292905261, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('an2mdi855rm8u2v0kuqd57vhu3', 1292905270, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"an2mdi855rm8u2v0kuqd57vhu3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('fe2g67gt63q42e8r5kl7nf3s17', 1292905416, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:239:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. ";s:10:"room_price";s:2:"79";s:6:"osCsid";s:26:"fe2g67gt63q42e8r5kl7nf3s17";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('f4aisvq0h8io7quk9omddv2392', 1292905421, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('k1om39gibjlj36qcmmsjfd57k4', 1292905426, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:10:"logoff.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"k1om39gibjlj36qcmmsjfd57k4";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('dec7hr9393bim89hgvei60b684', 1292905463, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"dec7hr9393bim89hgvei60b684";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('m0kcd3vrn2rvdkrumsddq6gu57', 1292905448, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('3hcgtqbrvohf7fv8agfl0r53q7', 1292905461, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"roomid";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('eface71rt5hamo34ln02q2qib1', 1292905468, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('h055mrv10prbreearq0u76kmd4', 1292905571, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('i1e34rvbnmfhctvqus0km4ugh5', 1292905578, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"i1e34rvbnmfhctvqus0km4ugh5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('r7i5vppc6qgp1rs7kru9sbmul5', 1292905584, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2lhpgt9qatjnc4tke9ifehcqu0', 1292905892, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('9pibbagq3a6o8quic0sh12b6r0', 1292905898, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"9pibbagq3a6o8quic0sh12b6r0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('1f5vmtuoo0ib7o027lv7emf0n3', 1292905902, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ahrd4v4mhulgahrie5acgf16s5', 1292905915, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"2";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:5:{s:10:"room_image";s:10:"Phong1.jpg";s:16:"room_description";s:285:"Spacious room of  48 square meter wooden floor room overlooking greenery mountain view. 32 inch LCD TV shower/ bath tub/ DVD player/ complimentary wireless internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities and balcony. Includes BREAKFAST, LUNCH ";s:7:"DINNER_";s:0:"";s:10:"room_price";s:2:"90";s:6:"osCsid";s:26:"ahrd4v4mhulgahrie5acgf16s5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('p7rehbd3cc6qjgccre4bsq8rf3', 1292905918, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('rqm5uv1f5qc6bolp044gqvo4u5', 1292905921, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('q3n51o4n1d1ekl29sc07go36l5', 1292906084, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"q3n51o4n1d1ekl29sc07go36l5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('t9sik0b2b13nkm6famtj258pr4', 1292906088, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('g346ftg6gn8u5jc1rcd1a171i2', 1292906116, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"g346ftg6gn8u5jc1rcd1a171i2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('95fetqdfhiop8265dk22a19br3', 1292906121, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('romi5c2rq5bslj0a2hme0v8ps1', 1292906720, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('m7pkc8vpm6piaai9qc2sth4k42', 1292906726, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"m7pkc8vpm6piaai9qc2sth4k42";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_first_name|s:4:"nhan";customer_id|s:2:"13";'),
('n7k6f7ag5d73ge786dubbced42', 1292906729, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('f0j45d63781ce0rfk9ekkem5n5', 1292906766, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"f0j45d63781ce0rfk9ekkem5n5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('9gbnamuo8jn5eu2vhv13m2b872', 1292906784, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"9gbnamuo8jn5eu2vhv13m2b872";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_first_name|s:4:"nhan";customer_id|s:2:"13";'),
('o8qto3tb12os2je12511httbu4', 1292906789, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('f78hnh2g71ok0a95hvmfga44r1', 1292907679, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('sdbs2cdvqpb4n6p23m1b07s4n5', 1292907685, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|N;customer_first_name|N;'),
('guec5684aouffrjf05dki7c845', 1292907697, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"guec5684aouffrjf05dki7c845";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('kjhnugffim42be7n6epsoe41i7', 1292907702, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|N;customer_first_name|N;'),
('eaim8l9hj69610ca5qkobkt6m6', 1292907925, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"eaim8l9hj69610ca5qkobkt6m6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('j70rkskpcaovfaae62kq2t2ch2', 1292907929, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('sq1bliee8mr74ajngnjlqudrt6', 1292908530, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"sq1bliee8mr74ajngnjlqudrt6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}login|s:4:"nhan";'),
('8ichjc2cetpt2c4iol21nkp2k6', 1292908544, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('rtna6hi8e5oktrr5v1tmmi4l20', 1292908589, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('gfhtoce9gb7o7j61icl5o6q3m3', 1292908594, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"gfhtoce9gb7o7j61icl5o6q3m3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}login|s:4:"nhan";');
INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('c8cg355gbuba4gklk8rvqc9qq2', 1292908599, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('lv7n2s89arp033d1i4fps7cem1', 1292910751, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2kn7bprahipd0ia36j1l0lri47', 1292910783, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"2kn7bprahipd0ia36j1l0lri47";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('97c4et22u5p3b1m7p82mgh8se4', 1292910786, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('lni3osr62qs7sccchpp43h0or1', 1292915220, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('hlrse64jl9vtc7h3cail79i2c0', 1292915229, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"hlrse64jl9vtc7h3cail79i2c0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login|s:19:"customer_first_name";'),
('6pn26giouu87uo8kup5k5fq567', 1292915233, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('585jekvqt6q1ddirfv8uklpvi6', 1292915335, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('p50ckth25qrif41h3f212umje2', 1292915364, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"p50ckth25qrif41h3f212umje2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login|s:19:"customer_first_name";'),
('pjoqj5pam6fh1f4bpr12guf292', 1292915376, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('17grkrgn2qit8ulnaeqekk3pq0', 1292915386, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"17grkrgn2qit8ulnaeqekk3pq0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login|s:19:"customer_first_name";'),
('aslbnitphptm42mnc7l1fv77m4', 1292915392, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('prc1dv18ssmhq5n0m8fl7r6mo6', 1292916817, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"prc1dv18ssmhq5n0m8fl7r6mo6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login|s:19:"customer_first_name";'),
('4jrnu83d3cv4tnfrftfo14dgv5', 1292916824, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ntfi04kef4gh8jf8nkqld542g2', 1292917482, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('05gudr35oitniu8ldse7376o63', 1292917488, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"05gudr35oitniu8ldse7376o63";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:19:"customer_first_name";'),
('534i2q2lnbckh451usnkem31r0', 1292917492, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mqik0jbl10cob880vo7lk5ban5', 1292917556, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6r4et9mas6qfjgmo7c1903sh51', 1292917561, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"6r4et9mas6qfjgmo7c1903sh51";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:19:"customer_first_name";'),
('pocmrtoj3h3d98nh4pqjnvlvk7', 1292917564, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qak53m4uhqng6ouo1vprva2ba2', 1292917649, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('55brmb2bhpjbs2ii12oqj23ah2', 1292917654, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qck544pqubni9jd9eitv3ah277', 1292917660, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"qck544pqubni9jd9eitv3ah277";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:19:"customer_first_name";'),
('r8vd8t4sa7gj58iud9nlgt38n2', 1292917663, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('tsts4nsgm1ptc5v6ffshvc8884', 1292917814, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('rmi1526q9inru1j8gpbmn7oae3', 1292917819, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"rmi1526q9inru1j8gpbmn7oae3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:19:"customer_first_name";'),
('e2k9nq4tl8mcmphu8ttab90o33', 1292917822, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('tq2ucgtstfpkb1n5c6qt34fmd0', 1292917831, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"tq2ucgtstfpkb1n5c6qt34fmd0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:19:"customer_first_name";'),
('mbs20p6anasavr67c3tvdp0v33', 1292917834, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('29lehiusb1eg58r1huukar7tm7', 1292918097, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:239:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. ";s:10:"room_price";s:2:"79";s:6:"osCsid";s:26:"29lehiusb1eg58r1huukar7tm7";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('9njqpinfjdkbmdsngv2361n3l0', 1292918129, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7i1ali3mb9f0idnbvorb110153', 1292918156, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"2";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:10:"room_image";s:10:"Phong1.jpg";s:6:"osCsid";s:26:"7i1ali3mb9f0idnbvorb110153";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ptbbsp2kssnesd4c65s2tkfh40', 1292918165, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('jdh72ct2vj7no4aqlp5fmc4o77', 1292981718, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:17:"shopping_cart.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:3:{s:16:"manufacturers_id";s:1:"9";s:4:"sort";s:2:"2a";s:6:"osCsid";s:26:"jdh72ct2vj7no4aqlp5fmc4o77";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7lj90crece13f1u0kn7paoc4u7', 1292918427, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"7lj90crece13f1u0kn7paoc4u7";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:19:"customer_first_name";'),
('qaro7qqgut96b7kup6no5cvml3', 1292982034, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"qaro7qqgut96b7kup6no5cvml3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:19:"customer_first_name";'),
('2s9voe3h9fhvn8c4l3f1240u41', 1292982024, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('aprak0b57pbv8789v2j6sr51h4', 1292918614, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qkj273euk6pft2002khsuf2aq6', 1292918619, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"qkj273euk6pft2002khsuf2aq6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:19:"customer_first_name";'),
('7utnkuvqrasteg5jvud7hhlrs5', 1292918622, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2a2k9qiu421s128unmuhitfpl7', 1292923528, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:239:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. ";s:10:"room_price";s:2:"79";s:6:"osCsid";s:26:"2a2k9qiu421s128unmuhitfpl7";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('of81m0d4e2q4tnhtsg8126in41', 1292924450, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('s9rr4cnmuficc35hb946hv2lr1', 1292924455, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('rqufquu0o6ojcavjnqpcd0rgj2', 1292924485, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('oddd2h6a4msspf7c0msbk2ocm6', 1292924488, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5f5i56oqkaij1u3lmhtb1dprg6', 1292924550, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ugkdi3qjq463d1t1e80vtloc14', 1292924553, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ngmg2diqn3cb9708m31m5pvl36', 1292924558, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2lflgt90i1sgv2au3jrrerllp6', 1292924577, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('oo4pim35br6g8bhi1oolp61pt6', 1292924580, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('l53rotogboqd8smhh9t9dhf417', 1292924583, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('makihfror5rvl72ic6le1oim30', 1292924660, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mrkg9oh01usf3vftkojldhh4i3', 1292924667, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('bl6hj6t42d88eo3okrgku28be5', 1292924670, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('96ijeab93ij5rgcn38t5b0hga0', 1292924848, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('r4m5cou02mkgc5aafdrtd01nu7', 1292924865, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('s86227cbhdrmvs6nd9iper4f24', 1292924888, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('t5eo6u6jrfgjj5lsruoplua3i7', 1292924896, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('iqdrfmkssmj6vtbsrqing628e4', 1292924896, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mrqv935dqev8g77k7kklraeqg2', 1292924896, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('kkmtmc3nvj5kd9844el2r6esa0', 1292924897, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('43gr9m1evboivbg8ruu3arc547', 1292925759, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:239:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. ";s:10:"room_price";s:2:"79";s:6:"osCsid";s:26:"43gr9m1evboivbg8ruu3arc547";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7budtodhpij9cc4mnul7qj93l6', 1292928033, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('8obop6r91e2ik4pj54tc3cp2o0', 1292928085, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('tv896q5jjkfhfdoe1rcdkqv2r5', 1292981716, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('32ldqsp551m6iljj9v2mrv69d5', 1292982037, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7etrkpg3hpqkmcnva89loqlan1', 1292982080, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('q0sg27vphbc2bukgsv1lf643d3', 1292982080, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('akf4iafgs4je11v7rejob4if13', 1292982080, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('fkbs7399omi1fbp51nrbhl2r30', 1292982086, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"fkbs7399omi1fbp51nrbhl2r30";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:19:"customer_first_name";'),
('nd699a394cnaeo6ppn6i997fc1', 1292982093, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('vh1huibbvmtegb2n4bc8gji1g4', 1292982175, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5n0m3hivh9tavr62raqgrvmre6', 1292982181, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"5n0m3hivh9tavr62raqgrvmre6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:4:"nhan";'),
('av84e4i9a2soq8d7el08jicfk2', 1292982184, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mnv049grm0r3gerglij3p8l0a5', 1292982316, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:4:"nhan";'),
('voiimfsp1j0um814kl4g0d5us2', 1292982319, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('tp9dn177l0ql2ibnm29chdbts5', 1292982362, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:4:"nhan";'),
('jvj4haq0792dj0jfpm1ee305a7', 1292982364, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('4ob48pl26h04pel8h178eq1vh0', 1292982411, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7u41eifca2pd5bc17q77j56ed0', 1292982415, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"7u41eifca2pd5bc17q77j56ed0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:4:"nhan";'),
('ih2gfl11isq8epd7dae556mib0', 1292982418, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('8d9guvt2v99cpv1ng619vbm5t5', 1292982463, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('jkalnk9mpnodo7mf4el04449o0', 1292982467, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"jkalnk9mpnodo7mf4el04449o0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:4:"nhan";'),
('2mi7h4mka76e0bf3p507q0blr2', 1292982470, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('3oib8u0sgf6ojrc7292a347ov6', 1292982511, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6ne8fkcikl4duklnqihu2kah15', 1292982515, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"6ne8fkcikl4duklnqihu2kah15";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:4:"nhan";'),
('1q3p8stphjtrl5kdlqosvtpjv4', 1292982518, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('l2vpa86s151l2pojdh7e8htil5', 1292982556, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('k3b30epskg28iav2cfit1ua1i6', 1292982596, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"k3b30epskg28iav2cfit1ua1i6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|N;customer_first_name|N;login23|N;'),
('1g6ecu5fop3io1re6squ0ulto5', 1292982605, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"1g6ecu5fop3io1re6squ0ulto5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|N;customer_first_name|N;login23|N;'),
('pfh3s7iuqbj57csbl0edpv6s02', 1292982920, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"pfh3s7iuqbj57csbl0edpv6s02";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|N;'),
('t7dvsmakcospjeffr0vfgi4i01', 1292982655, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"t7dvsmakcospjeffr0vfgi4i01";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:4:"nhan";'),
('etilhd6p6kssq3r63tcl5b2lf3', 1292982659, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('kam26739uio7a8to6h0o184nc5', 1292982677, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('c1b8d1fgqi7l3nr5enbbdkjf76', 1292982684, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}');
INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('e3rc8mnb9bcgeo7albiu0u3a07', 1292982931, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:4:"nhan";'),
('l0oavnpadm9l2kctkigqkead03', 1292982935, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('vuhjef03vr22jkgihgfvl12753', 1292983082, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('vq0hgsu3g4dvu6lrmc94f3emg3', 1292983083, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('a80r04j5ckfojckm6cno8rj1k0', 1292983083, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7djr0i5g5jojtcavabmjgbmn13', 1292983083, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('s3iumkn990oq6hs079h5fdqd63', 1292983088, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}'),
('mflhmc2jpraoonpfn8qanovr90', 1292983095, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}'),
('fbcf46o9ngmgj0mbrqgs6heob3', 1292983106, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}'),
('iciubvhq17nl0om4hdo8nbugr2', 1292983112, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"iciubvhq17nl0om4hdo8nbugr2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:4:"nhan";'),
('t1mg7t73gp7q49gf08eta8p0l3', 1292983116, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('saiobuforumm0tei6m9g0odlj0', 1292983169, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('kvj0ta0qhsrosnlha90q4fta30', 1292983169, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('av0ji4vg6bo7ct9uo5j3an48s3', 1292983175, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"av0ji4vg6bo7ct9uo5j3an48s3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('g88se02idnak4vf0mqondb32p2', 1292983177, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5r62rn74gmi5uq7phh1keh8ge0', 1292983207, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2ketoq7a65se9t7tahehjrg0j3', 1292983207, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2hdvlp2jsvlr02aao2g6ds3b50', 1292983207, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('r79dt7f1dkhsfmkeo836qgj8m1', 1292983216, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"r79dt7f1dkhsfmkeo836qgj8m1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('e0ktl70aopoevds9cmmla245e5', 1292983213, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qajvpc1lsgbuke2bbd5pagb420', 1292983223, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('m7ktv2l6d965gnrogiftqqas25', 1292983245, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"m7ktv2l6d965gnrogiftqqas25";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('7r472pu16ekmoupg752l0fflm0', 1292983249, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2lh4nbauul3dorgm0hlmd4qb71', 1292983309, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('u6d5qe2sl4banshg854sf8ang4', 1292983309, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('616t9kvppveduvjbmv2da6do20', 1292983309, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('f9btklenqlh7ostdb2rs3o2eu5', 1292983316, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"f9btklenqlh7ostdb2rs3o2eu5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('a64ufgstsfkj8tukpdt3jj6nj0', 1292983319, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('as4vmc6k8lt02v99pf5beql9l0', 1292983527, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"as4vmc6k8lt02v99pf5beql9l0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('it74151i7vrge8a9si626duc35', 1292983530, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('upevgn2bo364l8lth24jaa7ks1', 1292984097, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:239:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. ";s:10:"room_price";s:2:"79";s:6:"osCsid";s:26:"upevgn2bo364l8lth24jaa7ks1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('self2t6o897n8tbvhvp50o94r3', 1292984118, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('u653jnk23b4ij70negis24h340', 1292984121, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('caqnnec7v3n1eqivuctrps2nf4', 1292984982, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('e8l9va6gv2ma7db7ni98l4bnk7', 1292984983, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('jsras9r6l456ifkmevohokfnb4', 1292984985, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"login.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('esmju3d2v6o35f3scjgh6vtlt5', 1292984989, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('djc5kdjbnb3rvrkmbgb6q5h6d7', 1292984996, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"login.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('1g97fti8opkb7v05o3pismjt42', 1292984998, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('u9lqc0vfes5me39e0434rbor93', 1292985023, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('bsfft1t33os31bo6ia8r1ohpt2', 1292985025, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"login.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('vr7j4f0r1dunu2jbaqnl5nimd7', 1292985027, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ubqvldibr7qn48s5pvv4c3d042', 1292985244, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"ubqvldibr7qn48s5pvv4c3d042";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('qin19pdo0e33e56vvou6vlur24', 1292985246, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('1ot51vo2mkhaj33t7kvs8l1e64', 1292985651, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('va8tijrh8h7lchao0j9t2ia597', 1292985651, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('pmb53k7qh4fvasvclbmf5fq675', 1292985652, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2ao3pp2fgka9f2ahansudls3h4', 1292985658, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"2ao3pp2fgka9f2ahansudls3h4";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('hti7slmgfodonjr1lsdopn9mj0', 1292985659, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ch0moashpif2lk3sdvmfmm6ju7', 1292985790, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('kfal120jsl9mpevkr5or38jen5', 1292985790, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('uu6pm8vdkh7q185sunl1kqlpr4', 1292985791, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('v5nb3ni7omsrk3daioi669e9v2', 1292985804, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('tsm7iub49sp8r3qcgcicums914', 1292985811, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6s0akemics0otqvggj6q1mn230', 1292985818, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('tjg9age1ntg7cjsh14mk9tumn2', 1292985853, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('s5lbuscj32u71uv76kdu4fe0n2', 1292985858, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"s5lbuscj32u71uv76kdu4fe0n2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('kl0eutfdm3qfej48eldh2mut61', 1292985861, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('f3hjtteg5jco479uiodcrub2v7', 1292985957, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('60q6eqkvjn3cjl2b6rp1u48g03', 1292985979, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:22:"thanhnhan_kg@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"60q6eqkvjn3cjl2b6rp1u48g03";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:1:"9";customer_first_name|s:7:"vo nhan";'),
('o1f4l96cl6asp1r6o0fuaest26', 1292986164, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mm8aicd3mmi62o6c8rvdjpetl7', 1292986164, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mk5vnb8hkkmetdnhgqfhg4gtl4', 1292986164, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('u1cqi388cvdq48qkbobfm2t2f0', 1292986169, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"u1cqi388cvdq48qkbobfm2t2f0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('nro0fnickhbl57jmbvkj6k20j0', 1292986171, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ai1fqfft200kbhm55kco7pjks3', 1292986268, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('smfk37s8u2p31qcu21c7kppf96', 1292986268, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('id3q9n4kjd860819tfu3pe7gj1', 1292986269, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('90dni2r5kn88t3cvnt2c7u4gb7', 1292986269, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('bcsqhjd3c9sinib9mlpfdc2eq7', 1292986310, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('vti0j59evjn8rts1kbguqhmv91', 1292986310, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('9ds3gf1k4ht1j9or1b2s7q9s01', 1292986310, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('3tk1fufteg06o2iu1fd1nctga3', 1292986315, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"3tk1fufteg06o2iu1fd1nctga3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('v58rhtac2gs6laegncldca7c56', 1292986318, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('p47aatbacno1c8dqvp6781cm95', 1292986406, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('u6h4bb5q98k58rctmtkfcm3dc7', 1292986406, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('i94nma5lpksuga2r0mrv8ca6m6', 1292986406, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qe07o3q223spk7s6dg18qbjev1', 1292986440, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"qe07o3q223spk7s6dg18qbjev1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:12:"customers_id";'),
('n6tb5jcknjd1rs9h0o25gbq050', 1292986460, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"n6tb5jcknjd1rs9h0o25gbq050";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|N;'),
('ocn90qv7d7k0k30v434rqpoeh6', 1292986515, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"ocn90qv7d7k0k30v434rqpoeh6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|N;'),
('s5mvb3gvoolcb040bfsa8a3qo1', 1292986520, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"s5mvb3gvoolcb040bfsa8a3qo1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:2:"13";'),
('oj4sp1e3m9143asl16djr1t1k6', 1292986529, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ntd89fe82ou1vom92e2vjv9ie5', 1292986765, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6omm4i1dnf4kmnnj15kbfrrb73', 1292986765, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('r7i64pa8foqcc52p4rmed26tq3', 1292986765, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mk58hesej7v9hvbqpl8m85pje3', 1292986771, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"mk58hesej7v9hvbqpl8m85pje3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:2:"13";'),
('g7c6c1dnv3igbf34lioqob00g6', 1292986774, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('pul5kr2qm40amja4e60jcenjj1', 1292986896, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('dhlrd8gjfapve8kvnrkq6j8fh3', 1292987453, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"dhlrd8gjfapve8kvnrkq6j8fh3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:2:"13";'),
('k0j8e1nqusoe17c7u5lgk4o145', 1292987456, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('vp93tkjvk5stbttngaeiprk1j6', 1292987462, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"vp93tkjvk5stbttngaeiprk1j6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:2:"13";'),
('pvdaj3sh3rd7rv4h6ioad65s11', 1292987465, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('eivj46n1sbogdtnh1it1c9nd14', 1292987482, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('o26jfa68dibkm2868de5p8q5p6', 1292987489, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"o26jfa68dibkm2868de5p8q5p6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('h5kdpfgmalf2pf5tt40sv5gc27', 1292987516, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"h5kdpfgmalf2pf5tt40sv5gc27";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('dgdsc98eij7r6hkmgpq1lce0j6', 1292987521, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"dgdsc98eij7r6hkmgpq1lce0j6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|s:2:"13";'),
('9lt35id7c6k2eot9sipjge89r0', 1292987524, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('gi5j2pp0afq6fn3gpaif9jlfk1', 1292987620, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}');
INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('7erkks7m7p33nrcn3rumu1qqa1', 1292987625, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"7erkks7m7p33nrcn3rumu1qqa1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|i:1;'),
('83oh35h1jbl8v9crfdn2hti3p3', 1292987629, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('os4f82mb33f1ltp2mis4phd6i7', 1292987692, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6n45g5c4mccfufcur9cse703v0', 1292987692, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('44e5uh07fuvcd9esort2g1v7b5', 1292987693, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('sbgemitgf7dm9j5heht1km14v2', 1292987698, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"sbgemitgf7dm9j5heht1km14v2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|i:1;'),
('d8ju3e4u3860vgq8qgvo9567i0', 1292987699, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('r1eum5lon6em2ss7hm34rrip87', 1292987714, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('o4e8jo00pp4dn1h8khni7vp342', 1292987714, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('33bp4gn7hmrtts4ha53f0lle22', 1292987714, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('kgnsgfolea2dejo284l4vomuj4', 1292987715, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ugr2odkdpab0lnejmop0fm6ah4', 1292987724, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"ugr2odkdpab0lnejmop0fm6ah4";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|i:1;'),
('arj42rtfs8rukqvndtec7vaf76', 1292987732, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('3oi2potr3vv1t7evjd7f3c7s92', 1292988260, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"3oi2potr3vv1t7evjd7f3c7s92";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|i:1;'),
('g0nlq076fc0jsa4imc54jvaas1', 1292988265, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('uentkh291bof8c5u1o500al8p0', 1292988445, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:4:{s:10:"room_image";s:12:"NoiThat1.jpg";s:16:"room_description";s:239:" Room of  35 square meter wooden floor. Overlooking the green mountain scenery. 21inch LCD/ shower/ bath tub/ complimentary wireless/ plug and play internet/ personal safe/ mini bar/ 24 hour room service/ coffee and tea making facilities. ";s:10:"room_price";s:2:"79";s:6:"osCsid";s:26:"uentkh291bof8c5u1o500al8p0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('agu9gquf1v9bimt5n6fv78o406', 1292988797, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7im3s3erd6l42v7aa0mkatnet1', 1292988804, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"7im3s3erd6l42v7aa0mkatnet1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|i:1;'),
('rdtlvg49kbjard2hj0vq4dji26', 1292988807, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('86msjjvb4fc4gr17kc83hrnmo0', 1292991727, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('01k19m15napj4son7dmeol5414', 1292991727, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('d4mssrritt74ptd5j3g0qi1ch0', 1292991727, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6b4996lupinguofqbler4b6k45', 1292991728, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('aco8l1t6tcrrbjjlbeehefr236', 1292991728, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('036skejebp7dnnkng6vfo27jf4', 1292991735, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"036skejebp7dnnkng6vfo27jf4";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|i:1;'),
('vg6am7egrigd180mmjfemdd710', 1292991738, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('j7rrdc5luqvipq5vr293obbbr1', 1292991764, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5mvsm2gfae8fgp98a49bk19266', 1292991764, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('dod88a8jbc5j1epibs1pvvi1g7', 1292991764, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('n9evh1ans9r528udirnofto9n0', 1292991764, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6l1jbh4uhtf041sfo5en6g4gf7', 1292991769, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"6l1jbh4uhtf041sfo5en6g4gf7";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|i:1;'),
('metabbj96tlr48shhq2p707765', 1292991771, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('3j9e0gbtgltlf4r8jjaqddd296', 1292991879, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"3j9e0gbtgltlf4r8jjaqddd296";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|i:1;'),
('61nmj53h8vu8jml2q1km3i8oc6', 1292991882, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('kcev94p3fr2kahf6p5c9usjsl1', 1292992404, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('vblc6goaesiqhdpr455rvh6qs3', 1292992404, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('tcj7tl0eoh6ij1dse78rvcjqh6', 1292992404, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('3iuuqmn793kifht21qok7qknp3', 1292992409, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"3iuuqmn793kifht21qok7qknp3";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|i:1;'),
('h4f8j7g3gtmqi2f4c8p26tibl5', 1292992416, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('63ts9qjpvckpst485r98gfmn64', 1292992451, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5uebdqq6svef0pbcp25vf07n95', 1292992451, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ha5agcngbun90smnvfihe6eq53', 1292992451, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('sg36lv73edlgu5e38eresbkn90', 1292992484, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"sg36lv73edlgu5e38eresbkn90";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|i:1;'),
('6tmt9h9edo3da359j2fk3qpm32', 1292992458, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('q8voo12pa7dlcltaab13abo5p5', 1292992484, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qf18n6ll74emuqgfuvlafkeae0', 1292992488, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('vi8l8hf7uqa5g6jd4rapdlhud0', 1292992491, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:12:"register.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('a5v927pc6to94n14je3cnp4h26', 1292992493, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('8vpj34obtb6n8hj0ujhk9dja23', 1292993095, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('elmop8qm8dai87ptb1e3t4tip7', 1292993436, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:9:"room_type";s:1:"1";s:6:"osCsid";s:26:"elmop8qm8dai87ptb1e3t4tip7";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|i:1;'),
('q9a56dqbvm6mjqvvls8f54flu6', 1292993110, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('fd81a7ovfm47662bm2bh4hmgo5', 1292993127, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ushij3dmvg0tkl2velhbohuvf6', 1292993132, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('pmdosv2ccs62sq3071vm0gnf06', 1292993135, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('12', 1292993140, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:2:"12";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('0217j8q6gasi1qa13aghnsvn05', 1292993160, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:12:"register.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('g7ndlama8acl2ostqobaes5g57', 1292993183, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:9:"room_type";s:1:"1";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5vi8u68vqi53j87nahpku6e522', 1292993169, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mdf04rp86lt2pt1jmj0io19d60', 1292993439, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('s8uostl12l4lr7q7tod69ai0s0', 1292993444, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('0p8ldbvrrsomk07rj5kq4al372', 1292993446, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('fc2679rosqen1bsmlr14q9tk55', 1292993452, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"fc2679rosqen1bsmlr14q9tk55";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";login23|i:1;'),
('gd5vt6049ftou5gaumvsod0505', 1292993459, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('btr9otp8bg5j15bmj4facml0c5', 1294106252, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:7:"room_id";s:1:"5";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('m8makcn4c6r2vmnuaijd9cveg0', 1293157210, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"xulydangnhap.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:7:{s:5:"email";s:26:"thanhnhan_kg2000@yahoo.com";s:8:"password";s:6:"111111";s:6:"Submit";s:13:"ÄÄƒng Nháº­p";s:6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"m8makcn4c6r2vmnuaijd9cveg0";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('bo3hmq9hlksbmp79s7927q4604', 1293157213, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('hdoncb235vbllce2ohkjc3qn94', 1294127316, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:9:"room_type";s:1:"1";s:6:"osCsid";s:26:"hdoncb235vbllce2ohkjc3qn94";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('u9dqcq8d4h0totv2es3s8tq0u6', 1294107067, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('fqlb5h5ad2f48uitrev019u0n5', 1294107085, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('fr4v8830sm5ef86opnp33nbsc6', 1294129641, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:2:{i:0;a:4:{s:4:"page";s:16:"chitietphong.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:7:"room_id";s:1:"1";s:6:"osCsid";s:26:"fr4v8830sm5ef86opnp33nbsc6";}s:4:"post";a:0:{}}i:1;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:2:{s:20:"room_type_categories";s:1:"1";s:6:"osCsid";s:26:"fr4v8830sm5ef86opnp33nbsc6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('s521s1dsgjie4dsvcic3m5q5i2', 1294192690, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"s521s1dsgjie4dsvcic3m5q5i2";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2nbbj3dns1ognbqrrhg60dki51', 1294192571, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('brg6srhb9ehtth8kpqcav0vk55', 1294192688, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('0qgrgm3nimiv3tclr60kk5ej82', 1294192678, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('iho3h0uket78i5geo5kdppm5b1', 1294192718, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('53f1pkjkel88gif7cmb66h5631', 1294192724, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('jlan1io62ii3fean5879re1gs6', 1294192968, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"jlan1io62ii3fean5879re1gs6";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('pln3r8c8t9qnht2u9uoi15gka2', 1294192843, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('dbnfblj0qn1s4q19hv68h51rs6', 1294192873, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('3ckmdpligfk0pvc8qbiq4tepr1', 1294192967, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('jrfobp5d5bub4gb62rpgs7q196', 1294192995, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('u9uf2jlkulubof93vjemvdaso3', 1294193001, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('lr9kiaa2odb1no5n6bj8rftt56', 1294193004, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('pchqre45gvrhi9kg0eibrsvn24', 1294193022, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('ckgtc7293il31lcsef1t040pv1', 1294193023, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('g4vtjupqghhkue2tbs7k00gs23', 1294193246, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('5isnhhojrq0khn4hfg7pjjaiu1', 1294193246, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('3grd74i6shk4k397o5e2jls973', 1294193246, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ndaur5aa0dcnmrt17fasaraub5', 1294193251, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('m40adsjcb2bk76q8deg2a5t8c4', 1294193254, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('g1k9h072c3jfcpibhai9t5kmi0', 1294193649, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('amp1ve3oee7ahd4mh91finl5o0', 1294193655, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('prfvpvki6tiv3lr0ckq8veqgf5', 1294193656, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('dc8jbt5nmcepdmdaldomp45ak4', 1294193671, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('rg064l8a60f0gnttolmavdrse2', 1294193671, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mpntlh0g166qa5msv7qjolefg4', 1294193675, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('kva49cb4n6l3g2f2pt73oag8d2', 1294198234, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('edd7m5un3ovqc8vjqncdnjr846', 1294198240, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1vgaj85327tjsupbdvrm10qit5', 1294198307, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('i2kbslun4ljol3bbvdu8b2dil3', 1294194471, 'cart|O:12:"shoppingCart":5:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:6:"cartID";N;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;6:"option";s:8:"com_user";s:4:"task";s:5:"login";s:6:"return";s:12:"L0tob3RlbC8=";s:32:"1cc9b4ae8693d48be6efa33ba79536d6";s:1:"1";}}}s:8:"snapshot";a:0:{}}customer|s:2:"13";customer_id|s:2:"13";customer_first_name|s:4:"nhan";'),
('3i8sesah0q9e99prdlnkbui0g3', 1294198307, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('bdcfqkvpamfadqv6o5ta6dmt22', 1294198351, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('3538es9e97l1969se9t7pf7mi0', 1294198351, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('nqu22vh1p869e6d3sv6qb9mg66', 1294198376, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('8ut367squpep2qe6unjkrjjg87', 1294198376, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('p6aji2n2rn1uit1dvv1dshppt3', 1294198413, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1ef40j6d7a952oeacovvm9jvh7', 1294198413, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('ceau6c26rr902k1hh6sg03nbu1', 1294198435, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('scu07oqrb0jbftci5pcb3jjrb0', 1294198436, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('n1n5pi55s455vp28gc1bgbej02', 1294198498, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('9a0ldh94s8b97oer50he3b7ut3', 1294198498, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('jjkveff1ks5tjg38l8b7reet50', 1294198545, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('nkjrh4l6ajnocid2of7a8k2175', 1294198546, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('aolsc3lp6k4e3k9grlnvfqbqv5', 1294198546, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('2c55pbuv55isf9foukp9l2b5v1', 1294198574, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}');
INSERT INTO `sessions` (`sesskey`, `expiry`, `value`) VALUES
('m0btlvkrvlcq4cnqv43ejg8pe6', 1294198574, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('8k51ovt2is3nka1ig2qbe1ip44', 1294198574, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ebc2jb05svif3q3ic2ju8t2dv1', 1294198583, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('37k8u370itqphf5honpvmn1ns4', 1294198583, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('7pm2li72sge0qfsk9dvinhsks2', 1294198613, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('c8o4r0pd43rqjtv7cmq5onkju4', 1294198614, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('qm84n4gcfguv0kl8es5rc95op7', 1294198649, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('me8tjbs7pmjpfo7ftdh791mag7', 1294198650, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('ufei6c4hvpgus0pkoe1n3p7s31', 1294198821, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('1nfvgdlng1jpou1bbke4gvtf93', 1294198821, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('knio0iv2t91s6tlo6epnle68e5', 1294199014, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('1rkc7767n6517le7b9s1qmn083', 1294199015, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('f2qos5dpmjvt2kl2er60tlb6m5', 1294199015, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('lb7rjaj6ai37prk43g3plhut44', 1294199128, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('drfu08eri7t1h7jvvnbm5mfdb2', 1294199128, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('cb60uunubhf1v0sfovml0rqec2', 1294199517, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('gb7g9htkcjesqfeeqmqafqp3i0', 1294199518, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('iu06nuqvljmnooucm5i8lstee0', 1294199923, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('l5r18u1tlcj641blbc04cu2br2', 1294199927, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('8r36msmm0kcr1nnucmf5ina975', 1294199927, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('7d84t6tvlnddtinq2vjhpkbvo7', 1294199927, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('pv0n21pr1b181bvmduqpvj98o0', 1294199929, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('imta0d79397rqjqhhfgg4qvoi4', 1294199930, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('evpqnt76v38ogh4jv4j5uqrui4', 1294199930, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('mmdi9bsp64qfjj5d6kid35gjh1', 1294199930, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('p8sjla3snlibb8kjdrtgsfbv85', 1294199945, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('pa722o10am5qa7ki40ftf01i26', 1294199945, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('o8ij653f2i6q11mj733cvtn7k2', 1294199945, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('i7pb4suf5odfr1opbvdm4befr1', 1294199945, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('s250ckar3417kr0qeucd7ogdq4', 1294200923, 'cart|N;language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|N;'),
('7epg7m63v1dbep165n2v2n85j3', 1294200923, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('87cmq27j5p738o9ri9hc1o9b35', 1294200924, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('59mfrvuf938cmujo4u4jerjsb1', 1294200925, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('4p0uu5g5bi6jdjshksdc4vkmq0', 1294200957, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('l22fq6eumafeci8qe5ccgllug4', 1294200957, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('74sa7f6gtgo7sp9iqki5st1sf0', 1294201143, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('6i2rsb8mhev3ud6n04up11tb63', 1294201144, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('10lg914k5p23i8bpbf1tovljv5', 1294201144, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('i4skbqb7i1qoi55aneer3s3oh6', 1294201147, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('lv5o2kdt52f3ksm5mb09fndcc4', 1294201147, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('h856462unl20truj7kthamml50', 1294201147, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:0:{}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}'),
('p9cp99k967g026sqi7lclqh650', 1294212087, 'cart|O:12:"shoppingCart":4:{s:8:"contents";a:0:{}s:5:"total";i:0;s:6:"weight";i:0;s:12:"content_type";b:0;}language|s:7:"english";languages_id|s:1:"1";currency|s:3:"USD";navigation|O:17:"navigationHistory":2:{s:4:"path";a:1:{i:0;a:4:{s:4:"page";s:9:"index.php";s:4:"mode";s:6:"NONSSL";s:3:"get";a:1:{s:6:"osCsid";s:26:"p9cp99k967g026sqi7lclqh650";}s:4:"post";a:0:{}}}s:8:"snapshot";a:0:{}}');

-- --------------------------------------------------------

--
-- Table structure for table `specials`
--

CREATE TABLE IF NOT EXISTS `specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `specials_new_products_price` decimal(15,4) NOT NULL,
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` datetime DEFAULT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`specials_id`),
  KEY `idx_specials_products_id` (`products_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `specials`
--

INSERT INTO `specials` (`specials_id`, `products_id`, `specials_new_products_price`, `specials_date_added`, `specials_last_modified`, `expires_date`, `date_status_change`, `status`) VALUES
(1, 3, 39.9900, '2010-11-08 12:00:12', NULL, NULL, NULL, 1),
(2, 5, 30.0000, '2010-11-08 12:00:12', NULL, NULL, NULL, 1),
(3, 6, 30.0000, '2010-11-08 12:00:12', NULL, NULL, NULL, 1),
(4, 16, 29.9900, '2010-11-08 12:00:12', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `status_room`
--

CREATE TABLE IF NOT EXISTS `status_room` (
  `status_room_id_day` int(20) NOT NULL AUTO_INCREMENT,
  `status_room_dayofyear` date NOT NULL,
  `status_room_number_room_type_luxury1` int(2) NOT NULL,
  `status_room_number_room_type_luxury2` int(2) NOT NULL,
  `status_room_number_room_type_luxury3` int(2) NOT NULL,
  `status_room_number_room_type_senior1` int(2) NOT NULL,
  `status_room_number_room_type_senior2` int(2) NOT NULL,
  `status_room_number_room_type_senior3` int(2) NOT NULL,
  `status_room_number_room_type_family1` int(2) NOT NULL,
  `status_room_number_room_type_family2` int(2) NOT NULL,
  `status_room_number_room_type_meeting1` int(2) NOT NULL,
  `status_room_number_room_type_meeting2` int(2) NOT NULL,
  `status_room_number_room_type_meeting3` int(2) NOT NULL,
  PRIMARY KEY (`status_room_id_day`),
  UNIQUE KEY `status_room_current_day` (`status_room_id_day`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `status_room`
--

INSERT INTO `status_room` (`status_room_id_day`, `status_room_dayofyear`, `status_room_number_room_type_luxury1`, `status_room_number_room_type_luxury2`, `status_room_number_room_type_luxury3`, `status_room_number_room_type_senior1`, `status_room_number_room_type_senior2`, `status_room_number_room_type_senior3`, `status_room_number_room_type_family1`, `status_room_number_room_type_family2`, `status_room_number_room_type_meeting1`, `status_room_number_room_type_meeting2`, `status_room_number_room_type_meeting3`) VALUES
(1, '2011-01-04', 2, 2, 5, 3, 3, 4, 4, 2, 2, 3, 3),
(3, '2011-01-05', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, '2011-01-06', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, '2011-01-07', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, '2011-01-08', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, '2011-01-09', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, '2011-01-10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, '2011-01-09', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, '2011-01-10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) NOT NULL,
  `tax_class_description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `tax_class_title`, `tax_class_description`, `last_modified`, `date_added`) VALUES
(1, 'Taxable Goods', 'The following types of products are included non-food, services, etc', '2010-11-08 12:00:12', '2010-11-08 12:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE IF NOT EXISTS `tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL,
  `tax_description` varchar(255) NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`tax_rates_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`tax_rates_id`, `tax_zone_id`, `tax_class_id`, `tax_priority`, `tax_rate`, `tax_description`, `last_modified`, `date_added`) VALUES
(1, 1, 1, 1, 7.0000, 'FL TAX 7.0%', '2010-11-08 12:00:12', '2010-11-08 12:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `whos_online`
--

CREATE TABLE IF NOT EXISTS `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(64) NOT NULL,
  `session_id` varchar(128) NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `time_entry` varchar(14) NOT NULL,
  `time_last_click` varchar(14) NOT NULL,
  `last_page_url` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `whos_online`
--

INSERT INTO `whos_online` (`customer_id`, `full_name`, `session_id`, `ip_address`, `time_entry`, `time_last_click`, `last_page_url`) VALUES
(0, 'Guest', 'p9cp99k967g026sqi7lclqh650', '127.0.0.1', '1294210646', '1294210646', '/Temp_NuTrang/index.php?osCsid=p9cp99k967g026sqi7lclqh650');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE IF NOT EXISTS `zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL,
  `zone_code` varchar(32) NOT NULL,
  `zone_name` varchar(32) NOT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `idx_zones_country_id` (`zone_country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=182 ;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `zone_country_id`, `zone_code`, `zone_name`) VALUES
(1, 223, 'AL', 'Alabama'),
(2, 223, 'AK', 'Alaska'),
(3, 223, 'AS', 'American Samoa'),
(4, 223, 'AZ', 'Arizona'),
(5, 223, 'AR', 'Arkansas'),
(6, 223, 'AF', 'Armed Forces Africa'),
(7, 223, 'AA', 'Armed Forces Americas'),
(8, 223, 'AC', 'Armed Forces Canada'),
(9, 223, 'AE', 'Armed Forces Europe'),
(10, 223, 'AM', 'Armed Forces Middle East'),
(11, 223, 'AP', 'Armed Forces Pacific'),
(12, 223, 'CA', 'California'),
(13, 223, 'CO', 'Colorado'),
(14, 223, 'CT', 'Connecticut'),
(15, 223, 'DE', 'Delaware'),
(16, 223, 'DC', 'District of Columbia'),
(17, 223, 'FM', 'Federated States Of Micronesia'),
(18, 223, 'FL', 'Florida'),
(19, 223, 'GA', 'Georgia'),
(20, 223, 'GU', 'Guam'),
(21, 223, 'HI', 'Hawaii'),
(22, 223, 'ID', 'Idaho'),
(23, 223, 'IL', 'Illinois'),
(24, 223, 'IN', 'Indiana'),
(25, 223, 'IA', 'Iowa'),
(26, 223, 'KS', 'Kansas'),
(27, 223, 'KY', 'Kentucky'),
(28, 223, 'LA', 'Louisiana'),
(29, 223, 'ME', 'Maine'),
(30, 223, 'MH', 'Marshall Islands'),
(31, 223, 'MD', 'Maryland'),
(32, 223, 'MA', 'Massachusetts'),
(33, 223, 'MI', 'Michigan'),
(34, 223, 'MN', 'Minnesota'),
(35, 223, 'MS', 'Mississippi'),
(36, 223, 'MO', 'Missouri'),
(37, 223, 'MT', 'Montana'),
(38, 223, 'NE', 'Nebraska'),
(39, 223, 'NV', 'Nevada'),
(40, 223, 'NH', 'New Hampshire'),
(41, 223, 'NJ', 'New Jersey'),
(42, 223, 'NM', 'New Mexico'),
(43, 223, 'NY', 'New York'),
(44, 223, 'NC', 'North Carolina'),
(45, 223, 'ND', 'North Dakota'),
(46, 223, 'MP', 'Northern Mariana Islands'),
(47, 223, 'OH', 'Ohio'),
(48, 223, 'OK', 'Oklahoma'),
(49, 223, 'OR', 'Oregon'),
(50, 223, 'PW', 'Palau'),
(51, 223, 'PA', 'Pennsylvania'),
(52, 223, 'PR', 'Puerto Rico'),
(53, 223, 'RI', 'Rhode Island'),
(54, 223, 'SC', 'South Carolina'),
(55, 223, 'SD', 'South Dakota'),
(56, 223, 'TN', 'Tennessee'),
(57, 223, 'TX', 'Texas'),
(58, 223, 'UT', 'Utah'),
(59, 223, 'VT', 'Vermont'),
(60, 223, 'VI', 'Virgin Islands'),
(61, 223, 'VA', 'Virginia'),
(62, 223, 'WA', 'Washington'),
(63, 223, 'WV', 'West Virginia'),
(64, 223, 'WI', 'Wisconsin'),
(65, 223, 'WY', 'Wyoming'),
(66, 38, 'AB', 'Alberta'),
(67, 38, 'BC', 'British Columbia'),
(68, 38, 'MB', 'Manitoba'),
(69, 38, 'NF', 'Newfoundland'),
(70, 38, 'NB', 'New Brunswick'),
(71, 38, 'NS', 'Nova Scotia'),
(72, 38, 'NT', 'Northwest Territories'),
(73, 38, 'NU', 'Nunavut'),
(74, 38, 'ON', 'Ontario'),
(75, 38, 'PE', 'Prince Edward Island'),
(76, 38, 'QC', 'Quebec'),
(77, 38, 'SK', 'Saskatchewan'),
(78, 38, 'YT', 'Yukon Territory'),
(79, 81, 'NDS', 'Niedersachsen'),
(80, 81, 'BAW', 'Baden-Württemberg'),
(81, 81, 'BAY', 'Bayern'),
(82, 81, 'BER', 'Berlin'),
(83, 81, 'BRG', 'Brandenburg'),
(84, 81, 'BRE', 'Bremen'),
(85, 81, 'HAM', 'Hamburg'),
(86, 81, 'HES', 'Hessen'),
(87, 81, 'MEC', 'Mecklenburg-Vorpommern'),
(88, 81, 'NRW', 'Nordrhein-Westfalen'),
(89, 81, 'RHE', 'Rheinland-Pfalz'),
(90, 81, 'SAR', 'Saarland'),
(91, 81, 'SAS', 'Sachsen'),
(92, 81, 'SAC', 'Sachsen-Anhalt'),
(93, 81, 'SCN', 'Schleswig-Holstein'),
(94, 81, 'THE', 'Thüringen'),
(95, 14, 'WI', 'Wien'),
(96, 14, 'NO', 'Niederösterreich'),
(97, 14, 'OO', 'Oberösterreich'),
(98, 14, 'SB', 'Salzburg'),
(99, 14, 'KN', 'Kärnten'),
(100, 14, 'ST', 'Steiermark'),
(101, 14, 'TI', 'Tirol'),
(102, 14, 'BL', 'Burgenland'),
(103, 14, 'VB', 'Voralberg'),
(104, 204, 'AG', 'Aargau'),
(105, 204, 'AI', 'Appenzell Innerrhoden'),
(106, 204, 'AR', 'Appenzell Ausserrhoden'),
(107, 204, 'BE', 'Bern'),
(108, 204, 'BL', 'Basel-Landschaft'),
(109, 204, 'BS', 'Basel-Stadt'),
(110, 204, 'FR', 'Freiburg'),
(111, 204, 'GE', 'Genf'),
(112, 204, 'GL', 'Glarus'),
(113, 204, 'JU', 'Graubünden'),
(114, 204, 'JU', 'Jura'),
(115, 204, 'LU', 'Luzern'),
(116, 204, 'NE', 'Neuenburg'),
(117, 204, 'NW', 'Nidwalden'),
(118, 204, 'OW', 'Obwalden'),
(119, 204, 'SG', 'St. Gallen'),
(120, 204, 'SH', 'Schaffhausen'),
(121, 204, 'SO', 'Solothurn'),
(122, 204, 'SZ', 'Schwyz'),
(123, 204, 'TG', 'Thurgau'),
(124, 204, 'TI', 'Tessin'),
(125, 204, 'UR', 'Uri'),
(126, 204, 'VD', 'Waadt'),
(127, 204, 'VS', 'Wallis'),
(128, 204, 'ZG', 'Zug'),
(129, 204, 'ZH', 'Zürich'),
(130, 195, 'A Coruña', 'A Coruña'),
(131, 195, 'Alava', 'Alava'),
(132, 195, 'Albacete', 'Albacete'),
(133, 195, 'Alicante', 'Alicante'),
(134, 195, 'Almeria', 'Almeria'),
(135, 195, 'Asturias', 'Asturias'),
(136, 195, 'Avila', 'Avila'),
(137, 195, 'Badajoz', 'Badajoz'),
(138, 195, 'Baleares', 'Baleares'),
(139, 195, 'Barcelona', 'Barcelona'),
(140, 195, 'Burgos', 'Burgos'),
(141, 195, 'Caceres', 'Caceres'),
(142, 195, 'Cadiz', 'Cadiz'),
(143, 195, 'Cantabria', 'Cantabria'),
(144, 195, 'Castellon', 'Castellon'),
(145, 195, 'Ceuta', 'Ceuta'),
(146, 195, 'Ciudad Real', 'Ciudad Real'),
(147, 195, 'Cordoba', 'Cordoba'),
(148, 195, 'Cuenca', 'Cuenca'),
(149, 195, 'Girona', 'Girona'),
(150, 195, 'Granada', 'Granada'),
(151, 195, 'Guadalajara', 'Guadalajara'),
(152, 195, 'Guipuzcoa', 'Guipuzcoa'),
(153, 195, 'Huelva', 'Huelva'),
(154, 195, 'Huesca', 'Huesca'),
(155, 195, 'Jaen', 'Jaen'),
(156, 195, 'La Rioja', 'La Rioja'),
(157, 195, 'Las Palmas', 'Las Palmas'),
(158, 195, 'Leon', 'Leon'),
(159, 195, 'Lleida', 'Lleida'),
(160, 195, 'Lugo', 'Lugo'),
(161, 195, 'Madrid', 'Madrid'),
(162, 195, 'Malaga', 'Malaga'),
(163, 195, 'Melilla', 'Melilla'),
(164, 195, 'Murcia', 'Murcia'),
(165, 195, 'Navarra', 'Navarra'),
(166, 195, 'Ourense', 'Ourense'),
(167, 195, 'Palencia', 'Palencia'),
(168, 195, 'Pontevedra', 'Pontevedra'),
(169, 195, 'Salamanca', 'Salamanca'),
(170, 195, 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 195, 'Segovia', 'Segovia'),
(172, 195, 'Sevilla', 'Sevilla'),
(173, 195, 'Soria', 'Soria'),
(174, 195, 'Tarragona', 'Tarragona'),
(175, 195, 'Teruel', 'Teruel'),
(176, 195, 'Toledo', 'Toledo'),
(177, 195, 'Valencia', 'Valencia'),
(178, 195, 'Valladolid', 'Valladolid'),
(179, 195, 'Vizcaya', 'Vizcaya'),
(180, 195, 'Zamora', 'Zamora'),
(181, 195, 'Zaragoza', 'Zaragoza');

-- --------------------------------------------------------

--
-- Table structure for table `zones_to_geo_zones`
--

CREATE TABLE IF NOT EXISTS `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_to_geo_zones_country_id` (`zone_country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zones_to_geo_zones`
--

INSERT INTO `zones_to_geo_zones` (`association_id`, `zone_country_id`, `zone_id`, `geo_zone_id`, `last_modified`, `date_added`) VALUES
(1, 223, 18, 1, NULL, '2010-11-08 12:00:12');
