var ImageJtx = {};
ImageJtx.Resize1 = function(image, width, height)
{
image.removeAttribute('width');
	image.removeAttribute('height');
	var w = image.width, h = image.height;
	 var scaling = w / h;
	if(width != null)
	{	
		if(w > width)
		{
			image.width = width;
			image.height = width / scaling;
		}
	}
	if(height != null)
	{	
	h=image.height;///!!!
		if(h > height)
		{
			image.width = height * scaling;			
			image.height = height;
		}
	}
}
//�ô˷������ܶ�ͼƬ�ӿ�ߵ���ʽ������Ҫע��css�е���ʽ��
function SetMiddle(image, height)
{
	/// <summary>����ͼƬ��С����ͼƬ�����DIV����</summary>
	
	if (typeof(image) == 'string') image = document.images[image] || document.getElementById(image);
	var div = image.parentNode;
	
	if(div.nodeName != "DIV")
	{

	    div = div.parentNode;
	}
	if(image.height > 0 && image.height < height)
	{
	   var marginTopVal= (height - image.height) / 2;
		image.style.marginTop =parseInt(marginTopVal)+"px";
		image.style.marginBottom=parseInt(marginTopVal)+"px";
		///����px,�ڻ���²�֧�֣�
	}
	else
	{
	    image.height = height;
		image.style.marginTop = "0px";
	}
}
function GetPictureThumbnailUrl(url, formatName)
{	
	if (url == null || url == '' || url.lastIndexOf('.') == -1)
	{
		return '';
	}
	else
	{
		var extend = url.substring(url.lastIndexOf('.'));
		url = url.replace(extend, '_' + formatName + extend);
		return url;
	}
}
ImageJtx.OnError = function(image)
{  
   image.src='http://img.soufun.com/home/image/jiancai/images/nopicture.gif';
}
///lfl���������������ţ�
ImageJtx.Resize=function(image,width,height)
{
    if(width==null||height==null)
    return;
    image.removeAttribute('width');
	image.removeAttribute('height');
	var w = image.width, h = image.height;
	var scalingW=w/width,scalingH=h/height;
	var scaling = w / h;
	if(scalingW>=scalingH)
	{
	image.width=width;
	image.height = width / scaling;
	}
	else
	{
	image.height=height;
	image.width = height*scaling;
	}
};