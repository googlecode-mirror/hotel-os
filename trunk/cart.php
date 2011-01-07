<?php
require('includes/application_top.php');
//	if(isset($_POST['submit']))
//	{
//		foreach($_POST['qty'] as $key=>$value)
//		{
//	  		if( ($value == 0) and (is_numeric($value)))
//	  		{
//	  			 unset ($_SESSION['cart_room'][$key]);
//	  		}
//	  		elseif(($value > 0) and (is_numeric($value)))
//	  		{
//	   			$_SESSION['cart_room'][$key]=$value;
//	  		}	
//		}
//	 header("location:cart.php");
//	}
	
?>	<html>
		<head>			
	 <link rel="stylesheet" href="style.css" />
	</head>
		<body>
			
<?php
	$ok=1;
	if(isset($_SESSION['cart_room']))
	{
		foreach($_SESSION['cart_room'] as $k => $v)
		{
			if(isset($k))
			{
				$ok=2;
			}
		}
	}
	if($ok == 2)
	{
		echo "<form action=cart.php method=post>";
		echo count($_SESSION['cart_room']);
	    foreach($_SESSION['cart_room'] as $key=>$value)
	    {
	    	$item[]=$key;
	    }
	    $str=implode(",",$item);	  
	   session_start();
	   $listing_sql1="select * from room_type where room_type_id in ($str)";	 
	   $listing_split1 = new splitPageResults($listing_sql1, MAX_DISPLAY_SEARCH_RESULTS);
       $listing_query1 = tep_db_query($listing_split1->sql_query);	        
       ?>
<table width="50%" cellpadding="0" cellspacing="0" border="1">
	<tr>
	<td>Tên Loại Phòng</td>
	<td>Giá</td>
	<td>số Lượng</td>
	<td>Thành Tiền</td>
	<td>Hủy Loại này</td>	
	</tr>
<?php 		
	   while($row=tep_db_fetch_array($listing_query1))
	   {
	   	  echo "<tr>";
		  // echo "<div class=pro>";
		  echo "<td>$row[room_type_name]</td>";
		  echo "<td>  ".number_format($row[room_type_price],3)." VND</td>";
		  echo "<td><p align=center>So Luong: <input type=text name=qty[$row[room_type_id]] size=5 value={$_SESSION['cart_room'][$row[room_type_id]]}> </td> ";		  
		  echo "<td><p align=right>  ". number_format($_SESSION['cart_room'][$row[room_type_id]]*$row[room_type_price],3) ." VND</p></td>";
		  echo '<td><a href="'. tep_href_link("delcart.php",'room_type_id= '. $row['room_type_id']).'">Hủy</a></td>';		  
		  // echo "</div>";
		  echo "</tr>";
		   $total+=$_SESSION['cart_room'][$row[room_type_id]]*$row[room_type_price];
   
	   }
	   ?>
	   	
</table>
	   <?php 
	   echo "<div class=pro align=center>";
	   echo "<b>Tong tien cho cac mon hang: <font color=red>". number_format($total,3)." VND</font></b>";
	   echo "</div>";
	   echo "<input type='submit' name=submit value='Cap Nhat Gio Hang'>";
	   echo "<div class=pro align=center>";
	   echo "<b><a href=index.php>Mua Sach Tiep</a> - '<a href=delcart.php?room_type_id=0>Xoa Bo Gio Hang</a>'</b>";
	   echo "</div>";
	}
	else
	{
		echo "<div class=pro>";
	    echo '<p align=center>Ban khong co mon hang nao trong gio hang<br /><a href=index.php>Buy Ebook</a></p>';
	    echo "</div>";
	}
?>
	</body>
	</html>
