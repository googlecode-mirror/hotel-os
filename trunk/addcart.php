<?php
require('includes/application_top.php');
	session_start(); 
	session_register('cart_room');
    //$_SESSION['cart_room'];
	$id=$HTTP_GET_VARS['room_type_id'];
    echo "TEST ".$HTTP_GET_VARS['stay_dates'];
	
	function duration_vip($duration)
        {
            $time = $duration;
            $day = floor($time/(3600*24));
            $hour = floor(($time%(3600*24))/(3600));
            $minute = floor(($time%(3600))/(60));
            if($minute!=0)
            {
                $time = $minute.'';
            }
            else
            {
                $time='';
            }  
            if($hour!=0)
            {
                $time = $hour.'h'.$time;
            }
            if($day!=0)
            {
                $time = $day.' ngày '.$time;
            }
            return $time;
        }
	$daynum=duration_vip((daygo-dayto));	
	echo $daynum;	
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
	//tep_redirect(tep_href_link("newcart.php"));	
	exit();	
?>