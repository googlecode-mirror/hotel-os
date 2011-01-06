<div id="gk-nav" class="clearfix">
    <div id="gk-mainnav">
    <?php if (($gkmenu = $this->loadMenu())) $gkmenu->genMenu ($this->getParam('startlevel',0), $this->getParam('endlevel',-1)); ?>
    </div>
    
    <?php if ($this->hasSubmenu() && ($gkmenu = $this->loadMenu())) : ?>
    <div id="gk-subnav" class="clear">
        <?php $gkmenu->genMenu(1); ?>
    </div>
    <?php endif;?>
</div>