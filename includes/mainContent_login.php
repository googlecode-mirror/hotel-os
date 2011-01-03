
<!-- body //-->
<table border="0" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td class="col_left">

   </td>
<!-- body_text //-->
    <td width="100%" class="col_center"><?php echo tep_draw_form('login', tep_href_link(FILENAME_LOGIN, 'action=process', 'SSL')); ?><table border="0" width="100%" cellspacing="0" cellpadding="0">
      <tr>
        <td>

<? tep_draw_heading_top();?>
		
<? new contentBoxHeading_ProdNew($info_box_contents);?>

<? tep_draw_heading_top_1();?>

<?php
  if ($messageStack->size('login') > 0) {
?>
      
		<table cellpadding="0" cellspacing="0" border="0">
			<tr><td><?php echo $messageStack->output('login'); ?></td></tr>
			<tr><td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td></tr>
		</table>
<?php
  }

  if ($cart->count_contents() > 0) {
?>
      <table cellpadding="0" cellspacing="0" border="0">
	  	<tr><td class="smallText padd_1"><?php echo TEXT_VISITORS_CART; ?></td></tr>
		<tr><td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '10'); ?></td></tr>
	  </table>
<?php
  }
?>

		
		<table border="0" cellspacing="3" cellpadding="2">
          <tr>
            <td class="main" width="50%" valign="top"><b><?php echo HEADING_NEW_CUSTOMER; ?></b></td>
            <td class="main" width="50%" valign="top"><b><?php echo HEADING_RETURNING_CUSTOMER; ?></b></td>
          </tr>
          <tr>
            <td width="50%" height="100%" valign="top">
			
<?php echo tep_draw_infoBox_top();?>
                
                <table border="0" width="100%" height="100%" cellspacing="4" cellpadding="2" style=" height:220px;">
                  <tr><td class="main" valign="top"><?php echo TEXT_NEW_CUSTOMER . '<br><br>' . TEXT_NEW_CUSTOMER_INTRODUCTION; ?></td></tr>
                  <tr><td><?php echo tep_draw_separator('pixel_trans.gif', '100%', '5'); ?></td></tr>
                  <tr><td>
					  <table border="0" width="100%" cellspacing="0" cellpadding="2">
						  <tr>
							<td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '5', '1'); ?></td>
							<td align="right"><?php echo '<a href="' . tep_href_link(FILENAME_CREATE_ACCOUNT, '', 'SSL') . '">' . tep_image_button('button_continue.gif', IMAGE_BUTTON_CONTINUE) . '</a>'; ?><br style="line-height:1px;"><br style="line-height:5px;"></td>
							<td width="10"><?php echo tep_draw_separator('pixel_trans.gif', '5', '1'); ?></td>
						  </tr>
						</table></td>
					  </tr>
					</table>
                    
<?php echo tep_draw_infoBox_bottom();?>	
		
			</td>
            <td width="50%" height="100%" valign="top">
            
<?php echo tep_draw_infoBox_top();?>			
                
                <table border="0" width="100%" height="100%" cellspacing="4" cellpadding="2" style=" height:220px;">
                  <tr><td class="main" colspan="2"><?php echo TEXT_RETURNING_CUSTOMER; ?></td></tr>
                  <tr><td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '100%', '5'); ?></td> </tr>
                  <tr><td class="main"><b><?php echo ENTRY_EMAIL_ADDRESS; ?></b><br style="line-height:1px;"><br style="line-height:5px;"><?php echo tep_draw_input_field('email_address'); ?></td></tr>
                  <tr><td class="main"><b><?php echo ENTRY_PASSWORD; ?></b><br style="line-height:1px;"><br style="line-height:5px;"><?php echo tep_draw_password_field('password'); ?></td></tr>
                  <tr><td colspan="2"><?php echo tep_draw_separator('pixel_trans.gif', '100%', '5'); ?></td></tr>
                  <tr><td class="smallText" colspan="2"><?php echo '<a href="' . tep_href_link(FILENAME_PASSWORD_FORGOTTEN, '', 'SSL') . '">' . TEXT_PASSWORD_FORGOTTEN . '</a>'; ?></td></tr>
                  <tr><td colspan="2">
					<table border="0" width="100%" cellspacing="0" cellpadding="2">
                      <tr>
                        <td><?php echo tep_draw_separator('pixel_trans.gif', '5', '1'); ?></td>
                        <td align="right" class="bg_input"><?php echo tep_image_submit('button_sign_in1.gif', IMAGE_BUTTON_LOGIN); ?><br style="line-height:1px;"><br style="line-height:5px;"></td>
                        <td><?php echo tep_draw_separator('pixel_trans.gif', '5', '1'); ?></td>
                      </tr>
                    </table>
					</td></tr>
                </table>
                
<?php echo tep_draw_infoBox_bottom();?>                


			</td>
          </tr>
        </table>
		
<? tep_draw_heading_bottom_1();?>
      		
<? tep_draw_heading_bottom();?>
	
		</td>
      </tr>
    </table></form></td>
<!-- body_text_eof //-->
    <td class="col_right">

    </td>
  </tr>
</table>