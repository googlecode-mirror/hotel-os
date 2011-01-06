<?php

/**
* Gavick Image Slide - Template style
* @package Joomla!
* @Copyright (C) 2009 Gavick.com
* @ All rights reserved
* @ Joomla! is Free Software
* @ Released under GNU/GPL License : http://www.gnu.org/copyleft/gpl.html
* @version $Revision: 1.0.0 $
**/

// access restriction
defined('_JEXEC') or die('Restricted access');
// vars
$highest_layer = 0;
// initializing variables
$total_block_width = 0;
$URI = JURI::getInstance();
// calculating sizes
$total_block_width += $this->settings["image_x"];
//
if(!function_exists('htmlspecialchars_decode')){
	function htmlspecialchars_decode($string,$style=ENT_COMPAT)
	{
	    $translation = array_flip(get_html_translation_table(HTML_SPECIALCHARS,$style));
	    if($style === ENT_QUOTES){ $translation['&#039;'] = '\''; }
	    return strtr($string,$translation);
	}
}

?>

<div id="gk_is-<?php echo $this->ID;?>" class="gk_is_wrapper gk_is_wrapper-template<?php if($this->config['slide_links'] == 'true') echo ' slide-links'; ?>">
	<div class="gk_is_preloader">Loading...</div>
	<div class="gk_is_slides" style="width: <?php echo $this->settings["image_x"]; ?>px;height: <?php echo $this->settings["image_y"]; ?>px;">
		<?php for($i = 0; $i < count($this->slides); $i++) : ?>
			<?php unset($path); $path = $URI->root().'components/com_gk3_photoslide/thumbs_big/'.$this->slides[$i]["filename"]; ?>
			<span class="gk_is_slide"><?php echo $path; ?></span>
		<?php endfor; ?>	
	</div>
	
	<?php if($this->config['show_text_block'] == "true") : ?>
	<div class="gk_is_text" style="bottom:<?php echo $this->config['text_block_position_y']; ?>px;right:<?php echo $this->config['text_block_position_x']; ?>px;width:<?php echo $this->config['text_block_width']; ?>px;">Text</div>
	<?php endif; ?>
	
	<?php if($this->config['pagination'] == "true") : ?>
    <ul class="gk_is_pagination" style="top:<?php echo $this->config['pagination_position_y']; ?>px;left:<?php echo $this->config['pagination_position_x']; ?>px;">
        <?php for($i = 0; $i < count($this->slides); $i++) : ?>
        <li><?php echo $i+1; ?></li>
        <?php endfor; ?>
    </ul>
    <?php endif; ?>
	
	<div class="gk_is_text_data">
		<?php for($i = 0; $i < count($this->slides); $i++) : ?>
		
		<?php 
			// cleaning variables
			unset($title, $link, $text, $exploded_text);
			// creating slide title
			$title = ($this->slides[$i]["title"] == "") ? $this->slides[$i]["ctitle"] : $this->slides[$i]["title"];
			$title = substr($title, 0, $this->config['title_char_amount']);
				
			$part_one = explode(' ', $title);
            $part_one = $part_one[0];
		
			if(count(explode(' ', $title)) > 1) $part_two = substr($title, strpos($title,' '));
            else $part_two = '';
			
            $title = '<span>' . $part_one . '</span>' . $part_two ;
            		
            
            // creating slide link
			$link = ($this->slides[$i]["link_type"] != 0) ? JRoute::_(ContentHelperRoute::getArticleRoute($this->slides[$i]["article"], $this->slides[$i]["cid"], $this->slides[$i]["sid"])) : $this->slides[$i]["link"];
			// creating slide text
			$text = ($this->slides[$i]["content"] == "") ? $this->slides[$i]["introtext"] : $this->slides[$i]["content"];
			$text = htmlspecialchars_decode($text);
			if($this->config["clean_xhtml"] == "true") $text = strip_tags($text);
			$exploded_text = explode(" ", stripslashes($text));
			$text = '';

			for($j = 0; $j < $this->config["wordcount"]; $j++) {
				if(isset($exploded_text[$j])) $text .= $exploded_text[$j]." ";
			}
			
			if($this->config["wordcount"] < count($exploded_text)) $text .= '&hellip;';
		?>
		
		<div class="gk_is_text_item">
			<h4><a href="<?php echo $link; ?>"><?php echo $title; ?></a></h4>
			<p><?php echo $text; ?><a href="<?php echo $link; ?>" class="readon">&raquo;</a></p>
		</div>
		<?php endfor; ?>
	</div>
</div>		