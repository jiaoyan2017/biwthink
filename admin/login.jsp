<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page  import="java.util.*"%>
<%@ page import="com.yi.Action.*" %>
<%@ page import="com.yi.vo.*" %>

<%@page import="com.yi.util.PageBean"%>
<%@page import="com.yi.Dao.PublicDao"%>
<%@page import="com.yi.util.StringUtils"%>
<%@page import="com.google.code.kaptcha.Constants"%>  
<%
request.setCharacterEncoding("UTF-8");
StringUtils  s = new StringUtils();
String username = "";

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CMS发布系统</title>
<link href="style.css" media="screen" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>

<script language=javascript>

	
	
    function CheckSubmit(){
	

        if(document.myform.username.value==''){
            alert('用户名不能为空！');
            document.myform.username.focus();
            return false;
        }

       
		
		 if(document.myform.password.value==''){
            alert('密码不能为空！');
            document.myform.password.focus();
            return false;
        }
		
		if(document.myform.kaptcode.value==''){
            alert('验证码不能为空！');
            document.myform.kaptcode.focus();
            return false;
        }
    }
	
 $(function() {  
$('#onClickText').click(function() {  

$('#kaptchaImage').attr('src', '../kaptcha.jpg?' + Math.floor(Math.random() * 100));  
})  
});  

   
    </script>
</head>

<body>
<div class="main">
	<div class="main2"></div>
	 <form name='myform' id='myform' action='commonlogin.jsp' method='post' onSubmit='return CheckSubmit();'>
    <div class="main3">用户名：
      <input type="text" name="username" id="username" class="id01" />
     &nbsp; 密码：
    <input type="password" name="password" id="password" class="id01" />
    &nbsp;
    验证码:
      &nbsp;<input id="kaptcode"  size="15" name="kaptcode"  class="id01"/> &nbsp;  
      <input type="submit" name="button" id="button" value="登 录" class="id03" />
      <img src="../kaptcha.jpg" align="absmiddle" id="kaptchaImage"/> 
       <a  id="onClickText">看不清，换一个</a></div>
	</form>
</div>
</body>
</html>
