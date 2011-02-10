<?php
/*
  $Id: catalog.php,v 1.21 2003/07/09 01:18:53 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2002 osCommerce

  Released under the GNU General Public License
*/
?>
<!-- catalog //-->
          <tr>
            <td>
<?php
  $heading = array();
  $contents = array();

  $heading[] = array('text'  => BOX_HEADING_CATALOG,
                     'link'  => tep_href_link(FILENAME_CATEGORIES, 'selected_box=catalog'));

  if ($selected_box == 'catalog') {
    $contents[] = array('text'  => '<a href="' . tep_href_link(FILENAME_ROOMTYPE, '', 'NONSSL') . '" class="menuBoxContentLink">' . BOX_CATALOG_CATEGORIES_PRODUCTS . '</a><br>' .
                                   '<a href="' . tep_href_link(FILENAME_EMPTY_PRODUCTS, '', 'NONSSL') . '" class="menuBoxContentLink">' . BOX_CATALOG_DISPLAY_EMPTY_PRODUCTS . '</a><br>'.
                                   '<a href="' . tep_href_link(FILENAME_ROOMBOOKING, '', 'NONSSL') . '" class="menuBoxContentLink">' . BOX_CATALOG_ROOM_BOOKING . '</a><br>' .
                                   '<a href="' . tep_href_link(FILENAME_ROOMEDIT_DELETE, '', 'NONSSL') . '" class="menuBoxContentLink">' . BOX_CATALOG_ROOM_EDIT_DELETE . '</a><br>'

    );
  }

  $box = new box;
  echo $box->menuBox($heading, $contents);
?>
            </td>
          </tr>
<!-- catalog_eof //-->
