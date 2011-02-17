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
		<?php require(DIR_WS_INCLUDES . 'column_left_chitiet.php'); ?>
		<!-- left_navigation_eof //-->
		
		<?php /*require(DIR_WS_INCLUDES . 'mainContent_ThongTin.php'); */?>
        <?php
        if(isset($_SESSION['cart_room']))
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
        <h2 style="text-align: center;">DANH M?C PHÒNG Ð?T</h2>
        <table cellpadding="5" cellspacing="5" border="1" style="border: 1px solid;margin-bottom: 10px;">
            <tr>
                <th width="15%">
                    Tên lo?i phòng
                </th>
                <th class='center' width="5%">
                    Ngày d?n
                </th>
                <th class='center' width="5%">
                    S? phòng
                </th>
                <th class='center' width="5%">
                    S? ngày ?
                </th>
                <th class='center' width="5%">
                    Gía phòng
                </th>
                <th width="5%">
                    T?ng ti?n
                </th>
                 <th width="5%">
                    Huy
                </th>
            </tr>
            <?php
           if(isset($_SESSION['cart_room']))
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
                  echo "<p align=right>  ". ($cartItems['qty']*$row[room_type_price]*$cartItems['staydate'])*1000 ." VND</p>";
                  echo "</td>";   
                    echo '<td width="5%">';
                  echo '<p align=center><a href="'. tep_href_link('delcart.php','room_type_id='.$keys).'" class="delcartItem"> H?y </a></p>';
                  echo "</td>";
                  echo "</tr>";                
                  $total +=intval($cartItems['qty'])*$row[room_type_price]*$cartItems['staydate']*1000;
           		}
                }
           	} 
            }
            ?>
            <tr class="total">
                <td width="10%" align="right" colspan="5">
                    <p>T?ng ti?n:</p>
                </td>
                <td id="total_price">
                    <p>&nbsp;<?php echo $total." VND"; ?> </p>
                </td>
            </tr>  
            <tr>
            <td></td>
            </tr>
            </form>
            </div>
            </table>
             <form id="signupForm" class="cart_form" method="post" action="<?php echo tep_href_link('datphong.php');?>">
          <input type="submit" style="margin: 10px 15px 0 10px;" value="Thanh Toan"/>
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