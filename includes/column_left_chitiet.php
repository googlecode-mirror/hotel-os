<?php
/*
  $Id: column_left.php,v 1.15 2003/07/01 14:34:54 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License
*/
// if (isset($listing1['room_type_categories'])){
//	   		$listing_sql5 = "select * from " . room_type .  "  where room_type_categories= '" . (int)$listing1['room_type_categories'] . "'and room_type_id <>'".(int)$listing1['room_type_id']."' ";
//	  	    }
//	  	    $temp;
//	  	    $listing_split5 = new splitPageResults($listing_sql5, MAX_DISPLAY_SEARCH_RESULTS);
//      		$listing_query5 = tep_db_query($listing_split5->sql_query);
//	       while( $listing5 = tep_db_fetch_array($listing_query5)){
//	       	$temp=$listing5;
//	       }  
//	        
//	    	echo $temp["room_type_name"];
//	        echo  mysql_num_rows($listing_query5); 


function getroom($i,$cateID,$roomID){
	$j=0;	
	$listing_sql5 = "select * from " . room_type .  "  where room_type_categories= '" . $cateID . "'and room_type_id <>'".$roomID."' ";
  	    
    $listing_split5 = new splitPageResults($listing_sql5, MAX_DISPLAY_SEARCH_RESULTS);
   	$listing_query5 = tep_db_query($listing_split5->sql_query);   
	while ($row=tep_db_fetch_array($listing_query5)){		
		if ($i==$j){
			return $row;
		}
		$j++;
	}
}

$row1=getroom(0,$listing1['room_type_categories'],$listing1['room_type_id']);
$row2=getroom(1,$listing1['room_type_categories'],$listing1['room_type_id']);
	        
?>
 
<div id="left">
	<div id="gk-right" class="column" style="width:100%">
		<div class="gk-mass gk-mass-top clearfix">
	         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
            <div class="moduletable">	
           
				<h3>Các Phòng Cùng Loại </h3>                				
                <div class="moduletable_content">
                <div id="k2ModuleBox55" class="k2ItemsBlock ">
<!--	               	<p class="modulePretext">Khách sạn chúng tôi có một số phòng cùng loại bạn có thể có nhiều lựa chọn ! Xin mời...</p>-->
	                 <ul>
                        <li class="even">

      <!-- Plugins: BeforeDisplay -->
      
      <!-- K2 Plugins: K2BeforeDisplay -->     
      
                       <a href=<?php echo   tep_href_link("chitietphong.php", 'room_type_id=' . $row1['room_type_id'] ); ?>> <?php echo $row1['room_type_name'];?></a>
      
      
      <!-- Plugins: AfterDisplayTitle -->
      
      <!-- K2 Plugins: K2AfterDisplayTitle -->
      
      <!-- Plugins: BeforeDisplayContent -->
      
      <!-- K2 Plugins: K2BeforeDisplayContent -->
      
            <div class="moduleItemIntrotext">
	      	      <a href=<?php echo   tep_href_link("chitietphong.php", 'room_type_id=' . $row1['room_type_id'] ); ?>>
	      	<img src="<?php echo images.'/'.phongkhachsan.'/'.$row1['room_type_image'];?>" alt="Jonathan Adler Villa" width="220"/>

	      </a>	
                    	      </div>
      
              
              <div class="clr"></div>
        
                    <div class="moduleItemVideo">
        	          	<span class="moduleItemVideoCaption"></span>
              	         <span class="moduleItemVideoCredits"></span>
                    </div>

      
      <div class="clr"></div>

      <!-- Plugins: AfterDisplayContent -->
      
      <!-- K2 Plugins: K2AfterDisplayContent -->
      <div class="k2store_item_price"><span class="item_price_label">Item Price : </span><span class="k2store_item_price_value">&nbsp;<?php echo  number_format($row1['room_type_price'],3)."VND";?></span></div>
          	<?php echo "dfgdgfdgfjdjfh" ;?>
			<a class="moduleItemReadMore" href=<?php echo   tep_href_link("chitietphong.php", 'room_type_id=' . $row1['room_type_id'] ); ?>>
			Chi tiết...</a>
            
      <div class="clr">
      </div>

    </li>
        <li class="odd lastItem">

      <!-- Plugins: BeforeDisplay -->
      
      <!-- K2 Plugins: K2BeforeDisplay -->
      
      
             <a href=<?php echo   tep_href_link("chitietphong.php", 'room_type_id=' . $row2['room_type_id'] ); ?>> <?php echo $row2['room_type_name'];?></a>
      
      
      <!-- Plugins: AfterDisplayTitle -->
      
      <!-- K2 Plugins: K2AfterDisplayTitle -->
      
      <!-- Plugins: BeforeDisplayContent -->

      
      <!-- K2 Plugins: K2BeforeDisplayContent -->
      
            <div class="moduleItemIntrotext">
	      	      <a href=<?php echo   tep_href_link("chitietphong.php", 'room_type_id=' . $row2['room_type_id'] ); ?>>
	      	<img src="<?php echo images.'/'.phongkhachsan.'/'.$row2['room_type_image'];?>" alt="Heidi Fleiss real mansion" width="220" />
	      </a>
	      
      	      	   </div>
      
      
      <div class="clr"></div>

            <div class="moduleItemVideo">
      	      	<span class="moduleItemVideoCaption"></span>
      	<span class="moduleItemVideoCredits"></span>
      </div>
      
      <div class="clr"></div>

      <!-- Plugins: AfterDisplayContent -->
      
      <!-- K2 Plugins: K2AfterDisplayContent -->
      <div class="k2store_item_price"><span class="item_price_label">Item Price : </span><span class="k2store_item_price_value">&nbsp;<?php echo  number_format($row2['room_type_price'],3)."VND";?></span></div>
    	<a class="moduleItemReadMore" href=<?php echo   tep_href_link("chitietphong.php", 'room_type_id=' . $row2['room_type_id'] ); ?>>
			Chi tiết...</a>
			
      <!-- Plugins: AfterDisplay -->
      
      <!-- K2 Plugins: K2AfterDisplay -->
      
      <div class="clr">
      </div>
    </li>
        <li class="clearList"></li>
  </ul>

        </div>
</div>
</div>
</div>
</div>
</div>