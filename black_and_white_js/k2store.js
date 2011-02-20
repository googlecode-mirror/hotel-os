
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
window.addEvent('domready', function() {
        
			var container = 'miniK2StoreCart';
            var getminicart = 'getminicart';
			if ($(container))	{
			     if ($(getminicart))	{
			         var url = $(getminicart).value;
				    doMiniCart(url);
                }
			}
			      
		     SqueezeBox.initialize({size: {x: 700, y: 400}});
		      $$('.cart_form').each(function(el) {
		         el.addEvent('submit', function(e) {
		            new Event(e).stop();
                    
                   
                    var dateden = getDateObj(jQuery('#dateden').val());
                    var datedi = getDateObj(jQuery('#datedi').val());
                    
                    if(datedi < dateden){
                        alert("Ngày trả phòng không được nhỏ hơn ngày nhận phòng");
                        $("#ngaydi").val('');
                        return false;
                    }
                    jQuery("#datphongForm").dialog('close');
                    
                    var dayden = dateden.getDate();
                    var monthden = dateden.getMonth()+1;
                    var yearden = dateden.getFullYear();
                    
                    
                    var daydi = datedi.getDate();
                    var monthdi = datedi.getMonth()+1;
                    var yeardi = datedi.getFullYear();
                    
                     
                    var songayo = getDaySubstract(datedi,dateden);
		            
		            var url = this.action+"&stay_dates="+songayo+"&comingdate="+dayden+"&comingmonth="+monthden+"&comingyear="+yearden
                                            +"&leavingdate="+daydi+"&leavingmonth="+monthdi+"&leavingyear="+yeardi;
                    SqueezeBox.applyContent('<img src="images/loading.gif" width="50px" height="50px" style="margin:20% 45%;" />');
                    setTimeout('ajaxPage("'+url+'" )',3000);
                   
		         });
		         
		      });

             $$('a.product_list').each(function(el) {
                el.addEvent('click', function(e) {
                new Event(e).stop();
                var url=this.href;
                SqueezeBox.applyContent('<img src="images/loading.gif" width="50px" height="50px" style="margin:20% 45%;" />');
                    setTimeout('ajaxPage("'+url+'" )',3000);
                    return false;
              });
             });
             
           //   $$('a.delcartItem').each(function(el) {
//                el.addEvent('click', function(e) {
//                new Event(e).stop();
//                var url=this.href;
//                SqueezeBox.applyContent('<img src="images/loading.gif" width="50px" height="50px" style="margin:20% 45%;" />');
//                    setTimeout('ajaxPage("'+url+'" )',3000);
//                    return false;
//              });
//             });
		 }); //end dom ready
		
        function delcart(url){
            SqueezeBox.initialize({size: {x: 700, y: 400}});
                SqueezeBox.applyContent('<img src="images/loading.gif" width="50px" height="50px" style="margin:20% 45%;" />');
                    setTimeout('ajaxPage("'+url+'" )',3000);
                    return false;
        }
        
        function ajaxPage(url){
                    new Ajax(url,{
						 method:"post",
						 onSuccess: function(response){
							SqueezeBox.applyContent(response);
							//if ($(container))	{
//							doMiniCart();
//							}
						 }					
					}).request();
        }
         
		function doMiniCart(url) {
		var container = 'miniK2StoreCart';
			var murl = url+'&option=com_k2store&view=mycart&format=ajaxmini';
		
			var a=new Ajax(murl,{
                method:"post",
                onComplete: function(response){
                    $(container).setHTML(response); 
					}
				}).request();
			}
