<div id="gk-footer" class="clearfix main">
	<?php if($this->countModules('footer_nav')) : ?>
	<div id="gk-footer-nav">
		<jdoc:include type="modules" name="footer_nav" style="none" />
	</div>		
	<?php endif; ?>
	
	<div id="gk-copyright">
		<?php

			if (($mobile = $this->mobile_device_detect())) : 
				$handheld_view = $this->getParam('ui');
				$switch_to = $handheld_view=='desktop'?'default':'desktop';
				$text = $handheld_view=='desktop'?'Mobile Version':'Desktop Version';
		?>

			<a class="gk-tool-switchlayout" href="<?php echo JURI::base()?>?ui=<?php echo $switch_to?>" title="<?php echo JText::_($text)?>"><span><?php echo JText::_($text)?></span></a>

		<?php endif ; ?>
		<?php echo $this->_tpl->params->get("footer_content"); ?>
	</div>
</div>