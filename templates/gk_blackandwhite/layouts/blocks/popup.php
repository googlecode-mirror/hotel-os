<?php if($this->countModules('login') || (($this->countModules('register') && (($this->_tpl->params->get("register_button",1)) ? $userID == 0 : false))) ) : ?>	
<div id="gk-popup">	
	<div class="main gk-popup-wrap">
        <jdoc:include type="message" />
		<!-- FORMS -->
        <?php $this->loadBlock('usertools/login'); ?>
		<?php $this->loadBlock('usertools/register'); ?>
	</div>
</div>
<?php endif; ?>