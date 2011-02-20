<?php
require('includes/application_top.php');
//	session_start();
	$cart=$_SESSION['cart_room'];
	$id=$_GET['room_type_id'];	
//	echo count($_SESSION['cart_room']);
	if($id == 100)
	{
	 unset($_SESSION['cart_room']);	
	}
	else
	{		
	  unset($_SESSION['cart_room'][intval($id)]);
	 // foreach($_SESSION['cart_room'] as $cartItems)
	//	{				
	//		if($cartItems['roomtypeId'] == $id)
	//		{			 
        //     $keys=array_search($cartItems,$_SESSION['cart_room']);	
  	     //    unset($_SESSION['cart_room'][$keys]);	
		//	}				 
	//	} 
	}
	//header("location:cart.php");
	tep_redirect(tep_href_link("ReviewShopCart.php"));
	exit();
?>