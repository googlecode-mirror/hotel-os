
jQuery.noConflict();
var dateden = new Date();
jQuery(document).ready(function($){
    /************ check dateden & datedi **********************/
    
    
	if($('#dateden').html() != null){
		$('#dateden').datepicker({ appendText: '(yyyy-mm-dd)',changeMonth: true,
			changeYear: true, dateFormat: 'yy-mm-dd' });
        
        $("#dateden").change(function(){
            var dateArray = ($("#dateden").val()).split('-');
            dateden.setFullYear(dateArray[0],dateArray[1]-1,dateArray[2]);
            var today = new Date();
            if(dateden < today){
                alert("Ngày nhận phòng không được nhỏ hơn ngày hiện tại");
            }
        });
	}
	if($('#datedi').html() != null){
		$('#datedi').datepicker({ appendText: '(yyyy-mm-dd)',changeMonth: true,
			changeYear: true, dateFormat: 'yy-mm-dd' });
        $("#datedi").change(function(){
            var dateArray = ($("#datedi").val()).split('-');            
            var datedi = new Date();
            datedi.setFullYear(dateArray[0],dateArray[1]-1,dateArray[2]);  
            if(datedi < dateden){
                alert("Ngày trả phòng không được nhỏ hơn ngày nhận phòng");
            }
        });
	}
    /**********************************************************/
	if($('#ngayhethan').html() != null){
		$('#ngayhethan').datepicker({ appendText: '(yyyy-mm-dd)',changeMonth: true,
			changeYear: true, dateFormat: 'yy-mm-dd' });
	}
	if($('#ngaysinh').html() != null){
		$('#ngaysinh').datepicker({ appendText: '(yyyy-mm-dd)',changeMonth: true,
			changeYear: true, dateFormat: 'yy-mm-dd' });
	}
});

jQuery(document).ready(function($){
	if($('#carousel1')== null||$('#carousel1').html() == null)
		return false;
	var width = $('#carousel1').width();
	var height = $('#carousel1').height();
	$('#carousel1').CloudCarousel({
                xPos:width/2.1,
                yPos:(height/4),
                buttonLeft: $('#left-but'),
                buttonRight: $('#right-but'),
                altBox: $('#altText'),
                titleBox: $('#titleText'),
                //reflection
                reflHeight: 20,
                reflGap:10,
                reflOpacity: 1,
                //radius
                xRadius: width/3,
                yRadius: height/3,
                minScale:0.6               
            });	
});

jQuery(document).ready(function($) {	
	if($('#registeringForm')== null||$("#registeringForm").html() == null)
		return false;
	// validate signup form on keyup and submit
	$("#registeringForm").validate({
		rules: {			
			email: {
				 required: true,
				 email: true
			 },
			 matkhau: {
				required: true,
				minlength:5,
			 },
			 rematkhau: {
				required: true,
				minlength:5,
				equalTo: "#matkhau"
			 },
			 tenchuthe: "required",
			 diachi: "required",
			 dienthoai: "required",
			 quocgia: {required: true},
			 ngaysinh: "required"
		},
		messages: {
			email: {
					required: "Bạn chưa nhập email",
					email: "Email chưa đúng"
					},
			matkhau: {
					required: "Bạn chưa nhập mật khẩu",
					minlength: "Chiều dài từ 5 ký tự trở lên"
					},
			rematkhau: {
					required: "Bạn chưa nhập lại mật khẩu",
					minlength: "Chiều dài từ 5 ký tự trở lên",
					equalTo: "Mật khẩu không khớp"
					},		
			tenchuthe: "Bạn chưa nhập họ tên",
			diachi: "Bạn chưa nhập địa chỉ",
			dienthoai: "Bạn chưa nhập số điện thoại",
			quocgia: {required:"Bạn chưa chọn quốc gia"},
			ngaysinh: "Bạn chưa chọn ngày sinh"			
		}	
	});
});
jQuery(document).ready(function($) {		
	// propose username by combining first- and lastname
    if($("#username")==null) return false;
	$("#username").focus(function() {
		var firstname = $("#firstname").val();
		var lastname = $("#lastname").val();
		if(firstname && lastname && !this.value) {
			this.value = firstname + "." + lastname;
		}
	});
	
	// check if confirm password is still valid after password changed
	$("#password").blur(function() {
		$("#confirm_password").valid();
	});
	
	//code to hide topic selection, disable for demo
	var newsletter = $("#newsletter");
	// newsletter topics are optional, hide at first
	var inital = newsletter.is(":checked");
	var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
	var topicInputs = topics.find("input").attr("disabled", !inital);
	// show when newsletter is checked
	newsletter.click(function() {
		topics[this.checked ? "removeClass" : "addClass"]("gray");
		topicInputs.attr("disabled", !this.checked);
	});
});
/******************* Detail room ******************/
var idRoom=0;
function detail(id){
	idRoom = id;
	var realId = 'a #' + id;
	var arr = jQuery('a img');
	for(var i=0; i< arr.length; i = i+1){
		if(jQuery(arr[i]).css('border') != null)
			jQuery(arr[i]).css({'border':'none'});
	}
	jQuery(realId).css({ 'border': '5px solid #006bfc' }); 
	//var ref = window.open("chitietphong.php?room="+id,"Bang Chi tiet phong",'left=20,top=20,width=800,height=600,toolbar=1,resizable=1,scrollbars=1');
	jQuery('#roomInfo').lightbox(false, 0, false, false);
}

function contStep(){
	window.location='DKTimKiem_Group.php?step=3&room='+idRoom;
}
/*********************** show Form **********************/
function showForm(id){
    
	if(jQuery('#'+id).is(':hidden'))
		jQuery('#'+id).slideDown('400');
	else 
		jQuery('#'+id).slideUp('400');
}
/********************** show phong of roomType************************/
function showphongOfRoomType(roomType){
	jQuery('#showphongDiv').slideDown('400');
    jQuery('#showphongHeader').html('CÃ¡c phÃ²ng thuá»™c loáº¡i '+roomType+' hiá»‡n cÃ³ trong khÃ¡ch sáº¡n:');
	jQuery('#showphong').loopedSlider({
						containerClick: false 
					});
}
/***********************Hieu ung show loai phong trang index*********************/
jQuery(document).ready(function($){
    if($("div.loaiphong ul li") == null) return false;
    
    
             
	$("div.loaiphong ul li").hover(function() {
		$(this).css({'z-index' : '10'}); /*Add a higher z-index value so this image stays on top*/ 
		var imagePosition = $(this).find('img').position();
		$(this).find('img').addClass("hover").stop() /* Add class of "hover", then stop animation queue buildup*/
			.animate({
				marginTop: '-110px', /* The next 4 lines will vertically align this image */ 
				marginLeft: '-175px',
				top: '50%',
				left: '50%',
				width: '350px', /* Set new width */
				height: '250px', /* Set new height */
				padding: '10px'
			}, 200); /* this value of "200" is the speed of how fast/slow this hover animates */

		} , function() {
		$(this).css({'z-index' : '0'}); /* Set z-index back to 0 */
		$(this).find('img').removeClass("hover").stop()  /* Remove the "hover" class , then stop animation queue buildup*/
			.animate({
				marginTop: '0', /* Set alignment back to default */
				marginLeft: '0',
				top: '0',
				left: '0',
				width: '150px', /* Set width back to default */
				height: '100px', /* Set height back to default */
				padding:0
			}, 400);
	});
});
/****************** show form dat phong ********************************/
function showDatphongForm(){
    //if($("#datphongForm").html()!= null)
           jQuery("#datphongForm").removeClass('hidden');
    jQuery("#datphongForm").dialog({
        modal:true,
        width:600,
        position:[400,-100],
        zIndex:1000,
        resizable:false
        
    });
}

var lastBodyThe='';
jQuery(document).ready(function($){
    $("input:radio[name=payment]").change(function(){        
       if($("input:radio[name=payment]:checked").val()=='0'){
        lastBodyThe = $("#thongtinthe").html();
        $("#thongtinthe").html("Xin quý khách vui lòng liên hệ phòng tiếp tân của chúng tôi để rõ hơn chi tiết");        
       }else if(lastBodyThe.length > 0){
        $("#thongtinthe").html(lastBodyThe);
       }
       $("#thongtinthe").removeClass("hidden");
    });
    
    if($("#signupForm").html() == null) return;
    $("#signupForm").validate({
        rules:{
            hoten   : "required",
            email   : {
             required:true,
             email:true   
            } ,
            diachi:"required",
            dienthoai:{
                required:true,
                digits:true
            },
            dateden:{
                required:true,
                date:true
            },  
            datedi:{
                required:true,
                date:true
            },
            tenchuthe:{
                required:true
            },
            sothe:{
                required:true,
                digits:true
            } 
        },
        messages:{
            hoten   : "Họ tên KH không được trống",
            email   : {
             required:"Email không được trống",
             email:"Email không đúng"   
            } ,
            diachi:"Địa chỉ không được trống",
            dienthoai:{
                required:"Số điện thoại không được trống",
                digits:"Số ĐT gồm các chữ số 1-9"
            },
            dateden:{
                required:"Chưa điền ngày đến",
                date:"Ngày không đúng"
            },  
            datedi:{
                required:"Chưa điền ngày đi",
                date:"Ngày không đúng"
            },
            tenchuthe:{
                required:"Tên chủ thẻ không được trống"
            },
            sothe:{
                required:"Số thẻ không được trống",
                digits:"Số thẻ gồm các chữ số từ 1-9"
            } 
        }
    });
});