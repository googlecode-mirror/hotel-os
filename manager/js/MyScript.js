
//jQuery.noConflict();
var dateden = new Date();
$(document).ready(function(){
    /************ check dateden & datedi **********************/
    //hien thi validation cho ngay den, ngay di cho column_left
    if($("input[name=ngayden]").html()!=null){
        $("input[name=ngayden]").datepicker({changeMonth:true,changeYear:true,dateFormat:'dd-mm-yy'});
        $("input[name=ngayden]").change(function(){
            var dateArray = ($("input[name=ngayden]").val()).split('-');
            dateden.setFullYear(dateArray[2],dateArray[1]-1,dateArray[0]);
            var today = new Date();
            if(dateden < today){
                alert("Ngày nhận phòng không được nhỏ hơn ngày hiện tại");
                $("input[name=ngayden]").val('');
            }
        });
    }
    if($("input[name=ngaydi]").html() != null){
		$("input[name=ngaydi]").datepicker({ changeMonth: true,
			changeYear: true, dateFormat: 'dd-mm-yy' });
        $("input[name=ngaydi]").change(function(){
            var dateArray = ($("input[name=ngaydi]").val()).split('-');            
            var datedi = new Date();
            datedi.setFullYear(dateArray[2],dateArray[1]-1,dateArray[0]);
            if(datedi < dateden){
                alert("Ngày trả phòng không được nhỏ hơn ngày nhận phòng");
                $("input[name=ngaydi]").val('');
            }
        });
	}
    if($("input[name=ngaydat]").html()!=null){
        $("input[name=ngaydat]").datepicker({changeMonth:true,changeYear:true,dateFormat:'dd-mm-yy'});
    }
    $("select#cb_dmphong").change(function(){
        var option = $("select#cb_dmphong option:selected");
        var url = "loadloaiphong.php?roomcat="+option.val();
        sendRequest(url,loadLoaiphongcombo);
    });
    
    $("#soluongphong").change(function(){
        var dateden = getDateObj(jQuery('#ngayden').val());
        var datedi = getDateObj(jQuery('#ngaydi').val());
        var songayo = parseInt(getDaySubstract(datedi,dateden));    
        var option = $("select#cb_loaiphong option:selected").val();
        var arr = option.split(' - ');
        var price = parseInt(arr[1]);
        var rooms = parseInt($("#soluongphong").val());
        
        var total = rooms*price*songayo*1000;
        $("#total").val(total);
    });
    
    $("#prepaid").change(function(){
        var total = parseInt($("#total").val());
        var prepaid = parseInt($("#prepaid").val());
        $("#remain").val(total - prepaid);
    });
 });

function  getDateObj(str){
    var arr = str.split('-');
    var obj = new Date();
    obj.setFullYear(arr[2],arr[1]-1,arr[0]);
    return obj;
}

function getDaySubstract(date1, date2){
    var milisecs = date1 - date2;
    var days = milisecs/(1000*60*60*24);  //(star*secs*mins*hours)
    return parseInt(days);
}

function loadLoaiphongcombo(response){
    var first = response.indexOf("<option>");
    var end = response.indexOf("</select>");
    response = response.substring(first,end);
    $("select#cb_loaiphong").html(response);
}
function sendRequest(url,func){
        var request = null;
        if(window.XMLHttpRequest){
            request = new XMLHttpRequest();
        }else if(window.ActiveXObject){
            request = new ActiveXObject();
        }else{
            throw new Error("Ajax is not supported with this browser");
        }
        /******** send request *********/        
        request.open("POST",url,true);
        request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        request.setRequestHeader("Connection","close");
        /******** handle readystatechange  *********/
        request.onreadystatechange = function(){
            if(request.readyState == 4){
                if(request.status == 200){
                    var response = request.responseText;
                    //alert('Here 3'+response);
                    func(response);
                }                  
            }
        }
        request.send();
}