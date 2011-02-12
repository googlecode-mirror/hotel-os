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
    <li class="mega haschild  icon-joomla">
        <a href="<?php echo tep_href_link('datphong.php'); ?>" class="mega haschild  icon-joomla" id="menu27" title="Template">
        <span class="menu-title"><span>Đặt phòng</span></span>
        <span class="menu-desc">overview</span></a>
        
<div class="childcontent cols1 ">
<div class="childcontent-inner-wrap">
<div class="childcontent-inner clearfix" style="width: 200px;"><div class="megacol column1 first last" style="width: 200px;"><ul  class="level1"><li class="mega first haschild"><a href="#" class="mega first haschild" id="menu56" title="Template articles"><span class="menu-title"><span>Tìm phòng trống</span></span></a><div class="childcontent cols1 ">

<div class="childcontent-inner-wrap">
<div class="childcontent-inner clearfix" style="width: 200px;"><div class="megacol column1 first last" style="width: 200px;"><ul  class="level2"><li class="mega first"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=49&amp;Itemid=61" class="mega first" id="menu61" title="Typography"><span class="menu-title"><span>Typography</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=50&amp;Itemid=62" class="mega" id="menu62" title="IE6 style"><span class="menu-title"><span>IE6 style</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=51&amp;Itemid=63" class="mega" id="menu63" title="Messages"><span class="menu-title"><span>Messages</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=52&amp;Itemid=64" class="mega" id="menu64" title="Chrome Frame"><span class="menu-title"><span>Chrome Frame</span></span></a></li><li class="mega"><a href="/Khotel/?option=non-existing-component" class="mega" id="menu65" title="Error page"><span class="menu-title"><span>Error page</span></span></a></li><li class="mega"><a href="/Khotel/?tmpl=offline" class="mega" id="menu66" title="Offline page"><span class="menu-title"><span>Offline page</span></span></a></li><li class="mega last"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=53&amp;Itemid=67" class="mega last" id="menu67" title="Header module"><span class="menu-title"><span>Header module</span></span></a></li></ul></div></div>
</div></div></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=47&amp;Itemid=59" class="mega" id="menu59" title="Module variations"><span class="menu-title"><span>Module variations</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=48&amp;Itemid=60" class="mega" id="menu60" title="Module positions"><span class="menu-title"><span>Module positions</span></span></a></li><li class="mega haschild"><a href="#" class="mega haschild" id="menu57" title="Joomla! pages I"><span class="menu-title"><span>Joomla! pages I</span></span></a><div class="childcontent cols1 ">
<div class="childcontent-inner-wrap">
<div class="childcontent-inner clearfix" style="width: 200px;"><div class="megacol column1 first last" style="width: 200px;"><ul  class="level2"><li class="mega first"><a href="/Khotel/index.php?option=com_poll&amp;view=poll&amp;id=14&amp;Itemid=71" class="mega first" id="menu71" title="Poll"><span class="menu-title"><span>Poll</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_contact&amp;view=category&amp;catid=12&amp;Itemid=78" class="mega" id="menu78" title="Contact category"><span class="menu-title"><span>Contact category</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_contact&amp;view=contact&amp;id=1&amp;Itemid=79" class="mega" id="menu79" title="Contact single"><span class="menu-title"><span>Contact single</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_search&amp;view=search&amp;Itemid=72" class="mega" id="menu72" title="Search"><span class="menu-title"><span>Search</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_wrapper&amp;view=wrapper&amp;Itemid=73" class="mega" id="menu73" title="Wrapper"><span class="menu-title"><span>Wrapper</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_weblinks&amp;view=categories&amp;Itemid=74" class="mega" id="menu74" title="Web links category list"><span class="menu-title"><span>Web links category list</span></span></a></li><li class="mega last"><a href="/Khotel/index.php?option=com_weblinks&amp;view=category&amp;id=2&amp;Itemid=75" class="mega last" id="menu75" title="Web links category"><span class="menu-title"><span>Web links category</span></span></a></li></ul></div></div>

</div></div></li><li class="mega haschild"><a href="#" class="mega haschild" id="menu77" title="Joomla! pages II"><span class="menu-title"><span>Joomla! pages II</span></span></a><div class="childcontent cols1 ">
<div class="childcontent-inner-wrap">
<div class="childcontent-inner clearfix" style="width: 200px;"><div class="megacol column1 first last" style="width: 200px;"><ul  class="level2"><li class="mega first"><a href="/Khotel/index.php?option=com_newsfeeds&amp;view=categories&amp;Itemid=80" class="mega first" id="menu80" title="News feeds category list"><span class="menu-title"><span>News feeds category list</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_newsfeeds&amp;view=category&amp;id=4&amp;Itemid=81" class="mega" id="menu81" title="News feeds category"><span class="menu-title"><span>News feeds category</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_newsfeeds&amp;view=newsfeed&amp;id=1&amp;Itemid=82" class="mega" id="menu82" title="News feeds feed"><span class="menu-title"><span>News feeds feed</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_user&amp;view=login&amp;Itemid=83" class="mega" id="menu83" title="User login"><span class="menu-title"><span>User login</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_user&amp;view=register&amp;Itemid=84" class="mega" id="menu84" title="User registration"><span class="menu-title"><span>User registration</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_user&amp;view=remind&amp;Itemid=85" class="mega" id="menu85" title="User remind"><span class="menu-title"><span>User remind</span></span></a></li><li class="mega last"><a href="/Khotel/index.php?option=com_user&amp;view=user&amp;Itemid=87" class="mega last" id="menu87" title="User default"><span class="menu-title"><span>User default</span></span></a></li></ul></div></div>
</div></div></li><li class="mega haschild"><a href="#" class="mega haschild" id="menu89" title="Joomla! pages III"><span class="menu-title"><span>Joomla! pages III</span></span></a><div class="childcontent cols1 ">
<div class="childcontent-inner-wrap">
<div class="childcontent-inner clearfix" style="width: 200px;"><div class="megacol column1 first last" style="width: 200px;"><ul  class="level2"><li class="mega first"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=22&amp;Itemid=34" class="mega first" id="menu34" title="Article"><span class="menu-title"><span>Article</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=section&amp;id=3&amp;Itemid=41" class="mega" id="menu41" title="Section"><span class="menu-title"><span>Section</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=archive&amp;Itemid=90" class="mega" id="menu90" title="Archived articles"><span class="menu-title"><span>Archived articles</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=category&amp;layout=blog&amp;id=1&amp;Itemid=50" class="mega" id="menu50" title="Category blog"><span class="menu-title"><span>Category blog</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=frontpage&amp;Itemid=92" class="mega" id="menu92" title="Frontpage blog"><span class="menu-title"><span>Frontpage blog</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=category&amp;id=1&amp;Itemid=93" class="mega" id="menu93" title="Category list"><span class="menu-title"><span>Category list</span></span></a></li><li class="mega last"><a href="/Khotel/index.php?option=com_content&amp;view=section&amp;layout=blog&amp;id=1&amp;Itemid=94" class="mega last" id="menu94" title="Section blog"><span class="menu-title"><span>Section blog</span></span></a></li></ul></div></div>

</div></div></li><li class="mega last haschild"><a href="#" class="mega last haschild" id="menu105" title="Layouts"><span class="menu-title"><span>Layouts</span></span></a><div class="childcontent cols1 ">
<div class="childcontent-inner-wrap">
<div class="childcontent-inner clearfix" style="width: 200px;"><div class="megacol column1 first last" style="width: 200px;"><ul  class="level2"><li class="mega first"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=54&amp;Itemid=106" class="mega first" id="menu106" title="Right column"><span class="menu-title"><span>Right column</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=55&amp;Itemid=107" class="mega" id="menu107" title="Left column"><span class="menu-title"><span>Left column</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=56&amp;Itemid=108" class="mega" id="menu108" title="Right two columns"><span class="menu-title"><span>Right two columns</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=57&amp;Itemid=109" class="mega" id="menu109" title="Left two columns"><span class="menu-title"><span>Left two columns</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=58&amp;Itemid=110" class="mega" id="menu110" title="Content inset left"><span class="menu-title"><span>Content inset left</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=59&amp;Itemid=111" class="mega" id="menu111" title="Content inset right"><span class="menu-title"><span>Content inset right</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=60&amp;Itemid=112" class="mega" id="menu112" title="Content inset both"><span class="menu-title"><span>Content inset both</span></span></a></li><li class="mega"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=61&amp;Itemid=113" class="mega" id="menu113" title="Content inset + column"><span class="menu-title"><span>Content inset + column</span></span></a></li><li class="mega last"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=62&amp;Itemid=114" class="mega last" id="menu114" title="Content inset + column(2x)"><span class="menu-title"><span>Content inset + column(2x)</span></span></a></li></ul></div></div>
</div></div></li></ul></div></div>
</div></div></li><li class="mega haschild"><a href="/Khotel/index.php?option=com_content&amp;view=article&amp;id=46&amp;Itemid=58" class="mega haschild" id="menu58" title="Menu types"><span class="menu-title"><span>Loại phòng</span></span><span class="menu-desc">&nbsp;</span></a><div class="childcontent cols1 ">
<div class="childcontent-inner-wrap">

<div class="childcontent-inner clearfix" style="width: 200px;"><div class="megacol column1 first last" style="width: 200px;"><ul  class="level1"><li class="mega first"><a href="/Khotel/?gk_menu=mega" class="mega first" id="menu115" title="Mega menu"><span class="menu-title"><span>Phòng hội nghị</span></span></a></li><li class="mega"><a href="/Khotel/?gk_menu=dropline" class="mega" id="menu116" title="Dropline menu"><span class="menu-title"><span>Loại A</span></span></a></li><li class="mega"><a href="/Khotel/?gk_menu=dropline" class="mega" id="menu117" title="Dropline menu"><span class="menu-title"><span>Loại B</span></span></a></li><li class="mega last"><a href="/Khotel/?gk_menu=split" class="mega last" id="menu118" title="Split menu"><span class="menu-title"><span>Loại C</span></span></a></li><li class="mega"><a href="/Khotel/?gk_menu=dropline" class="mega" id="menu119" title="Dropline menu"><span class="menu-title"><span>Loại D</span></span></a></li></ul></div></div>
</div></div></li><li class="mega last haschild"><a href="#" class="mega last haschild" id="menu53" title="3rd party extensions"><span class="menu-title"><span>Dịch vụ</span></span><span class="menu-desc">my work</span></a><div class="childcontent cols1 ">
<div class="childcontent-inner-wrap">
<div class="childcontent-inner clearfix" style="width: 200px;">
    <div class="megacol column1 first last" style="width: 200px;">
        <ul  class="level1">
            <li class="mega last">
                <a href="/hotelbooking/dichvunhahang.php/" class="mega first haschild" id="menu96" title="K2">
                    <span class="menu-title">
                        <span>Nhà hàng</span>
                    </span>
                </a>
               
            </li>
            <li class="mega last"><a href="/hotelbooking/dichvukaraoke.php" class="mega last" id="menu97" title="JComments"><span class="menu-title"><span>Karaoke</span></span></a></li>
             <li class="mega last"><a href="/hotelbooking/dichvuhoboi.php" class="mega last" title="JComments"><span class="menu-title"><span>Hồ bơi</span></span></a></li>
              <li class="mega last"><a href="/hotelbooking/index.php?option=com_content&amp;view=article&amp;id=22&amp;Itemid=97" class="mega last" id="menu120" title="JComments"><span class="menu-title"><span>Massage</span></span></a></li>
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

