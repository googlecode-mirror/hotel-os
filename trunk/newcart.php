<?php
    require('includes/application_top.php');
	$ok=1;
	if(isset($_SESSION['cart_room']))
	{
	    $_SESSION['temp']=$_SESSION['cart_room'];   
		foreach($_SESSION['cart_room'] as $k => $v)
		{
			if(isset($k))
			{
				$ok=2;
			}
		}
	}
    //echo count($_SESSION['temp']);
	if($ok == 2)
	{
		echo "<form action=newcart.php method=post>";
		//echo count($_SESSION['cart_room']);
	    foreach($_SESSION['cart_room'] as $key=>$value)
	    {
	    	$item[]=$key;
	    }
	    $str=implode(",",$item);	  
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
                    Số phòng
                </th>
                <th class='center' width="10%">
                    Số ngày ở
                </th>
                <th class='center' width="10%">
                    Gía phòng
                </th>
                <th width="10%">
                    Tổng tiền
                </th>
            </tr>
            <?php
           while($row=tep_db_fetch_array($listing_query1)){
                  echo "<tr>";
                  echo  '<td width="10%">';
                  echo   " <p>$row[room_type_name]</p>";
                  echo  "</td>";
                  echo  '<td class="center" width="10%">';
                  echo   " <p>".$HTTP_GET_VARS['comingdate']."</p>";
                  echo  "</td>";
                  echo  '<td class="center" width="10%">';
                  echo   " <p>".$HTTP_GET_VARS['stay_dates']."</p>";
                  echo  "</td>";
                  echo  "<td class=\"center\" width='10%'>";
                  echo    " <p>".$_SESSION['cart_room'][$row[room_type_id]]."</p>";
                 // echo "<p align=center> <input type=text name=qty[$row[room_type_id]] size=5 value={$_SESSION['cart_room'][$row[room_type_id]]}>  ";
                  echo  "</td>";
                  echo '<td class="center" width="10%">';
                 // echo     "<p>120.000VND</p>";
                  echo " <p>$row[room_type_price]</p>";
                  echo "</td>";
                  echo '<td width="10%">';
                 // echo    "<p>120.000VND</p>";
                  echo "<p align=right>  ". number_format($_SESSION['cart_room'][$row[room_type_id]]*$row[room_type_price],3) ." VND</p>";
                  echo "</td>";
                  echo "</tr>";
                  $total +=intval($_SESSION['cart_room'][$row[room_type_id]])*$row[room_type_price];
            }
             ?>
            <tr>
                <td width="10%" align="right" colspan="3">
                    <p>Tổng tiền</p>
                </td>
                <td id="total_price">
                    <p>&nbsp;<?php echo number_format($total,3); ?></p>
                </td>
            </tr>            
        </table>
         </form>
        <form id="userForm" name="userForm" method="get" action="xulydatphong.php">
                    <input type="submit" style="margin: 10px 15px 0 10px;" value="Thanh toán"/>                
                  
        </form>
        <form id="userForm" name="userForm" method="get" action="index.php">                    
                
                    <input type="submit" style="margin: 10px 15px 0 10px;" value="Chọn tiếp"/>
        </form>
    </div>