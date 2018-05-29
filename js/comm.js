/*=首页右侧 促销栏Hover效果*/
function initCuxiao(sId){
	var curObj;
	$("#"+sId+" li").each(function(i){
		var jQobj=$(this);
		//curObj=$("#jQcuxiaoLs .current");
		jQobj.hover(function(){
				jQobj.css("backgroundColor","#f1ffe6");
				//curObj.removeClass("current");
				$("#"+sId+" li").each(function(j){
					$(this).removeClass("current");
					if(i==j){
						$(this).addClass("current");
					}
				});
				//$(this).addClass("hov");
			},function(){
				$(this).css("backgroundColor","#fff");

		});

	});
}



/*=主题营销切换样式
	//change_content()默认下的切换
	//initnavTa()  四个li的click廷时初始化
*/
var timeout2=5000;  //切换时间
var timeout3=10000; //mouse over 后切换时间
var total_content;
var theTimer1,theTimer2;
var start_content=0;
var now_content=0;
//var total_content=4;
//var way=1;
var div,li;
//主题营销自动切换事件
function change_content(){
	clearTimeout(theTimer1);
	//alert("11"+total_content);
	div=$("#jQnavTab");
	li=$("#jQnavTab li");
 	for (var i=0;i<total_content;i++){
		li.eq(i).removeClass("current");
	  	$("#jQnavTabcn"+i).hide();
  	}
	//alert(now_content);
  	li.eq(now_content).addClass("current");
	$("#jQnavTabcn"+now_content).show();
	now_content++;
	if(now_content>total_content-1){
		now_content=0;
	}
  	theTimer2=setTimeout('change_content()', timeout2);
}
//主题营销切换按钮点击 hover事件初始化
function initnavTab(){
	var showObj=$(".jQnavTabcn .navTabcn");  //要显示的图片层
	var tatObj=$("#jQnavTab li");  //四个切换的tab
	//alert("22"+total_content);
	tatObj.each(function(i){
		$(this).hover(
			function(){
				clearTimeout(theTimer2);
				tatObj.each(function(j,domEle){
					if(i==j){
						$(domEle).addClass("current");
						now_content=i+1;
						if(now_content>total_content-1){
							now_content=0;
						}
					}else{
						$(domEle).removeClass("current");
					}
				});
				showObj.each(function(k,domEle){
					if(i==k){
						$(domEle).show();
					}else{
						$(domEle).hide();
					}
				});
			},function(){
				theTimer2=setTimeout('change_content()', timeout2);
			}
		);
	});
	/*showObj.each(function(i){
		$(this).hover(function(){
				showObj.each(function(j,domEle){
					if($(domEle).css("display")=="block"){
						clearTimeout(theTimer2);
						theTimer1=setTimeout('change_content()', timeout3);
					}
				});
			},function(){
				showObj.each(function(j,domEle){
					if($(domEle).css("display")=="block"){
						clearTimeout(theTimer1);
						theTimer2=setTimeout('change_content()', timeout2);
					}
				});
			}
		);
	});*/
}


/*=拼购抢购时间 天时分秒
	//
	//
*/
function str2date(str) {
    /*=str：yy-mm-dd hh:mm:ss=*/
    var d = null;
    var reg = /^(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})$/;
    if (arr = str.match(reg)) d = new Date(Number(arr[1]), Number(arr[2]) - 1, Number(arr[3]), Number(arr[4]), Number(arr[5]), Number(arr[6]));
    return d;
}

function TimeToDetailN(timeSpan) {
	var timeObj = new Object();
	timeObj.day = Math.floor(timeSpan / 1000 / 3600 / 24);
	timeSpan = timeSpan - (timeObj.day * 1000 * 3600 * 24);
	timeObj.hour = Math.floor(timeSpan / 1000 / 3600);
	timeSpan = timeSpan - (timeObj.hour * 1000 * 3600);
	timeObj.minute = Math.floor(timeSpan / 1000 / 60);
	timeSpan = timeSpan - (timeObj.minute * 1000 * 60);
	timeObj.second = Math.floor(timeSpan / 1000);

	return timeObj;
}

function timeCountDownN(msSpan) {
	var timeObj=TimeToDetailN(msSpan);
    //格式化输出时间为x天x小时xx分xx秒
    var output = "";
	var sday=(timeObj.day<=0)?("00"):((timeObj.day<10)?("0"+timeObj.day):(timeObj.day));
	var shour=(timeObj.hour<=0)?("00"):((timeObj.hour<10)?("0"+timeObj.hour):(timeObj.hour));
	var sminute=(timeObj.minute<=0)?("00"):((timeObj.minute<10)?("0"+timeObj.minute):(timeObj.minute));
	var ssecond=(timeObj.second<=0)?("00"):((timeObj.second<10)?("0"+timeObj.second):(timeObj.second));
	if(sday=='0'){
		output="<span><em class='eng'>"+shour+"</em>"+"时</span>"+"<span><em class='eng'>"+sminute+"</em>"+"分</span>"+"<span><em class='eng'>"+ssecond+"</em>"+"秒</span>";
	}else{
		output="<span><em class='eng'>"+sday+"</em>"+"天</span>"+"<span><em class='eng'>"+shour+"</em>"+"时</span>"+"<span><em class='eng'>"+sminute+"</em>"+"分</span>"+"<span><em class='eng'>"+ssecond+"</em>"+"秒</span>";
	}
	//output="<em class='eng'>"+sday+"</em>"+"天"+"<em class='eng'>"+shour+"</em>"+"时"+"<em class='eng'>"+sminute+"</em>"+"分"+"<em class='eng'>"+ssecond+"</em>"+"秒";
    return output;
}

function initPromotTime(cssstr){
		var timeObj=$("."+cssstr);
		var endObj,nowObj,showObj;
		var dateEnd,dateNow,msSapn;
		endObj=$("."+cssstr+" .jQTimeEnd");
		nowObj=$("."+cssstr+" .jQTimeNow");
		showObj=$("."+cssstr+" .jQshowcn");
		dateEnd=str2date(endObj.text());
		dateNow=str2date(nowObj.text());
		var msSpan = dateEnd.getTime() - dateNow.getTime();
		//alert(msSpan);
		setInterval(function() {
				var sHtml = "";

				if (msSpan >0) {
					//msSpan = msSpan / 1000;
					sHtml = timeCountDownN(msSpan);
				}
				showObj.html(sHtml);
				msSpan-=1000;
			}, 1000);
}

//拼抢购的最后购买者状态 事件初始化
function initBuyState(cssstr){
	var cnObj=$("."+cssstr);
	var obj=$("."+cssstr+" .jQbuyState");
	var id,flg;
	flg=$.trim(cnObj.attr("flg"));
	id=parseInt(cnObj.attr("aid"));
	/*$.post(buysUrl,{activity_id:id,action:flg},function(data){
		if(data&&data.length!=0){
			if(obj.get(0)){
				obj.html(data);
			}else{
				obj.html("<div class='cnft jQbuyState>"+data+"</div>");
			}
		}else{
			cnObj.hide();
		}
	});
	var theTimer3=setTimeout('initBuyState("'+cssstr+'")', 1000);
	*/
}

 $(".HoverPane").each(function(i) {
	        var singleCur = this;
	        var tObj = $(singleCur).find(".h-t");
	        var cObj = $(singleCur).find(".h-c");

	        tObj.hover(
				function() {
					cObj.show();
					$(singleCur).addClass("hpOver");
				},
				function() {
					singleCur.timeout = setTimeout(function() {
						cObj.hide();
						$(singleCur).removeClass("hpOver");
					}, 800);
				}
              );
	        cObj.hover(function() {
	                clearTimeout(singleCur.timeout);
	                cObj.show();
					$(singleCur).addClass("hpOver");
	            },
                  function() {
                      cObj.hide();
					  $(singleCur).removeClass("hpOver");
                  }
              );
	    });

/*= 返回顶部事件
-----------------------------------------------------------------------------------------------------------------------------*/
var bIe6Flg=false;
if($.browser.msie){
	if($.browser.version=='6.0'){
		bIe6Flg=true;
	}
}
// 获取滚动条所在位置
function getScrollTop(){
	var de = document.documentElement;
	var clientH=de.clientHeight;
	var top= self.pageYOffset ||( de && de.scrollTop ) ||document.body.scrollTop;
	return top;
}
//bFlg用来判断是不是第一次生成toTop div；false表示没有生成过
var bFlg=false;
//初始化滚动条滚动事件
function init_top(){
	var sHtml="<div class='toTop' id='toTop'><a href='#top'>返回顶部</a></div>";
	var de = document.documentElement;
	var clientH=de.clientHeight;  //当前屏幕在高度
	var scH=clientH/4;      //滚过当前屏幕的1/4
	//var iTop=0;     //放置Top的值
	var top= getScrollTop();	//滚动条的位置
	//alert("top:"+top);
	if(scH&&top){
		//iTop=(top+clientH/2);   //返回顶部的TOP的值，加上78是为了不和我要留言重叠
		if(!bFlg){
			if(top>=scH){
				$("#fixed").prepend(sHtml);
				$("#toTop").show();
				bFlg=true;
			}else{
				$("#toTop").hide();
			}
		}else{
			if(top>=scH){
				$("#toTop").show();
			}
			else{
				$("#toTop").hide();
			}
		}
	}else{
		$("#toTop").hide();
	}
}
//IE 的滚动移动固定事件
function IE6scroll(){
	var top=getScrollTop();
	var de = document.documentElement;
	var clientH=de.clientHeight;
	var newTop=top+(clientH/4);
	if(newTop<230){
		newTop=230;
	}
	$("#fixed").css("top",newTop+"px");
}	
	
$(document).ready(function(){
	$(window).scroll(function(){
		init_top();   //返回顶部事件
	});
	if(bIe6Flg){  //如果是IE6
		$(window).scroll(function(){
			IE6scroll();
		});
	}
	//促销块的鱼眼效果
	initCuxiao("jQcuxiaoLs");
	//主题营销
	change_content();
	initnavTab();
	//拼抢购抢块时间
	//initPromotTime('jQTmScare');
	//initPromotTime('jQTmGroup');

	//拼抢购的最后购买者状态
	initBuyState("jQbsScare");
	initBuyState("jQbsGroup");

});