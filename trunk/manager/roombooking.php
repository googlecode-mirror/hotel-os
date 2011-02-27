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
    function getroomtype($a,$b){
	    	$listing_sql="select * from  room_type  where  room_type_id ='".$a."'";		
		    $listing_query = tep_db_query($listing_sql);
		    $listing = tep_db_fetch_array($listing_query);
		    $temp=$listing[room_type_count]-$b;	            
	    return $temp;
		} 
    function NumDayStay($dayto,$daygo){
			list($day,$month,$year)=split('[-]', $dayto);			
			list($day2,$month2,$year2)=split('[-]', $daygo);
			$to=mktime(0,0,0,$month,$day,$year);
			$go=mktime(0,0,0,$month2,$day2,$year2);
			$temp=$go-$to;
			$daynum=$temp/(24*60*60);
			return $daynum;
		}
    function testAllDay($roomID,$roomNumber,$dayto,$daygo){
        	$n=NumDayStay($dayto, $daygo); 
        	$flag=1;
        	list($day,$month,$year)=split('[-]', $dayto);
        	for($i=0;$i<$n;$i++){        		
        		$daytest=date($year."-".$month."-".$day); 
        		$day +=1;         			
	        	$listtemp=getroomofdate($daytest);
                $id_temp="id_".$roomID;   
	        	if(getroomtype($roomID, $listtemp[$id_temp])<$roomNumber){
	        		$flag=0;                  
	        	}
        	}
        	return $flag;	
        }
  #
  # load from db roomtypcate
  #
    mysql_query("set names 'utf8'");
  $query = mysql_query("select room_type_id,room_type_name from room_type");
  while($result = mysql_fetch_array($query, MYSQL_ASSOC)){
      if(!isset($_SESSION['roomtypecat'])){
            $_SESSION['roomtypecat'] = array();            
          }
      $_SESSION['roomtypecat'][$result["room_type_id"]] = $result["room_type_name"];
  }
  
  
  $action = (isset($HTTP_GET_VARS['action']) ? $HTTP_GET_VARS['action'] : '');  
  if (tep_not_null($action) && $action=='insert') {
    $hoten = tep_db_prepare_input($HTTP_POST_VARS['hoten']);
    $email = tep_db_prepare_input($HTTP_POST_VARS['email']);
    $diachi = tep_db_prepare_input($HTTP_POST_VARS['diachi']);
    $dienthoai = tep_db_prepare_input($HTTP_POST_VARS['dienthoai']);
    $payment = $_POST['payment'];
    
    $loaiphong = $_POST["cb_loaiphong"];
    $tempArr = split("-",$loaiphong);
    $roomTypeId = array_search(trim($tempArr[0]),$_SESSION['roomtypecat']);
    $loaiphongName = trim($tempArr[0]);
    $price = trim($tempArr[1]);
    $dayto = tep_db_prepare_input($HTTP_POST_VARS['ngayden']);
    $daygo = tep_db_prepare_input($HTTP_POST_VARS['ngaydi']);
    $songayo=NumDayStay($dayto,$daygo);
    $roomcout = tep_db_prepare_input($HTTP_POST_VARS['soluongphong']);
    
    $total = tep_db_prepare_input($HTTP_POST_VARS['total']);
    $sql_data_array = array('customers_firstname' => $hoten,
		    					  'customers_lastname' => $diachi,
		                          'customers_email_address' => $email,
		                          'customers_telephone' => $dienthoai) ;
                    tep_db_perform(TABLE_CUSTOMERS, $sql_data_array);
		            $customer_id = tep_db_insert_id();  
                    $dateset=date("Y-m-d");
                    $account_id=null; 
   $sql_data_array = array('booking_form_dateset' => $dateset,		    				 
		                      'booking_form_custommers_id' => $customer_id,
		                      'booking_form_account_id' => $account_id,
		                      'booking_form_payment_methods_id' =>  $payment,
                              'booking_form_total_price'=>$total/1000
		                      );
	  
	                          tep_db_perform(booking_form, $sql_data_array);
	                          $booking_form_id= tep_db_insert_id(); 
                list($day,$month,$year)=split('[-]', $dayto);
                $ngayden=date($year."-".$month."-".$day); 
                list($day2,$month2,$year2)=split('[-]', $dayto);
                $ngaydi=date($year2."-".$month2."-".$day2); 
    $sql_data_array = array('detail_booking_form_type_room_id' => $roomTypeId,
                              'detail_booking_form_id'=>$booking_form_id,
		    				  'detail_booking_form_dateto' => $ngayden,
		                      'detail_booking_form_datego' =>  $ngaydi,	                      
	                          'detail_booking_form_staydate' =>  $songayo,
                              'detail_booking_form_number_room'=> $roomcout,		                      
		                      'detail_booking_form_price' =>  $price);	  
	                          tep_db_perform(detail_booking_form, $sql_data_array);
                           list($day,$month,$year)=split('[-]', $dayto);
                              $n=$songayo;                               
                               for($i=0;$i<$n;$i++){  
                                    $daytest=date($year."-".$month."-".$day); 
            		                  $day +=1;                                     
                                  	 $listing2=getroomofdate($daytest);                                                                          
                                     $id_status_room="id_".$roomTypeId; 
                                     list($name,$room_id)=split('[_]', $roomTypeId);                                     
                                     $num_room= $listing2[$id_status_room] +$roomcout ;         
                                     tep_db_query("update status_room set ". $id_status_room." = '" . (int)$num_room . "' where status_room_dayofyear = '" . $daytest . "'");                    
	                          }
    $prepaid = tep_db_prepare_input($HTTP_POST_VARS['prepaid'])/1000;
    $remain = tep_db_prepare_input($HTTP_POST_VARS['remain'])/1000;   
    $sql_data_array = array('booking_form_id' => $booking_form_id,
                              'prepay'=>$prepaid,
		    				  'remain' => $remain);	  
	                          tep_db_perform(prepaid, $sql_data_array);       
    tep_redirect(tep_href_link(FILENAME_ROOMBOOKING));              
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

    <form id="managerForm" action="<?php echo tep_href_link(FILENAME_ROOMBOOKING,"action=insert") ?>" method="post">
                	<div id="managerBooking">
                            <div class="line">
                			<label for="hoten"> Họ tên KH </label>
                			<input id="hoten" type="text" class="text" name="hoten" />
                			</div>
                			<div class="line">
                			<label for="email">&#272;&#7883;a ch&#7881; email </label>
                			<input id="email" type="text" class="text" name="email"/>
                			</div>
                			<div class="line">
                			<label for="diachi"> &#272;&#7883;a ch&#7881;  </label>
                			<input id="diachi" type="text" class="text" name="diachi"/>
                			</div>      
                			<div class="line">
                			<label for="dienthoai">&#272;i&#7879;n tho&#7841;i li&ecirc;n l&#7841;c </label>
                			<input id="dienthoai" type="text" class="text" name="dienthoai"/>
                			</div>
                            
                            <div class="line">
                			<label for="cb_dmphong"> Danh mục phòng  </label>
                			<select id="cb_dmphong" class="text" name="cb_dmphong">
                                <option value="0" selected="selected"> --------- </option>          
                                <option value="1">Phòng sang trọng</option>
                                <option value="2">Phòng cao cấp</option>
                                <option value="3">Phòng gia đình</option>
                                <option value="4">Phòng hội nghị</option>
                            </select>
                			</div>                         
                            <div class="line">
                			<label for="ngayden"> Loại phòng</label>
                			<select style="width:50%;" id="cb_loaiphong" name="cb_loaiphong">
                            </select>
                			</div> 
                                                                                                                
                            <div class="line">
                			<label for="ngayden"> Ngày đến  </label>
                			<input id="ngayden" type="text" class="text" name="ngayden"/>
                			</div> 
                            <div class="line">
                			<label for="ngaydi"> Ngày đi  </label>
                			<input id="ngaydi" type="text" class="text" name="ngaydi"/>
                			</div>
                            <div class="line">
                			<label for="soluongphong"> Số lượng phòng  </label>
                			<input id="soluongphong" type="text" class="text" name="soluongphong"/>
                			</div>
                            <div class="line">
                            <p>Phương thức thanh toán</p>                			
                			<input id="cash" type="radio" checked="true"  name="payment" class="payment" value="0"/>Tiền mặt
                			</div>
                            <div class="line">
                			<label for="total"> Tổng tiền</label>
                			<input id="total" type="text" class="text" name="total"/>
                			</div>
                            <div class="line">
                			<label for="prepaid"> Đặt cọc</label>
                			<input id="prepaid" type="text" class="text" name="prepaid"/>
                			</div>
                            <div class="line">
                			<label for="remain"> Còn lại</label>
                			<input id="remain" type="text" class="text" name="remain"/>
                			</div>
                	</div>
                	
                		<input type="submit" value="&#272;&#7863;t ph&ograve;ng"/>
                </form>
        </tr>
      <!--end dat phong -->
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