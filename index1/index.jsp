<%@ page contentType="text/html; charset=UTF-8"%>
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
    <td width="300"><img src="images/top_01.jpg" width="300" height="72" /></td>
    <td width="419"><img src="images/top_02.jpg" width="419" height="72" /></td>
    <td width="432"><img src="images/top_03.jpg" width="432" height="72" /></td>
    <td width="129"><img src="images/top_04.jpg" width="129" height="72" /></td>
  </tr>
  <tr>
    <td><img src="images/top_05.jpg" width="300" height="73" /></td>
    <td><img src="images/top_06.jpg" width="419" height="73" /></td>
    <td><img src="images/top_07.jpg" width="432" height="73" /></td>
    <td><img src="images/top_08.jpg" width="129" height="73" /></td>
  </tr>
  <tr>
    <td><img src="images/top_09.jpg" width="300" height="58" /></td>
    <td><img src="images/top_10.jpg" width="419" height="58" /></td>
    <td><img src="images/top_11.jpg" width="432" height="58" /></td>
    <td><img src="images/top_12.jpg" width="129" height="58" /></td>
  </tr>
</table>
<table width="1280" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="41" background="images/wmenu_01.jpg"><table width="1280" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="289" height="38"></td>
        <%
        CategoryAction ca = new CategoryAction();
        List<CategoryVo> caList = ca.getCategoryListByParentIdAction("0","0");
        for(int i=0;i<caList.size();i++){
        CategoryVo cv = caList.get(i);
         %>
        <td   width="188"><a href="index.jsp?categoryid=<%=cv.getId() %>"><div style="background:url(images/hmenu_button_05.gif); height:40px; text-align:center; line-height:40px"><%=cv.getName() %></div></a></td>
        <%} %>
        
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1280" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="89"><img src="images/left_01.jpg" width="89" height="501" /></td>
    <td width="187" align="right" valign="top" background="images/left_02.jpg"><table width="187" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="187" height="10"></td>
      </tr>
      
      <tr>
        <td height="11"></td>
      </tr>
      <%
       // CategoryAction caChild = new CategoryAction();
        //CategoryVo cavo = new CategoryVo();
        CategoryVo parentcv  = new CategoryVo();
        if("".equals(categoryid) || categoryid==null){
            parentcv = caList.get(0);
        	categoryid=parentcv.getId()+"";
        }
        
        List<ContentVo> contetnList = new ArrayList<ContentVo>();
        if(parentcv!=null){
		
  		ContentAction cation = new ContentAction();
    	 contetnList =  cation.getContentListActionByView(categoryid,0,0);
          int len = contetnList.size();
		  for(int i=0;i<len;i++){
		  ContentVo vo = (ContentVo)contetnList.get(i);
       %>
	      <tr>
	        <td><a href="index.jsp?articleid=<%=vo.getId()%>&categoryid=<%=categoryid%>"><div style="background:url(images/hmenu_button_04.gif); height:40px; text-align:center; line-height:40px"><%=vo.getName() %></div></a></td>
	      </tr>
	      <tr>
	        <td height="10"></td>
	      </tr>
	      <%} 
      }%>
    </table></td>
    <td width="23"><img src="images/left_03.jpg" width="23" height="501" /></td>
    <td width="874" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/mid_01.jpg" width="874" height="26" /></td>
      </tr>
    </table>
      <table width="874" border="0" cellpadding="0" cellspacing="0" background="images/mid_02.jpg">
        <tr>
         
          <td width="874" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
            <%
            if(("".equals(articleid) || articleid==null) && contetnList.size()>0){
        		ContentVo childcv = contetnList.get(0);
        		articleid=childcv.getId()+"";
        		System.out.println(articleid);
        	}
             %>
              <td> <iframe src="Article.jsp?id=<%=articleid%>" name="article" id="article" frameborder="0"  scrolling="no" style="width:874px;height:440px"></iframe></td>
            </tr>
          </table>		 </td>
        </tr>
      </table></td>
    <td width="107"><img src="images/right_01.jpg" width="107" height="501" /></td>
  </tr>
</table>
<table width="1280" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="11"><img src="images/bottom_01.jpg" width="1280" height="21" /></td>
  </tr>
  <tr>
    <td width="87" bgcolor="#deedd1">&nbsp;</td>
    <td width="166"><img src="images/bottom_02.jpg" width="166" height="74" /></td>
    <td width="69"><img src="images/bottom_03.jpg" width="69" height="74" /></td>
    <td width="166"><img src="images/bottom_04.jpg" width="166" height="74" onclick="window.frames['article'].scrollBy(0,-420);"/></td>
    <td width="66" bgcolor="#deedd1">&nbsp;</td>  <!--onmousemove="window.timer=setInterval('article.document.body.scrollTop--',140)"-->
    <td width="166"><img src="images/bottom_05.jpg" width="166" height="74"  onclick="window.frames['article'].scrollBy(0,420);"/></td>
    <td width="65" bgcolor="#deedd1">&nbsp;</td>
    <td width="166"><img src="images/bottom_06.jpg" width="166" height="74"  /></td>
    <td width="63"><img src="images/bottom_07.jpg" width="63" height="74" /></td>
    <td width="167"><img src="images/bottom_08.jpg" width="167" height="74" /></td>
    <td width="99">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="11"><img src="images/bottom_09.jpg" width="1280" height="50" /></td>
  </tr>
</table>
</body>
</html>
