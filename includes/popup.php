<?php

/**
 * @author quang
 * @copyright 2010
 */



?>
<div id="gk-popup">	
	<div class="main gk-popup-wrap">        
		<!-- FORMS -->       
		
<div id="login_form">
	<h3>Đăng Nhập</h3>
	
<div class="mod_login">
               <form action="/hotelbooking/xulydangnhap.php" method="post" name="login" id="form-login" >
                    <p class="username">
               <label for="modlgn_username">Email</label>
              
               <input id="modlgn_username" type="text" name="email" class="inputbox" alt="username" size="25" />
          </p>

          <p class="password">
               <label for="modlgn_passwd">Mật khẩu</label>
             
               <input id="modlgn_passwd" type="password" name="password" class="inputbox" size="25" alt="password" />
          </p>
                    <p class="remember">
               <label for="modlgn_remember">Ghi nhận</label>
               <input id="modlgn_remember" type="checkbox" name="remember" class="inputbox" value="yes" alt="Remember Me" />
          </p>

                    <div class="buttons">
               <input type="submit" name="Submit" class="button" value="Đăng Nhập" />
          </div>
          <ul>
               <li> <a href="/Khotel/index.php?option=com_user&amp;view=reset"> Quên mật khẩu</a> </li>
               <li> <a href="/Khotel/index.php?option=com_user&amp;view=remind"> Quên Email</a> </li>

                              <li> <a href="/hotelbooking/includes/mainContent_account.php"> Đăng ký tài khoản</a> </li>
                         </ul>
          <div style="clear: both;"></div>
                    <input type="hidden" name="option" value="com_user" />
          <input type="hidden" name="task" value="login" />
          <input type="hidden" name="return" value="L0tob3RlbC8=" />
          <input type="hidden" name="1cc9b4ae8693d48be6efa33ba79536d6" value="1" />     </form>

     </div>

</div>	
	
<div id="register_form">		
	<h3>Đăng ký</h3>	

		<script type="text/javascript" src="http://localhost/Khotel/media/system/js/validate.js"></script>
		<script type="text/javascript">Window.onDomReady(function(){document.formvalidator.setHandler('passverify', function (value) { return ($('password').value == value); }	);});</script>

		<form action="/hotelbooking/xulydangky.php" method="post" id="josForm" name="josForm" class="form-validate">

		
		<table cellpadding="0" cellspacing="0" border="0" width="100%" class="contentpane">
		<tr>
			<td width="30%" height="40">
				<label id="namemsg" for="name">Tên:</label>
			</td>
		  	<td>
		  		<input type="text" name="name" id="name" size="40" value="" class="inputbox required" maxlength="50" /> *
		  	</td>

		</tr>
		
		<tr>
			<td height="40">
				<label id="emailmsg" for="email">Email:</label>
			</td>
			<td>
				<input type="text" id="email" name="email" size="40" value="" class="inputbox required validate-email" maxlength="100" /> *
			</td>

		</tr>
		<tr>
			<td height="40">
				<label id="pwmsg" for="password">Mật khẩu</label>
			</td>
		  	<td>
		  		<input class="inputbox required validate-password" type="password" id="password" name="password" size="40" value="" /> *
		  	</td>

		</tr>
		<tr>
			<td height="40">
				<label id="pw2msg" for="password2">Nhập lại mật khẩu:</label>
			</td>
			<td>
				<input class="inputbox required validate-passverify" type="password" id="password2" name="password2" size="40" value="" /> *
			</td>

		</tr>
		<tr>
			<td colspan="2" height="40">
				<p class="information_td">* Thông tin bắt buộc</p>
			</td>
		</tr>		
		</table>
			<p class="form_buttons"><span class="btn"><button class="button validate" type="submit" onclick="resister.php">Đăng Ký</button></span></p>

			<input type="hidden" name="task" value="register_save" />
			<input type="hidden" name="id" value="0" />
			<input type="hidden" name="gid" value="0" />
			<input type="hidden" name="1cc9b4ae8693d48be6efa33ba79536d6" value="1" />		</form>	
		
</div>		
			</div>
</div>