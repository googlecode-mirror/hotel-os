
<link href="css/smoothness/jquery-ui-1.8.2.custom.css" rel="stylesheet" type="text/css"/>
  <script src="js/jquery-1.4.2.min.js"></script>
  <script src="js/jquery-ui-1.8.2.custom.min.js"></script>
  <script src="js/jquery.lightboxLib.js"></script>
  
  <script type="text/JavaScript" src="js/cloud-carousel.1.0.3.js"></script>
<div class="steps">
<ul>
<li id="step1" class="nonactive">T&igrave;m ki&#7871;m </li>
<li id="step2" class="active">Ch&#7885;n ph&ograve;ng </li>
<li id="step3" class="nonactive">Th&ocirc;ng tin </li>
<li id="step4" class="nonactive">K&#7871;t th&uacute;c </li>
</ul>
</div>

  <div id="carousel1" >            
            <!-- All images with class of "cloudcarousel" will be turned into carousel items -->
            <!-- You can place links around these images -->
            <a href="javascript:detail(1)">
            <img id="1" class = "cloudcarousel" src="images/phong 4.jpeg" alt="Can phong huong ra phia bien, don nhung anh nang dau tien cua buoi som mai" title="Room 204" /></a>
            <a href="javascript:detail(2)">
            <img id="2" class = "cloudcarousel" src="images/phong 5.jpg" alt="Chiec giuong doi hinh trai tim, rat lang man, rat hop voi nhung cap tinh nhan" title="Room 301" /></a>
            <a href="javascript:detail(3)">
			<img id="3" class = "cloudcarousel" src="images/phong 1.jpg" title="Room 305" alt="Phong co 1 phong khach va 1 phong ngu, day du tien nghi, ngoai ra con co 1 quay bar thu nho" /></a>
            <img class = "cloudcarousel" src="images/phong 2.jpg" title="Room 107" alt="Phong huong ra phia bien va ngoai ra con co 1 quay bar thu nho" />
			<img class = "cloudcarousel" src="images/phong 3.jpg" title="Room 200" alt="Voi nhung nhanh lan diem xuyet o khu ban cong, khong khi se diu nhe va thoang thoang huong thom, hay tan huong cuoc song nhe ban" />
			<img class = "cloudcarousel" src="images/phong 6.jpg" title="Room 105" alt="Ban co the vui ve cugn cac nguoi ban o ngay tai khu quay bar mini trong phong" />
			<img class = "cloudcarousel" src="images/phong 7.jpg" title="Room 300" alt="RAt vui khi ban da den day" />
			<img class = "cloudcarousel" src="images/phong 8.jpg" title="Room 075" alt="RAt vui khi ban da den day" />
			<img class = "cloudcarousel" src="images/phong 10.jpg" title="Room 001" alt="RAt vui khi ban da den day" />
        </div> 
        <p>Please click on image to see the full room's detail</p>               
        <!-- Define left and right buttons. -->
        <input id="left-but"  type="submit" value="Left" />
        <input id="right-but" type="submit" value="Right" />
        
        <!-- Define elements to accept the alt and title text from the images. -->
        <p id="titleText"></p>
        <p id="altText"></p>
        
        <input id="right-but" type="submit" value="Dat phong" style="float:right;" onclick="contStep();"/>
        <div class="clear"></div>
		<div id="roomInfo" class="hidden">
			<dl>
				<dt>Room 302</dt>
				<dd class="image"><img class="detail" src="images/phong 3.jpg" alt="phong 3" /></dd>
				<dd><b>Price: </b> 300$</dd>
				<dd><b>Full Detail: </b>Voi nhung nhanh lan diem xuyet o khu ban cong, 
				khong khi se diu nhe va thoang thoang huong thom, 
				hay tan huong cuoc song nhe ban</dd>
			</dl>
		</div>
