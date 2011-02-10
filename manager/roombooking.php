<?php
/*
  $Id: $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2007 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');
  #checking owner role
if(!tep_session_is_registered('owner'))
     tep_redirect(tep_href_link(FILENAME_LOGIN));
     echo 'run hreer';
  $action = (isset($HTTP_GET_VARS['action']) ? $HTTP_GET_VARS['action'] : '');

  if (tep_not_null($action)) {
    switch ($action) {
      case 'insert':
        require('includes/functions/password_funcs.php');

        $username = tep_db_prepare_input($HTTP_POST_VARS['username']);
        $password = tep_db_prepare_input($HTTP_POST_VARS['password']);
        $account = tep_db_prepare_input($HTTP_POST_VARS['account_number']);
        $check_query = tep_db_query("select id from " . TABLE_MANAGERS . " where user_name = '" . tep_db_input($username) . "' limit 1");

        if (tep_db_num_rows($check_query) < 1) {
          tep_db_query("insert into " . TABLE_MANAGERS . " (user_name, user_password,role) values ('" . tep_db_input($username) . "', '" . tep_db_input(tep_encrypt_password($password)) . "',0)");
          tep_db_query("insert into " . TABLE_OWNERS . " (id, account_number) values ('" .tep_db_insert_id(). "', '" .$account . "')");
        } else {
          $messageStack->add_session(ERROR_ADMINISTRATOR_EXISTS, 'error');
        }

        tep_redirect(tep_href_link(FILENAME_ADMINISTRATORS));
        break;
      case 'save':
        require('includes/functions/password_funcs.php');

        $username = tep_db_prepare_input($HTTP_POST_VARS['username']);
        $password = tep_db_prepare_input($HTTP_POST_VARS['password']);
        $account = tep_db_prepare_input($HTTP_POST_VARS['account_number']);
        
        $check_query = tep_db_query("select id from " . TABLE_MANAGERS . " where user_name = '" . tep_db_input($owner['username']) . "'");
        $check = tep_db_fetch_array($check_query);

        if ($owner['id'] == $check['id']) {
          $owner['username'] = $username;
        }

        tep_db_query("update " . TABLE_MANAGERS . " set user_name = '" . tep_db_input($username) . "' where id = '" . (int)$HTTP_GET_VARS['aID'] . "'");

        if (tep_not_null($password)) {
          tep_db_query("update " . TABLE_MANAGERS . " set user_password = '" . tep_db_input(tep_encrypt_password($password)) . "' where id = '" . (int)$HTTP_GET_VARS['aID'] . "'");
        }
//update account_number
         tep_db_query("update " . TABLE_OWNERS . " set account_number = '" . $account . "' where id = '" . (int)$HTTP_GET_VARS['aID'] . "'");        
        tep_redirect(tep_href_link(FILENAME_ADMINISTRATORS, 'aID=' . (int)$HTTP_GET_VARS['aID']));
        break;
      case 'deleteconfirm':
        $id = tep_db_prepare_input($HTTP_GET_VARS['aID']);

        $check_query = tep_db_query("select id from " . TABLE_MANAGERS . " where user_name = '" . tep_db_input($owner['username']) . "'");
        $check = tep_db_fetch_array($check_query);

        if ($id == $check['id']) {
          tep_session_unregister('owner');
        }
        
        tep_db_query("delete from " . TABLE_OWNERS . " where id = '" . (int)$id . "'");
        tep_db_query("delete from " . TABLE_MANAGERS . " where id = '" . (int)$id . "'");

        tep_redirect(tep_href_link(FILENAME_ADMINISTRATORS));
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

               <form id="managerForm" action="" method="post">
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
                			<input id="cash" type="radio" name="payment" class="payment" value="0"/>Tiền mặt
                            <input id="card" type="radio" name="payment" class="payment" value="1"/>Thẻ tín dụng
                			</div>
                	</div>
                	<div id="bookingthe" class="hidden">                		
                			<div class="line">
                			<label for="tenchuthe"> T&ecirc;n Ch&#7911; Th&#7867; </label>
                			<input id="tenchuthe" type="text" class="text" name="tenchuthe"/>
                			</div>
                			
                			<div class="line">
                			<label> Lo&#7841;i th&#7867; </label>
                			<select name="s" size="1"	>
                			<option value="1" selected="selected">Mater Card</option>		
                			<option value="2"> Visa Card</option>                			
                			</select>
                			</div>
                			<div class="line">
                			
                			<label for="sothe">  S&#7889; th&#7867; </label>
                			<input id="sothe" type="text" class="text" name="sothe"/>
                			</div>
                			<div> 			
                			   <INPUT TYPE="checkbox" NAME="checkbox" VALUE="checkbox"> 
                			   T&ocirc;i ch&#7845;p nh&#7853;n v&#7899;i c&aacute;c &#273;i&#7873;u kho&#7843;n tr&ecirc;n
                			</div>
                		
                	</div>
                		<input type="submit" value="&#272;&#7863;t ph&ograve;ng" onclick="success.php">
                </form>
        </tr>
      <!--end dat phong -->
  <!-- start comment 
        </a>    <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr class="dataTableHeadingRow">
                <td class="dataTableHeadingContent"><?php echo 'Tên đăng nhập' ?></td>
                <td class="dataTableHeadingContent"><?php echo 'Số tài khoản ngân hàng' ?></td>
                <td class="dataTableHeadingContent" align="right"><?php echo TABLE_HEADING_ACTION ?>&nbsp;</td>
              </tr>
#<?php
#
#  $admins_query = tep_db_query("select ".TABLE_OWNERS.".id, user_name,account_number from " .
#                     TABLE_MANAGERS.",".TABLE_OWNERS . " where ".TABLE_MANAGERS.".id = ".TABLE_OWNERS.".id order by user_name");
#  while ($admins = tep_db_fetch_array($admins_query)) {
#    if ((!isset($HTTP_GET_VARS['aID']) || (isset($HTTP_GET_VARS['aID']) && ($HTTP_GET_VARS['aID'] == $admins['id']))) && !isset($aInfo) && (substr($action, 0, 3) != 'new')) {
#      $aInfo = new objectInfo($admins);
#    }
#
#    if ( (isset($aInfo) && is_object($aInfo)) && ($admins['id'] == $aInfo->id) ) {
#      echo '                  <tr id="defaultSelected" class="dataTableRowSelected" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_ADMINISTRATORS, 'aID=' . $aInfo->id . '&action=edit') . '\'">' . "\n";
#    } else {
#      echo '                  <tr class="dataTableRow" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_ADMINISTRATORS, 'aID=' . $admins['id']) . '\'">' . "\n";
#    }
#?>
#                <td class="dataTableContent"><?php echo $admins['user_name']; ?></td>
#                <td class="dataTableContent"><?php echo $admins['account_number']; ?></td>
#                <td class="dataTableContent" align="right"><?php if ( (isset($aInfo) && is_object($aInfo)) && ($admins['id'] == $aInfo->id) ) { echo tep_image(DIR_WS_IMAGES . 'icon_arrow_right.gif', ''); } else { echo '<a href="' . tep_href_link(FILENAME_ADMINISTRATORS, 'aID=' . $admins['id']) . '">' . tep_image(DIR_WS_IMAGES . 'icon_info.gif', IMAGE_ICON_INFO) . '</a>'; } ?>&nbsp;</td>
#                
#               </tr>
#<?php
 # }
#?>
#              <tr>
#                <td colspan="2" align="right"><?php echo '<a href="' . tep_href_link(FILENAME_ADMINISTRATORS, 'action=new') . '">' . tep_image_button('button_insert.gif', IMAGE_INSERT) . '</a>'; ?></td>
#              </tr>
#            </table></td>
#<?php
#  $heading = array();
#  $contents = array();
#
#  switch ($action) {
#    case 'new':
#      $heading[] = array('text' => '<b>' . TEXT_INFO_HEADING_NEW_ADMINISTRATOR . '</b>');
#
#      $contents = array('form' => tep_draw_form('administrator', FILENAME_ADMINISTRATORS, 'action=insert'));
#      $contents[] = array('text' => TEXT_INFO_INSERT_INTRO);
#      $contents[] = array('text' => '<br>' . TEXT_INFO_USERNAME . '<br>' . tep_draw_input_field('username'));
#      $contents[] = array('text' => '<br>' . TEXT_INFO_PASSWORD . '<br>' . tep_draw_password_field('password'));
#      $contents[] = array('text' => '<br>' . TEXT_INFO_ACCOUNT . '<br>' . tep_draw_input_field('account_number'));
#      $contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_save.gif', IMAGE_SAVE) . '&nbsp;<a href="' . tep_href_link(FILENAME_ADMINISTRATORS) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
#      break;
#    case 'edit':
#      $heading[] = array('text' => '<b>' . $aInfo->user_name . '</b>');
#
#      $contents = array('form' => tep_draw_form('administrator', FILENAME_ADMINISTRATORS, 'aID=' . $aInfo->id . '&action=save'));
#      $contents[] = array('text' => TEXT_INFO_EDIT_INTRO);
#      $contents[] = array('text' => '<br>' . TEXT_INFO_USERNAME . '<br>' . tep_draw_input_field('username', $aInfo->user_name));
#      $contents[] = array('text' => '<br>' . TEXT_INFO_NEW_PASSWORD . '<br>' . tep_draw_password_field('password'));
#      $contents[] = array('text' => '<br>' . TEXT_INFO_ACCOUNT . '<br>' . tep_draw_input_field('account_number'));
#      $contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_update.gif', IMAGE_UPDATE) . '&nbsp;<a href="' . tep_href_link(FILENAME_ADMINISTRATORS, 'aID=' . $aInfo->id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
#      break;
#    case 'delete':
#      $heading[] = array('text' => '<b>' . $aInfo->user_name . '</b>');
#
#      $contents = array('form' => tep_draw_form('administrator', FILENAME_ADMINISTRATORS, 'aID=' . $aInfo->id . '&action=deleteconfirm'));
#      $contents[] = array('text' => TEXT_INFO_DELETE_INTRO);
#      $contents[] = array('text' => '<br><b>' . $aInfo->user_name . '</b>');
#      $contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_delete.gif', IMAGE_UPDATE) . '&nbsp;<a href="' . tep_href_link(FILENAME_ADMINISTRATORS, 'aID=' . $aInfo->id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
#      break;
#    default:
#      if (isset($aInfo) && is_object($aInfo)) {
#        $heading[] = array('text' => '<b>' . $aInfo->user_name . '</b>');
#
#        $contents[] = array('align' => 'center', 'text' => '<a href="' . tep_href_link(FILENAME_ADMINISTRATORS, 'aID=' . $aInfo->id . '&action=edit') . '">' . tep_image_button('button_edit.gif', IMAGE_EDIT) . '</a> <a href="' . tep_href_link(FILENAME_ADMINISTRATORS, 'aID=' . $aInfo->id . '&action=delete') . '">' . tep_image_button('button_delete.gif', IMAGE_DELETE) . '</a>');
#      }
#      break;
#  }
#
#  if ( (tep_not_null($heading)) && (tep_not_null($contents)) ) {
#    echo '            <td width="25%" valign="top">' . "\n";
#
#    $box = new box;
#    echo $box->infoBox($heading, $contents);
#
#    echo '            </td>' . "\n";
#  }
#?>
          </tr>
end comment-->
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
