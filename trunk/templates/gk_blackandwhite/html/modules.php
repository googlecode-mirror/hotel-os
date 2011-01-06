<?php



defined('_JEXEC') or die('Restricted access');


jimport( 'joomla.application.module.helper' );


function modChrome_gavickpro($module, &$params, &$attribs) { 

	$badge = preg_match ('/badge/', $params->get('moduleclass_sfx')) ? "<span class=\"badge\">badge</span>\n" : "";
	$headerLevel = isset($attribs['headerLevel']) ? (int) $attribs['headerLevel'] : 3;
	

	if (!empty ($module->content)) : ?>

		<div class="moduletable<?php echo $params->get('moduleclass_sfx'); ?><?php if(isset($attribs['additional_class'])) echo $attribs['additional_class']; ?>">

			<?php if ($module->showtitle) : ?>

				<?php
				
					$part_one = explode(' ', $module->title);
					$part_one = $part_one[0];
		
					if(count(explode(' ', $module->title)) > 1)
					{
						$part_two = substr($module->title, strpos($module->title,' '));
					}
					else
					{
						$part_two = '';
					}
					
				?>
				
				<h<?php echo $headerLevel; ?>><span><?php echo $part_one; ?></span><?php echo $part_two; ?><?php echo $badge; ?></h<?php echo $headerLevel; ?>>
			<?php endif; ?>
			<?php echo $badge; ?>

   			<div class="moduletable_content">
                
                	<?php echo $module->content; ?>
              

			</div>

		</div>

	<?php endif;	

}



?>