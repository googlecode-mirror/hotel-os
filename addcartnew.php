<?php
require_once('includes/application_top.php');
function getroomofdate($day){			
			//echo $datecurent; 			
			$listing_sql2="select * from  status_room  where  status_room_dayofyear ='".$day."'";		
			$listing_split2 = new splitPageResults($listing_sql2, MAX_DISPLAY_SEARCH_RESULTS);
		    $listing_query2 = tep_db_query($listing_split2->sql_query);
		    $listing2 = tep_db_fetch_array($listing_query2);
		    return $listing2;
		}
    function getroomtype($a,$b){
	    	$listing_sql="select * from  room_type  where  room_type_id ='".$a."'";		
			$listing_split = new splitPageResults($listing_sql, MAX_DISPLAY_SEARCH_RESULTS);
		    $listing_query = tep_db_query($listing_split->sql_query);
		    $listing = tep_db_fetch_array($listing_query);
		    $temp=$listing[room_type_count]-$b;	            
	    return $temp;
		} 
    function NumDayStay($dayto,$daygo){
			list($year,$month,$day)=split('[-]', $dayto);			
			list($year2,$month2,$day2)=split('[-]', $daygo);
			$to=mktime(0,0,0,$month,$day,$year);
			$go=mktime(0,0,0,$month2,$day2,$year2);
			$temp=$go-$to;
			$daynum=$temp/(24*60*60);
			return $daynum;
		}
    function testAllDay($roomID,$roomNumber,$dayto,$daygo){
        	$n=NumDayStay($dayto, $daygo); 
        	$flag=1;
        	list($year,$month,$day)=split('[-]', $dayto);
        	for($i=0;$i<$n;$i++){        		
        		$daytest=date($year."-".$month."-".$day); 
        		$day +=1;         			
	        	$listtemp=getroomofdate($daytest);
                $id_temp="id_".$roomID;                   	
	        	if(getroomtype($roomID, $listtemp[$id_temp])<$roomNumber){
	        		$flag=0;                  
	        	}
        	}
        	return $flag;	
        }
        
	$id=$HTTP_GET_VARS['room_type_id'];
    //echo "id".$id;  
    if(isset($HTTP_GET_VARS['stay_dates'])) 
    {
        $songayo=$HTTP_GET_VARS['stay_dates'];
    }
    else
    {
        $songayo=1;
    }
    	
    $dayto=$HTTP_GET_VARS['dayto'];    
    $daygo=$HTTP_GET_VARS['daygo'];  
    if(isset($daygo))
    {
        $ngayden=$dayto;
        $ngaydi=$daygo;
        $songayo=NumDayStay($ngayden,$ngaydi);
        $sofong=$HTTP_GET_VARS['count_room'];       
    }         
    else
    {
    	$ngayden= date("Y-m-d", mktime(0, 0, 0, $_GET['comingmonth'], $_GET['comingdate'], $_GET['comingyear']));
        $ngaydi= date("Y-m-d", mktime(0, 0, 0, $_GET['leavingmonth'], $_GET['leavingdate'], $_GET['leavingyear']));
        $sofong=1;   
    }   

    if(testAllDay($id,$songayo,$ngayden,$ngaydi)==1)
    {
    	if(isset($_SESSION['cart_room']))
    	{	
            $flag=0;
    		foreach($_SESSION['cart_room'] as $cartItems)
    		{				
    			if($cartItems['roomtypeId'] == $id)
    			{
    			 $flag=1;
                 $keys=array_search($cartItems,$_SESSION['cart_room']);			 			 
    			 $qty= $cartItems['qty']+$sofong;         
    		     $cartItems['qty']=$qty;
    		     $cartItems['staydate']=$songayo;
                 $cartItems['dayto']=$ngayden;
                 $cartItems['daygo']=$ngaydi;
                 	$_SESSION['cart_room'][$keys]=$cartItems;	  
    		    		     
    			}				 
    		}
            if($flag==0){
                 $qty=$sofong; 			 
    			 array_push($_SESSION['cart_room'],array( "qty" => $qty,
                                                   "roomtypeId" => $id ,
    			 									"staydate" =>  $songayo,
    			 									"dayto"=> $ngayden ,
                                                     "daygo"=>$ngaydi                                       
                                                  ));   
            }
    	}
    	else 
    	{		
    	    $qty=$sofong; 	    
    	    $_SESSION['cart_room'][] = array( "qty" => $qty,
                                                   "roomtypeId" => $id,
    	    										"staydate" =>  $songayo,
    	    										"dayto"=> $ngayden,
                                                    "daygo"=>$ngaydi 
    			 								  );   
    	}    
    	tep_redirect(tep_href_link("cart.php"));
        exit();
    }
    else
    {
        echo "Hi?n t?i không còn phòng tr?ng vào ngày b?n mu?n d?t";
    }
		
?>
