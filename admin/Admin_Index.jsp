<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.util.StringUtils"%>
<%
StringUtils  s = new StringUtils();
String username = "";
String uid = "";
username = (String)session.getAttribute("username");
uid = (String)session.getAttribute("uid");
if(s.isNullOrEmpty(username) || s.isNullOrEmpty(uid)){
	response.sendRedirect("return.jsp?err=-9");
}



 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>

<frameset rows="*" cols="200,*" framespacing="0" frameborder="0" border="false" id="frame" scrolling="yes">
  <frame name="left" scrolling="yes" marginwidth="0" marginheight="0" src="Admin_Index_Left.jsp">
  <frameset rows="53,*" cols="*" framespacing="0" border="false" rows="35,*" frameborder="0" scrolling="yes">
    <frame name="top" scrolling="no" src="Admin_Index_Top.jsp">
    <frame name="main" scrolling="auto" src="Admin_Index_Main.jsp">
  </frameset>
</frameset>
<!-- 
<noframes>
  <body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
  <p></p>
  </body>
</noframes> -->
  <body leftmargin="2" topmargin="0" marginwidth="0" marginheight="0">
  <p>111111</p>
  </body>
 
 
</html>