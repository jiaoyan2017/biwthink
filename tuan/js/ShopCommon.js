/*前台页面公用*/
//滑动门
function tabOver(objId, objContId, Num, TotalNum, classNameOn, classNameOff)
{
    var tabNum = TotalNum;
    for (var i = 1; i <= tabNum; i++)
    {
        var tab = document.getElementById(objId + i);
        var tabCont = document.getElementById(objContId + i);
        if(tabCont != null && tab!=null)
        {
            if (i == Num)
            {
                tabCont.style.display = 'block';
                tab.className = classNameOn;
            } 
            else 
            {
                tabCont.style.display = 'none';
                tab.className = classNameOff;
            }
        }
    }
}
//上一图
function PicUp(area)
{
  var pics=document.getElementById(area);
  if(!pics){return;}
  var list=pics.childNodes;
   for(var i=0;i<list.length;i++)
  {
      if(list[i].nodeType==3)
      {
        var t=pics.childNodes[i];
        pics.removeChild(t);
      }
  }
  var len=list.length;
  if(len>1)
  {
	var t=pics.childNodes[len-1];
	pics.removeChild(t);
	pics.insertBefore(t,pics.childNodes[0]);
  }
}
//下一图
function PicDown(area)
{
  var pics=document.getElementById(area);
  if(!pics){return;}
  var list=pics.childNodes;
  for(var i=0;i<list.length;i++)
  {
      if(list[i].nodeType==3)
      {
        var t=pics.childNodes[i];
        pics.removeChild(t);
      }
  }
  if(list.length>1)
  {
	var t=pics.childNodes[0];
	pics.removeChild(t);
	pics.appendChild(t);
  }
}
//自动播放
function playnext()
{
    playit(slidint);
    slidint++
    if (slidint > 4) {
        slidint = 0;
    }
}
function playit(num) 
{
    var oItem = document.getElementById("smlPhoto").getElementsByTagName("ul")[1];
    var list = oItem.getElementsByTagName("li");
    var pic = document.getElementById("div" + num);
    var len = list.length;
    for (var i = 4; i < len; i++) {
        if (list[i] == pic) {
            pic = list[0];
            break;
        }
    }
    for (i = 0; i < len; i++) {
        list[i].className = "";
    }
    pic.className = "on";
    imgUrl = photoUrl[num];
    document.getElementById("imgurl").src = imgUrl;
    slidint = num;
	//初始化图片放大器
	InitMagnifier();
}
//判断是否为正整数
function IsInt(num)
{
    var re = /^(0|[1-9][0-9]*)$/;  
    if(!re.test(num))
    {
        return false;
    }
    return true;
}
//倒计时
function BackTime(endyear,endmonth,endday,endhour,endminute,endsecond)
{
    var nowTime=new Date();
    var day=hour=minitus=second=ms=0;
    var tmp=(new Date(endyear,endmonth,endday,endhour,endminute,endsecond)-nowTime)%86400000;
    var tmpforday=new Date(endyear,endmonth,endday,endhour,endminute,endsecond)-nowTime;
    day=Math.floor(tmpforday/86400000); 
    hour=Math.floor(tmp/3600000);
    if(hour<10)  {hour="0"+hour;} 

    tmp%=3600000;
    minitus=Math.floor(tmp/60000);
    if(minitus<10) {minitus="0"+minitus;} 

    tmp%=60000;
    second=Math.floor(tmp/1000);
    if(second<10) {second="0"+second;} 

    ms=tmp-1000*second;
    return [day,hour,minitus,second];
}

