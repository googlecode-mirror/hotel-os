<?php
require_once('includes/application_top.php');
	$id=$HTTP_GET_VARS['room_type_id'];
    $songayo = $HTTP_GET_VARS['stay_dates'];
	//$ngayden = $HTTP_GET_VARS['comingdate'];
	$ngayden= date("Y-m-d", mktime(0, 0, 0, $_GET['comingmonth'], $_GET['comingdate'], $_GET['comingyear']));

	if(isset($_SESSION['cart_room']))
	{	
        $flag=0;
		foreach($_SESSION['cart_room'] as $cartItems)
		{				
			if($cartItems['roomtypeId'] == $id)
			{
			 $flag=1;
             $keys=array_search($cartItems,$_SESSION['cart_room']);			 			 
			 $qty= $cartItems['qty']+1;         
		     $cartItems['qty']=$qty;
		     $cartItems['staydate']=$songayo;
             $cartItems['dayto']=$ngayden;
             	$_SESSION['cart_room'][$keys]=$cartItems;	  
		    		     
			}				 
		}
        if($flag==0){
             $qty=1; 			 
			 array_push($_SESSION['cart_room'],array( "qty" => $qty,
                                               "roomtypeId" => $id ,
			 									"staydate" =>  $songayo,
			 									"dayto"=> $ngayden                                        
                                              ));   
        }
	}
	else 
	{		
	    $qty=1; 	    
	    $_SESSION['cart_room'][] = array( "qty" => $qty,
                                               "roomtypeId" => $id,
	    										"staydate" =>  $songayo,
	    										"dayto"=> $ngayden
			 								  );   
	}    
	tep_redirect(tep_href_link("cart.php"));
	exit();	
?>
