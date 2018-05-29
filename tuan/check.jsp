﻿<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.yi.Action.ProductAction"%>
<%@page import="com.yi.vo.ProductVo"%>

<%@page import="com.yi.util.StringUtils"%>
<%
request.setCharacterEncoding("utf-8");
StringUtils  s = new StringUtils();
String username = "";
username = (String)session.getAttribute("username");
String uid = (String)session.getAttribute("uid");

out.print(uid);

if(s.isNullOrEmpty(username) || s.isNullOrEmpty(uid)){
	response.sendRedirect("../return.jsp?err=-9");
}

String id = s.trimStr(request.getParameter("id"));
String ProductNum = s.trimStr(request.getParameter("ProductNum"));

if(s.isNullOrEmpty(id) || s.isNullOrEmpty(ProductNum)){
	response.sendRedirect("../return.jsp?err=-9999");
}

ProductAction action = new ProductAction();

ProductVo vo = action.getProductInfoAction(Integer.parseInt(id));

float price = vo.getNowprice() * Integer.parseInt(ProductNum);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>确认支付</title>


<script language=javascript>

		 function submitForm(){
		    if(document.getElementById("ProductNum").value==''){
            alert('购买数量不能为空！');
            document.myform.ProductNum.focus();
            return false;
        }
		else{
			document.paytoali.submit();
		}
		
		}
		
		   
    </script>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
body {
	background-image: url();
	background-repeat: repeat-x;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #FFFFFF;
}
body,td,th {
	font-size: 12px;
	color: 333333;
}
.STYLE11 {color: #666666}
.STYLE13 {
	font-size: 24px;
	font-weight: bold;
	color: #333333;
}
.STYLE14 {
	font-size: 14px;
	color: #333333;
	line-height: 21px;
}
.STYLE17 {font-size: 14px; color: #333333; line-height: 21px; font-weight: bold; }
.STYLE19 {
	font-size: 18px;
	color: #333333;
	line-height: 21px;
	font-weight: bold;
}
.STYLE20 {
	color: #D75275;
	font-weight: bold;
	font-size: 18px;
		  }
.STYLE21 {
	font-size: 14px;
	font-weight: bold;
}
-->
</style>
</head>

<body>
<div align="center">
  <jsp:include page="top.jsp" flush="true" />
<jsp:include page="search.jsp" flush="true" />
  </div>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/lt_tabbg.gif"><table width="1000" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" colspan="2" bgcolor="e0e0e0"></td>
      </tr>
      <tr>
        <td height="18" colspan="2">&nbsp;</td>
        </tr>
      <tr>
        <td width="731" align="center" valign="top"><table width="697" border="0" cellpadding="0" cellspacing="2" bgcolor="#D75275">
          <tr>
            <td height="400" valign="top" bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="100%" colspan="6">&nbsp;</td>
              </tr>
              <tr>
                <td height="60" colspan="6"><span class="STYLE13">您的订单</span></td>
              </tr>
              <tr>
                <td height="1" colspan="6" bgcolor="E3E3E3"></td>
              </tr>
              
              <tr>
                <td colspan="6" valign="bottom" bgcolor="F8F8F8">&nbsp;</td>
              </tr>
<form name="paytoali" action="alipayto.jsp">              
<input name="id" id="id" type="text" value="<%=id%>" />
<input name="ProductNum" id="ProductNum" type="text" value="<%=ProductNum%>" />
</form>

              <tr>
                <td height="20" colspan="6" valign="bottom" bgcolor="F8F8F8"><span class="STYLE14">　项目名称：<%=vo.getName() %></span></td>
              </tr>
              <tr>
                <td height="20" colspan="6" valign="bottom" bgcolor="F8F8F8"><p class="STYLE14">　应付金额：<span class="STYLE20">&yen;<%=price %></span></p>                  </td>
              </tr>
              
              <tr>
                <td height="1" colspan="6" valign="bottom" bgcolor="E7E7E7"></td>
              </tr>
              <tr>
                <td colspan="6" valign="bottom">&nbsp;</td>
              </tr>

              <tr>
                <td height="1" colspan="6" valign="bottom" bgcolor="E7E7E7"></td>
              </tr>
              <tr>
                <td height="50" colspan="6" class="STYLE14">　</td>
              </tr>
              <tr>
                <td height="1" colspan="6" valign="bottom" bgcolor="E7E7E7"></td>
              </tr>
              <tr>
                <td colspan="6" valign="bottom">&nbsp;</td>
              </tr>
              <tr>
                <td height="60" colspan="6" valign="bottom"><div align="right"><a href="buy.jsp?id=<%=id%>" class="STYLE11">返回修改订单</a>　　
				
				<img src="images/con_button.jpg" width="112" height="36" align="absmiddle"  onclick="submitForm();"/>　</div></td>
              </tr>
              <tr>
                <td height="18" colspan="6">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table>
          </td>
      
      </tr>
    </table></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="18" background="images/lt_tabbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td height="18" background="images/lt_tabbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td height="1" bgcolor="e0e0e0"></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="f0f0f0">
  <tr>
    <td width="247" height="61"><img src="images/foot_button_01.gif" width="247" height="53" /></td>
    <td width="232"><img src="images/foot_button_02.gif" width="232" height="53" /></td>
    <td width="270"><img src="images/foot_button_03.gif" width="270" height="53" /></td>
    <td width="251"><img src="images/foot_button_04.gif" width="249" height="53" /></td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0" background="images/lt_tabbg.gif">
  <tr>
    <td height="1" colspan="3" bgcolor="e0e0e0"></td>
  </tr>
  <tr>
    <td height="15" colspan="3"></td>
  </tr>
  <tr>
    <td width="179"><img src="images/foot_logo.jpg" width="179" height="61" /></td>
    <td width="806" align="right" valign="top" bgcolor="#FFFFFF"><table width="90%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td height="20"><div align="right" class="STYLE11">关于我们　|　联系我们　|　客服中心　|　意见反馈　|　网站导航</div></td>
      </tr>
      <tr>
        <td height="20"><div align="right" class="STYLE11">本网版权归河青传媒有限责任公司所有，转载请注明来源　冀ICP备09022655号　冀新网备132006015 </div></td>
      </tr>
      <tr>
        <td height="20"><div align="right" class="STYLE11">CopyRight 2012 HeQing Media Ltd. All Rights Reserved </div></td>
      </tr>
    </table></td>
    <td width="15">&nbsp;</td>
  </tr>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15" background="images/lt_tabbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td height="1" bgcolor="e0e0e0"></td>
  </tr>
</table>
<p align="center" class="STYLE1">&nbsp;</p>
</body>
</html>
