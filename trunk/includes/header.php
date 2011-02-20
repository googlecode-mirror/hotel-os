<?php
/*
  $Id: header.php,v 1.42 2003/06/10 18:20:38 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/

// check if the 'install' directory exists, and warn of its existence
  if (WARN_INSTALL_EXISTENCE == 'true') {
    if (file_exists(dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/install')) {
      $messageStack->add('header', WARNING_INSTALL_DIRECTORY_EXISTS, 'warning');
    }
  }

// check if the configure.php file is writeable
  if (WARN_CONFIG_WRITEABLE == 'true') {
    if ( (file_exists(dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/includes/configure.php')) && (is_writeable(dirname($HTTP_SERVER_VARS['SCRIPT_FILENAME']) . '/includes/configure.php')) ) {
      $messageStack->add('header', WARNING_CONFIG_FILE_WRITEABLE, 'warning');
    }
  }

// check if the session folder is writeable
  if (WARN_SESSION_DIRECTORY_NOT_WRITEABLE == 'true') {
    if (STORE_SESSIONS == '') {
      if (!is_dir(tep_session_save_path())) {
        $messageStack->add('header', WARNING_SESSION_DIRECTORY_NON_EXISTENT, 'warning');
      } elseif (!is_writeable(tep_session_save_path())) {
        $messageStack->add('header', WARNING_SESSION_DIRECTORY_NOT_WRITEABLE, 'warning');
      }
    }
  }

// check session.auto_start is disabled
  if ( (function_exists('ini_get')) && (WARN_SESSION_AUTO_START == 'true') ) {
    if (ini_get('session.auto_start') == '1') {
      $messageStack->add('header', WARNING_SESSION_AUTO_START, 'warning');
    }
  }

  if ( (WARN_DOWNLOAD_DIRECTORY_NOT_READABLE == 'true') && (DOWNLOAD_ENABLED == 'true') ) {
    if (!is_dir(DIR_FS_DOWNLOAD)) {
      $messageStack->add('header', WARNING_DOWNLOAD_DIRECTORY_NON_EXISTENT, 'warning');
    }
  }

  if ($messageStack->size('header') > 0) {
    echo $messageStack->output('header');
  }
?>

	        <!-- NAV -->
    <div id="gk-nav" class="clearfix">
    <div id="gk-mainnav">
    <div class="gk-menu clearfix">
<ul id="gk-menu" class="level0">
    <li class="mega active first  icon-home">
        <a href="<?php echo tep_href_link(FILENAME_DEFAULT); ?>" class="mega active first  icon-home" id="menu1" title="Home">
            <span class="menu-title"><span>Trang chủ</span></span>
            <span class="menu-desc">summary</span></a>
    </li>
<li class="mega haschild"><a href="<?php echo tep_href_link(FILENAME_DEFAULT); ?>" class="mega haschild" id="menu58" title="Loại phòng"><span class="menu-title"><span>Loại phòng</span></span><span class="menu-desc">&nbsp;</span></a><div class="childcontent cols1 ">
<div class="childcontent-inner-wrap">

<div class="childcontent-inner clearfix" style="width: 200px;"><div class="megacol column1 first last" style="width: 200px;"><ul  class="level1"><li class="mega first"><a href="<?php echo tep_href_link(FILENAME_DEFAULT,'room_type_categories=1'); ?>" class="mega first" id="menu115" title="Phòng sang trọng"><span class="menu-title"><span>Phòng sang trọng</span></span></a></li><li class="mega"><a href="<?php echo tep_href_link(FILENAME_DEFAULT,'room_type_categories=2'); ?>" class="mega" id="menu116" title="Phòng cao cấp"><span class="menu-title"><span>Phòng cao cấp</span></span></a></li><li class="mega"><a href="<?php echo tep_href_link(FILENAME_DEFAULT,'room_type_categories=3'); ?>" class="mega" id="menu117" title="Phòng gia đình"><span class="menu-title"><span>Phòng gia đình</span></span></a></li><li class="mega last"><a href="<?php echo tep_href_link(FILENAME_DEFAULT,'room_type_categories=4'); ?>" class="mega last" id="menu118" title="Phòng hội nghị"><span class="menu-title"><span>Phòng hội nghị</span></span></a></li></ul></div></div>
</div></div></li><li class="mega last haschild"><a href="<?php echo tep_href_link('dichvunhahang.php'); ?>" class="mega last haschild" id="menu53" title="Dịch vụ"><span class="menu-title"><span>Dịch vụ</span></span><span class="menu-desc">my work</span></a><div class="childcontent cols1 ">
<div class="childcontent-inner-wrap">
<div class="childcontent-inner clearfix" style="width: 200px;">
    <div class="megacol column1 first last" style="width: 200px;">
        <ul  class="level1">
            <li class="mega last">
                <a href="<?php echo tep_href_link('dichvunhahang.php'); ?>" class="mega first haschild" id="menu96" title="Nhà hàng">
                    <span class="menu-title">
                        <span>Nhà hàng</span>
                    </span>
                </a>
               
            </li>
            <li class="mega"><a href="<?php echo tep_href_link('dichvukaraoke.php'); ?>" class="mega last" id="menu97" title="Karaoke"><span class="menu-title"><span>Karaoke</span></span></a></li>
             <li class="mega last"><a href="<?php echo tep_href_link('dichvuhoboi.php'); ?>" class="mega last" title="Hồ bơi"><span class="menu-title"><span>Hồ bơi</span></span></a></li>
            </ul></div></div>
</div></div></li></ul>
</div>	

<script type="text/javascript">
			var megamenu = new gkMegaMenuMoo ('gk-mainnav', {
				'bgopacity': 0, 
				'delayHide': 1000, 
				'slide': 1, 
				'fading': 0,
				'direction':'down',
				'action':'mouseover',
				'tips': false,
				'duration': 300,
				'hidestyle': 'fastwhenshow'
			});			
			</script>
		
			    </div>
    
    </div>	        <!-- HEADER -->

