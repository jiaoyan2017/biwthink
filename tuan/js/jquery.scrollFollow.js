// JScript �ļ�
// JScript �ļ�

;if(typeof(jQuery)!="undefined")
{
   jQuery.fn.extend({
         scrollFollow:function (opts){
           var os=this;
           //Ĭ�ϲ�������
           //��������ʱ��
           var duration=200;
           //�ϱ߾�
           var offset=200;           
           
		   //�Ƿ����ù���������
		   var isRun=true;
            
            //��ȡ��������Ĳ���
           if(opts)
           {
               if(!isNaN(opts.duration))
               {
                   duration=parseInt(opts.duration);
               }
               if(!isNaN(opts.offset))
               {
                   offset=parseInt(opts.offset);
               }
			   if(typeof(opts.isRun)!='undefined')
			   {
					isRun = opts.isRun;
			   }
           }
		   
            //����cssĬ�����ԣ�Ԥ����
           os.each(function (){
               var o=$(this);
               o.css("position","absolute").appendTo("body");
           });
           
           //��Ӧ�����������¼�
           $(window).scroll(function (){
                var scrollPos; 
	            if (typeof window.pageYOffset != 'undefined') { 
		            scrollPos = window.pageYOffset; 
	            } 
	            else if (typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat') { 
		            scrollPos = document.documentElement.scrollTop; 
	            } 
	            else if (typeof document.body != 'undefined') { 
		            scrollPos = document.body.scrollTop; 
	            }
	            os.stop();
               os.each(function (){
				   if(isRun) {
						var o=$(this);
						o.animate({"top":offset+scrollPos},duration);
				   }
               });
           });
          
           return this;
       }
   });
}