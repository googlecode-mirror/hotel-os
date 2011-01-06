<?php

	$user =& JFactory::getUser();
	// getting User ID
	$userID = $user->get('id');

?>

<div id="gk-top" class="main">
    <?php if ($this->getParam('logoType')=='image'): ?>
    <h1 class="logo"> <a href="index.php" title="<?php echo $this->sitename(); ?>"><span><?php echo $this->sitename(); ?></span></a> </h1>
    <?php elseif($this->getParam('logoType')=='text') : ?>
    <div class="logo text">
      <h1><a href="index.php" title="<?php echo $this->sitename(); ?>"><span><?php echo GK_LOGO; ?></span></a></h1>
      <p class="site-slogan"><?php echo GK_SLOGAN;?></p>
    </div>
    <?php endif; ?>
    
    <?php if($this->countModules('search') || GK_LOGIN) : ?>
    	<?php if( $this->countModules('search') ): ?>
        <div class="gk-search">
        	<jdoc:include type="modules" name="search" style="none" />
        </div>
        <?php endif; ?>
        
		<?php if(GK_LOGIN) : ?>
		<a href="<?php echo $this->baseurl(); ?>index.php?option=com_user&amp;view=login" id="btn_login"></a>
		<?php endif; ?>

		<?php if(GK_TWITTER) : ?>
		<a href="<?php echo GK_TWITTER_URL; ?>" target="_blank" id="btn_twitter"></a>
		<?php endif; ?>

		<?php if(GK_FB) : ?>
		<a href="<?php echo GK_FB_URL; ?>" target="_blank" id="btn_fb"></a>
		<?php endif; ?>
	
		<?php if($this->countModules('top_nav')): ?>
		<div id="gk-top-menu">
			<?php if($this->countModules('top_nav')) : ?>
			<jdoc:include type="modules" name="top_nav" style="none" />
			<?php endif; ?>
		</div>
		<?php endif; ?>

    <?php endif; ?>
</div>

<ul class="no-display">
     <li><a href="<?php echo $this->getCurrentURL();?>#gk-content" title="<?php echo JText::_("Skip to content");?>"><?php echo JText::_("Skip to content");?></a></li>
</ul>