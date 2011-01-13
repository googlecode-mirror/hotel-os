<?php
require('includes/application_top.php');
	session_start(); 
	//session_register('cart_room');
//	$_SESSION['cart_room'][] = array( "qty" => $qty,
//                               "roomtypeId" => $roomtypeID                                
//                                );
   // $_SESSION['cart_room'];
	$id=$HTTP_GET_VARS['room_type_id'];
//	$dayto= tep_db_prepare_input($HTTP_POST_VARS['dateden']);
//	$daygo= tep_db_prepare_input($HTTP_POST_VARS['datedi']);
//	$dayto=date("2011-1-13");
//	$daygo=date("2011-1-14");
//	list($year,$month,$day)=split('[-]', $dayto);
//	list($year2,$month2,$day2)=split('[-]', $daygo);
	//echo "Month: $month; Day: $day; Year: $year<br />\n";
	
	//echo "Ngày đến".$dayto;
	//echo "Ngày đi".$daygo;
//	echo $to=mktime(0,0,0,$month,$day,$year)."<br />";
//	echo $go=mktime(0,0,0,$month2,$day2,$year2)."<br />";
//	echo "    ".$temp=$go-$to."<br />";
//	$daynum=$temp/(24*60*60);
//	echo "so ngay :  ".$daynum;	
	//$array=$_SESSION['cart_room'];
	if(isset($_SESSION['cart_room']))
	{
		
		foreach($_SESSION['cart_room'] as $cartItems)
		{	
			echo $cartItems['roomtypeId']."      gia tri id:".$id;
			
			if($cartItems['roomtypeId'] == $id)
			{
			 echo "bang nhau";				
			 //$_SESSION['cart_room'][$qty] = $_SESSION['cart_room'][$qty] + 1;
			 echo  "sluong cu  ".$cartItems['qty']."   ";			 
			 $qty= $cartItems['qty']+1;
		     $cartItems['qty']=$qty;		   
		     echo "sl moi  :" .$cartItems['qty'];		     
			}
			else
			{
			 $qty=1; 
			 echo "testtttttttttt";
			 $_SESSION['cart_room'][] = array( "qty" => $qty,
                                               "roomtypeId" => $id                                              
                                              );   
		 	}			 
		}
	}
	else 
	{
		echo "aaaaaaaa";	
	    $qty=1; 	    
	    $_SESSION['cart_room'][] = array( "qty" => $qty,
                                               "roomtypeId" => $id
			 								  );   
	}
	echo "so session   ".count($_SESSION['cart_room'])."      ";
	//echo $_SESSION['cart_room'][$id];
	//echo $id;
	//header("location:cart.php");
	//tep_redirect(tep_href_link("newcart.php"));	
	exit();	
?>
