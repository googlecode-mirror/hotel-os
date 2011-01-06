<?php if($this->_tpl->params->get('font_method') == 0 && !$this->isIPad()) : ?>

    <?php 
        $document =& JFactory::getDocument();
        $document->addScript($this->templateurl() . '/js/cufon.js'); 
    ?>

	<?php if($this->_tpl->params->get('cufon_font') != -1 ) : ?>
        <?php $document->addScript($this->templateurl().'/fonts/'.$this->_tpl->params->get('cufon_font')); ?>
	<?php endif; ?>

	<?php if($this->_tpl->params->get('cufon_font1') != -1 ) : ?>
        <?php $document->addScript($this->templateurl().'/fonts/'.$this->_tpl->params->get('cufon_font1')); ?>
	<?php endif; ?>
	
	<?php if($this->_tpl->params->get('cufon_font2') != -1 ) : ?>
        <?php $document->addScript($this->templateurl().'/fonts/'.$this->_tpl->params->get('cufon_font2')); ?>
	<?php endif; ?>

	<script type="text/javascript">
	//<![CDATA[
		if(!window.ie || (document.querySelectorAll && window.ie)){
		<?php if($this->_tpl->params->get('cufon_font','-1') != '-1' ) : ?>
		Cufon.replace('body', { fontFamily: '<?php echo $this->_tpl->params->get('cufon_fontname',''); ?>' });
		<?php endif; ?>

		<?php 

			$cufon_fonts = array(
                '.moduletable_menu h3',
                '.moduletable_text h3',
                '.moduletable h3',
                '#gk-popup h3',
                '#gk-mainnav .level0>li>a',		
				'.itemRelated h3', 		
				'.itemAuthorLatest h3'					
			);		

			if($this->_tpl->params->get('cufon_font1','-1') != '-1' ) :
		?>		

	   	    <?php foreach($cufon_fonts as $cfont) : ?>
	       	Cufon.replace('<?php echo $cfont; ?>', { fontFamily: '<?php echo $this->_tpl->params->get('cufon_font1name',''); ?>' });
			<?php endforeach; ?>
		<?php endif; ?>	

		<?php 

			$cufon_fonts = array(
                '.gk_is_text h4',
				'.moduletable.bigtitle h3'
			);		

			if($this->_tpl->params->get('cufon_font2','-1') != '-1' ) :

		?>		

			<?php foreach($cufon_fonts as $cfont) : ?>
			Cufon.replace('<?php echo $cfont; ?>', { fontFamily: '<?php echo $this->_tpl->params->get('cufon_font2name',''); ?>' });
			<?php endforeach; ?>

		<?php endif; ?>	
		}
	//]]>	
	</script>
<?php endif; ?>

<?php 

	if($this->_tpl->params->get('font_method') == 2 && !$this->isIPad()) {
		if($this->getParam('google_font','none') != 'none'){
			echo '<link href="http://fonts.googleapis.com/css?family='.$this->getParam('google_font').'" rel="stylesheet" type="text/css" />';
		}

		if($this->getParam('google_font1','none') != 'none'){
			if($this->getParam('google_font1') != $this->getParam('google_font')){
				echo '<link href="http://fonts.googleapis.com/css?family='.$this->getParam('google_font1').'" rel="stylesheet" type="text/css" />';		
			}
		}

		if($this->getParam('google_font2','none') != 'none'){
			if($this->getParam('google_font2') != $this->getParam('google_font') && $this->getParam('google_font2') != $this->getParam('google_font1')){
				echo '<link href="http://fonts.googleapis.com/css?family='.$this->getParam('google_font2').'" rel="stylesheet" type="text/css" />';		
			}
		}
	}

?>

<?php

if($this->_tpl->params->get('font_method') == 3 && !$this->isIPad()) {
	if($this->getParam('squirell_dirname','') != ''){
		echo '<link href="'. $this->templateurl() . '/fonts/' . $this->getParam('squirell_dirname') . '/stylesheet.css" rel="stylesheet" type="text/css" />';
	}

	if($this->getParam('squirell_dirname','') != $this->getParam('squirell_dirname1','')) {
		if($this->getParam('squirell_dirname1','') != ''){
			echo '<link href="'. $this->templateurl() . '/fonts/' . $this->getParam('squirell_dirname1') . '/stylesheet.css" rel="stylesheet" type="text/css" />';
		}
	}

	if($this->getParam('squirell_dirname','') != $this->getParam('squirell_dirname2','') && $this->getParam('squirell_dirname1','') != $this->getParam('squirell_dirname2','')) {
		if($this->getParam('squirell_dirname2','') != ''){
			echo '<link href="'. $this->templateurl() . '/fonts/' . $this->getParam('squirell_dirname2') . '/stylesheet.css" rel="stylesheet" type="text/css" />';
		}
	}
}	

?>

<style type="text/css">	

	body {
		font-family: <?php echo $this->fontFamily($this->getParam('font_family',1), $this->getParam('google_font','none'), ''); ?>;
	}
	
    .moduletable_menu h3,
    .moduletable_text h3,
    .moduletable h3,
    #gk-popup h3,
    #gk-mainnav .level0>li>a,
	.itemRelated h3, 
	.itemAuthorLatest h3
	{
		font-family: <?php echo $this->fontFamily($this->getParam('font_family1', 1), $this->getParam('google_font1','none'), '1'); ?>;
	}

	.gk_is_text h4,
	.moduletable.bigtitle h3 {
		font-family: <?php echo $this->fontFamily($this->getParam('font_family2',1), $this->getParam('google_font2','none'), '2'); ?>;
	}

</style>