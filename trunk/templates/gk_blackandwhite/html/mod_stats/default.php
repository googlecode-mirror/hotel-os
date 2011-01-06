<?php 

/**
 * 
 * GK Joomla! Override by GavickPro
 * 
 * v.1.0.0
 * 
 */

/**
 *
 * CSS classes
 * 
 * .mod_stats - selector for main container
 * .mod_stats>ul - selector for list
 * .mod_stats>ul li - selector for list items
 * .mod_stats>ul strong - selector for strong emphase in list items
 * 
 * -- when counting mode for user list is enabled you can use also these classes: 
 * 
 * .mod_stats>ul li.odd - selector for odd user items
 * .mod_stats>ul li.even - selector for even user items
 * 
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

/**
 *
 * Configuration
 * 
 */

// Enabled counting mode causes adding classes odd/even for stats list 
$mod_stats_counting_mode = true; // counting mode is enabled

?>

<div class="mod_stats">
	<?php if(count($list) > 0) : ?>
	<ul>
		<?php 
			$counter = 1;
			foreach ($list as $item) :
			if($mod_stats_counting_mode) $class = ' class="'.(($counter%2 == 1) ? 'odd' : 'even').'"';
			else $class = '';
		?>
		<li<?php echo $class; ?>><strong><?php echo $item->title ?></strong> : <?php echo $item->data ?></li>
		<?php 
			$counter++;
			endforeach; 
		?>
	</ul>
	<?php endif; ?>
</div>