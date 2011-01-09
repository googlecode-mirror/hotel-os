window.addEvent('domready', function() {
        
			//var container = 'miniK2StoreCart';
			//if ($(container))	{
//				doMiniCart();
//			}
			      
		     SqueezeBox.initialize({});
		      $$('.cart_form').each(function(el) {
		         el.addEvent('submit', function(e) {
		            new Event(e).stop();
                    
                    if(!jQuery("#signupForm").valid())
                        return false;
                    jQuery("#datphongForm").dialog('close');
                    //jQuery('#datphongForm').addClass('hidden');
                    //alert('run');
		            //var quantity = this.quantity.value;
		            var url = this.action;//+'&quantity='+quantity+'&Itemid='+this.Itemid.value;
		            //var murl = 'index.php?option=com_k2store&view=mycart&format=ajaxmini';
                    SqueezeBox.applyContent('<img src="images/loading.gif" width="50px" height="50px" style="margin:30% 45%;" />');
                    setTimeout('ajaxPage("'+url+'" )',3000);
                   // new Ajax(url,{
//						 method:"post",
//						 onSuccess: function(response){
//							SqueezeBox.applyContent(response);
//							//if ($(container))	{
////							doMiniCart();
////							}
//						 }
//					
//					}).request();
					
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
