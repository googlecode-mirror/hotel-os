<?php if( $this->countModules('banner1')) : ?>
<div id="banner1" class="clear clearfix">
   	<jdoc:include type="modules" name="banner1" style="gavickpro" />
</div>
<?php endif; ?>

<?php if($this->countModules('header')) : ?>
<div id="gk-header" class="normal clearfix clear">		
	<jdoc:include type="modules" name="header" style="gavickpro" />		
</div>
<?php endif; ?>

<?php if( $this->countModules('banner2') ): ?>
<div id="banner2" class="clearfix clear">
	<jdoc:include type="modules" name="banner2" style="none" />
</div>
<?php endif; ?>