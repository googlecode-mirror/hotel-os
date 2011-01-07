<?php
require('includes/application_top.php');
	session_start();
	session_register('cart_room');
	$id=$HTTP_GET_VARS['room_type_id'];
	if(isset($_SESSION['cart_room'][$id]))
	{
	 $qty = $_SESSION['cart_room'][$id] + 1;
	}
	else
	{
	 $qty=1;
	}
	$_SESSION['cart_room'][$id]=$qty;
	//echo $_SESSION['cart_room'][$id];
	//echo $id;
	//header("location:cart.php");
	tep_redirect(tep_href_link("cart.php"));	
	exit();	
?>