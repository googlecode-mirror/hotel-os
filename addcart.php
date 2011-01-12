<?php
require('includes/application_top.php');
	session_start(); 
	session_register('cart_room');
    //$_SESSION['cart_room'];
	$id=$HTTP_GET_VARS['room_type_id'];
	$dayto= tep_db_prepare_input($HTTP_POST_VARS['dateden']);
	$daygo= tep_db_prepare_input($HTTP_POST_VARS['datedi']);
	$dayto=date("2011-1-13");
	$daygo=date("2011-1-14");
	list($year,$month,$day)=split('[-]', $dayto);
	list($year2,$month2,$day2)=split('[-]', $daygo);
	//echo "Month: $month; Day: $day; Year: $year<br />\n";
	
	//echo "Ngày đến".$dayto;
	//echo "Ngày đi".$daygo;
	echo $to=mktime(0,0,0,$month,$day,$year)."<br />";
	echo $go=mktime(0,0,0,$month2,$day2,$year2)."<br />";
	echo "    ".$temp=$go-$to."<br />";
	$daynum=$temp/(24*60*60);
//	function duration_vip($duration)
//        {
//            $time = $duration;
//            $day = floor($time/(3600*24));
//            $hour = floor(($time%(3600*24))/(3600));
//            $minute = floor(($time%(3600))/(60));
//            if($minute!=0)
//            {
//                $time = $minute.'';
//            }
//            else
//            {
//                $time='';
//            }  
//            if($hour!=0)
//            {
//                $time = $hour.'h'.$time;
//            }
//            if($day!=0)
//            {
//                $time = $day.' ngày '.$time;
//            }
//            return $time;
//        }
//	$daynum=duration_vip(($daygo-$dayto));	
	echo "so ngay :  ".$daynum;	
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
		tep_redirect(tep_href_link("newcart.php"));	
	exit();	
?>