/*=��ҳ�Ҳ� ������HoverЧ��*/
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



/*=����Ӫ���л���ʽ
	//change_content()Ĭ���µ��л�
	//initnavTa()  �ĸ�li��click͢ʱ��ʼ��
*/
var timeout2=5000;  //�л�ʱ��
var timeout3=10000; //mouse over ���л�ʱ��
var total_content;
var theTimer1,theTimer2;
var start_content=0;
var now_content=0;
//var total_content=4;
//var way=1;
var div,li;
//����Ӫ���Զ��л��¼�
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
//����Ӫ���л���ť��� hover�¼���ʼ��
function initnavTab(){
	var showObj=$(".jQnavTabcn .navTabcn");  //Ҫ��ʾ��ͼƬ��
	var tatObj=$("#jQnavTab li");  //�ĸ��л���tab
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


/*=ƴ������ʱ�� ��ʱ����
	//
	//
*/
function str2date(str) {
    /*=str��yy-mm-dd hh:mm:ss=*/
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
    //��ʽ�����ʱ��Ϊx��xСʱxx��xx��
    var output = "";
	var sday=(timeObj.day<=0)?("00"):((timeObj.day<10)?("0"+timeObj.day):(timeObj.day));
	var shour=(timeObj.hour<=0)?("00"):((timeObj.hour<10)?("0"+timeObj.hour):(timeObj.hour));
	var sminute=(timeObj.minute<=0)?("00"):((timeObj.minute<10)?("0"+timeObj.minute):(timeObj.minute));
	var ssecond=(timeObj.second<=0)?("00"):((timeObj.second<10)?("0"+timeObj.second):(timeObj.second));
	if(sday=='0'){
		output="<span><em class='eng'>"+shour+"</em>"+"ʱ</span>"+"<span><em class='eng'>"+sminute+"</em>"+"��</span>"+"<span><em class='eng'>"+ssecond+"</em>"+"��</span>";
	}else{
		output="<span><em class='eng'>"+sday+"</em>"+"��</span>"+"<span><em class='eng'>"+shour+"</em>"+"ʱ</span>"+"<span><em class='eng'>"+sminute+"</em>"+"��</span>"+"<span><em class='eng'>"+ssecond+"</em>"+"��</span>";
	}
	//output="<em class='eng'>"+sday+"</em>"+"��"+"<em class='eng'>"+shour+"</em>"+"ʱ"+"<em class='eng'>"+sminute+"</em>"+"��"+"<em class='eng'>"+ssecond+"</em>"+"��";
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

//ƴ�������������״̬ �¼���ʼ��
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

/*= ���ض����¼�
-----------------------------------------------------------------------------------------------------------------------------*/
var bIe6Flg=false;
if($.browser.msie){
	if($.browser.version=='6.0'){
		bIe6Flg=true;
	}
}
// ��ȡ����������λ��
function getScrollTop(){
	var de = document.documentElement;
	var clientH=de.clientHeight;
	var top= self.pageYOffset ||( de && de.scrollTop ) ||document.body.scrollTop;
	return top;
}
//bFlg�����ж��ǲ��ǵ�һ������toTop div��false��ʾû�����ɹ�
var bFlg=false;
//��ʼ�������������¼�
function init_top(){
	var sHtml="<div class='toTop' id='toTop'><a href='#top'>���ض���</a></div>";
	var de = document.documentElement;
	var clientH=de.clientHeight;  //��ǰ��Ļ�ڸ߶�
	var scH=clientH/4;      //������ǰ��Ļ��1/4
	//var iTop=0;     //����Top��ֵ
	var top= getScrollTop();	//��������λ��
	//alert("top:"+top);
	if(scH&&top){
		//iTop=(top+clientH/2);   //���ض�����TOP��ֵ������78��Ϊ�˲�����Ҫ�����ص�
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
//IE �Ĺ����ƶ��̶��¼�
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
		init_top();   //���ض����¼�
	});
	if(bIe6Flg){  //�����IE6
		$(window).scroll(function(){
			IE6scroll();
		});
	}
	//�����������Ч��
	initCuxiao("jQcuxiaoLs");
	//����Ӫ��
	change_content();
	initnavTab();
	//ƴ��������ʱ��
	//initPromotTime('jQTmScare');
	//initPromotTime('jQTmGroup');

	//ƴ�������������״̬
	initBuyState("jQbsScare");
	initBuyState("jQbsGroup");

});