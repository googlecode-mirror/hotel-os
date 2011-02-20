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
 <title>Nhà hàng</title>   
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
		<div id="mainContent">
		       <div class="itemHeader">
            <h2 class="itemTitle">Hội ngộ ẩm thực</h2>
        </div>

        <div class="itemBody">
            <div class="itemImageBlock">
		      <span class="itemImage">
    		  	<a title="Click to preview image" href="http://localhost/hotelbooking/HaNhan/images/nhahang1.jpg" class="modal">
		  		  <img style="width: 600px; height: 400px;" alt="A1" src="/hotelbooking/HaNhan/images/nhahang1.jpg"/>
                </a>
              </span>
            </div>
                <div class="itemIntroText">
                    <p class="gioithieu"><b>Giới thiệu: </b>
				Bên cạnh giúp cho khách hàng tìm được một nơi nghỉ ngơi thoải mái, yên tĩnh thì món ngon tại khách sạn 
                cũng là một mục tiêu mà khách sạn chúng tôi quan tâm. Chúng tôi luôn tìm tòi và chế biến nhiều món ăn
                ngon, lạ mắt và giá cả phù hợp với túi tiền của nhiều tầng lớp khách hàng. Các đầu bếp tại đây đều được 
                tuyển từ mọi miền đất nước để có thể phục các món ăn từ Bắc vào Nam và các món ăn các nước trên thế giới.
                  </p> 
                           
			         <p class="gioithieu"><b>Món ngon: </b>
               Khách sạn chúng tôi đưa ra thực đơn cho khách hàng mỗi ngày đều khác nhau, đa dạng, phong phú trong từng thực 
               đơn. Buổi sáng: khách hàng có thể chọn bánh mì ốp la, súp, hủ tiếu, phở,... Buổi trưa: những món ăn của 
               buổi sáng và cơm. Buổi chiều: có cơm, bún thịt nướng,... Ngoài ra khách sạn có thêm các món ăn nhẹ vào buổi tối
            </p>
                     
                     <p class="gioithieu"><b>Lợi ích: </b>
                     Khi du khách đã lựa chọn khách sạn chúng tôi làm nơi dừng chân, thì dịch vụ nhà hàng dành cho du khách
                     sẽ được ưu đãi về giá cả. Chúng tôi sẽ phục vụ chu đáo từ: khăn giấy, tăm,...
                 </p>
                </div>            
        </div>				
                               
				<div class="view">
					<h2>Góc ảnh</h2>
					<ul> 
							<li><a href="#"><img src="/hotelbooking/HaNhan/images/nhahang2.jpg"/></a></li>
							<li><a href="#"><img src="/hotelbooking/HaNhan/images/nhahang3.jpg"/></a></li>
							<li><a href="#"><img src="/hotelbooking/HaNhan/images/nhahang4.jpg"/></a></li>
							<li><a href="#"><img src="/hotelbooking/HaNhan/images/nhahang5.jpg"/></a></li>
					</ul>
				</div>
           <div class="clear"></div>
		</div>
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