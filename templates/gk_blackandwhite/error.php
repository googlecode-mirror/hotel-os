<?php
/*
#------------------------------------------------------------------------
# Black & White - October2010 (for Joomla 1.5)
#
# Copyright (C) 2007-2010 Gavick.com. All Rights Reserved.
# License: Copyrighted Commercial Software
# Website: http://www.gavick.com
# Support: support@gavick.com   
#------------------------------------------------------------------------ 
# Based on T3 Framework
#------------------------------------------------------------------------
# Copyright (C) 2004-2009 J.O.O.M Solutions Co., Ltd. All Rights Reserved.
# @license - GNU/GPL, http://www.gnu.org/copyleft/gpl.html
# Author: J.O.O.M Solutions Co., Ltd
# Websites: http://www.joomlart.com - http://www.joomlancers.com
#------------------------------------------------------------------------
*/
// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>">
<head>
<title><?php echo $this->error->code ?>-<?php echo $this->title; ?></title>
<link rel="stylesheet" href="<?php echo $this->baseurl; ?>/templates/gk_blackandwhite/css/system/error.css" type="text/css" />
<?php if($this->direction == 'rtl') : ?>
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/gk_blackandwhite/css/system/error_rtl.css" type="text/css" />
<?php endif; ?>
</head>
<body>
    <div id="bg-wrap">
        <div class="top"> 
            <div><img src="templates/gk_blackandwhite/images/logo.png" alt="Logo" /></div>
        </div>
        
        <div id="frame">
            <div id="outline">
                <h1> <?php echo $this->error->code ?></h1>
                <h2> <?php echo $this->error->message ?></h2>
                <div id="errorboxbody">
                
                   <p><strong> <?php echo JText::_('You may not be able to visit this page because of:'); ?></strong> </p>
                   <ol>
                        <li> <?php echo JText::_('An out-of-date bookmark/favourite'); ?> </li>
                        <li> <?php echo JText::_('A search engine that has an out-of-date listing for this site'); ?> </li>
                        <li> <?php echo JText::_('A mis-typed address'); ?> </li>
                        <li> <?php echo JText::_('You have no access to this page'); ?> </li>
                        <li> <?php echo JText::_('The requested resource was not found'); ?> </li>
                        <li> <?php echo JText::_('An error has occurred while processing your request.'); ?> </li>
                   </ol>
                   <p><strong> <?php echo JText::_('Please try one of the following pages:'); ?></strong> </p>
                   <ol>
                        <li> <a href="<?php echo $this->baseurl; ?>/index.php" title="<?php echo JText::_('Go to the home page'); ?>"> <?php echo JText::_('Home Page'); ?> </a> </li>
                   </ol>
                   <p class="admincontact"> <?php echo JText::_('If difficulties persist, please contact the system administrator of this site.'); ?> </p>
                   <div id="techinfo">
                        <p> <?php echo $this->error->message; ?> </p>
                        <?php if($this->debug) : echo $this->renderBacktrace(); endif; ?>
                   </div>
                </div>
            </div>
        </div>  
    </div>   
</body>
</html>