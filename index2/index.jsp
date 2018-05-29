﻿<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.Action.ContentAction"%>
<%@page import="java.util.List"%>
<%@page import="com.yi.vo.ContentVo"%>
<%@page import="com.yi.util.PageBean"%>
<%@page import="com.yi.Action.CategoryAction"%>
<%@page import="com.yi.vo.CategoryVo"%>
<%@page import="java.util.ArrayList"%>
<%
request.setCharacterEncoding("UTF-8");
String categoryid = request.getParameter("categoryid");

String articleid = request.getParameter("articleid");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>椿树街道服务大厅触摸查询系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	background-image: url();
	background-repeat: no-repeat;
}
.STYLE4 {color: #666666}
.STYLE5 {color: #999999}
.STYLE7 {
	font-size: 14px;
	color: #333333;
}
.STYLE8 {color: #333333}
a{text-decoration: none;} /* 链接无下划线,有为underline */ 
a:link {color: #000000;} /* 未访问的链接 */
a:visited {color: #333333;} /* 已访问的链接 */
a:hover{color: #ae0927;} /* 鼠标在链接上 */ 
a:active {color: #0000ff;} /* 点击激活链接 */
-->
</style></head>

<body>
<table width="1280" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/top_bg_01.jpg" width="272" height="71" /></td>
    <td><img src="images/top_bg_02.jpg" width="129" height="71" /></td>
    <td><img src="images/top_bg_03.jpg" width="272" height="71" /></td>
    <td><img src="images/top_bg_04.jpg" width="222" height="71" /></td>
    <td><img src="images/top_bg_05.jpg" width="183" height="71" /></td>
    <td><img src="images/top_bg_06.jpg" width="202" height="71" /></td>
  </tr>
  <tr>
    <td><img src="images/top_bg_07.jpg" width="272" height="75" /></td>
    <td><img src="images/top_bg_08.jpg" width="129" height="75" /></td>
    <td><img src="images/top_bg_09.jpg" width="272" height="75" /></td>
    <td><img src="images/top_bg_10.jpg" width="222" height="75" /></td>
    <td><img src="images/top_bg_11.jpg" width="183" height="75" /></td>
    <td><img src="images/top_bg_12.jpg" width="202" height="75" /></td>
  </tr>
  <tr>
    <td width="272"><img src="images/top_bg_13.jpg" width="272" height="51" /></td>
    <td width="129"><img src="images/top_bg_14.jpg" width="129" height="51" /></td>
    <td width="272"><img src="images/top_bg_15.jpg" width="272" height="51" /></td>
    <td width="222"><img src="images/top_bg_16.jpg" width="222" height="51" /></td>
    <td width="183"><img src="images/top_bg_17.jpg" width="183" height="51" /></td>
    <td width="202"><img src="images/top_bg_18.jpg" width="202" height="51" /></td>
  </tr>
</table>
<table width="1280" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="98" valign="top"><img src="images/left_bg_01.jpg" width="98" height="540" /></td>
    <td width="132" valign="top" background="images/left_bg_02.jpg"><table width="132" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="132" height="7"></td>
      </tr>
	  
	  <%
	   CategoryAction ca = new CategoryAction();
        List<CategoryVo> caList = ca.getCategoryListByParentIdAction("0","0");
	  
        CategoryAction caChild = new CategoryAction();
        CategoryVo cavo = new CategoryVo();
         CategoryVo parentcv  = new CategoryVo();
        if("".equals(categoryid) || categoryid==null){
         parentcv = caList.get(0);
        	categoryid=parentcv.getId()+"";
        }
        
           List<ContentVo> contetnList = new ArrayList<ContentVo>();
          int len = 0;
        if(parentcv!=null){
       		ContentAction cation = new ContentAction();
    	 	contetnList =  cation.getContentListActionByView(categoryid,0,0);
			 len = contetnList.size();
          	
        }
        
       
       for(int i=0;i<len;i++){
		  ContentVo vo = (ContentVo)contetnList.get(i);
       %>
      <tr>
        <td>
		<a href="index.jsp?articleid=<%=vo.getId()%>&categoryid=<%=categoryid%>"><div style="background:url(images/hmenu_button_01.png); height:40px; text-align:center; line-height:40px"><%=vo.getName() %></div></a></td>
      </tr>
      <tr>
        <td height="17"></td>
      </tr>
	  
	   <%} %>
     
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table></td>
    <td width="42" valign="top"><img src="images/left_bg_03.jpg" width="42" height="540" /></td>
    <td width="901" valign="top"><table width="901" border="0" cellspacing="0" cellpadding="0">
      <tr>
	   <%
       if(caList.size()>0){
        for(int i=0;i<caList.size();i++){
        CategoryVo cv = caList.get(i);
         %>
        <td width="129" align="center" background="images/wmenu_bg_01.jpg"><a href="index.jsp?categoryid=<%=cv.getId() %>"><%=cv.getName() %></a></td>
        <td width="8"><img src="images/wmenu_bg_02.jpg" width="8" height="48" /></td>
		<%}
		}
		%>
      
        <td width="764"  background="images/wmenu_bg_03.jpg">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="13"><img src="images/mid_bg_01.jpg" width="901" height="18" /></td>
        </tr>
    </table>
      <table width="901" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="250"><img src="images/mid_bg_02.jpg" width="250" height="50" /></td>
          <td width="613" background="images/mid_bg_03.jpg">&nbsp;</td>
          <td width="38"><img src="images/mid_bg_04.jpg" width="38" height="50" /></td>
        </tr>
      </table>
      <table width="901" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/mid_bg_05.jpg" width="25" height="395" /></td>
          <td background="images/mid_text_bg.jpg">
		              <%
            if(("".equals(articleid) || articleid==null) && contetnList.size()>0){
        		ContentVo childcv = contetnList.get(0);
        		articleid=childcv.getId()+"";
        		System.out.println(articleid);
        	}
             %>
		  <iframe src="Article.jsp?id=<%=articleid%>" name="article" frameborder="0"  scrolling="no" style="width:838px;height:395px"></iframe>
		  
		  </td>
          <td><img src="images/mid_bg_06.jpg" width="38" height="395" /></td>
        </tr>
        <tr>
          <td width="25"><img src="images/mid_bg_07.jpg" width="25" height="29" /></td>
          <td width="838"><img src="images/mid_bg_08.jpg" width="838" height="29" /></td>
          <td width="38"><img src="images/mid_bg_09.jpg" width="38" height="29" /></td>
        </tr>
      </table></td>
    <td width="107"><img src="images/right_bg_01.jpg" width="107" height="540" /></td>
  </tr>
</table>
<table width="1280" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="11"><img src="images/bottom_bg_01.jpg" width="1280" height="19" /></td>
  </tr>
  <tr>
    <td width="234"><img src="images/bottom_bg_02.jpg" width="234" height="105" /></td>
    <td width="135"><img src="images/bottom_bg_03.jpg" width="135" height="105"  /></td>
    <td width="83"><img src="images/bottom_bg_04.jpg" width="83" height="105" /></td>
   <td width="133"><img src="images/bottom_bg_05.jpg" width="133" height="105"  onclick="window.frames['article'].scrollBy(0,-420);"/></td>
    <td width="74"><img src="images/bottom_bg_06.jpg" width="74" height="105" /></td>
    <td width="135"><img src="images/bottom_bg_07.jpg" width="135" height="105" onclick="window.frames['article'].scrollBy(0,420);"/></td>
    <td width="80"><img src="images/bottom_bg_08.jpg" width="80" height="105" /></td>
    <td width="135"><img src="images/bottom_bg_09.jpg" width="135" height="105" /></td>
    <td width="78"><img src="images/bottom_bg_10.jpg" width="78" height="105" /></td>
    <td width="134"><img src="images/bottom_bg_11.jpg" width="134" height="105" /></td>
    <td width="59"><img src="images/bottom_bg_12.jpg" width="59" height="105" /></td>
  </tr>
  <tr>
    <td colspan="11"><img src="images/bottom_bg_13.jpg" width="1280" height="28" /></td>
  </tr>
</table>
</body>
</html>
