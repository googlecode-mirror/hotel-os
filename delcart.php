<?php
require('includes/application_top.php');
//	session_start();
	$cart=$_SESSION['cart_room'];
	$id=$_GET['room_type_id'];	
	echo count($_SESSION['cart_room']);
	if($id == 100)
	{
	 unset($_SESSION['cart_room']);
	
	}
	else
	{
		//echo $id;		
	  unset($_SESSION['cart_room'][intval($id)]);
	 //echo "gfgf";
	}
	//header("location:cart.php");
	tep_redirect(tep_href_link("cart.php"));
	exit();
?>