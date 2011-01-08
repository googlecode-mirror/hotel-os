<?php
/*
  $Id: column_left.php,v 1.15 2003/07/01 14:34:54 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/
  //require('includes/application_top.php');
?>
<div id="left">
		<!--****************************************************************Tim kiem-->
	<div id="search" class="moduletable color2">
		<h3>T&Igrave;M KI&#7870;M </h3>
        <div class="search_content">
            <div class="line">
    			<label>Ng&agrave;y &#273;&#7871;n </label>
    			<input type='text' class='text'/>
    		</div>
    		<div class="line">
    			<label>Ng&agrave;y &#273;i </label>
    			<input type='text' class='text'/>
    		</div>
    		<div class="line">
    			<label>Loại Ph&ograve;ng</label>
                <select id="cb_loaiphong" class='text'>
                    <option value="0">Phòng sang trọng</option>
                    <option value="1">Phòng cao cấp</option>
                    <option value="2">Phòng gia đình</option>
                    <option value="3">Phòng hội nghị</option>
                </select>
    		</div>
            <div class="line">
    			<label>SL phòng </label>
    			<input type='text' class='text'/>
    		</div>
    		<input  type="submit" value="T&igrave;m ki&#7871;m" style="margin: 10px 0 0 0;"/>
        </div>
		
        <div class="clear"></div>
	</div>
	
    	<!--******************************************************loai phong**********-->
     <div id="danhmuc" class="moduletable color2">
		<h3>DANH MỤC LOẠI PHÒNG </h3>
        <div class="moduletable_content">
            <div class="k2CategoriesListBlock  color2" id="k2ModuleBox47">
	           <ul class="level0">
                <li><a href="<?php echo tep_href_link(FILENAME_DEFAULT); ?>"><span>Nhóm loại phòng</span></a>
                    <ul class="level1">                        
                        <li><a href="<?php echo tep_href_link(FILENAME_DEFAULT,'room_type_categories=1');?>"><span>Phòng Sang Trọng ( 20)</span></a></li>
                        <li><a href="<?php echo tep_href_link(FILENAME_DEFAULT,'room_type_categories=2');?>"><span>Phòng Cao Cấp ( 25)</span></a></li>
                        <li><a href="<?php echo tep_href_link(FILENAME_DEFAULT,'room_type_categories=3');?>"><span>Phòng Gia Đình ( 40)</span></a></li>
                        <li><a href="<?php echo tep_href_link(FILENAME_DEFAULT,'room_type_categories=4');?>"><span>Phòng Hội Nghị ( 15)</span></a></li>
                    </ul>
                </li>
               </ul>
            </div>
        </div>

	</div>
    
</div>
