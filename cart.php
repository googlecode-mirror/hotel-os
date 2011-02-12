<?php
    require('includes/application_top.php');
	$ok=1;
	if(isset($_SESSION['cart_room']))
	{
	    $_SESSION['temp']=$_SESSION['cart_room'];   
	    echo count($_SESSION['cart_room']);	    
		foreach($_SESSION['cart_room'] as $cartItems)
		{
			
			if(isset($cartItems['roomtypeId']))
			{	
				echo $cartItems['roomtypeId'];			
				$ok=2;
			}
		}
	}
    //echo count($_SESSION['temp']);
	if($ok == 2)
	{
		echo "<form action=newcart.php method=post>";
		//echo count($_SESSION['cart_room']);
	    foreach($_SESSION['cart_room'] as $cartItems)
	    {
	    	$item[]=$cartItems['roomtypeId'];
	    	//echo $item."    ";
	    }
	 //   echo "item   :".$item;
	   $str=implode(",",$item);	 
	 //  echo "mang     ".$str; 
//	   session_start();      
	   $listing_sql1="select * from room_type where room_type_id in ($str)";      
	   $listing_split1 = new splitPageResults($listing_sql1, MAX_DISPLAY_SEARCH_RESULTS);      
       $listing_query1 = tep_db_query($listing_split1->sql_query);
     
    }       
?>

    <div id="container">
        <h3>DANH MỤC PHÒNG ĐẶT</h3>
        <table id="cart" style="margin-bottom: 20px;">
           <tr>
                <th width="10%">
                    Tên loại phòng
                </th>
                <th class='center' width="10%">
                    Ngày đến
                </th>
                <th class='center' width="10%">
                    Số ngày ở
                </th>
                <th class='center' width="10%">
                    Số phòng
                </th>
                <th class='center' width="10%">
                    Gía phòng
                </th>
                
                <th width="10%">
                    Tổng tiền
                </th>
                <th class='center' width="10%">
                   Hủy Phòng
                </th>
            </tr>
            <?php
           while($row=tep_db_fetch_array($listing_query1)){
           	foreach($_SESSION['cart_room'] as $cartItems){
           		if($cartItems['roomtypeId'] == $row[room_type_id]){
           			$keys=array_search($cartItems,$_SESSION['cart_room']);
           		  echo "<tr>";
                  echo  '<td width="10%">';
                  echo   " <p>$row[room_type_name]</p>";
                  echo  "</td>";
                  echo  '<td class="center" width="10%">';
				//  date_format($cartItems['dayto'], 'Y-m-d');
                  echo   " <p>".$cartItems['dayto']."</p>";
                  echo  "</td>";
                  echo  '<td class="center" width="10%">';
                  echo   " <p>".$cartItems['staydate']."</p>";
                  echo  "</td>";
                  echo  "<td class=\"center\" width='10%'>";
                  echo    " <p>".$cartItems['qty']."</p>";
                 // echo "<p align=center> <input type=text name=qty[$row[room_type_id]] size=5 value={$_SESSION['cart_room'][$row[room_type_id]]}>  ";
                  echo  "</td>";
                  echo '<td width="10%">';
                 // echo     "<p>120.000VND</p>";
                  echo " <p align=center>$row[room_type_price]</p>";
                  echo "</td>";
                  echo '<td width="10%">';
                 // echo    "<p>120.000VND</p>";
                  echo "<p align=right>  ". ($cartItems['qty']*$row[room_type_price]*$cartItems['staydate'])*1000 ." VND</p>";
                  echo "</td>";
                  
                  echo '<td width="10%">';
                  echo '<p align=center><a href="'. tep_href_link('delcart.php','room_type_id='.$keys).'"> Hủy </a></p>';
                  echo "</td>";
                  echo "</tr>";                
                  $total +=intval($cartItems['qty'])*$row[room_type_price]*$cartItems['staydate']*1000;
           		}
           	}
               
            }
             ?>
            <tr>
                <td width="10%" align="right" colspan="3">
                    <p>Tổng tiền</p>
                </td>
                <td id="total_price">
                    <p>&nbsp;<?php echo $total."VND"; ?></p>
                </td>
            </tr>            
        </table>
         </form>
         <?php
            require_once("nganluong.php");
            $nl=new NL_Checkout();
            $return_url="http://hotelonline.viit-group.com/complete.php";//dia chi thanh toan thanh cong
            $transaction_info="ma phong";//thong tin giao dich
            $receiver="thanhnhan_kg2000@yahoo.com";//tai khoan chu hotel
            $order_code="ma hoa don ddddd";//ma hoa don
            $price=$total;
            $url=$nl->buildCheckoutUrl($return_url, $receiver, $transaction_info, $order_code, $price);
          ?>
    
        <td colspan="2"><a href="<?php echo $url; ?>"><img border="0" src="https://www.nganluong.vn/data/images/buttons/11.gif" /></a></td>
          <input type="submit" style="margin: 10px 15px 0 10px;" value="Chọn tiếp"
                        onclick="javascript:window.href='<?php echo tep_href_link('index.php');?>';"/>
    </div>