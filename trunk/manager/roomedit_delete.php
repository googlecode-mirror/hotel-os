<?php
/*
  $Id: $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2007 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');
  
  
function getroomofdate($day){			
			//echo $datecurent; 			
			$listing_sql2="select * from  status_room  where  status_room_dayofyear ='".$day."'";
		    $listing_query2 = tep_db_query($listing_sql2);
		    $listing2 = tep_db_fetch_array($listing_query2);
		    return $listing2;
		} 
                                    
  $display = 'none';
  if(count($_SESSION['booking_form'])>0){
            $display = 'block';
  }
  $action = (isset($HTTP_GET_VARS['action']) ? $HTTP_GET_VARS['action'] : '');

  if (tep_not_null($action)) {
    switch ($action) {
      case 'search':
        $khachhang = tep_db_prepare_input($HTTP_POST_VARS['hoten']);
        $ngaydat = tep_db_prepare_input($HTTP_POST_VARS['ngaydat']);
        list($day,$month,$year)=split('[-]', $ngaydat);
        $ngay=date($year."-".$month."-".$day);
        
        $query = "SELECT `".TABLE_BOOKING_FORM."`.`booking_form_id`, `customers_firstname` , `booking_form_dateset` , `booking_form_total_price`, `prepay`
                    FROM `".TABLE_BOOKING_FORM."` join `".TABLE_CUSTOMERS."`
                         left join `".TABLE_PREPAID."` on (`".TABLE_PREPAID."`.`booking_form_id` = `".TABLE_BOOKING_FORM."`.`booking_form_id` )
                    WHERE `booking_form_custommers_id` = `customers_id`
                    AND `customers_firstname` = '$khachhang'";
          if($ngay!='--')          
                    $query .= " AND `booking_form_dateset` = '$ngay'";
        $listing_query = tep_db_query($query);
        $arrTemp = array();
        
        while ($listing = tep_db_fetch_array($listing_query)) {
            array_push($arrTemp, $listing);  
             
        }
        
        $_SESSION['booking_form'] = $arrTemp;
        
                break;  
      case 'save':
        
        break;
      case 'deleteconfirm':
       $booking_form_id = tep_db_prepare_input($HTTP_GET_VARS['booking_form_id']);
    #remove from detail booking
        $detailquery = "select * from ".TABLE_DETAIL." where `detail_booking_form_id`='".(int)$booking_form_id ."'";
        $listDetail = tep_db_query($detailquery);
        #update status_room
        while ($details = tep_db_fetch_array($listDetail)) {
                list($year,$month,$day)=split('[-]', $details['detail_booking_form_dateto']);
                              $n=$details['detail_booking_form_staydate'];                               
                               for($i=0;$i<$n;$i++){  
                                    $daytest=date($year."-".$month."-".$day); 
            		                  $day +=1;                                     
                                  	 $listing2=getroomofdate($daytest);                                                                          
                                     $id_status_room="id_".$details['detail_booking_form_type_room_id']; 
                                     list($name,$room_id)=split('[_]', $details['detail_booking_form_type_room_id']);                                     
                                     $num_room= $listing2[$id_status_room] - $details['detail_booking_form_number_room'] ;         
                                     tep_db_query("update status_room set ". $id_status_room." = '" . (int)$num_room . "' where status_room_dayofyear = '" . $daytest . "'");                    
	                          }    
        }
        #remove
        tep_db_query("delete from " . TABLE_DETAIL. " where detail_booking_form_id  = '" . (int)$booking_form_id . "'");
        #remove booking form
        tep_db_query("delete from " . TABLE_BOOKING_FORM. " where booking_form_id = '" . (int)$booking_form_id . "'");

$key = 0;
        foreach($_SESSION['booking_form'] as $item){
            if(array_search($booking_form_id,$item) !== false){
                $key = array_search($item,$_SESSION['booking_form']);
                break;
            }
        }
        unset($_SESSION['booking_form'][$key]);
        tep_redirect(tep_href_link(FILENAME_ROOMEDIT_DELETE));
        break;
    }
  }
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<link rel="stylesheet" type="text/css" href="includes/newstyle.css">
<link rel="stylesheet" type="text/css" href="css/smoothness/jquery-ui-1.8.2.custom.css">
<script language="javascript" src="includes/general.js"></script>
<script src="js/jquery-1.4.2.min.js"></script>
<script src="js/jquery-ui-1.8.2.custom.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/loopedslider.js"></script>
<script src="js/MyScript.js"></script>

</head>
<body marginwidth="0" marginheight="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" bgcolor="#FFFFFF" onload="SetFocus();">
<!-- header //-->
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
<!-- header_eof //-->

<!-- body //-->
<table border="0" width="100%" cellspacing="2" cellpadding="2">
  <tr>
    <td width="<?php echo BOX_WIDTH; ?>" valign="top"><table border="0" width="<?php echo BOX_WIDTH; ?>" cellspacing="1" cellpadding="1" class="columnLeft">
<!-- left_navigation //-->
<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
<!-- left_navigation_eof //-->
    </table></td>
<!-- body_text //-->
    <td width="100%" valign="top">
        <h2 style="text-align: center;">THÔNG TIN ĐĂNG KÝ ĐẶT PHÒNG</h2>
           <div id="datphongForm" title="THÔNG TIN ĐẶT PHÒNG">
           <!--check chọn người đặt phòng-->
           <?php ?>
               <form id="managerbookForm" action="roomedit_delete.php?action=search" method="post">
                	<div id="managerBooking">
                            <div class="line">
                			<label> Họ tên KH </label>
                            <input id="hoten" type="text" class="text" name="hoten" />
                            </div>
                            <div class="line">
                			<label for="ngaydat"> Ngày đặt  </label>
                			<input id="ngaydat" type="text" class="text" name="ngaydat"/>
                			</div> 
                            <div class="line">
                                <input type="submit" value="Tìm kiếm" style="float: left;margin-left:160px;" />
                            </div>
                      </div>      
                </form>
                            <div class="line">
                                <h2>Kết quả tìm kiếm</h2>
                            </div>
                <!-- show result -->
                <div style="display: <?php echo $display?>;">
                   <table border="0" width="100%" cellspacing="0" cellpadding="0">
                      <tr>
                        <td valign="top">
                            <table border="0" width="100%" cellspacing="0" cellpadding="2">
                              <tr class="dataTableHeadingRow">
                                <td class="dataTableHeadingContent"><?php echo 'Tên khách hàng ' ?></td>
                                <td class="dataTableHeadingContent"><?php echo 'Ngày đặt phòng' ?></td>
                                <td class="dataTableHeadingContent"><?php echo 'Tổng tiền phải trả' ?></td>
                                <td class="dataTableHeadingContent"><?php echo 'Trả trước' ?></td>
                                <td class="dataTableHeadingContent" align="right"><?php echo TABLE_HEADING_ACTION ?>&nbsp;</td>
                              </tr>
                              <?php
                              $first = 0;
                                 foreach($_SESSION['booking_form'] as $item){
                                    if (((!isset($HTTP_GET_VARS['booking_form_id']) && $first==0) || (isset($HTTP_GET_VARS['booking_form_id']) && ($HTTP_GET_VARS['booking_form_id'] == $item['booking_form_id']) && !isset($aInfo) ))) {
                                      $aInfo = new objectInfo($item);
                                      $first++;
                                    }
                                    if ( (isset($aInfo) && is_object($aInfo)) && ($item['booking_form_id'] == $aInfo->booking_form_id) ) {
                                      echo '<tr id="defaultSelected" class="dataTableRowSelected" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_ROOMEDIT_DELETE, 'booking_form_id=' . $aInfo->booking_form_id . '&action=delete') . '\'">' . "\n";
                                    } else {
                                      echo '<tr class="dataTableRow" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_ROOMEDIT_DELETE, 'booking_form_id=' . $item['booking_form_id']) . '\'">' . "\n";
                                    }
                                    echo "<td class=\"dataTableContent\">".$item["customers_firstname"]."</td>";
                                    echo "<td class=\"dataTableContent\">".$item["booking_form_dateset"]."</td>";
                                    echo "<td class=\"dataTableContent\">".$item["booking_form_total_price"]."</td>";
                                    echo "<td class=\"dataTableContent\">".$item["prepay"]."</td>";
                                    $image='';
                                    if ( (isset($aInfo) && is_object($aInfo)) && ($item['booking_form_id'] == $aInfo->booking_form_id) ) {
                                        $image = tep_image(DIR_WS_IMAGES . 'icon_arrow_right.gif', ''); 
                                    } else { 
                                        $image = '<a href="' . tep_href_link(FILENAME_ROOMEDIT_DELETE, 'booking_form_id=' . $item['booking_form_id']) . '">' . tep_image(DIR_WS_IMAGES . 'icon_info.gif', IMAGE_ICON_INFO) . '</a>'; 
                                    }
                                    echo "<td class=\"dataTableContent\" align=\"right\">".$image."&nbsp;</td>";
                                    echo "</tr>";  
                                 }                              
                              ?>
                            </table>
                        </td>
<?php
  $heading = array();
  $contents = array();

  switch ($action) {
    case 'edit':
       break;
    case 'delete':
      $heading[] = array('text' => '<b>' . $aInfo->customers_name . '</b>');

      $contents = array('form' => tep_draw_form('del_booking_form', FILENAME_ROOMEDIT_DELETE, 'booking_form_id=' . $aInfo->booking_form_id . '&action=deleteconfirm'));
      $contents[] = array('text' => TEXT_INFO_DELETE_INTRO);
      $contents[] = array('text' => '<br><b>' . $aInfo->customers_name . '</b>');
      $contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_delete.gif', IMAGE_UPDATE) . '&nbsp;<a href="' . tep_href_link(FILENAME_ROOMEDIT_DELETE, 'booking_form_id=' . $aInfo->booking_form_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
      break;
    default:
      if (isset($aInfo) && is_object($aInfo)) {
        $heading[] = array('text' => '<b>' . $aInfo->customers_name . '</b>');

        $contents[] = array('align' => 'center', 'text' => '<a href="' . tep_href_link(FILENAME_ROOMEDIT_DELETE, 'booking_form_id=' . $aInfo->booking_form_id . '&action=delete') . '">' . tep_image_button('button_delete.gif', IMAGE_DELETE) . '</a>');
      }
      break;
  }

  if ( (tep_not_null($heading)) && (tep_not_null($contents)) ) {
    echo '            <td width="25%" valign="top">' . "\n";

    $box = new box;
    echo $box->infoBox($heading, $contents);

    echo '            </td>' . "\n";
  }
?>
                      </tr>
                   </table>
                </div>
           </div>
      </td>
<!-- body_text_eof //-->
  </tr>
</table>
<!-- body_eof //-->

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
<br>
</body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
