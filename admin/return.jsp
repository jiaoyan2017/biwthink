<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.util.StringUtils"%>
<%@page import="com.google.code.kaptcha.Constants"%>  
<%
request.setCharacterEncoding("UTF-8");
StringUtils  s = new StringUtils();
	 String   err = s.trimStr(request.getParameter("err"));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="bm/js/jquery.js"></script>
<title>成义网科</title>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE6 {color: #FF0000}
body {
	background-image: url(bm/images/bg.gif);
	background-repeat: repeat-x;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #FFFFFF;
}
.STYLE11 {color: #666666}
.STYLE15 {color: #999999}
body,td,th {
	font-size: 12px;
	color: #666666;
}
.STYLE17 {
	font-size: 14px;
	font-weight: bold;
	color: #333333;
}
-->
</style>


</head>

<body>
<div align="center">

<table width="980" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="6"></td>
    </tr>
    <tr>
      <td height="37">&nbsp;</td>
    </tr>
  </table>
  <table width="980" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="30">&nbsp;</td>
    </tr>
  </table>
  <table width="980" border="0" cellspacing="0" cellpadding="0">

    <tr>
      <td height="405">&nbsp;</td>
      <td valign="top"><table width="830" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="26">&nbsp;</td>
        </tr>
      </table>
        <table width="830" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#C6C4C4">
        
        <tr>
          <td height="330" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="35" bgcolor="#e1edca"></td>
            </tr>
            <tr>
              <td height="1" bgcolor="c6c4c4"></td>
            </tr>
          </table><div align="center">
		  
		  <%
		  if("-10".equals(err)){
		    out.print("验证码错误！");
		  }
		   else if("1".equals(err)){
		    out.print("密码修改成功！");
		  }
		  else if("2".equals(err)){
		    out.print("提交成功！");
		  }
		  else if("3".equals(err)){
		    out.print("注册成功！请<a href='login.jsp'>登录</a>");
		  }
		  else if("-9".equals(err)){
		    out.print("您还没有登录，请<a href='login.jsp'>登录</a>！");
		  }
		  else if ("-1".equals(err)){
		 	 out.print("用户名不合法");
		  }
		  else if ("-2".equals(err)){
		  	out.print("包含要允许注册的词语");
		  }
		  else if ("-3".equals(err)){
		 	 out.print("用户名已经存在");
		  }
		  else if ("-4".equals(err)){
		 	 out.print("Email 格式有误");
		  }
		  else if ("-5".equals(err)){
		 	 out.print("Email 不允许注册");
		  }
		  else if ("-6".equals(err)){
		 	 out.print("该 Email 已经被注册");
		  }
		  else if ("-11".equals(err)){
		 	 out.print("用户不存在,或者被删除");
		  }
		  else if ("-12".equals(err)){
		 	 out.print("用户名或密码错误");
		  }
		  else if ("-13".equals(err)){
		 	 out.print("成功退出系统！");
		  }
		  else if ("-9999".equals(err)){
		 	 out.print("参数错误！");
		  }
		  else{
		   out.print("系统错误！");
		  }
		  
		  %>
		  
		  </div>
		 
            </td>
        </tr>
      </table></td>
      <td background="bm/images/bm_login_bg.jpg">&nbsp;</td>
    </tr>
  </table>
  <table width="980" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="30">&nbsp;</td>
    </tr>
  </table>
</div>


</body>
</html>
