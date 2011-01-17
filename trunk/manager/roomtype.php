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

        $name = tep_db_prepare_input($HTTP_POST_VARS['name']);
        $image = tep_db_prepare_input($HTTP_POST_VARS['image']);
        $description = tep_db_prepare_input($HTTP_POST_VARS['description']);
        $count = tep_db_prepare_input($HTTP_POST_VARS['count']);
        $price = tep_db_prepare_input($HTTP_POST_VARS['price']);
        $categories = tep_db_prepare_input($HTTP_POST_VARS['categories']);
        $image1 = tep_db_prepare_input($HTTP_POST_VARS['image1']);
        $image2 = tep_db_prepare_input($HTTP_POST_VARS['image2']);
        $image3 = tep_db_prepare_input($HTTP_POST_VARS['image3']);
        $image4 = tep_db_prepare_input($HTTP_POST_VARS['image4']);
        $check_query = tep_db_query("select id from " . TABLE_ROOM_TYPE . " where room_type_name = '" . tep_db_input($name) . "' limit 1");

        if (tep_db_num_rows($check_query) < 1) {
          tep_db_query("insert into " . TABLE_ROOM_TYPE . 
          " (room_type_name,room_type_image,room_type_description,room_type_count,room_type_price,room_type_categories,image1,image2,image3,image4) values ('" 
          . tep_db_input($name) . "', '" . tep_db_input(($image)) . "', '".tep_db_input($description). "', '".tep_db_input($count). "', '".tep_db_input($price)
          . "', '".tep_db_input($categories). "', '".tep_db_input($image1). "', '".tep_db_input($image2). "', '".tep_db_input($image3). "', '".tep_db_input($image4));
        } else {
          $messageStack->add_session(ERROR_ADMINISTRATOR_EXISTS, 'error');
        }

        tep_redirect(tep_href_link(FILENAME_ROOMTYPE));
        break;
      case 'save':
        require('includes/functions/password_funcs.php');

        $username = tep_db_prepare_input($HTTP_POST_VARS['username']);
        $password = tep_db_prepare_input($HTTP_POST_VARS['password']);
        
        $check_query = tep_db_query("select id from " . TABLE_MANAGERS . " where user_name = '" . tep_db_input($owner['username']) . "'");
        $check = tep_db_fetch_array($check_query);

        if ($manager['id'] == $check['id']) {
          $manager['username'] = $username;
        }

        tep_db_query("update " . TABLE_ROOM_TYPE . " set user_name = '" . tep_db_input($username) . "' where id = '" . (int)$HTTP_GET_VARS['aID'] . "'");

        if (tep_not_null($password)) {
          tep_db_query("update " . TABLE_ROOM_TYPE . " set user_password = '" . tep_db_input(tep_encrypt_password($password)) . "' where id = '" . (int)$HTTP_GET_VARS['aID'] . "'");
        }

        tep_redirect(tep_href_link(FILENAME_ROOMTYPE, 'aID=' . (int)$HTTP_GET_VARS['aID']));
        break;
      case 'deleteconfirm':
        $id = tep_db_prepare_input($HTTP_GET_VARS['aID']);

        $check_query = tep_db_query("select id from " . TABLE_ROOM_TYPE . " where user_name = '" . tep_db_input($owner['username']) . "'");
        $check = tep_db_fetch_array($check_query);

        if ($id == $check['id']) {
          tep_session_unregister('owner');
        }
        
        tep_db_query("delete from " . TABLE_ROOM_TYPE . " where id = '" . (int)$id . "'");

        tep_redirect(tep_href_link(FILENAME_ROOMTYPE));
        break;
    }
  }
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<script language="javascript" src="includes/general.js"></script>
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
    <td width="100%" valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td class="pageHeading"><?php echo HEADING_TITLE ?></td>
            <td class="pageHeading" align="right"><?php echo tep_draw_separator('pixel_trans.gif', HEADING_IMAGE_WIDTH, HEADING_IMAGE_HEIGHT); ?></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><table border="0" width="100%" cellspacing="0" cellpadding="0">
          <tr>
            <td valign="top"><table border="0" width="100%" cellspacing="0" cellpadding="2">
              <tr class="dataTableHeadingRow">
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_NAME ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_IMAGE ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_DESCRIPTION ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_COUNT ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_PRICE ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_CATEGORIES ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_IMAGE1 ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_IMAGE2 ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_IMAGE3 ?></td>
                <td class="dataTableHeadingContent"><?php echo TABLE_HEADING_IMAGE4 ?></td>
                <td class="dataTableHeadingContent" align="right"><?php echo TABLE_HEADING_ACTION ?>&nbsp;</td>
              </tr>
<?php

  $admins_query = tep_db_query("select room_type_id, room_type_name,room_type_image,room_type_description,room_type_count,room_type_price,room_type_categories,image1,image2,image3,image4 from " . TABLE_ROOM_TYPE);
  while ($admins = tep_db_fetch_array($admins_query)) {
    if ((!isset($HTTP_GET_VARS['aID']) || (isset($HTTP_GET_VARS['aID']) && ($HTTP_GET_VARS['aID'] == $admins['id']))) && !isset($aInfo) && (substr($action, 0, 3) != 'new')) {
      $aInfo = new objectInfo($admins);
    }

    if ( (isset($aInfo) && is_object($aInfo)) && ($admins['id'] == $aInfo->id) ) {
      echo '                  <tr id="defaultSelected" class="dataTableRowSelected" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $aInfo->id . '&action=edit') . '\'">' . "\n";
    } else {
      echo '                  <tr class="dataTableRow" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $admins['id']) . '\'">' . "\n";
    }
?>
                <td class="dataTableContent"><?php echo $admins['room_type_name']; ?></td>
                <td class="dataTableContent"><img src="../images/<?php echo $admins['room_type_image']; ?>" height="70" width="70"/></td>
                <td class="dataTableContent"><?php echo $admins['room_type_description']; ?></td>
                <td class="dataTableContent"><?php echo $admins['room_type_count']; ?></td>
                <td class="dataTableContent"><?php echo $admins['room_type_price']; ?></td>
                <td class="dataTableContent"><?php echo $admins['room_type_categories']; ?></td>
                <td class="dataTableContent"><?php echo $admins['image1']; ?></td>
                <td class="dataTableContent"><?php echo $admins['image2']; ?></td>
                <td class="dataTableContent"><?php echo $admins['image3']; ?></td>
                <td class="dataTableContent"><?php echo $admins['image4']; ?></td>
                <td class="dataTableContent" align="right"><?php if ( (isset($aInfo) && is_object($aInfo)) && ($admins['id'] == $aInfo->id) ) { echo tep_image(DIR_WS_IMAGES . 'icon_arrow_right.gif', ''); } else { echo '<a href="' . tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $admins['id']) . '">' . tep_image(DIR_WS_IMAGES . 'icon_info.gif', IMAGE_ICON_INFO) . '</a>'; } ?>&nbsp;</td>
                
               </tr>
<?php
  }
?>
              <tr>
                <td colspan="2" align="right"><?php echo '<a href="' . tep_href_link(FILENAME_ROOMTYPE, 'action=new') . '">' . tep_image_button('button_insert.gif', IMAGE_INSERT) . '</a>'; ?></td>
              </tr>
            </table></td>
<?php
  $heading = array();
  $contents = array();

  switch ($action) {
    case 'new':
      $heading[] = array('text' => '<b>' . TEXT_INFO_HEADING_NEW_ROOM . '</b>');

      $contents = array('form' => tep_draw_form('administrator', FILENAME_MANAGER_OWNER, 'action=insert'));
      $contents[] = array('text' => TEXT_INFO_INSERT_INTRO);
      $contents[] = array('text' => '<br>' . TEXT_INFO_NAME . '<br>' . tep_draw_input_field('name'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE . '<br>' . tep_draw_input_field('image'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_DESCRIPTION . '<br>' . tep_draw_input_field('description'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_COUNT . '<br>' . tep_draw_input_field('count'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_PRICE . '<br>' . tep_draw_input_field('price'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_CATEGORIES . '<br>' . tep_draw_input_field('catogories'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE1 . '<br>' . tep_draw_input_field('image1'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE2 . '<br>' . tep_draw_input_field('image2'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE3 . '<br>' . tep_draw_input_field('image3'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE4 . '<br>' . tep_draw_input_field('image4'));
      $contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_save.gif', IMAGE_SAVE) . '&nbsp;<a href="' . tep_href_link(FILENAME_MANAGER_OWNER) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
      break;
    case 'edit':
      $heading[] = array('text' => '<b>' . $aInfo->user_name . '</b>');

      $contents = array('form' => tep_draw_form('administrator', FILENAME_MANAGER_OWNER, 'aID=' . $aInfo->id . '&action=save'));
      $contents[] = array('text' => TEXT_INFO_EDIT_INTRO);
      $contents[] = array('text' => '<br>' . TEXT_INFO_NAME . '<br>' . tep_draw_input_field('name', $aInfo->user_name));
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE . '<br>' . tep_draw_input_field('image'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_DESCRIPTION . '<br>' . tep_draw_input_field('description'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_COUNT . '<br>' . tep_draw_input_field('count'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_PRICE . '<br>' . tep_draw_input_field('price'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_CATEGORIES . '<br>' . tep_draw_input_field('catogories'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE1 . '<br>' . tep_draw_input_field('image1'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE2 . '<br>' . tep_draw_input_field('image2'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE3 . '<br>' . tep_draw_input_field('image3'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE4 . '<br>' . tep_draw_input_field('image4'));     
      $contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_update.gif', IMAGE_UPDATE) . '&nbsp;<a href="' . tep_href_link(FILENAME_MANAGER_OWNER, 'aID=' . $aInfo->id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
      break;
    case 'delete':
      $heading[] = array('text' => '<b>' . $aInfo->user_name . '</b>');

      $contents = array('form' => tep_draw_form('administrator', FILENAME_ROOMTYPE, 'aID=' . $aInfo->id . '&action=deleteconfirm'));
      $contents[] = array('text' => TEXT_INFO_DELETE_INTRO);
      $contents[] = array('text' => '<br><b>' . $aInfo->user_name . '</b>');
      $contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_delete.gif', IMAGE_UPDATE) . '&nbsp;<a href="' . tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $aInfo->id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
      break;
    default:
      if (isset($aInfo) && is_object($aInfo)) {
        $heading[] = array('text' => '<b>' . $aInfo->user_name . '</b>');

        $contents[] = array('align' => 'center', 'text' => '<a href="' . tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $aInfo->id . '&action=edit') . '">' . tep_image_button('button_edit.gif', IMAGE_EDIT) . '</a> <a href="' . tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $aInfo->id . '&action=delete') . '">' . tep_image_button('button_delete.gif', IMAGE_DELETE) . '</a>');
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
        </table></td>
      </tr>
    </table></td>
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
