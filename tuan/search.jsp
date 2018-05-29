<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.Action.CategoryAction"%>
<%@page import="com.yi.vo.CategoryVo"%>
<%@page import="com.yi.Action.ProductAction"%>
<%@page import="com.yi.vo.ProductVo"%>
<%@page import="com.yi.Action.KeywordAction"%>
<%@page import="com.yi.vo.KeywordVo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList;"%>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {
	font-size: 30px;
	font-family: Geneva, Arial, Helvetica, sans-serif;
	color: #D01C36;
}
.STYLE3 {
	font-size: 18px;
	font-family: "微软雅黑";
}
.STYLE4 {
	font-size: 12px;
	color: #999999;
	line-height: 20px;
}
.STYLE5 {font-size: 12px; color: #999999; line-height: 20px; font-weight: bold; }
.STYLE6 {color: #FF0000}
.STYLE7 {
	font-size: 14px;
	font-weight: bold;
}
.STYLE10 {font-size: 12; color: #666666; }
.STYLE11 {color: #666666}
body {
	background-image: url();
	background-repeat: repeat-x;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.line-hight {
	line-height: 20px;
}
a{text-decoration: none;} /* 链接无下划线,有为underline */ 
a:link {color: #333333;} /* 未访问的链接 */
a:visited {color: #666666;} /* 已访问的链接 */
a:hover{color: #D75275;} /* 鼠标在链接上 */ 
.STYLE12 {color: #c0778a}
-->
</style>
<script language=javascript>
	function bysearch(keyword){
	
	 var key = document.getElementById(keyword).innerText;
	
		document.getElementById("keyword").value= key;
	
		var form = document.getElementById("search");
   	    form.submit();

	}
	
	
		function bycategorysearch(categoryid){
	
	
	
		document.getElementById("categoryid").value= categoryid;
	
		var form = document.getElementById("search");
   	    form.submit();

	}
	
			function byareasearch(areaid){
	
	
	// var key = document.getElementById(keyword).innerText;
		document.getElementById("areaid").value= areaid;
	
		var form = document.getElementById("search");
   	    form.submit();

	}
</script>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr><% KeywordAction getKeyList =new KeywordAction(); 
    List keyList = getKeyList.getKeywordListAllAction("",0,0,"2");
    %>
    <td height="32" bgcolor="f0f0f0">
	  <form id="search" name="search" method="post" action="searchlist.jsp">
	　<span class="STYLE12">热门关键词：
 <%for(int i=0;i<keyList.size();i++){ 
    	KeywordVo vo=(KeywordVo)keyList.get(i);
    %>
    <a href="#" id="key<%=vo.getId() %>" onclick="bysearch('key<%=vo.getId() %>');"><%=vo.getName() %></a>  
    <%} %>
</span>
<input name="keyword"  id ="keyword" type="text" />
	  <select name="categoryid" id="categoryid">
							  <option selected="selected" value="">请选择...</option>
							  <%
							  CategoryAction getCategoryList =new CategoryAction();
							  List CategoryList = new ArrayList();
							  CategoryList = getCategoryList.getCategoryListByParentIdAction("0","3");
							  for(int i=0;i<CategoryList.size();i++){
							    CategoryVo vo = new CategoryVo();
							    vo = (CategoryVo)CategoryList.get(i);
							  %>
							  <option value="<%=vo.getId()%>"><%=vo.getName()%></option>
							  <%} %>
	  </select>
	<input name="categoryid"  id ="categoryid" type="text" />
	<input name="areaid"  id ="areaid" type="text" />
	    <label>
	    <input type="submit" name="Submit" value="搜索" />
        </label>
    </form></td>
  </tr>
</table>
<br />
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1" bgcolor="e0e0e0"></td>
  </tr>
  <tr>
    <td height="18" background="images/lt_tabbg.gif"><br />
      <table width="960" border="0" align="center" cellpadding="8" cellspacing="1" bgcolor="#c94165">
      <tr>
        <td valign="middle" bgcolor="#FFFFFF"><%
                 ProductAction paction = new ProductAction();
                 List categorylist = paction.getProductListActionByCategory();
                
                  %>
&nbsp;<span class="line-hight">分类：<a href="#" id="area" onclick="bycategorysearch('');">全部</a>　
          <%for(int i=0;i<categorylist.size();i++) {
          
           ProductVo vo= (ProductVo)categorylist.get(i);
          %>
           <a href="#" id="category<%=vo.getCategoryid() %>" onclick="bycategorysearch('<%=vo.getCategoryid() %>');"><%=vo.getCategoryName() %></a>
          (<%=vo.getCount() %>)&nbsp;&nbsp;
          <%} %>
          
          <br /> <% List categorylistByArea = paction.getProductListActionByArea() ;%>
          &nbsp;区域：<a href="#" id="area" onclick="byareasearch('');">全部</a>　
          <%for(int i=0;i<categorylistByArea.size();i++) {
          
           ProductVo vo= (ProductVo)categorylistByArea.get(i);
          %>
			<%if(!"".equals(vo.getAreaName())&& vo.getAreaName()!=null){%>
           <a href="#" id="area<%=vo.getAreaid() %>" onclick="byareasearch('<%=vo.getAreaid() %>');"><%=vo.getAreaName() %></a>(<%=vo.getCount() %>)&nbsp;&nbsp;
<%}%>
          <%} %></span>
          <!--<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td>&nbsp;</td>
            </tr>
            <tr>
              <td height="1" bgcolor="cfcfcf"></td>
            </tr>
            <tr>
              <td class="line-hight">　 排序：默认　热门　折扣　价格 </td>
            </tr>
          </table>-->
          <span class="line-hight">          </span></td>
      </tr>
    </table>
    <br /></td>
  </tr>
  <tr>
    <td height="1" bgcolor="e0e0e0"></td>
  </tr>
</table>

