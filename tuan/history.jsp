<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.Action.ProductAction"%>
<%@page import="com.yi.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {
	font-size: 30px;
	font-family: Geneva, Arial, Helvetica, sans-serif;
	color: #D01C36;
}
.STYLE3 {
	font-size: 16px;
	font-family: "微软雅黑";
	font-weight: bold;
}
.STYLE4 {
	font-size: 12px;
	color: #999999;
	line-height: 20px;
}
.STYLE5 {font-size: 12px; color: #999999; line-height: 20px; font-weight: bold; }
.STYLE6 {color: #FF0000}
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

<body><jsp:include page="top.jsp" flush="true" />
<jsp:include page="search.jsp" flush="true" />

<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/lt_tabbg.gif"><table width="1000" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="18" colspan="2">&nbsp;</td>
        </tr>
      <tr>
        <td width="731" valign="top" background="images/lt_tab_con_15.gif"><table width="731" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="35" valign="top"><img src="images/lt_tab_con_1.gif" width="35" height="15" /></td>
            <td width="665" height="15" background="images/lt_tab_con_2.gif"></td>
            <td width="31" valign="top"><img src="images/lt_tab_con_14.gif" width="31" height="15" /></td>
          </tr>
        </table>
          <table width="731" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="203"><img src="images/lt_sub_banner_7.jpg" width="160" height="38" /></td>
              <td width="497">&nbsp;</td>
              <td width="31" background="images/lt_tab_con_16.gif">&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td background="images/lt_tab_con_16.gif">&nbsp;</td>
            </tr>
          </table>
          <table width="731" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td valign="top" background="images/lt_tab_con_15.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  
                  <tr>
                    <td width="5%" height="104"></td>
                    <td width="95%" colspan="2" valign="top">
					
						<%
	    ProductAction pc  = new ProductAction();
    List pcList =  pc.getProductListByNowAction("2",0,20);
		int j=pcList.size();
		//out.print(j/3);
		int n=0;
	%>
					
					<table width="310">
	
	<%for (int i=0;i< (j/2)+1;i++ ) {
	 
	
	%>
	
	<tr>
	<%for (int h=0;h<2;h++){ 

	%>
	<td>
	<%if((i*2+h)<j){
	ProductVo vo = (ProductVo)pcList.get(i*2+h);
	%>
	<table width="297" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="2">
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="5%">&nbsp;</td>
            <td width="95%"><div align="left"><span class="STYLE7"><%=vo.getSummary()%></span></div></td>
          </tr>
        </table></td>
        </tr>
      <tr>
        <td width="148"><img src="upload/<%=vo.getPic() %>"  width="215" height="133"/></td>
        <td width="149"><div align="left"><%=vo.getSum() %>人购买</div></td>
      </tr>
    </table>
	</td>
	<%} %>
	<%} %>
	</tr>
	<%} %>
	</table>
					</td>
                  </tr>
                </table></td>
              <td width="31" background="images/lt_tab_con_16.gif">&nbsp;</td>
            </tr>
          </table>
          <table width="731" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="35" valign="top"><img src="images/lt_tab_con_9.gif" width="35" height="24" /></td>
              <td widgh="665" height="15" background="images/lt_tab_con_10.gif">&nbsp;</td>
              <td width="31" valign="top"><img src="images/lt_tab_con_17.gif" width="31" height="24" /></td>
            </tr>
          </table></td>
        <td width="269" valign="top"><table width="255" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/lt_sub_banner_6.jpg" width="255" height="30" /></td>
          </tr>
          <tr>
            <td background="images/lt_tab_bg04.gif"><img src="images/lt_sub_01b.jpg" width="255" height="151" /></td>
          </tr>
          <tr>
            <td><img src="images/lt_sub_01c.jpg" width="255" height="47" /></td>
          </tr>
          <tr>
            <td height="1" bgcolor="#D2D4D3"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><img src="images/lt_sub_01d.jpg" width="255" height="120" /></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
<jsp:include page="foot.jsp" flush="true" />
</body>
</html>
