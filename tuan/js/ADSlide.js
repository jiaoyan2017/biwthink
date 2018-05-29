/**
 * @author 愚人码头
 * 演示地址：http://www.css88.com/demo/ADSlide/
 * 下载地址：http://www.css88.com/demo/ADSlide/
 */
(function($){
	$.fn.ADSlide=function(settings){
		settings = jQuery.extend({
        	speed : "normal",
			num : 5,
			timer : 1000,
			flowSpeed:300
    	}, settings);
		return this.each(function() {
			$.fn.ADSlide.scllor( $(this), settings );
    	});
	};
	
	$.fn.ADSlide.scllor=function($this,settings){
		var index=0;
		$("<div id='flow'></div>").appendTo($this);
		var li=$(".flash_item li");
		var showImg=$(".flash_img li")
		li.hover(function(){
			if(intervalTime){
				clearInterval(intervalTime);
			}
			index=li.index(this);
			intervalTime=setTimeout(function(){
				$(".flash_img li").stop();
				ShowAD(index);
			}, 400);

		},function(){
			clearInterval(intervalTime);
			intervalTime=setInterval(function(){
				ShowAD(index);
				index++;
				if (index == settings.num) {
					index = 0;
				}
			}, settings.timer);
		});
		showImg.hover(function(){
			if(intervalTime){
				clearInterval(intervalTime);
			}
		},function(){
			clearInterval(intervalTime);
			intervalTime=setInterval(function(){
				ShowAD(index);
				index++;
				if (index == settings.num) {
					index = 0;
				}
			}, settings.timer);
		});
		var intervalTime= setInterval(function(){
			ShowAD(index);
			index++;
			if(index==settings.num){
				index=0;
			}
		},settings.timer);
		var ShowAD=function(i){
			showImg.eq(i).animate({opacity:1},settings.speed).css({"z-index": "1"}).siblings().animate({opacity: 0},settings.speed).css({"z-index":"0"});
			$("#flow").animate({top:i*76+"px"})
		};
	};
})(jQuery);

