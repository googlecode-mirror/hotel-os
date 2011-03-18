<?php
/*
  $Id: $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2007 osCommerce

  Released under the GNU General Public License
*/

  require('includes/application_top.php');

  require(DIR_WS_CLASSES . 'currencies.php');
  $currencies = new currencies();
  
  $action = (isset($HTTP_GET_VARS['action']) ? $HTTP_GET_VARS['action'] : '');

  if (tep_not_null($action)) {
    switch ($action) {
      case 'insert':        
      case 'save':
        $room_type_id = tep_db_prepare_input($HTTP_GET_VARS['aID']);
        $sql_data_array = array('room_type_name'        => tep_db_prepare_input($HTTP_POST_VARS['name']),
                                'room_type_description' => tep_db_prepare_input($HTTP_POST_VARS['description']),
                                'room_type_count'       => tep_db_prepare_input($HTTP_POST_VARS['count']),
                                'room_type_price'       => tep_db_prepare_input($HTTP_POST_VARS['price'])
                                
                            );
        if ($action == 'insert') {
       
          tep_db_perform(TABLE_ROOM_TYPE, $sql_data_array);

          $room_type_id = tep_db_insert_id();
        } elseif ($action == 'save') {
            tep_db_perform(TABLE_ROOM_TYPE, $sql_data_array, 'update', "room_type_id = '" . (int)$room_type_id."'");
        }

        
   
     unset($sql_data_array);   
        
        $room_image = new upload('roomtype_image');
        $room_image->set_destination(DIR_FS_CATALOG_IMAGES_HOTEL);

        if ($room_image->parse() && $room_image->save()) {
          
            $sql_data_array = array('room_type_image'=>tep_db_input($room_image->filename));  
        }
        $room_image1 = new upload('image1');
        $room_image1->set_destination(DIR_FS_CATALOG_IMAGES_HOTEL);

        if ($room_image1->parse() && $room_image1->save()) {
            $sql_data_array = array_merge($sql_data_array,array('image1'=>tep_db_input($room_image1->filename)));  
        }
        $room_image2 = new upload('image2');
        $room_image2->set_destination(DIR_FS_CATALOG_IMAGES_HOTEL);

        if ($room_image2->parse() && $room_image2->save()) {
            $sql_data_array = array_merge($sql_data_array,array('image2'=>tep_db_input($room_image2->filename))); 
        }
        $room_image3 = new upload('image3');
        $room_image3->set_destination(DIR_FS_CATALOG_IMAGES_HOTEL);

        if ($room_image3->parse() && $room_image3->save()) {
           $sql_data_array = array_merge($sql_data_array,array('image3'=>tep_db_input($room_image3->filename)));
        }
        $room_image4 = new upload('image4');
        $room_image4->set_destination(DIR_FS_CATALOG_IMAGES_HOTEL);

        if ($room_image4->parse() && $room_image4->save()) {
            $sql_data_array = array_merge($sql_data_array,array('image4'=>tep_db_input($room_image4->filename)));
        }
        if(count($sql_data_array) > 0){
                   
               tep_db_perform(TABLE_ROOM_TYPE, $sql_data_array, 'update', "room_type_id = '" . (int)$room_type_id."'"); 
        }
        
       tep_redirect(tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $room_type_id));
        break;
      case 'deleteconfirm':
        $id = tep_db_prepare_input($HTTP_GET_VARS['aID']);

        tep_db_query("delete from " . TABLE_ROOM_TYPE . " where room_type_id = '" . (int)$id . "'");

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
    if ((!isset($HTTP_GET_VARS['aID']) || (isset($HTTP_GET_VARS['aID']) && ($HTTP_GET_VARS['aID'] == $admins['room_type_id']))) && !isset($aInfo) && (substr($action, 0, 3) != 'new')) {
      $aInfo = new objectInfo($admins);
    }

    if ( (isset($aInfo) && is_object($aInfo)) && ($admins['room_type_id'] == $aInfo->room_type_id) ) {
      echo '                  <tr id="defaultSelected" class="dataTableRowSelected" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $aInfo->room_type_id . '&action=edit') . '\'">' . "\n";
    } else {
      echo '                  <tr class="dataTableRow" onmouseover="rowOverEffect(this)" onmouseout="rowOutEffect(this)" onclick="document.location.href=\'' . tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $admins['room_type_id']) . '\'">' . "\n";
    }
?>
                <td class="dataTableContent"><?php echo $admins['room_type_name']; ?></td>
                <td class="dataTableContent"><img src="../images/phongkhachsan/<?php echo $admins['room_type_image']; ?>" height="70" width="70"/></td>
                <td class="dataTableContent"><?php echo $admins['room_type_description']; ?></td>
                <td class="dataTableContent"><?php echo $admins['room_type_count']; ?></td>
                <td class="dataTableContent"><?php echo $admins['room_type_price']; ?></td>
                <td class="dataTableContent"><?php echo $admins['room_type_categories']; ?></td>
                <td class="dataTableContent"><img src="../images/phongkhachsan/<?php echo $admins['image1']; ?>" height="70" width="70"/></td>
                <td class="dataTableContent"><img src="../images/phongkhachsan/<?php echo $admins['image2']; ?>" height="70" width="70"/></td>
                <td class="dataTableContent"><img src="../images/phongkhachsan/<?php echo $admins['image3']; ?>" height="70" width="70"/></td>
                <td class="dataTableContent"><img src="../images/phongkhachsan/<?php echo $admins['image4']; ?>" height="70" width="70"/></td>
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

      $contents = array('form' => tep_draw_form('roomtype', FILENAME_ROOMTYPE, 'aID=' . $aInfo->room_type_id . '&action=insert', 'post', 'enctype="multipart/form-data"') );
      $contents[] = array('text' => TEXT_INFO_INSERT_INTRO);
      $contents[] = array('text' => '<br>' . TEXT_INFO_NAME . '<br>' . tep_draw_input_field('name', $aInfo->room_type_name));
      //$contents[] = array('text' => '<br>' . tep_image(DIR_WS_CATALOG_IMAGES_HOTEL . $aInfo->room_type_image, $aInfo->room_type_name,'200','150') . '<br>' . DIR_WS_CATALOG_IMAGES_HOTEL . '<br><b>' . $aInfo->room_type_image . '</b>');
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE . '<br>' . tep_draw_file_field('roomtype_image'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_DESCRIPTION . '<br>' . tep_draw_textarea_field('description','soft','40','20',$aInfo->room_type_description));
      $contents[] = array('text' => '<br>' . TEXT_INFO_COUNT . '<br>' . tep_draw_input_field('count',$aInfo->room_type_count));
      $contents[] = array('text' => '<br>' . TEXT_INFO_PRICE . '<br>' . tep_draw_input_field('price',$aInfo->room_type_price).'VND');
      //$contents[] = array('text' => '<br>' . TEXT_INFO_CATEGORIES . '<br>' . tep_draw_input_field('catogories'));
      //$contents[] = array('text' => '<br>' . tep_image(DIR_WS_CATALOG_IMAGES_HOTEL . $aInfo->image1, $aInfo->room_type_name,'200','150') . '<br>' . DIR_WS_CATALOG_IMAGES_HOTEL . '<br><b>' . $aInfo->image1 . '</b>');
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE1 . '<br>' . tep_draw_file_field('image1'));
      //$contents[] = array('text' => '<br>' . tep_image(DIR_WS_CATALOG_IMAGES_HOTEL . $aInfo->image2, $aInfo->room_type_name,'200','150') . '<br>' . DIR_WS_CATALOG_IMAGES_HOTEL . '<br><b>' . $aInfo->image2 . '</b>');
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE2 . '<br>' . tep_draw_file_field('image2'));
      //$contents[] = array('text' => '<br>' . tep_image(DIR_WS_CATALOG_IMAGES_HOTEL . $aInfo->image3, $aInfo->room_type_name,'200','150') . '<br>' . DIR_WS_CATALOG_IMAGES_HOTEL . '<br><b>' . $aInfo->image3 . '</b>');
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE3 . '<br>' . tep_draw_file_field('image3'));
      //$contents[] = array('text' => '<br>' . tep_image(DIR_WS_CATALOG_IMAGES_HOTEL . $aInfo->image4, $aInfo->room_type_name,'200','150') . '<br>' . DIR_WS_CATALOG_IMAGES_HOTEL . '<br><b>' . $aInfo->image4 . '</b>');
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE4 . '<br>' . tep_draw_file_field('image4'));       
      $contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_save.gif', IMAGE_SAVE) . '&nbsp;<a href="' . tep_href_link(FILENAME_ROOMTYPE).'">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
      break;
    case 'edit':
      $heading[] = array('text' => '<b>' . $aInfo->room_type_name . '</b>');

      //$contents = array('form' => tep_draw_form('roomtype', FILENAME_ROOMTYPE, 'aID=' . $aInfo->room_type_id . '&action=save'));
      $contents = array('form' => tep_draw_form('roomtype', FILENAME_ROOMTYPE, 'aID=' . $aInfo->room_type_id . '&action=save', 'post', 'enctype="multipart/form-data"') );
      $contents[] = array('text' => TEXT_INFO_EDIT_INTRO);
      $contents[] = array('text' => '<br>' . TEXT_INFO_NAME . '<br>' . tep_draw_input_field('name', $aInfo->room_type_name));
      $contents[] = array('text' => '<br>' . tep_image(DIR_WS_CATALOG_IMAGES_HOTEL . $aInfo->room_type_image, $aInfo->room_type_name,'200','150') . '<br>' . DIR_WS_CATALOG_IMAGES_HOTEL . '<br><b>' . $aInfo->room_type_image . '</b>');
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE . '<br>' . tep_draw_file_field('roomtype_image'));
      $contents[] = array('text' => '<br>' . TEXT_INFO_DESCRIPTION . '<br>' . tep_draw_textarea_field('description','soft','40','20',$aInfo->room_type_description));
      $contents[] = array('text' => '<br>' . TEXT_INFO_COUNT . '<br>' . tep_draw_input_field('count',$aInfo->room_type_count));
      $contents[] = array('text' => '<br>' . TEXT_INFO_PRICE . '<br>' . tep_draw_input_field('price',$aInfo->room_type_price).'VND');
      //$contents[] = array('text' => '<br>' . TEXT_INFO_CATEGORIES . '<br>' . tep_draw_input_field('catogories'));
      $contents[] = array('text' => '<br>' . tep_image(DIR_WS_CATALOG_IMAGES_HOTEL . $aInfo->image1, $aInfo->room_type_name,'200','150') . '<br>' . DIR_WS_CATALOG_IMAGES_HOTEL . '<br><b>' . $aInfo->image1 . '</b>');
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE1 . '<br>' . tep_draw_file_field('image1'));
      $contents[] = array('text' => '<br>' . tep_image(DIR_WS_CATALOG_IMAGES_HOTEL . $aInfo->image2, $aInfo->room_type_name,'200','150') . '<br>' . DIR_WS_CATALOG_IMAGES_HOTEL . '<br><b>' . $aInfo->image2 . '</b>');
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE2 . '<br>' . tep_draw_file_field('image2'));
      $contents[] = array('text' => '<br>' . tep_image(DIR_WS_CATALOG_IMAGES_HOTEL . $aInfo->image3, $aInfo->room_type_name,'200','150') . '<br>' . DIR_WS_CATALOG_IMAGES_HOTEL . '<br><b>' . $aInfo->image3 . '</b>');
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE3 . '<br>' . tep_draw_file_field('image3'));
      $contents[] = array('text' => '<br>' . tep_image(DIR_WS_CATALOG_IMAGES_HOTEL . $aInfo->image4, $aInfo->room_type_name,'200','150') . '<br>' . DIR_WS_CATALOG_IMAGES_HOTEL . '<br><b>' . $aInfo->image4 . '</b>');
      $contents[] = array('text' => '<br>' . TEXT_INFO_IMAGE4 . '<br>' . tep_draw_file_field('image4'));       
      $contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_update.gif', IMAGE_UPDATE) . '&nbsp;<a href="' . tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $aInfo->room_type_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
      break;
    case 'delete':
      $heading[] = array('text' => '<b>' . $aInfo->user_name . '</b>');

      $contents = array('form' => tep_draw_form('room_type', FILENAME_ROOMTYPE, 'aID=' . $aInfo->room_type_id . '&action=deleteconfirm'));
      $contents[] = array('text' => TEXT_INFO_DELETE_INTRO);
      $contents[] = array('text' => '<br><b>' . $aInfo->room_type_name . '</b>');
      $contents[] = array('align' => 'center', 'text' => '<br>' . tep_image_submit('button_delete.gif', IMAGE_UPDATE) . '&nbsp;<a href="' . tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $aInfo->room_type_id) . '">' . tep_image_button('button_cancel.gif', IMAGE_CANCEL) . '</a>');
      break;
    default:
      if (isset($aInfo) && is_object($aInfo)) {

        $heading[] = array('text' => '<b>' . $aInfo->room_type_name . '</b>');

        $contents[] = array('align' => 'center', 'text' => '<a href="' . tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $aInfo->room_type_id . '&action=edit') . '">' . tep_image_button('button_edit.gif', IMAGE_EDIT) . '</a> <a href="' . tep_href_link(FILENAME_ROOMTYPE, 'aID=' . $aInfo->room_type_id . '&action=delete') . '">' . tep_image_button('button_delete.gif', IMAGE_DELETE) . '</a>');
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
