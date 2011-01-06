<?php

/**
* Gavick Image Show - Template style
* @package Joomla!
* @Copyright (C) 2009 Gavick.com
* @ All rights reserved
* @ Joomla! is Free Software
* @ Released under GNU/GPL License : http://www.gnu.org/copyleft/gpl.html
* @version $Revision: 1.0.0 $
**/

// access restriction
defined('_JEXEC') or die('Restricted access');

?>

<script type="text/javascript">
	try {$Gavick;}catch(e){$Gavick = {};};
	$Gavick["gk_is-<?php echo $this->module_id;?>"] = {
		"anim_speed": <?php echo $dataForJSEngine["anim_speed"];?>,
		"anim_interval": <?php echo $dataForJSEngine["anim_interval"];?>,
		"autoanim": <?php echo $dataForJSEngine["autoanim"];?>,
		"anim_type": "<?php echo $dataForJSEngine["anim_type"];?>",
		"slide_links": <?php echo $dataForJSEngine["slide_links"]; ?>,
		"stripe_width": <?php echo $dataForJSEngine["stripe_width"]; ?>
	};
</script>

<?php if($this->useMoo == 1) : ?><script type="text/javascript" src="<?php echo $uri->root(); ?>modules/mod_gk_image_show/js/mootools.js"></script><?php endif; ?>
<?php if($this->useScript == 1) : ?><script type="text/javascript" src="<?php echo $uri->root(); ?>templates/gk_blackandwhite/js/gk_image_show.js"></script><?php endif; ?>