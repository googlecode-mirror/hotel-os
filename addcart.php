<?php
require('includes/application_top.php');
//	session_start(); 
	session_register('cart_room');
    //$_SESSION['cart_room'];
	$id=$HTTP_GET_VARS['room_type_id'];
    $songayo = $HTTP_GET_VARS['stay_dates'];
	$ngayden = $HTTP_GET_VARS['comingdate'];
    //echo "so ngay o ".$songayo. " ; ngayden ".gmdate('m/d/Y','Mon Jan 17 2011 14:53:45 GMT 0700');	
		
	$array=$_SESSION['cart_room'];	
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
    //echo tep_href_link("newcart.php","stay_dates=".$songayo);
	tep_redirect(tep_href_link("newcart.php","stay_dates=".$songayo."&comingdate=".$ngayden));	
	exit();	
?>