<?php

/**
 * @author quang
 * @copyright 2010
 */

//session_start();

?>
    <!-- Starting Header top -->
<div id="gk-top" class="main">
        <h1 class="logo"> <a href="/hotelbooking/index.php" title=""><span></span></a> </h1>        
        	        <div class="gk-search">        	

<script type="text/javascript">
window.addEvent('load', function(){
	var input = $('mod_search_searchword');
	input.addEvents({
		'blur' : function(){ if(input.value == '') input.value='search...'; },
		'focus' : function(){ if(input.value == 'search...') input.value='';	}
	});
	input.value = 'search...';
	
	if($('mod_search_button')){
		$('mod_search_button').addEvent('click', function(){ 
			input.focus(); 
		});
	}
});
</script>

<form action="index.php" method="post">
	<div class="mod_search">
 		<input name="searchword" id="mod_search_searchword" maxlength="20" alt="Search" class="inputbox" type="text" size="20" />
			</div>

	<input type="hidden" name="task"   value="search" />
	<input type="hidden" name="option" value="com_search" />
	<input type="hidden" name="Itemid" value="0" />
</form>
        </div>
                
				<a href="http://localhost/hotelbooking/index.php?" id="btn_login"></a>
		
				<a href="http://twitter.com/gavickpro" target="_blank" id="btn_twitter"></a>
		
				<a href="http://www.facebook.com/pages/Gavick-Magazine/119441148082732" target="_blank" id="btn_fb"></a>
				
				<div id="gk-top-menu">

						<ul class="menu"><li class="item18" ><a href="<?php echo tep_href_link(FILENAME_DEFAULT); ?>" id="btn_login2"><span>Đăng nhập</span></a></li><li class="item30"><a href="<?php echo tep_href_link('register.php');?>"><span>Đăng ký</span></a></li><li class="item30"><a href="<?php echo tep_href_link('logoff.php');?>"><span>Đăng xuất</span></a></li></ul>
						
					</div>
		
    </div>

<ul class="no-display">
     <li><a href="/Khotel/#gk-content" title="Skip to content">Skip to content</a></li>
</ul> 
 <!-- End header top -->  