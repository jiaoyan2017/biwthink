<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.Action.ContentAction"%>
<%@page import="com.yi.vo.ContentVo"%>
<%
request.setCharacterEncoding("UTF-8");
%>
		<%
String id = request.getParameter("id");
ContentAction getInfo = new ContentAction();
ContentVo vo = new ContentVo();
vo = getInfo.getContentInfoAction(Integer.parseInt(id));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>

<link href='../css/homestyle.css' rel='stylesheet' type='text/css'>
<style type="text/css">
<!--
table { 
background-image:url(images/mid_text_bg.jpg); 
background-repeat: no-repeat; 
background-attachment: fixed;
} 
#x{
height:1628px;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	background-image: url();
	background-repeat: no-repeat;
}
body,td,th {
	font-size: 12px;
	color: #333333;
}
.STYLE10 {
	color: #333333;
	font-size: 16px;
	font-weight: bold;
}
.STYLE11 {
	font-size: 14px;
	line-height: 22px;
}
-->
</style>
</head>

<body>

    <table width="874" border="0" height="475" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="10"></td>
          </tr>
          <tr>
            <td height="24"><div align="center"><span class="STYLE10"><%=vo.getName() %></span></div></td>
          </tr>

          <tr>
            <td valign="top"><span class="STYLE11"><%=vo.getContent() %>
              </span>
              <br />
            </td>
          </tr>

          <tr>
            <td height="18"></td>
          </tr>
</table>
	


</body>
</html>
