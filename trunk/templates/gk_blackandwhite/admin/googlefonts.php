<?php

// access denied
defined('JPATH_BASE') or die();
 
class JElementGoogleFonts extends JElement
{
	// name of element
	var $_name = 'GoogleFonts';
	// Construct an array of the HTML OPTION statements.
	var $_options = array();
	// function to create an element
	function fetchElement($name, $value, &$node, $control_name)
	{
        // Base name of the HTML control.
        $ctrl  = $control_name .'['. $name .']';
		// iterating
		$temp_options = array(
            array('none','- - - None - - -'),
            array('Cantarell','Cantarell'),
            array('Cantarell:italic','Cantarell (italic)'),
            array('Cantarell:bold','Cantarell (bold)'),
            array('Cantarell:bolditalic','Cantarell (bold italic)'),
            array('Cardo','Cardo'),
            array('Crimson+Text','Crimision Text'),
            array('Cuprum','Cuprum'),
            array('Droid+Sans','Droid Sans'),
            array('Droid+Sans:bold','Droid Sans (bold)'),
            array('Droid+Sans+Mono','Droid Sans Mono'),
            array('Droid+Serif','Droid Serif'),
            array('Droid+Serif:italic','Droid Serif (italic)'),
            array('Droid+Serif:bold','Droid Serif (bold)'),
            array('Droid+Serif:bolditalic','Droid Serif (bold italic)'),
            array('IM+Fell+DW+Pica','IM Fell DW Pica'),
            array('IM+Fell+DW+Pica:italic','IM Fell DW Pica (italic)'),
            array('IM+Fell+DW+Pica+SC','IM Fell DW Pica SC'),
            array('IM+Fell+Double+Pica','IM Fell Double Pica'),
            array('IM+Fell+Double+Pica:italic','IM Fell Double Pica (italic)'),
            array('IM+Fell+Double+Pica+SC','IM Fell Double Pica SC'),
            array('IM+Fell+English','IM Fell English'),
            array('IM+Fell+English:italic','IM Fell English (italic)'),
            array('IM+Fell+English+SC','IM Fell English SC'),
            array('IM+Fell+French+Canon','IM Fell French Canon'),
            array('IM+Fell+French+Canon:italic','IM Fell French Canon (italic)'),
            array('IM+Fell+English+SC','IM Fell English SC'),
            array('IM+Fell+Great+Primer','IM Fell Great Primer'),
            array('IM+Fell+Great+Primer:italic','IM Fell Great Primer (italic)'),
            array('Inconsolata','Inconsolata'),
            array('Josefin+Sans+Std+Light','Josefin Sans Std Light'),
            array('Lobster','Lobster'),
            array('Molengo','Molengo'),
            array('Neucha','Neucha'),
            array('Neuton','Neuton'),
            array('Nobile','Nobile'),
            array('Nobile:italic','Nobile (italic)'),
            array('Nobile:bold','Nobile (bold)'),
            array('Nobile:bolditalic','Nobile (bolditalic)'),
            array('OFL+Sorts+Mill+Goudy+TT','OFL Sorts Mill Goudy TT'),
            array('OFL+Sorts+Mill+Goudy+TT:italic','OFL Sorts Mill Goudy TT (italic)'),
            array('Old+Standard+TT','Old Standard TT'),
            array('Old+Standard+TT:italic','Old Standard TT (italic)'),
            array('Old+Standard+TT:bold','Old Standard TT (bold)'),
            array('PT+Sans','PT Sans'),
            array('PT+Sans:italic','PT Sans (italic)'),
            array('PT+Sans:bold','PT Sans (bold)'),
            array('PT+Sans:bolditalic','PT Sans (bold italic)'),
            array('PT+Sans+Caption','PT Sans Caption'),
            array('PT+Sans+Caption:bold','PT Sans Caption (bold)'),
            array('PT+Sans+Narrow','PT Sans Narrow'),
            array('PT+Sans+Narrow:bold','PT Sans Narrow (bold)'),
            array('Philosopher','Philosopher'),
            array('Reenie+Beanie','Reenie Beanie'),
            array('Tangerine','Tangerine'),
            array('Tangerine:bold','Tangerine (bold)'),
            array('Vollkorn','Vollkorn'),
            array('Vollkorn:bold','Vollkorn (bold)'),
            array('Yanone+Kaffeesatz:extralight','Yanone Kaffeesatz'),
            array('Yanone+Kaffeesatz:extralight','Yanone Kaffeesatz (extralight)'),
            array('Yanone+Kaffeesatz:light','Yanone Kaffeesatz (light)'),
            array('Yanone+Kaffeesatz:bold','Yanone Kaffeesatz (bold)')
        );
		
		foreach ($temp_options as $option) {
    	   $this->_options[] = JHTML::_('select.option', $option[0], JText::_($option[1]));
    	}		
		// Construct the various argument calls that are supported.
        $attribs = ' ';
        if ($v = $node->attributes( 'size' )) $attribs .= 'size="'.$v.'"';
        if ($v = $node->attributes( 'class' )) $attribs .= 'class="'.$v.'"';
        else $attribs .= 'class="inputbox"';
        // Render the HTML SELECT list.
        return JHTML::_('select.genericlist', $this->_options, $ctrl, $attribs, 'value', 'text', $value, $control_name.$name );	
	}
}						