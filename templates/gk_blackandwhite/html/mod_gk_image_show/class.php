<?php

if(!class_exists('GKImageShowTemplate')){
	class GKImageShowTemplate{
		// 
		var $ID;
		// 
		var $config;
		// 
		var $path;
	 	// 
		var $settings;
		// 
		var $slides;
		// 
		function GKImageShowTemplate( $module_id, $settings, $base_path, $group_settings, $slide_data ){
			$this->ID = $module_id;
			$this->path = $base_path;
			$this->settings = $group_settings;
			$this->slides = $slide_data;
			
			$this->parse($settings);
			$this->generate();
		}
		// 
		function returnJSData(){
			return array(
				"anim_speed" => $this->config['anim_speed'],
				"anim_interval" => $this->config['anim_interval'],
				"autoanim" => $this->config['autoanim'],
				"anim_type" => $this->config['anim_type'],
				"slide_links" => $this->config['slide_links'],
				"stripe_width" => $this->config['stripe_width']
			);
		}
		// 
		function parse($settings){
			// creating configuration array (hash)
			$this->config = array(
									"text_block_position_x" => 100,
									"text_block_position_y" => 100,
									"text_block_width" => 300,
									"show_text_block" => true,
									"clean_xhtml" => true,
									"wordcount" => 30,
									"title_char_amount" => 30,
									"slide_links" => true, // true |false
									"pagination" => true,
									"pagination_position_x" => 100,
									"pagination_position_y" => 300,
									"anim_speed" => 500,
									"anim_interval" => 5000,
									"autoanim" => true, // true |false
									"anim_type" => 'opacity', // opacity, stripes-top, stripes-height, stripes-opacity-top, stripes-opacity-height, stripes-mixed
									"show_readmore" => true,
									"stripe_width" => 25
								);
			// exploding settings
			$settings = preg_replace("/\n$/", '', $settings);
			$exploded_settings = explode(';', $settings);
			// parsing
			for( $i = 0; $i < count($exploded_settings) - 1; $i++ )
			{
				// preparing pair key-value
				$pair = explode('=', trim($exploded_settings[$i]));
				// extracting key and value from pair	
				$key = $pair[0];
				$value = $pair[1];	
				// checking existing of key in config array
				if(isset($this->config[$key]))
				{
					// setting value for key
					$this->config[$key] = $value;
				}
			}	
		}
		// 
		function generate(){
			require(JModuleHelper::getLayoutPath('mod_gk_image_show', 'content'));
		}
	}
}

?>