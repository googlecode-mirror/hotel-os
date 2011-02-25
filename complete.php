<?php
  require('includes/application_top.php');
  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_DEFAULT);
?>
<script type="text/javascript" src="black_and_white_js/k2store.js"></script>
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
var osCsid = gup('transaction_info');
if(osCsid != "")
    {
      /*  var payment_id=gup('payment_id');
        var payment_type=gup('payment_type');
        var order_code=gup('order_code');
        var price=gup('price');
        var error_text=('error_text');
        var secure_code=('secure_code');*/
        var url = "http://hotelonline.viit-group.com/complete.php?osCsid=" + osCsid;
      /*  url +=  "&payment_id=";
        url += payment_id;
        url +=  "&payment_type=";
        url += payment_type;
        url +=  "&order_code=";
        url += order_code;
        url +=  "&price=";
        url += price;
        url +=  "&error_text=";
        url += error_text;
        url +=  "&secure_code=";
        url += secure_code;*/
        window.location = url;
        
        
        
    }
    
</script>


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
             function getroomofdate($daytest){			
    			                         //cap nhat so phong dat xuong table status_room            			
                            			$listing_sql2="select * from  status_room  where  status_room_dayofyear ='".$daytest."'";		
                            			$listing_split2 = new splitPageResults($listing_sql2, MAX_DISPLAY_SEARCH_RESULTS);
                            		    $listing_query2 = tep_db_query($listing_split2->sql_query);
                            		    $listing2 = tep_db_fetch_array($listing_query2);
                            		    return $listing2;
                                    } 
        ?>	
        <?php
            
            require_once("nganluong.php");
            $nl=new NL_Checkout();            
            $transaction_info=@$_GET["transaction_info"];//lay thong tin giao dich
           // tep_redirect(tep_href_link("datphong.php?osCsid=" . $transaction_info));
            $payment_id=@$_GET["payment_id"];//ma giao dich
            $payment_type=@$_GET["payment_type"];//loai giao dich (1. thanh toan ngay 2. thanh toan tam giu)
            $order_code=@$_GET["order_code"];//ma gia dich
            $price=@$_GET["price"];//so tien thanh toan voi ngan luong
            $error_text=@$_GET['error_text'];//lay thong tin chi tiet loi tra ve tu giao dich
            $secure_code=@$_GET["secure_code"];//lay ma kiem tra tinh hop le cua dau vao
            $check=$nl->verifyPaymentUrl($transaction_info, $order_code, $price, $payment_id, $payment_type, $error_text, $secure_code);//kiem tra giao dich
           //list($osCsid,$id_customer)= split('[-]',$order_code); 
            //if($check){
                  $count= count($_SESSION['cart_room']);    
            if($count>0){
                  $account_id=null;  
                  $dateset=date("Y-m-d"); 
                  $payment=1;
                  foreach($_SESSION['cart_room'] as $cartItems)
                    {
    	    	       $item1[]=$cartItems['roomtypeId'];	    
    	            }
        	       $str1=implode(",",$item1);	 	      
            	   $listing_sql2="select * from room_type where room_type_id in ($str1)";      
            	   $listing_split2 = new splitPageResults($listing_sql2, MAX_DISPLAY_SEARCH_RESULTS);      
                   $listing_query2 = tep_db_query($listing_split2->sql_query);
                   while($row1=tep_db_fetch_array($listing_query2)){
           	       foreach($_SESSION['cart_room'] as $cartItems){
           	        if($cartItems['roomtypeId'] == $row1[room_type_id]){
                    $money +=intval($cartItems['qty'])*$row1[room_type_price]*$cartItems['staydate'];                  
                  }}}
                   if($customer_id==null)
                   {                    
                    $name=$_SESSION['customers']["name"] ;
                    $email_address= $_SESSION['customers']["email"] ;
                    $stress_address= $_SESSION['customers']["address"] ;
                    $telephone= $_SESSION['customers']["telephone"] ;
                    $sql_data_array = array('customers_firstname' => $name,
		    					  'customers_lastname' => $stress_address,
		                          'customers_email_address' => $email_address,
		                          'customers_telephone' => $telephone) ;
                    tep_db_perform(TABLE_CUSTOMERS, $sql_data_array);
		            $customer_id = tep_db_insert_id();                     	  
                   } 
                  // echo "id kh: ". $customer_id;
                  $price=$money;
                  $sql_data_array = array('booking_form_dateset' => $dateset,		    				 
		                      'booking_form_custommers_id' => $customer_id,
		                      'booking_form_account_id' => $account_id,
		                      'booking_form_payment_methods_id' =>  $payment,
                              'booking_form_total_price'=>$price
		                      );
	  
	                          tep_db_perform(booking_form, $sql_data_array);
	                          $booking_form_id= tep_db_insert_id(); 
                              
                   $count= count($_SESSION['cart_room']);    
                //  if($count>0)
               //   {
                    foreach($_SESSION['cart_room'] as $cartItems)
                    {
    	    	       $item[]=$cartItems['roomtypeId'];	    
    	            }
        	       $str=implode(",",$item);	 	      
            	   $listing_sql1="select * from room_type where room_type_id in ($str)";      
            	   $listing_split1 = new splitPageResults($listing_sql1, MAX_DISPLAY_SEARCH_RESULTS);      
                   $listing_query1 = tep_db_query($listing_split1->sql_query);
               //  }
                   
                 //if($count>0)
                 while($row=tep_db_fetch_array($listing_query1)){
                	foreach($_SESSION['cart_room'] as $cartItems){
           		       if($cartItems['roomtypeId'] == $row[room_type_id]){
           		           try{
     		                   $sql_data_array = array('detail_booking_form_type_room_id' => $cartItems['roomtypeId'],
                              'detail_booking_form_id'=>$booking_form_id,
		    				  'detail_booking_form_dateto' => $cartItems['dayto'],
		                      'detail_booking_form_datego' =>  $cartItems['daygo'],	                      
	                          'detail_booking_form_staydate' =>  $cartItems['staydate'],
                              'detail_booking_form_number_room'=> $cartItems['qty'],		                      
		                      'detail_booking_form_price' =>  $row[room_type_price]);	  
	                          tep_db_perform(detail_booking_form, $sql_data_array);
                              list($year,$month,$day)=split('[-]', $cartItems['dayto']);
                              $n=$cartItems['staydate'];                               
                               for($i=0;$i<$n;$i++){  
                                    $daytest=date($year."-".$month."-".$day); 
            		                  $day +=1;                                     
                                  	 $listing2=getroomofdate($daytest);                                                                          
                                     $id_status_room="id_".$cartItems['roomtypeId']; 
                                     list($name,$room_id)=split('[_]', $cartItems['roomtypeId']);                                     
                                     $num_room= $listing2[$id_status_room] +$cartItems['qty'] ;         
                                     tep_db_query("update status_room set ". $id_status_room." = '" . (int)$num_room . "' where status_room_dayofyear = '" . $daytest . "'");                    
	                          } 	                          
           		           }
                           catch ( Exception $e){
	    	                  echo 'Exception caught: ',  $e->getMessage(), "\n";	    	
	                       }
       		           }
                    }
                 } 
                
               //  echo "ma hoa don".$order_code."hoa don ".$osCsid."  ma khach hang: ".$id_customer;    
           			$keys=array_search($cartItems,$_SESSION['cart_room']);    
                     
                $html.="<div align=\"center\">Cảm ơn qúy khách,quá trình thanh toán đã được hoàn tất!</div>";
                echo $html;
            }
            else{
                echo "Quá trình thanh toán không thành công vui lòng thử lại";
            }
 ?> 
		</div>
	</div>
	<!-- footer //-->
	<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
	<!-- footer_eof //-->
</div>
</div>
</body>

<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
</html>