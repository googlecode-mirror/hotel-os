<?php
 require('includes/application_top.php');
 require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_CREATE_ACCOUNT);
 	$name = tep_db_prepare_input($HTTP_POST_VARS['name']);
  	$email_address = tep_db_prepare_input($HTTP_POST_VARS['email']);
   	$birthday = tep_db_prepare_input($HTTP_POST_VARS['birthday']);
    $gender = tep_db_prepare_input($HTTP_POST_VARS['gender']);
    $telephone = tep_db_prepare_input($HTTP_POST_VARS['telephone']);
    $password = tep_db_prepare_input($HTTP_POST_VARS['password']);
    $stress_address = tep_db_prepare_input($HTTP_POST_VARS['address']);
     $error = false;    
    $check_email_query = tep_db_query("select count(*) as total from " . TABLE_CUSTOMERS . " where customers_email_address = '" . tep_db_input($email_address) . "'");
    $check_email = tep_db_fetch_array($check_email_query);
      if ($check_email['total'] > 0) {
        $error = true;
        echo ENTRY_EMAIL_ADDRESS_ERROR_EXISTS;
      }
    if  ($error == false){  
	    try{
	    	 $sql_data_array = array('customers_firstname' => $name,
	    							 'customers_lastname' => $stress_address,
	                              'customers_gender' => $gender,
	                              'customers_dob' => $birthday,
	                              'customers_email_address' => $email_address,
	                              'customers_telephone' => $telephone,
	                              'customers_password' =>  tep_encrypt_password($password));
	    	  tep_db_perform(TABLE_CUSTOMERS, $sql_data_array);
	    	  if (SESSION_RECREATE == 'True') {
      			  tep_session_recreate();
      		  }
		      $customer_firstname = $name;		            
//		      tep_session_register('customer_id');
//		      tep_session_register('customer_firstname');		       
	    	  tep_redirect(tep_href_link(FILENAME_DEFAULT, '', 'SSL'));
	    }
	    catch ( Exception $e){
	    	 echo 'Exception caught: ',  $e->getMessage(), "\n";
	    	
	    }
    }
?>