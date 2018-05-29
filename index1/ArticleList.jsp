<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.Action.ContentAction"%>
<%@page import="java.util.List"%>
<%@page import="com.yi.vo.ContentVo"%>
<%@page import="com.yi.util.PageBean"%>
<%
request.setCharacterEncoding("UTF-8");
%>
		<%
		String pages = "0";
pages = request.getParameter("pages");
if(pages==null) pages = "0";
		String categoryid = request.getParameter("categoryid");
		//categoryid="2";
		if("".equals(categoryid)){
			categoryid="2";
		}
		
  		ContentAction ca = new ContentAction();
  		
  		int count = ca.getContentListActionByArticleCount(categoryid);
  		 PageBean pageView = new PageBean(count,Integer.parseInt(pages));
    	List caList =  ca.getContentListActionByView(categoryid,pageView.getFromIndex(),pageView.getPageSize());
    	
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
body {
	margin-left: 0px;
	margin-top: 0px;
	background-image: url();
	background-repeat: no-repeat;
}
.STYLE8 {color: #333333}
body,td,th {
	font-size: 12px;
	color: #333333;
}
.STYLE9 {font-size: 14px}
.STYLE11 {font-size: 14px; font-weight: bold; }
-->
</style></head>

<body>
<table width="874" border="0" height="475" align="center" cellpadding="0" cellspacing="0" background="images/mid_02.jpg">


          <tr>
            <td height="2"></td>
          </tr>
		  
		  <%
		  int len = caList.size();
		  for(int i=0;i<len;i++){
		  ContentVo vo = (ContentVo)caList.get(i);
		  %>
          <tr>
            <td height="23" valign="top"><span class="STYLE8"><img src="../image/info_dot_04.gif" width="18" height="23" align="absmiddle" /> <a href="Article.jsp?id=<%=vo.getId()%>" class="STYLE9 STYLE9"><%=vo.getName()%></a></span></td>
          </tr>
		  <%}%>

          <tr>
            <td height="18">&nbsp;</td>
          </tr>
          <tr>
            <td height="12">
			
			  <div align="center"><a href="ArticleList.jsp?pages=<%=pageView.getCurrentPage()-1 %>&categoryid=<%=categoryid%>">上一页</a>　共<%=pageView.getPageCount() %>页  第<%=pageView.getCurrentPage() %>页　<a href="ArticleList.jsp?pages=<%=pageView.getCurrentPage()+1 %>&categoryid=<%=categoryid %>">下一页</a>			      </div></td>
          </tr>
</table>

</body>
</html>
