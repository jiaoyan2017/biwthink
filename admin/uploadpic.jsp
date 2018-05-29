<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page  import="java.util.*"%>
<%@ page  import="com.jspsmart.upload.*"%>
<%   
String path = request.getContextPath();   
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   
%>   
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">   
<html>   
  <head>   
    <base href="<%=basePath%>">   
 
  </head>   
     
  <body>   
    <%   
        //得到一个SmartUpload对象   
        SmartUpload su=new SmartUpload();   
        //上传下载前的初始化方法   
        su.initialize(pageContext);   
        //设置不可以上传的文件后缀列表,没有后缀名的文件也不能上传，用,,来表示   
        String denieddList="exe,bat,,";   
        su.setDeniedFilesList(denieddList);   
        //设置可以上传的文件   
        String allowedList="doc,txt,jpeg,png,bmp,rar,zip,pdf,chm,jpg,gif";   
        su.setAllowedFilesList(allowedList);   
        //设定单个文件的最大值不超过10兆   
        su.setMaxFileSize(1024*1024*10);   
        su.upload();   
        Files files=su.getFiles();   
        String filename="";
        for(int i=0;i<files.getCount();++i){   
            File file=files.getFile(i);   
            //判断有没有上传文件   
            if(file.isMissing()){   
                continue;   
            }   
            filename=file.getFileName();   
            String ext=file.getFileExt();   
            String filepathname=file.getFilePathName();   
            String size=file.getSize()+"";   
            String filedname=file.getFieldName();   
           // out.println("文件信息：");   
            //out.println("文件全路径名："+filepathname+"<br>");   
           // out.println("文件名"+filename+"<br>");   
           // out.println("字段名："+filedname+"<br>");   
           // out.println("文件后缀名："+ext+"<br>");   
           // out.println("文件大小:"+size+"<br>");   
           // out.print("<p><p>");   
            //将文件上传到Web应用目录下的upload目录下，这个需要在Web应用目录下事先建好一个upload目录   
            //网上说得那个加后缀名的方法试了一下，提示找不到路径，   
            su.save("/upload",File.SAVEAS_VIRTUAL);   
        }   
        
        String strJS="<SCRIPT language=javascript>";
        strJS=strJS + "parent.document.getElementById(" + "'" + "addresspic" + "'"+").value='"+filename+"';";
		
		strJS=strJS + "</script>";
		
		out.print(strJS);
		//response.sendRedirect(strJS);
     %>   
    <!-- <a href="<%//=path%>/up.jsp">上传文件成功，点此继续上传文件</a>   -->
  </body>   
</html>  
