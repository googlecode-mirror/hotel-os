<?php  


	require('includes/application_top.php');	    
 	require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_LOGIN);
   
 	$email_address = tep_db_prepare_input($HTTP_POST_VARS['email']);
  	$password= tep_db_prepare_input($HTTP_POST_VARS['password']);
  	 $error = false;
  	 // Check if email exists
    $check_customer_query = tep_db_query("select customers_id, customers_firstname, customers_password, customers_email_address, customers_default_address_id from " . TABLE_CUSTOMERS . " where customers_email_address = '" . tep_db_input($email_address) . "'");
    if (!tep_db_num_rows($check_customer_query)) {
      $error = true;
        echo TEXT_LOGIN_ERROR;
    } else {
      $check_customer = tep_db_fetch_array($check_customer_query);
// Check that password is good
      if (!tep_validate_password($password, $check_customer['customers_password'])) {
        $error = true;   
        echo ENTRY_PASSWORD_NEW_TEXT ;  
      } else {
        if (SESSION_RECREATE == 'True') {
          tep_session_recreate();
        }
      		
        $customer_id = $check_customer['customers_id'];       
        $customer_first_name = $check_customer['customers_firstname'];    
        $_SESSION['customer']= $customer_id;
        $arrays = $_SESSION['cart_room'];
        tep_session_register('customer_id');     
        tep_session_register('customer_first_name');
        #luu giu session hien tai osCsid
        unset($_SESSION['cart_room']);
        $_SESSION['cart_room'] = $arrays;
               tep_redirect(tep_href_link(FILENAME_DEFAULT));          
               	
      }
    }
?>