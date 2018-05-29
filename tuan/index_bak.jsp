<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.Action.AdInfoAction"%>
<%@page import="com.yi.vo.AdInfoVo"%>
<%@page import="com.yi.Action.ProductAction"%>
<%@page import="com.yi.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="js/yoka6.1.js"></script>
<link href="css/yindex9.4.css" rel="stylesheet" type="text/css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>河青网--团购</title>
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
	background-image: url(images/lt_bg.gif);
	background-repeat: repeat-x;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
</head>

<body>

<jsp:include page="top.jsp" flush="true" />

<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="32" bgcolor="d7d6d6">&nbsp;</td>
  </tr>
</table>

<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="18" background="images/lt_tabbg.gif">&nbsp;</td>
  </tr>
</table>
<table width="1000" height="423" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/lt_tabbg.gif"><div align="center">
      <table border="0" cellpadding="0" cellspacing="1" bgcolor="#000000">
        <tr>
          <td width="464" bgcolor="#FFFFFF">
		  
		   <div style="width:464px" id="foc" clickname="stickthread_5_data">
		<%
		 AdInfoAction ad = new AdInfoAction();
    List adList =  ad.getAdInfoListByTypeAction("2",0,4);
		
		%>
				 <%for(int i=0;i<adList.size();i++){
				 AdInfoVo ao =(AdInfoVo)adList.get(i);
					   %>
<a href="<%=ao.getUrl() %>">
<img src="../upload/<%=ao.getPic() %>" width="464" height="481" />
</a>
		<%}%>
</div>
<dl id="focimg" class="avs"><dt><a><img src="images/a14.gif" border="0"/></a></dt>
<dd><div>STOP</div><ul></ul></dd>
</dl>
<script>FocusImg(5000,"foc","focimg");</script>

		  
		  </td>
          <td width="234" bgcolor="#FFFFFF"><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="images/lt_prod_02.jpg" width="234" height="159" /></td>
            </tr>
            <tr>
              <td height="1" bgcolor="#000000"></td>
            </tr>
            <tr>
              <td><img src="images/lt_prod_03.jpg" width="234" height="159" /></td>
            </tr>
            <tr>
              <td height="1" bgcolor="#000000"></td>
            </tr>
            <tr>
              <td><img src="images/lt_prod_04.jpg" width="234" height="161" /></td>
            </tr>
          </table></td>
          <td bgcolor="#FFFFFF"><table width="228" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="images/lt_prod_05.jpg" width="228" height="212" /></td>
            </tr>
            <tr>
              <td height="1" bgcolor="#000000"></td>
            </tr>
            <tr>
              <td><img src="images/lt_prod_06.jpg" width="228" height="164" /></td>
            </tr>
            <tr>
              <td height="1" bgcolor="#000000"></td>
            </tr>
            <tr>
              <td><img src="images/lt_prod_07.jpg" width="228" height="103" /></td>
            </tr>
          </table></td>
        </tr>
      </table>
    </div></td>
  </tr>
</table>
<table width="1000" height="53" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top" background="images/lt_tabbg.gif">
	
	
	<%
		    ProductAction pc  = new ProductAction();
    List pcList =  pc.getProductListByNowAction(0,20);
		int j=pcList.size();
		int n=0;
	%>

	<table>
	
	<%for (int i=0;i< (j/3)+1;i++ ) {
	 
	%>
	<tr>
	<%for (int h=0;h<3;h++){ 

	%>
	<td>
	<%if((i*3+h)<j){
	
	ProductVo vo = (ProductVo)pcList.get(i*3+h);
	%>
	<table width="297" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        </tr>
      <tr>
        <td width="297"><img src="upload/<%=vo.getPic() %>" width="297" height="203" /></td>
        </tr>
      <tr>
        <td background="images/lt_theme_02.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="5%">&nbsp;</td>
            <td width="95%"><div align="left"><span class="STYLE7"><%=vo.getSummary()%></span></div></td>
          </tr>
        </table></td>
        </tr>
      <tr>
        <td background="images/lt_theme_02.gif"><table width="297" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="4" colspan="4"></td>
            </tr>
          <tr>
            <td width="17" height="24">&nbsp;</td>
            <td width="87" class="STYLE4"><div align="left">现价：<%=vo.getNowprice() %></span></div></td>
            <td colspan="2" class="STYLE4"><div align="left">剩余　天以上　　　<%=vo.getSum() %>人已购买</div>
              </span></td>
          </tr>
          <tr>
            <td height="24">&nbsp;</td>
            <td><div align="left"><span class="STYLE4">原价：<%=vo.getOldprice() %></span></div></td>
            <td width="81" rowspan="2" background="images/lt_theme_03.jpg"><span class="STYLE11"></span></td>
            <td width="112" rowspan="2"><a href=info.jsp?id=<%=vo.getId()%> ><img src="images/lt_theme_04.jpg" width="112" height="48"  border="0"/></a></td>
          </tr>
          <tr>
            <td height="20">&nbsp;</td>
            <td><div align="left"><span class="STYLE4">折扣：</span></div></td>
            </tr>
        </table></td>
        </tr>
      <tr>
        <td height="13" valign="top"><img src="images/lt_theme_05.gif" width="297" height="12" /></td>
        </tr>
    </table>
	</td>
	<%} %>
	
	<%} %>
	</tr>
	<%} %>
	</table>
	

	
	
      <br /></td>
  </tr>
</table>
<jsp:include page="foot.jsp" flush="true" />

<p align="center" class="STYLE1">&nbsp;</p>
<p align="center" class="STYLE1">&nbsp;</p>
</body>
</html>
