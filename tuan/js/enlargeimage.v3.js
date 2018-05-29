/*

*图片放大器 v2 
 
*Changes by 赵志强

*1.如果换图片,需要重新初始化 也就是运行InitMagnifier();
与v2相比，修改了mag的宽高，magnifier的top\left 常量370，560 lfl 20120315 为了适应product2012.aspx

*/

function getEventObject(W3CEvent) {			//事件标准化函数
	return W3CEvent || window.event;
}
function getPointerPosition(e) {			//兼容浏览器的鼠标x,y获得函数
	e = e || getEventObject(e);
	var x = e.pageX || (e.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));
	var y = e.pageY || (e.clientY + (document.documentElement.scrollTop || document.body.scrollTop));
	
	return { 'x':x,'y':y };
}
function setOpacity(elem,level) {			//兼容浏览器设置透明值
	if(elem.filters) {
		elem.style.filter = 'alpha(opacity=' + level * 100 + ')';
	} else {
		elem.style.opacity = level;
	}
}
function css(elem,prop) {				//css设置函数,可以方便设置css值,并且兼容设置透明值
	for(var i in prop) {
		if(i == 'opacity') {
			setOpacity(elem,prop[i]);
		} else {
			elem.style[i] = prop[i];
		}
	}
	return elem;
}
var magnifier = {
	m : null,
	
	init:function(magni){
		var m = this.m = magni || {
			cont : null,		//装载原始图像的div
			img : null,			//放大的图像
			mag : null,			//放大框
			scale : 12		//比例值,设置的值越大放大越大,但是这里有个问题就是如果不可以整除时,会产生些很小的白边,目前不知道如何解决
		}
		
		css(m.img,{	
			'position' : 'relative',
			'width' : (parseInt(document.getElementById('imgurl').width) * m.scale) + 'px',				//原始图像的宽*比例值	
			'height' : (parseInt(document.getElementById('imgurl').height) * m.scale) + 'px'				//原始图像的高*比例值
			})
		//放大图片的大小;
		css(m.mag,{
			'display' : 'none',
			'width' : '360px',			//m.cont为原始图像,与原始图像等宽
			'height' :'376px',
			//'width' : (m.cont.clientWidth / 2) + 'px',
			//'height' : (m.cont.clientHeight) + 'px',
			'position' : 'absolute',
			'left' : m.cont.offsetLeft + m.cont.offsetWidth + 10 + 'px',		//放大框的位置为原始图像的右方远10px
			'top' : m.cont.offsetTop + 'px'
			})
		
		var borderWid = m.cont.getElementsByTagName('div')[0].offsetWidth - m.cont.getElementsByTagName('div')[0].clientWidth;		//获取border的宽
		//截取框大小
		css(m.cont.getElementsByTagName('div')[0],{			//m.cont.getElementsByTagName('div')[0]为浏览框
			'display' : 'none',								//开始设置为不可见
			'width' :  360/ m.scale  + 'px',			//原始图片的宽/比例值 - border的宽度
			'height' : 376/ m.scale  + 'px',		//原始图片的高/比例值 - border的宽度
			//'width' : m.cont.clientWidth / m.scale - borderWid + 'px',			//原始图片的宽/比例值 - border的宽度
			//'height' : m.cont.clientHeight / m.scale - borderWid + 'px',
			'opacity' : 0.5					//设置透明度
			})
		
		//m.img.src = document.getElementById('imgurl').src;			//让原始图像的src值给予放大图像
		m.cont.style.cursor = 'crosshair';
		
		m.cont.onmouseover = magnifier.start;
		
	},
	
	start:function(e){
		
		if(document.all){				//只在IE下执行,主要避免IE6的select无法覆盖
			magnifier.createIframe(magnifier.m.img);
		}
		
		this.onmousemove = magnifier.move;		//this指向m.cont
		this.onmouseout = magnifier.end;
	},
	
	move:function(e){
	    var temp = GetImgUrl(document.getElementById('imgurl').src,'t');
		//magnifier.m.img.src = document.getElementById('imgurl').src;			//让原始图像的src值给予放大图像
		magnifier.m.img.src = temp;
		var pos = getPointerPosition(e);		//事件标准化
		var div = this.getElementsByTagName('div')[0];
		div.style.display = '';
		var leftSpace=(document.body.clientWidth-980)/2; //document.body.clientWidth：宽屏空白处的宽度；980：页面宽度
		if(leftSpace<0){leftSpace=0;}
		
		//截取框位置
		css(div,{
			'top' : Math.min(Math.max(pos.y - (this.offsetTop+300) - parseInt(div.style.height) / 2,0),this.clientHeight - div.offsetHeight) + 'px',
			'left' : Math.min(Math.max(pos.x-leftSpace - (this.offsetLeft+230) - parseInt(div.style.width) / 2,0),this.clientWidth - div.offsetWidth) + 'px'			//left=鼠标x - this.offsetLeft - 浏览框宽/2,Math.max和Math.min让浏览框不会超出图像
			})
		
		magnifier.m.mag.style.display = '';
		
		css(magnifier.m.img,{
			'top' : - ((parseInt(this.getElementsByTagName('div')[0].style.top)-(parseInt(370-document.getElementById('imgurl').height)/2)) * magnifier.m.scale) + 'px', //  -(截取框的top-((放原图div的高-原图的高)/2))
			'left' : - ((parseInt(this.getElementsByTagName('div')[0].style.left)-(parseInt(560-document.getElementById('imgurl').width)/2)) * magnifier.m.scale) + 'px'
			})
		
	},
	
	end:function(e){
		this.getElementsByTagName('div')[0].style.display = 'none';
		magnifier.removeIframe(magnifier.m.img);		//销毁iframe
		
		magnifier.m.mag.style.display = 'none';
	},
	
	createIframe:function(elem){
		var layer = document.createElement('iframe');
		layer.tabIndex = '-1';
		layer.src = 'javascript:false;';
		elem.parentNode.appendChild(layer);
		
		layer.style.width = elem.offsetWidth + 'px';
		layer.style.height = elem.offsetHeight + 'px';
	},
	
	removeIframe:function(elem){
		var layers = elem.parentNode.getElementsByTagName('iframe');
		while(layers.length >0){
			layers[0].parentNode.removeChild(layers[0]);
		}
	}
}
function InitMagnifier()
{
	magnifier.init({
				   cont : document.getElementById('magnifier'),
				   img : document.getElementById('magnifierImg'),
				   mag : document.getElementById('mag'),
				   scale : 3
				   });
}
window.onload = function(){
    InitMagnifier();
}

//获取大图片  即结尾是： _000.jpg
function GetImgUrl(imgUrl,format)
{
    if(imgUrl.indexOf('http://uimgn')!=-1)
    {
        if(!format){format="t";}
        var index=imgUrl.lastIndexOf("_"+format+".");
        if (index>0)
        {
            imgUrl= imgUrl.substring(0,index)+imgUrl.substring(index+format.length+1);
        }
    }
    return imgUrl;

}

