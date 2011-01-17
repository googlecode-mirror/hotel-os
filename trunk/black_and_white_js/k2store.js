
function  getDateObj(str){
    var arr = str.split('-');
    var obj = new Date();
    obj.setFullYear(arr[0],arr[1]-1,arr[2]);
    return obj;
}

function getDaySubstract(date1, date2){
    var milisecs = date1 - date2;
    var days = milisecs/(1000*60*60*24);  //(star*secs*mins*hours)
    return parseInt(days);
}
window.addEvent('domready', function() {
        
			//var container = 'miniK2StoreCart';
			//if ($(container))	{
//				doMiniCart();
//			}
			      
		     SqueezeBox.initialize({size: {x: 700, y: 400}});
		      $$('.cart_form').each(function(el) {
		         el.addEvent('submit', function(e) {
		            new Event(e).stop();
                    
                    if(!jQuery("#signupForm").valid())
                        return false;
                    jQuery("#datphongForm").dialog('close');
                    
                    var dateden = getDateObj(jQuery('#dateden').val());
                    var datedi = getDateObj(jQuery('#datedi').val());
                    
                    var songayo = getDaySubstract(datedi,dateden);
		            
		            var url = this.action+"&stay_dates="+songayo+"&comingdate="+dateden;
           	     
                    SqueezeBox.applyContent('<img src="images/loading.gif" width="50px" height="50px" style="margin:20% 45%;" />');
                    setTimeout('ajaxPage("'+url+'" )',3000);
                   
		         });
		         
		      });
		      
		 }); //end dom ready
		
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
         
		function doMiniCart() {
		var container = 'miniK2StoreCart';
			var murl = 'index.php?option=com_k2store&view=mycart&format=ajaxmini';
		
			var a=new Ajax(murl,{
                method:"post",
                onComplete: function(response){
                    $(container).setHTML(response); 
					}
				}).request();
			}
