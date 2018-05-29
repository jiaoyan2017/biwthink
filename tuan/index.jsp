<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.yi.Action.AdInfoAction"%>
<%@page import="com.yi.vo.AdInfoVo"%>
<%@page import="com.yi.Action.ProductAction"%>
<%@page import="com.yi.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="com.yi.util.PageBean"%>
<%@page import="com.yi.util.StringUtils"%>
<%

request.setCharacterEncoding("utf-8");
StringUtils s = new StringUtils();
String pages = "0";
pages = request.getParameter("pages");
if(pages==null) pages = "0";
int recordCount = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>青客团</title>
<link rel="shortcut icon" href="../images/qingcall.ico"> 
<script src="js/yoka6.1.js"></script>
<script type="text/javascript" src="../bm/js/jquery.js"></script>
<script type="text/javascript" src="../bm/js/Root.Image.js"></script>
<script type="text/javascript"  src="../bm/js/hotHit.js"></script>
<link href="css/yindex9.4.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE4 {
	font-size: 12px;
	color: #999999;
	line-height: 20px;
}
.STYLE17 {
	font-size: 14px;
}
.STYLE6 {
	font-family: Geneva, Arial, Helvetica, sans-serif;
	color: #ff0007;
	font-size: 26px;
}
.STYLE7 {font-family: Geneva, Arial, Helvetica, sans-serif; color: #ff0007; font-size: 22px;}
.STYLE11 {color: #666666}
body {
	background-image: url(images/lt_bg.jpg);
	background-repeat: repeat-x;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #fff;
}
body,td,th {
	font-size: 12px;
	color: #333333;
}
.line-hight {
	line-height: 24px;
}
a{text-decoration: none;} /* 链接无下划线,有为underline */ 
a:link {color: #333333;} /* 未访问的链接 */
a:visited {color: #666666;} /* 已访问的链接 */
a:hover{color: #999999;} /* 鼠标在链接上 */ 
.STYLE12 {color: #c0778a}
-->
</style>
</head>

<body>
<table width="1001" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1001" height="1"></td>
  </tr>
</table>
<jsp:include page="top.jsp" flush="true" />
<jsp:include page="search.jsp" flush="true" />
<table width="1001" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="1001">&nbsp;</td>
  </tr>
</table>
<table width="1000" height="16" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1" bgcolor="e0e0e0"></td>
  </tr>

  <tr>
    <td height="15" background="images/lt_tabbg.gif">&nbsp;</td>
  </tr>
</table>
<table width="1000" height="53" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top" background="images/lt_tabbg.gif">
	
	
	<%
		    ProductAction pc  = new ProductAction();
			 recordCount = pc.getProductListByNowActionCount("1",0,18);
			 
			  PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));
			  pageView.setPageSize(18);
   			 List pcList =  pc.getProductListByNowAction("1",pageView.getFromIndex(),18);
		int j=pcList.size();
		
		int n=0;
		
			int trcount =0;
			if(j%3!=0){
				trcount=j/3+1;
			}
			else{
				trcount=j/3;
			}
	%>
	<table>
	
	<%for (int i=0;i< trcount;i++ ) {	%>
	<tr>
	<%for (int h=0;h<3;h++){ 

	%>
	<td height="360">
	<%if((i*3+h)<j){
	
	ProductVo vo = (ProductVo)pcList.get(i*3+h);
	%>
	<table width="314"  height="360" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        </tr>
      <tr>
        <td width="314" height="203">
		
		
		<table width="297" height="203" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
      <tr>
        <td bgcolor="#FFFFFF"><a href="info.jsp?id=<%=vo.getId()%>" target="_blank"><img src="../upload/<%=vo.getPic() %>" width="297" height="203"   border="0" /></a></td>
      </tr>
    </table>		</td>
        </tr>
      <tr>
        <td valign="top"><table width="299" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td background="images/lt_theme_02.gif"><table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td colspan="2">&nbsp;</td>
              </tr>
              <tr>
                <td height="32" colspan="2" valign="top"><div align="left"><span class="STYLE17"><a href="info.jsp?id=<%=vo.getId()%>" target="_blank">
                	<%=s.truncateStringWithDBC(vo.getSummary(),80)%>
                	</a></span></div></td>
              </tr>
              <tr>
                <td height="9" colspan="2"></td>
              </tr>
              <tr>
                <td width="179"><div align="left"><span class="STYLE6">&nbsp;&yen;&nbsp;<%=vo.getNowprice() %></span></div></td>
                <td width="101"><a href="info.jsp?id=<%=vo.getId()%>" target="_blank"><img src="images/tuan_button_01.gif"  width="101" height="38"  border="0" align="absmiddle"/></a></td>
              </tr>
            </table>
              <table width="299" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="15"></td>
                </tr>
                <tr>
                  <td height="1" bgcolor="c8c8c8"></td>
                </tr>
              </table>
              <table width="280" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="26" valign="bottom"><div align="left"><span class="STYLE4">原价：<%=vo.getOldprice() %></span></div>                    <div align="left"><span class="STYLE4">剩余
                      <%
                            String timer = s.getQuot(vo.getDowntime(),"");
                            if(!"".equals(timer)){
                           
                            String[] arr  = timer.split(",");
                            out.print(arr[0]+"天"+arr[1]+"小时"+arr[2]+"分"+arr[3]+"秒");
                           }
                            
                            
                            %>
                      
                      　<%=vo.getSum() %>人已购买</span></div></td>
                  </tr>
              </table>
              <table width="299" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td><img src="images/lt_theme_05.gif" width="299" height="6" /></td>
                  </tr>
              </table></td>
          </tr>
        </table>          </td>
        </tr>
    </table>	</td>
	<%} %>
	<%} %>
	</tr>
	<%} %>
	</table>
	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
         <td>&nbsp;</td>
       </tr>
     </table>
	 <div align="center">
 <table border="0" cellpadding="0" cellspacing="2">
   <tr><td width="36" height="20" background="../bm/images/digital_bg_01.gif">
     <div align="center"><a href="index.jsp?pages=1">首页</a> </div></td>	
<td width="36" height="16" background="../bm/images/digital_bg_01.gif"> <div align="center"><a href="index.jsp?pages=<%=pageView.getCurrentPage()-1 %>">前页</a> </div></td>

 <%
 for (int i=1;i<=pageView.getPageCount();i++){
 %><td>
 <a href="index.jsp?pages=<%=i%>">
 &nbsp;
 <%if(i==pageView.getCurrentPage()){%>
 	<font color="#FF0000"><%=i %></font>
 <%}
else{%><%=i%>	
 <%}%>
&nbsp; </a></td>
 <%
 }
  %>
 <td width="36" height="16" background="../bm/images/digital_bg_01.gif"><div align="center"><a href="index.jsp?pages=<%=pageView.getCurrentPage()+1 %>">后页</a></div></td>
<td width="36" height="16" background="../bm/images/digital_bg_01.gif"> <div align="center"><a href="index.jsp?pages=<%=pageView.getPageCount()%>">末页</a></div></td>
  </tr></table>
 </div>	</td>
  </tr>
  <tr>
    <td valign="top" background="images/lt_tabbg.gif">&nbsp;</td>
  </tr>
</table>
<jsp:include page="foot.jsp" flush="true" />
</body>
</html>
