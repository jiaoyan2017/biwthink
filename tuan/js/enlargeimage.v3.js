/*

*ͼƬ�Ŵ��� v2 
 
*Changes by ��־ǿ

*1.�����ͼƬ,��Ҫ���³�ʼ�� Ҳ��������InitMagnifier();
��v2��ȣ��޸���mag�Ŀ�ߣ�magnifier��top\left ����370��560 lfl 20120315 Ϊ����Ӧproduct2012.aspx

*/

function getEventObject(W3CEvent) {			//�¼���׼������
	return W3CEvent || window.event;
}
function getPointerPosition(e) {			//��������������x,y��ú���
	e = e || getEventObject(e);
	var x = e.pageX || (e.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));
	var y = e.pageY || (e.clientY + (document.documentElement.scrollTop || document.body.scrollTop));
	
	return { 'x':x,'y':y };
}
function setOpacity(elem,level) {			//�������������͸��ֵ
	if(elem.filters) {
		elem.style.filter = 'alpha(opacity=' + level * 100 + ')';
	} else {
		elem.style.opacity = level;
	}
}
function css(elem,prop) {				//css���ú���,���Է�������cssֵ,���Ҽ�������͸��ֵ
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
			cont : null,		//װ��ԭʼͼ���div
			img : null,			//�Ŵ��ͼ��
			mag : null,			//�Ŵ��
			scale : 12		//����ֵ,���õ�ֵԽ��Ŵ�Խ��,���������и���������������������ʱ,�����Щ��С�İױ�,Ŀǰ��֪����ν��
		}
		
		css(m.img,{	
			'position' : 'relative',
			'width' : (parseInt(document.getElementById('imgurl').width) * m.scale) + 'px',				//ԭʼͼ��Ŀ�*����ֵ	
			'height' : (parseInt(document.getElementById('imgurl').height) * m.scale) + 'px'				//ԭʼͼ��ĸ�*����ֵ
			})
		//�Ŵ�ͼƬ�Ĵ�С;
		css(m.mag,{
			'display' : 'none',
			'width' : '360px',			//m.contΪԭʼͼ��,��ԭʼͼ��ȿ�
			'height' :'376px',
			//'width' : (m.cont.clientWidth / 2) + 'px',
			//'height' : (m.cont.clientHeight) + 'px',
			'position' : 'absolute',
			'left' : m.cont.offsetLeft + m.cont.offsetWidth + 10 + 'px',		//�Ŵ���λ��Ϊԭʼͼ����ҷ�Զ10px
			'top' : m.cont.offsetTop + 'px'
			})
		
		var borderWid = m.cont.getElementsByTagName('div')[0].offsetWidth - m.cont.getElementsByTagName('div')[0].clientWidth;		//��ȡborder�Ŀ�
		//��ȡ���С
		css(m.cont.getElementsByTagName('div')[0],{			//m.cont.getElementsByTagName('div')[0]Ϊ�����
			'display' : 'none',								//��ʼ����Ϊ���ɼ�
			'width' :  360/ m.scale  + 'px',			//ԭʼͼƬ�Ŀ�/����ֵ - border�Ŀ��
			'height' : 376/ m.scale  + 'px',		//ԭʼͼƬ�ĸ�/����ֵ - border�Ŀ��
			//'width' : m.cont.clientWidth / m.scale - borderWid + 'px',			//ԭʼͼƬ�Ŀ�/����ֵ - border�Ŀ��
			//'height' : m.cont.clientHeight / m.scale - borderWid + 'px',
			'opacity' : 0.5					//����͸����
			})
		
		//m.img.src = document.getElementById('imgurl').src;			//��ԭʼͼ���srcֵ����Ŵ�ͼ��
		m.cont.style.cursor = 'crosshair';
		
		m.cont.onmouseover = magnifier.start;
		
	},
	
	start:function(e){
		
		if(document.all){				//ֻ��IE��ִ��,��Ҫ����IE6��select�޷�����
			magnifier.createIframe(magnifier.m.img);
		}
		
		this.onmousemove = magnifier.move;		//thisָ��m.cont
		this.onmouseout = magnifier.end;
	},
	
	move:function(e){
	    var temp = GetImgUrl(document.getElementById('imgurl').src,'t');
		//magnifier.m.img.src = document.getElementById('imgurl').src;			//��ԭʼͼ���srcֵ����Ŵ�ͼ��
		magnifier.m.img.src = temp;
		var pos = getPointerPosition(e);		//�¼���׼��
		var div = this.getElementsByTagName('div')[0];
		div.style.display = '';
		var leftSpace=(document.body.clientWidth-980)/2; //document.body.clientWidth�������հ״��Ŀ�ȣ�980��ҳ����
		if(leftSpace<0){leftSpace=0;}
		
		//��ȡ��λ��
		css(div,{
			'top' : Math.min(Math.max(pos.y - (this.offsetTop+300) - parseInt(div.style.height) / 2,0),this.clientHeight - div.offsetHeight) + 'px',
			'left' : Math.min(Math.max(pos.x-leftSpace - (this.offsetLeft+230) - parseInt(div.style.width) / 2,0),this.clientWidth - div.offsetWidth) + 'px'			//left=���x - this.offsetLeft - ������/2,Math.max��Math.min������򲻻ᳬ��ͼ��
			})
		
		magnifier.m.mag.style.display = '';
		
		css(magnifier.m.img,{
			'top' : - ((parseInt(this.getElementsByTagName('div')[0].style.top)-(parseInt(370-document.getElementById('imgurl').height)/2)) * magnifier.m.scale) + 'px', //  -(��ȡ���top-((��ԭͼdiv�ĸ�-ԭͼ�ĸ�)/2))
			'left' : - ((parseInt(this.getElementsByTagName('div')[0].style.left)-(parseInt(560-document.getElementById('imgurl').width)/2)) * magnifier.m.scale) + 'px'
			})
		
	},
	
	end:function(e){
		this.getElementsByTagName('div')[0].style.display = 'none';
		magnifier.removeIframe(magnifier.m.img);		//����iframe
		
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

//��ȡ��ͼƬ  ����β�ǣ� _000.jpg
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

