window.addEvent('load', function() {
    if(MooTools.version.contains('1.1')){
        $$(".gk_is_wrapper-template").each(function(el){
            ////alert('1.1');
            var elID = el.getProperty('id');
            new GK_IS_sep2010_11($Gavick[elID], el, elID);
        });
    } else {
        $$(".gk_is_wrapper-template").each(function(el){
            ////alert('1.2');
            var elID = el.getProperty('id');
            new GK_IS_sep2010_12($Gavick[elID], el, elID);
        });
	}
});

var GK_IS_sep2010_11 = new Class({
    
    options: {
        "anim_type" : "opacity", // opacity, stripes-top, stripes-height, stripes-opacity-top, stripes-opacity-height, stripes-mixed 
        "anim_interval" : 5000,
        "anim_speed" : 500,
        "stripe_width" : 20,
        "slide_links" : true
    },
    
    initialize: function(options, el, elID) {
        this.setOptions(options);
        $this = this;
        this.loadedImages = false;
        this.wrapper = $(elID);   
        this.slides = [];
        this.contents = [];
        this.links = [];
        this.play = false;
        this.$blank = false;
        this.overlayAnim = false;
        this.actual_slide = 0;
        this.stripes = [];
        this.wrap_width = $E('.gk_is_slides', this.wrapper).getSize().size.x;
        this.wrap_height = $E('.gk_is_slides', this.wrapper).getSize().size.y;
        this.text = $E('.gk_is_text', this.wrapper);
        this.blank = false;
        this.pagination = $E('.gk_is_pagination', this.wrapper);
        this.playing = false;
        
        $ES('.gk_is_text_item', this.wrapper).each(function(el){
            $this.links.push(el.getElement('h4 a').getProperty('href'));
        });
        
        if(this.text) this.text_anim(0);
        if(this.pagination) {
            this.pagination_active(0);
            this.pagination.getElements('li').each(function(li, i) {
                li.addEvent('click', function(){
                    if(!$this.playing) {
                        $this.blank = true;
                        $this.anim(i);
                    }
                });
            });
        }
        
        var imagesToLoad = [];
        var amount = $ES('.gk_is_slide', this.wrapper).length;
        
        $ES('.gk_is_slide', this.wrapper).each(function(elm,i){
            $this.links.push(elm.innerHTML);
            var newImg = new Element('img', { 'class' : 'gk_is_slide', 'alt' : '', 'src' : elm.innerHTML, 'style' : 'z-index:' + (amount - i) });
            imagesToLoad.push(newImg);
            newImg.injectAfter(elm);
            elm.remove();
        });
        
        if($this.options.anim_type != 'opacity') this.init_stripes();
                
        var time = (function(){
            var process = 0;                
            imagesToLoad.each(function(el,i){ if(el.complete) process++; });
            
            if(process == imagesToLoad.length){
                $clear(time);
                $this.loadedImages = process;
                (function(){
                    new Fx.Style($E('.gk_is_preloader', 'opacity', $this.wrapper)).start(0); 
                    $ES('.gk_is_slide', $this.wrapper).each(function(slide,i){
                    	$this.slides.push({
                    		"slide":slide, 
                    		"anim": new Fx.Style(slide, 'opacity', { duration: $this.options['anim_speed'] }).set(i != 0 ? 0 : 1)
                    	});
                    	if($this.options.slide_links) slide.addEvent('click', function() { $this.redirect($this.actual_slide); });
                    });
                }).delay(400);
            }
        }).periodical(200);
        
        if(this.options['autoanim']){
            (function(){
                if($this.blank == false){
                    $this.anim($this.actual_slide+1);
                }else $this.blank = false;
            }).periodical($this.options['anim_interval']+$this.options['anim_speed']);
        }
    },
    // down top anim
    init_stripes: function() {
		// create stripes
		var amount_of_stripes = Math.ceil($this.wrap_width / $this.options.stripe_width);
		
		for(var i = 0; i < amount_of_stripes; i++) {
			var stripe = new Element('div', { 'class' : 'gk_is_stripe' });
			stripe.setStyles({ 'left' : i * $this.options.stripe_width + "px", 'width' : $this.options.stripe_width + "px" });
			stripe.injectInside($E('.gk_is_slides', $this.wrapper));
			if($this.options.slide_links) stripe.addEvent('click', function() { $this.redirect($this.actual_slide); });
			
			$this.stripes.push({
				"stripe" : stripe, 
				"anim_top" : new Fx.Style(stripe, 'top', { 
					duration: $this.options.anim_speed - ((amount_of_stripes - i) * (Math.floor($this.options.anim_speed / amount_of_stripes)))
				}).set(($this.options.anim_type !== 'stripes-mixed') ? (($this.options.anim_type == 'stripes-opacity-height' || $this.options.anim_type == 'stripes-height') ? 0 : -$this.wrap_height) : (i%2 == 1 ? -$this.wrap_height : $this.wrap_height)  ), 
				"anim_height" : new Fx.Style(stripe, 'height', { 
					duration: $this.options.anim_speed - ((amount_of_stripes - i) * (Math.floor($this.options.anim_speed / amount_of_stripes)))
				}).set(($this.options.anim_type == 'stripes-opacity-height' || $this.options.anim_type == 'stripes-height') ? 0 : $this.wrap_height),
				"anim_opacity" : new Fx.Style(stripe, 'opacity', {
					duration: $this.options.anim_speed				
				}).set(($this.options.anim_type == 'stripes-mixed' || $this.options.anim_type == 'stripes-opacity-height' || $this.options.anim_type == 'stripes-opacity-top') ? 0 : 1)
			});
		}
    },
    
    text_anim: function(which) {
        var max = $this.slides.length-1;
        which = (which > max) ? 0 : ((which < 0) ? max : which);
        
        $E('.gk_is_text', $this.wrapper).innerHTML = $ES('.gk_is_text_item', $this.wrapper)[which].innerHTML;
    },
    
    pagination_active: function(which) {
        if($this.pagination) {
            $this.pagination.getElements('li').setProperty('class', '');
            $this.pagination.getElements('li')[which].setProperty('class', 'active');
        }
    },
    
    anim: function(which) {
        if(which != $this.actual_slide){ 
            var max = $this.slides.length-1;
            which = (which > max) ? 0 : ((which < 0) ? max : which);
            var actual = $this.actual_slide;
            $this.actual_slide = which;
            
            $this.playing = true;
            
            if($this.text) $this.text_anim(which);
            $this.pagination_active(which);
            // opacity anim
           	if($this.options.anim_type == 'opacity') {
	            $this.slides[actual].slide.setStyle("z-index",max+1);
	            $this.slides[actual].anim.start(1,0);
	            $this.slides[which].anim.start(0,1);
	            
	            (function(){
	                $this.slides[$this.actual_slide].slide.setStyle("z-index", $this.actual_slide);
	                $this.playing = false;
	            }).delay($this.options['anim_speed']);
	        }
			// top anim
            if($this.options.anim_type == 'stripes-top' || $this.options.anim_type == 'stripes-opacity-top') {
       			$this.stripes.each(function(item,i){
            		item.stripe.setStyle("background", "transparent url('" + $this.slides[which].slide.getProperty('src') + "') " + (-1 * i * $this.options.stripe_width) + "px 0");
           			item.anim_top.start(0); 
           			if($this.options.anim_type == 'stripes-opacity-top') item.anim_opacity.start(1);
            	});
            	
            	(function(){
                    $this.slides[actual].anim.set(0);
            		$this.slides[which].anim.set(1);
            	    $this.slides[$this.actual_slide].slide.setStyle("z-index", $this.actual_slide);
            	    
                     $this.stripes.each(function(item){ 
            		 	item.anim_top.set(-$this.wrap_height); 
            		 	if($this.options.anim_type == 'stripes-opacity-top') item.anim_opacity.set(0);
            		 });
            		 
            		 $this.playing = false;
            	}).delay($this.options['anim_speed']);
            }
            // height anim
            if($this.options.anim_type == 'stripes-height' || $this.options.anim_type == 'stripes-opacity-height') {
            	$this.stripes.each(function(item,i){
            		item.stripe.setStyle("background", "transparent url('" + $this.slides[which].slide.getProperty('src') + "') " + (-1 * i * $this.options.stripe_width) + "px 0");
           			item.anim_height.start($this.wrap_height); 
            		if($this.options.anim_type == 'stripes-opacity-height') item.anim_opacity.start(1);
            	});
            	
            	(function(){
            		$this.slides[actual].anim.set(0);
            		$this.slides[which].anim.set(1);
            		$this.slides[$this.actual_slide].slide.setStyle("z-index", $this.actual_slide);
            	
            		 $this.stripes.each(function(item){ 
            		 	item.anim_height.set(0);
            		 	if($this.options.anim_type == 'stripes-opacity-height') item.anim_opacity.set(0); 
            		 	$this.playing = false;
            		 });
            	}).delay($this.options['anim_speed']);
            }
            // anim mixed	
            if($this.options.anim_type == 'stripes-mixed') {
            	$this.stripes.each(function(item,i){
            		item.stripe.setStyle("background", "transparent url('" + $this.slides[which].slide.getProperty('src') + "') " + (-1 * i * $this.options.stripe_width) + "px 0");
           			item.anim_top.start(0); 
           			item.anim_opacity.start(1);
            	});
            	
            	(function(){
            		$this.slides[actual].anim.set(0);
            		$this.slides[which].anim.set(1);
            		$this.slides[$this.actual_slide].slide.setStyle("z-index", $this.actual_slide);
            	
            		 $this.stripes.each(function(item,i){ 
            		 	item.anim_top.set(i%2 == 1 ? -$this.wrap_height : $this.wrap_height);
            		 	item.anim_opacity.set(0); 
            		 	$this.playing = false;
            		 });
            	}).delay($this.options['anim_speed']);
            }
        }
    },
    
    redirect: function(where) {
        window.location = $this.links[where];
    }
});

GK_IS_sep2010_11.implement(new Options);

var GK_IS_sep2010_12 = new Class({
    
    options: {
        "anim_type" : "opacity", // opacity, stripes-top, stripes-height, stripes-opacity-top, stripes-opacity-height, stripes-mixed 
        "anim_interval" : 5000,
        "anim_speed" : 500,
        "stripe_width" : 20,
        "slide_links" : true
    },
    
    initialize: function(options, el, elID) {
        this.setOptions(options);
        $this = this;
        this.loadedImages = false;
        this.wrapper = $(elID);   
        this.slides = [];
        this.contents = [];
        this.links = [];
        this.play = false;
        this.$blank = false;
        this.overlayAnim = false;
        this.actual_slide = 0;
        this.stripes = [];
        this.wrap_width = this.wrapper.getElement('.gk_is_slides').getSize().x;
        this.wrap_height = this.wrapper.getElement('.gk_is_slides').getSize().y;
        this.text = this.wrapper.getElement('.gk_is_text');
        this.blank = false;
        this.pagination = this.wrapper.getElement('.gk_is_pagination');
        this.playing = false;
        
        this.wrapper.getElements('.gk_is_text_item').each(function(el){
            $this.links.push(el.getElement('h4 a').getProperty('href'));
        });
        
        if(this.text) this.text_anim(0);
        if(this.pagination) {
            this.pagination_active(0);
            this.pagination.getElements('li').each(function(li, i) {
                li.addEvent('click', function(){
                    if(!$this.playing) {
                        $this.blank = true;
                        $this.anim(i);
                    }
                });
            });
        }
        
        var imagesToLoad = [];
        var amount = this.wrapper.getElements('.gk_is_slide').length;
        
        this.wrapper.getElements('.gk_is_slide').each(function(elm,i){
            $this.links.push(elm.innerHTML);
            var newImg = new Element('img', { 'class' : 'gk_is_slide', 'alt' : '', 'src' : elm.innerHTML, 'style' : 'z-index:' + (amount - i) });
            imagesToLoad.push(newImg);
            newImg.injectAfter(elm);
            elm.remove();
        });
        
        if($this.options.anim_type != 'opacity') this.init_stripes();
              
        var time = (function(){
            var process = 0;                
            imagesToLoad.each(function(el,i){ if(el.complete) process++; });
          
            if(process == imagesToLoad.length){
                ////alert("process "+process);
                $clear(time);
                $this.loadedImages = process;
                (function(){
                    new Fx.Style($this.wrapper.getElement('.gk_is_preloader'), 'opacity').start(0); 
                    $this.wrapper.getElements('.gk_is_slide').each(function(slide,i){
                    	$this.slides.push({
                    		"slide":slide, 
                    		"anim": new Fx.Style(slide, 'opacity', { duration: $this.options['anim_speed'] }).set(i != 0 ? 0 : 1)
                    	});
                        ////alert("fserwer "+$this.slides.length);
                    	if($this.options.slide_links) slide.addEvent('click', function() { $this.redirect($this.actual_slide); });
                    });
                }).delay(400);
            }
        }).periodical(200);
        
        if(this.options['autoanim']){
            (function(){
                if($this.blank == false){
                    $this.anim($this.actual_slide+1);
                }else $this.blank = false;
            }).periodical($this.options['anim_interval']+$this.options['anim_speed']);
        }
    },
    // down top anim
    init_stripes: function() {
		// create stripes
        var amount_of_stripes = Math.ceil($this.wrap_width / $this.options.stripe_width);
		
		for(var i = 0; i < amount_of_stripes; i++) {
            var stripe = new Element('div', { 'class' : 'gk_is_stripe' });
            stripe.setStyles({ 'left' : i * $this.options.stripe_width + "px", 'width' : $this.options.stripe_width + "px" });
			stripe.injectInside($this.wrapper.getElement('.gk_is_slides'));
			
			if($this.options.slide_links) stripe.addEvent('click', function() { $this.redirect($this.actual_slide); });
			
			$this.stripes.push({
				"stripe" : stripe, 
				"anim_top" : new Fx.Style(stripe, 'top', { 
					duration: $this.options.anim_speed - ((amount_of_stripes - i) * (Math.floor($this.options.anim_speed / amount_of_stripes)))
				}).set(($this.options.anim_type !== 'stripes-mixed') ? (($this.options.anim_type == 'stripes-opacity-height' || $this.options.anim_type == 'stripes-height') ? 0 : -$this.wrap_height) : (i%2 == 1 ? -$this.wrap_height : $this.wrap_height)  ), 
				"anim_height" : new Fx.Style(stripe, 'height', { 
					duration: $this.options.anim_speed - ((amount_of_stripes - i) * (Math.floor($this.options.anim_speed / amount_of_stripes)))
				}).set(($this.options.anim_type == 'stripes-opacity-height' || $this.options.anim_type == 'stripes-height') ? 0 : $this.wrap_height),
				"anim_opacity" : new Fx.Style(stripe, 'opacity', {
					duration: $this.options.anim_speed				
				}).set(($this.options.anim_type == 'stripes-mixed' || $this.options.anim_type == 'stripes-opacity-height' || $this.options.anim_type == 'stripes-opacity-top') ? 0 : 1)
			});
		}
    },
    
    text_anim: function(which) {
        var max = $this.slides.length-1;
        which = (which > max) ? 0 : ((which < 0) ? max : which);
        
        $this.wrapper.getElement('.gk_is_text').innerHTML = $this.wrapper.getElements('.gk_is_text_item')[which].innerHTML;
    },
    
    pagination_active: function(which) {
        if($this.pagination) {
            $this.pagination.getElements('li').setProperty('class', '');
            $this.pagination.getElements('li')[which].setProperty('class', 'active');
        }
    },
    
    anim: function(which) {
        if(which != $this.actual_slide){ 
            var max = $this.slides.length-1;
            which = (which > max) ? 0 : ((which < 0) ? max : which);
            var actual = $this.actual_slide;
            $this.actual_slide = which;
            
            $this.playing = true;
            
            if($this.text) $this.text_anim(which);
            $this.pagination_active(which);
            // opacity anim
           	if($this.options.anim_type == 'opacity') {
	            $this.slides[actual].slide.setStyle("z-index",max+1);
	            $this.slides[actual].anim.start(1,0);
	            $this.slides[which].anim.start(0,1);
	            
	            (function(){
	                $this.slides[$this.actual_slide].slide.setStyle("z-index", $this.actual_slide);
	                $this.playing = false;
	            }).delay($this.options['anim_speed']);
	        }
			// top anim
            if($this.options.anim_type == 'stripes-top' || $this.options.anim_type == 'stripes-opacity-top') {
       			$this.stripes.each(function(item,i){
            		item.stripe.setStyle("background", "transparent url('" + $this.slides[which].slide.getProperty('src') + "') " + (-1 * i * $this.options.stripe_width) + "px 0");
           			item.anim_top.start(0); 
           			if($this.options.anim_type == 'stripes-opacity-top') item.anim_opacity.start(1);
            	});
            	
            	(function(){
                    $this.slides[actual].anim.set(0);
            		$this.slides[which].anim.set(1);
            	    $this.slides[$this.actual_slide].slide.setStyle("z-index", $this.actual_slide);
            	    
                     $this.stripes.each(function(item){ 
            		 	item.anim_top.set(-$this.wrap_height); 
            		 	if($this.options.anim_type == 'stripes-opacity-top') item.anim_opacity.set(0);
            		 });
            		 
            		 $this.playing = false;
            	}).delay($this.options['anim_speed']);
            }
            // height anim
            if($this.options.anim_type == 'stripes-height' || $this.options.anim_type == 'stripes-opacity-height') {
            	$this.stripes.each(function(item,i){
            		item.stripe.setStyle("background", "transparent url('" + $this.slides[which].slide.getProperty('src') + "') " + (-1 * i * $this.options.stripe_width) + "px 0");
           			item.anim_height.start($this.wrap_height); 
            		if($this.options.anim_type == 'stripes-opacity-height') item.anim_opacity.start(1);
            	});
            	
            	(function(){
            		$this.slides[actual].anim.set(0);
            		$this.slides[which].anim.set(1);
            		$this.slides[$this.actual_slide].slide.setStyle("z-index", $this.actual_slide);
            	
            		 $this.stripes.each(function(item){ 
            		 	item.anim_height.set(0);
            		 	if($this.options.anim_type == 'stripes-opacity-height') item.anim_opacity.set(0); 
            		 	$this.playing = false;
            		 });
            	}).delay($this.options['anim_speed']);
            }
            // anim mixed	
            if($this.options.anim_type == 'stripes-mixed') {
            	$this.stripes.each(function(item,i){
            		item.stripe.setStyle("background", "transparent url('" + $this.slides[which].slide.getProperty('src') + "') " + (-1 * i * $this.options.stripe_width) + "px 0");
           			item.anim_top.start(0); 
           			item.anim_opacity.start(1);
            	});
            	
            	(function(){
            		$this.slides[actual].anim.set(0);
            		$this.slides[which].anim.set(1);
            		$this.slides[$this.actual_slide].slide.setStyle("z-index", $this.actual_slide);
            	
            		 $this.stripes.each(function(item,i){ 
            		 	item.anim_top.set(i%2 == 1 ? -$this.wrap_height : $this.wrap_height);
            		 	item.anim_opacity.set(0); 
            		 	$this.playing = false;
            		 });
            	}).delay($this.options['anim_speed']);
            }
        }
    },
    
    redirect: function(where) {
        window.location = $this.links[where];
    }
});

GK_IS_sep2010_12.implement(new Options);