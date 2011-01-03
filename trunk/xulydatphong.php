<?php
 require('includes/application_top.php');
  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_DEFAULT);
  Try{
	  $dateset=date("Y-m-d");  
	  $dateto=tep_db_prepare_input($HTTP_POST_VARS['dateden']);
	  $datego=tep_db_prepare_input($HTTP_POST_VARS['datedi']);
	  $payment=tep_db_prepare_input($HTTP_POST_VARS['payment']);
	  $numberroom=tep_db_prepare_input($HTTP_POST_VARS['numberroom']);
	  $accuont_id=null;
	  if (tep_session_is_registered('customer_first_name') && tep_session_is_registered('customer_id')){
	  	$custommer_id=$customer_first_name;
	  }
	  else{
	  	$name = tep_db_prepare_input($HTTP_POST_VARS['name']);
	  	$stress_address = tep_db_prepare_input($HTTP_POST_VARS['address']);
	  	$telephone = tep_db_prepare_input($HTTP_POST_VARS['telephone']);
	  	$sql_data_array = array('customers_firstname' => $name,
		    					  'customers_lastname' => $stress_address,
		                          'customers_gender' => $gender,
		                          'customers_dob' => $birthday,
		                          'customers_email_address' => $email_address,
		                          'customers_telephone' => $telephone,
		                          'customers_password' =>  tep_encrypt_password($password));
	    tep_db_perform(TABLE_CUSTOMERS, $sql_data_array);
		$customer_id = tep_db_insert_id();    	  
	  }
	  $sql_data_array = array('booking_form_dateset' => $dateset,
		    				  'booking_form_dateto' => $dateto,
		                      'booking_form_datego' =>  $datego,
		                      'booking_form_custommers_id' => $customer_id,
		                      'booking_form_account_id' => $accuont_id,
		                      'booking_form_payment_methods_id' =>  $payment,
		                      'booking_form_number_room' =>  $numberroom);
	  tep_db_perform(booking_form, $sql_data_array);
	  echo "Thanh cong";
  }
   catch ( Exception $e){
	    	 echo 'Exception caught: ',  $e->getMessage(), "\n";
	    	
	    }
?>