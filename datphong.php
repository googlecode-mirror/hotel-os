<?php
/*
  $Id: index.php,v 1.1 2003/06/11 17:37:59 hpdl Exp $

  osCommerce, Open Source E-Commerce Solutions
  http://www.oscommerce.com

  Copyright (c) 2003 osCommerce

  Released under the GNU General Public License

*/

  require('includes/application_top.php');
  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_DEFAULT);
 
         if($_GET["process"]=="pending"){
           $_SESSION['customers'] = array( "name" => $_POST['hoten'],
                                                   "email" => $_POST['email'],
    	    										"address" => $_POST['diachi'],
    	    										"telephone"=> $_POST['dienthoai']                                                 
    			 								  );   
         
            require_once("nganluong.php");
            $nl=new NL_Checkout();
            $return_url="http://hotelonline.viit-group.com/complete.php";//dia chi thanh toan thanh cong
            $transaction_info=$_GET['osCsid'];//thong tin giao dich
            $receiver="thanhnhan_kg2000@yahoo.com";//tai khoan chu hotel
            $order_code="Phòng khách sạn";//ma hoa don
            $price="2000";
            $url=$nl->buildCheckoutUrl($return_url, $receiver, $transaction_info, $order_code, $price);
         
       //  print_r($_SESSION['customers']); 
          tep_redirect($url);
          exit;
  }

 
?>

<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>  
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
 <title>Form dat phong </title>   
<base href="<?php echo (($request_type == 'SSL') ? HTTPS_SERVER : HTTP_SERVER) . DIR_WS_CATALOG; ?>">
<link rel="stylesheet" type="text/css" href="stylesheet.css">
<link href="style.css" rel="stylesheet" type="text/css" >
<link rel="stylesheet" href="css/carousel.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="smoothness/jquery-ui-1.8.2.custom.css">
<link href="newstyle.css" rel="stylesheet" type="text/css" >
<!-- black and white-->
<link href="/Khotel/templates/gk_blackandwhite/favicon.ico" rel="shortcut icon" type="image/x-icon" />
  <link rel="stylesheet" href="black_and_white_css/modal.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/k2.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/system.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/general.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/addons.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/layout.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/template.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/joomla.css" type="text/css" />

  <link rel="stylesheet" href="black_and_white_css/gk_stuff.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/typo.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/css3.css" type="text/css" />
  <link rel="stylesheet" href="black_and_white_css/style1.css" type="text/css" >
  
  <script type="text/javascript" src="black_and_white_js/mootools.js"></script>
<script type="text/javascript" src="black_and_white_js/domready_fix.js"></script>
<script type="text/javascript" src="black_and_white_js/modal.js"></script>
 <script type="text/javascript" src="black_and_white_js/k2.js"></script>
 <script type="text/javascript" src="black_and_white_js/caption.js"></script>
 <script type="text/javascript" src="black_and_white_js/gk.script.js"></script>
 <script type="text/javascript" src="black_and_white_js/engine-mootools-11.js"></script>
 <script type="text/javascript" src="black_and_white_js/k2store.js"></script>
 <script type="text/javascript" src="black_and_white_js/gk_image_show.js"></script>
 


  <script type="text/javascript">
window.addEvent("domready", function() {
	SqueezeBox.initialize({});
	$$("a.modal").each(function(el) {
		el.addEvent("click", function(e) {
			new Event(e).stop();
			SqueezeBox.fromElement(el);
		});
	});
});
var K2RatingURL = '<?php echo HTTPS_SERVER.DIR_WS_HTTP_CATALOG ?>';
  </script>




<!--[if IE 8.0]><link rel="stylesheet" href="http://localhost/Khotel/templates/gk_blackandwhite/css/ie8.css" type="text/css" /><![endif]-->
<!--[if IE 7.0]><link rel="stylesheet" href="http://localhost/Khotel/templates/gk_blackandwhite/css/ie.css" type="text/css" /><![endif]-->
<!--[if IE 7.0]><style>.clearfix { display: inline-block; } /* IE7xhtml*/</style><![endif]-->

<script type="text/javascript">
var siteurl='<?php echo HTTPS_SERVER.DIR_WS_HTTP_CATALOG ?>';
var tmplurl='templates/gk_blackandwhite';
</script>

<script src="js/jquery-1.4.2.min.js"></script>
<script src="js/jquery-ui-1.8.2.custom.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/loopedslider.js"></script>
<!--<script src="js/jquery.lightboxLib.js"></script>
-->
<script>
jQuery.noConflict();
</script>
<script src="js/MyScript.js"></script>
<script>
function gup( name )
{
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp( regexS );
  var results = regex.exec( window.location.href );
  if( results == null )
    return "";
  else
    return results[1];
}
var osCsid = gup('oscsid');
if(osCsid != "")
    {
        window.location = "http://hotelonline.viit-group.com/datphong.php?osCsid=" + osCsid;
        
    }
    
</script>

<link href="templates/gk_blackandwhite/css/menu/mega.css" rel="stylesheet" type="text/css" /><script src="templates/gk_blackandwhite/js/menu/mega.js" language="javascript" type="text/javascript"></script>

<link href="templates/gk_blackandwhite/fonts/DroidSans/stylesheet.css" rel="stylesheet" type="text/css" /><link href="templates/gk_blackandwhite/fonts/League_Gothic/stylesheet.css" rel="stylesheet" type="text/css" />
<style type="text/css">	

/*	body {
		font-family: Arial, Helvetica, sans-serif;
	}
	
    .moduletable_menu h3,
    .moduletable_text h3,
    .moduletable h3,
    #gk-popup h3,
    #gk-mainnav .level0>li>a,
	.itemRelated h3, 
	.itemAuthorLatest h3
	{
		font-family: DroidSans;
	}

	.gk_is_text h4,
	.moduletable.bigtitle h3 {
		font-family: LeagueGothic;
	}
*/
</style>
<!--Width of template -->
<style type="text/css">
.main { width: 1002px; margin: 0 auto; }
</style>

</head>
<body id="bd" class="fs3 FF">

    <?php require(DIR_WS_INCLUDES . 'popup.php'); ?>

<div id="bg-wrap">
	<!-- header top //--><?php require(DIR_WS_INCLUDES . 'header_top.php'); ?>
	<!-- header top_eof //-->
    <div id="gk-wrapper-content" class="main"> 
        <div id="gk-wrapper-content2">

	        <a name="Top" id="top"></a> 
            
            <!-- header -->
	<?php require(DIR_WS_INCLUDES . 'header.php'); ?>
            <!-- end header -->
	<!-- header_eof //-->
	<div id="gk-container">
		<!-- left_navigation //-->
		<?php require(DIR_WS_INCLUDES . 'column_left.php'); ?>
		<!-- left_navigation_eof //-->
		
		
        <?php
         $count= count($_SESSION['cart_room']);
        if($count>0)
        {
            foreach($_SESSION['cart_room'] as $cartItems)
    	    {
    	    	$item[]=$cartItems['roomtypeId'];	    
    	    }	
    	   $str=implode(",",$item);	 	      
    	   $listing_sql1="select * from room_type where room_type_id in ($str)";      
    	   $listing_split1 = new splitPageResults($listing_sql1, MAX_DISPLAY_SEARCH_RESULTS);      
           $listing_query1 = tep_db_query($listing_split1->sql_query);
       }
       ?>       
          
		<div id="mainContent">
        <h2 style="text-align: center;">DANH MỤC PHÒNG ĐẶT</h2>
        <table cellpadding="5" cellspacing="5" border="1" style="border: 1px solid;margin-bottom: 10px;">
            <tr>
                <th width="15%">
                    Tên loại phòng
                </th>
                <th class='center' width="5%">
                    Ngày đến
                </th>
                <th class='center' width="5%">
                    Số phòng
                </th>
                <th class='center' width="5%">
                    Số ngày ở
                </th>
                <th class='center' width="5%">
                    Gía phòng
                </th>
                <th width="5%">
                    Tổng tiền
                </th>
            </tr>
            <?php
           if($count>0)
           { 
           while($row=tep_db_fetch_array($listing_query1)){
           	foreach($_SESSION['cart_room'] as $cartItems){
           		if($cartItems['roomtypeId'] == $row[room_type_id]){
           			$keys=array_search($cartItems,$_SESSION['cart_room']);
           		  echo "<tr>";
                  echo  '<td width="5%">';
                  echo   " <p>$row[room_type_name]</p>";
                  echo  "</td>";
                  echo  '<td class="center" width="5%">';				
                  list($year,$month,$day)=split('[-]', $cartItems['dayto']);  
                  $dayto=date($day."-".$month."-".$year);
                  echo   " <p>".$dayto."</p>";
                  echo  "</td>";
                  echo  '<td class="center" width="5%">';
                  echo   " <p>".$cartItems['staydate']."</p>";
                  echo  "</td>";
                  echo  "<td class=\"center\" width='5%'>";
                  echo    " <p>".$cartItems['qty']."</p>";               
                  echo  "</td>";
                  echo '<td width="5%">';                
                  echo " <p align=center>$row[room_type_price].000</p>";
                  echo "</td>";   
                  echo '<td width="5%">';             
                  echo "<p align=right>  ". number_format(($cartItems['qty']*$row[room_type_price]*$cartItems['staydate']),3) ." VND</p>";
                  echo "</td>";   
                  echo "</tr>";                
                  $total +=intval($cartItems['qty'])*$row[room_type_price]*$cartItems['staydate']*1000;
                  $total1 +=intval($cartItems['qty'])*$row[room_type_price]*$cartItems['staydate'];

           		}
                }
           	} 
            }
            ?>
            <tr class="total">
                <td width="10%" align="right" colspan="5">
                    <p>Tổng tiền:</p>
                </td>
                <td id="total_price">
                    <p>&nbsp;<?php echo number_format($total1,3)." VND"; ?> </p>
                </td>
            </tr>  
            </table>
		      <h2 style="text-align: center;">THÔNG TIN ĐĂNG KÝ ĐẶT PHÒNG</h2>
           <div id="datphongForm" title="THÔNG TIN ĐẶT PHÒNG">
           <!--check chọn người đặt phòng-->          
           <input id="setMyself" type="radio" name="setRoom" class="payment" value="0"/>Đặt phòng cho chính bạn
           <input id="setFor" type="radio" name="setRoom" class="payment" value="1"/>Đặt phòng cho người khác
           
           
                <form id="signupForm" method="post" action="<?php echo tep_href_link("datphong.php","process=pending") ?>">
                	<div id="thongtinkhach">
                    <?php
                        function getInfoCustomer($id){
                    		$listing_sql2="select * from  customers  where  customers_id ='".$id."'";		
                    		$listing_split2 = new splitPageResults($listing_sql2, MAX_DISPLAY_SEARCH_RESULTS);
                    		$listing_query2 = tep_db_query($listing_split2->sql_query);
                    		$listing2 = tep_db_fetch_array($listing_query2);
                    		return $listing2;
                    		}
                          
                        if(isset($customer_id))
                        {
                            $list=getInfoCustomer($customer_id);
                            
                      ?>
                            <div class="line">
                			<label for="hoten"> Họ tên KH </label>
                			<input id="hoten" type="text" class="text" name="hoten" value="<?php echo $list['customers_firstname'] ;?>" readonly />
                			</div>
                			<div class="line">
                			<label for="email">&#272;&#7883;a ch&#7881; email </label>
                			<input id="email" type="text" class="text" name="email" value="<?php echo trim($list['customers_email_address']);?>" readonly/>
                			</div>
                			<div class="line">
                			<label for="diachi"> &#272;&#7883;a ch&#7881;  </label>
                			<input id="diachi" type="text" class="text" name="diachi" value="<?php echo $list['customers_lastname'] ;?>" readonly/>
                			</div>      
                			<div class="line">
                			<label for="dienthoai">&#272;i&#7879;n tho&#7841;i li&ecirc;n l&#7841;c </label>
                			<input id="dienthoai" type="text" class="text" name="dienthoai" value="<?php echo $list['customers_telephone'] ;?>" readonly/>
                			</div>         
                     <?php       
                        } 
                        else
                        {                  
                     ?>
                            <div class="line">
                			<label for="hoten"> Họ tên KH </label>
                			<input id="hoten" type="text" class="text" name="hoten" />
                			</div>
                			<div class="line">
                			<label for="email">&#272;&#7883;a ch&#7881; email </label>
                			<input id="email" type="text" class="text" name="email"/>
                			</div>
                			<div class="line">
                			<label for="diachi"> &#272;&#7883;a ch&#7881;  </label>
                			<input id="diachi" type="text" class="text" name="diachi"/>
                			</div>      
                			<div class="line">
                			<label for="dienthoai">&#272;i&#7879;n tho&#7841;i li&ecirc;n l&#7841;c </label>
                			<input id="dienthoai" type="text" class="text" name="dienthoai"/>
                			</div>                           
                           
                          
                    <?php }
                    
                    ?>  
                              
                            <div class="line">
                            <p>Phương thức thanh toán</p>                			
                			<input id="cash" type="radio" name="payment" class="payment" value="0"/>Tiền mặt
                            <input id="card" type="radio" name="payment" class="payment" value="1"/>Thẻ tín dụng
                			</div>      
                	</div>
                	<div id="thongtinthe" class="hidden">                		
         <input type="submit" value="&#272;&#7863;t ph&ograve;ng" style="   background: url(https://www.nganluong.vn/data/images/buttons/11.gif); border: none;
    height: 73px !important;
    line-height: 2em;
    text-indent: -9999px;
    width: 137px;">

          <!--<img border="0" src="https://www.nganluong.vn/data/images/buttons/11.gif" />-->
                		
                	</div>
                	
                <?php
                    if($_GET['oscsid'])
             {
                $url = "http://hotelonline.viit-group.com/datphong.php?osCsid=" . $_GET['osc'];
                if ( (strstr($url, "\n") != false) || (strstr($url, "\r") != false) ) {
      tep_redirect(tep_href_link(FILENAME_DEFAULT, '', 'NONSSL', false));
    }

    if ( (ENABLE_SSL == true) && (getenv('HTTPS') == 'on') ) { // We are loading an SSL page
      if (substr($url, 0, strlen(HTTP_SERVER)) == HTTP_SERVER) { // NONSSL url
        $url = HTTPS_SERVER . substr($url, strlen(HTTP_SERVER)); // Change it to SSL
      }
    }
               // echo "testttttttttt";
               //header(("datphong.php?osCsid=" . $_GET['oscsid']));
               header("Location: " . $url);
                 //tep_redirect(("datphong.php?osCsid=" . $_GET['oscsid']));
                  //tep_redirect(tep_href_link("datphong.php?osCsid=" . $_GET['oscsid'],"" ,"NONSSL" ) );
             }  
                ?>	
                </form>
            </div>
            <div class="clear"></div> </div>
            </div>
		</div>
	</div>
	<!-- footer //-->
	<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
	<!-- footer_eof //-->
</div>
</body>

<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
</html>