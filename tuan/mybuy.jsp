<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.Action.ProductAction"%>
<%@page import="com.yi.vo.ProductVo"%>

<%@page import="java.util.List"%>
<%@page import="com.yi.util.PageBean"%>
<%@page import="com.yi.util.StringUtils"%>
<%@page import="com.yi.Action.TransactionAction"%>
<%@page import="com.yi.vo.TransactionVo"%>


<%
request.setCharacterEncoding("UTF-8");
StringUtils  s = new StringUtils();

String username = "";
String uid = "";
username =(String)session.getAttribute("username");
uid = (String)session.getAttribute("uid");

if(s.isNullOrEmpty(username) || s.isNullOrEmpty(uid)){
	response.sendRedirect("../return.jsp?err=-9");
}

String pages = "0";
pages = request.getParameter("pages");
if(pages==null) pages = "0";
int recordCount = 0;

TransactionAction action = new TransactionAction();
recordCount  = action.getTransactionListActionByUserCount(uid);

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));

List TransactionList = action.getTransactionListActionByUser(uid,pageView.getFromIndex(),pageView.getPageSize());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>青客团购</title>
<script type="text/javascript" src="../bm/js/jquery.js"></script>
<script type="text/javascript" src="../bm/js/Root.Image.js"></script>
<script type="text/javascript"  src="../bm/js/hotHit.js"></script>
<style type="text/css">
<!--
body {
	background-image: url(images/lt_bg.gif);
	background-repeat: repeat-x;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.text {
	font-size: 22px;
	font-weight: bold;
	color: #333333;
}
.text1 {
	font-size: 26px;
	color: #FFFFFF;
	font-family: Geneva, Arial, Helvetica, sans-serif;
}
.text2 {
	font-size: 14px;
	font-weight: bold;
	color: #333333;
}
.STYLE4 {	font-size: 12px;
	color: #999999;
	line-height: 20px;
}

-->
</style>
</head>

<body>
<jsp:include page="top.jsp" flush="true" />
<jsp:include page="search.jsp" flush="true" />
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/lt_tabbg.gif"><table width="1000" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="18" colspan="2">&nbsp;</td>
        </tr>
      <tr>
        <td width="800" height="498" align="center" valign="top"><table width="838" border="0" cellpadding="0" cellspacing="2" bgcolor="#D75275">
          <tr>
            <td width="834" valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr class='title' height='22' align='center'>
                <!-- <td width='26'>选中</td>
                <td width="79">购买人</td>-->
                <td width="73">购买产品</td>
                <td width="106">交易时间</td>
                <td width="45">价格</td>
                <td width="116">验证码</td>
                <td width="165">订单号</td>
                <td width="89">手机号</td>
                <td width="161">状态</td>
              </tr>
              <%for (int i=0;i<TransactionList.size();i++) {
  TransactionVo vo = new TransactionVo();
  
  vo = (TransactionVo)TransactionList.get(i);
  %>
              <tr class='title' height='22' align='center'>
               <!-- <td><%//=s.isNullOrEmpty(vo.getPerson()) %></td>-->
                <td width="73"><%=vo.getProductName() %></td>
                <td><%=vo.getTransactiontime() %></td>
                <td><%=vo.getPrice() %></td>
                <td><%=vo.getCode() %></td>
                <td><%=vo.getOut_trade_no() %></td>
              <td width="89"><%=vo.getMobile() %></td>
              <td> <%
                    int flag = vo.getFlag(); 
                    
                    if(flag==0){
                    	out.print("买家提交订单");
                    }
                    else if(flag==1){
                    	out.print("等待买家付款");
                    }
                    else if(flag==2){
                    	out.print("等待卖家发货");
                    }
                    else if(flag==3){
                    	out.print("等待买家确认收货");
                    }
                    else if(flag==4){
                    	out.print("交易完成，等待买家使用");
                    }
                    else if(flag==5){
                   	 	out.print("商家确认买家使用");
                    }
                    else{
                   	 out.print("交易结束");
                    }
                    %></td>
              </tr>
              <%}%>
            </table></td>
          </tr>
        </table>
        <br>
		 <div align="center">
 <table border="0" cellpadding="0" cellspacing="2">
   <tr><td width="36" height="16" background="../bm/images/digital_bg_01.gif">
     <div align="center"><a href="mybuy.jsp?pages=1">首页</a> </div></td>	
<td width="36" height="16" background="../bm/images/digital_bg_01.gif"> <div align="center"><a href="mybuy.jsp?pages=<%=pageView.getCurrentPage()-1 %>">前页</a> </div></td>

 <%
 for (int i=1;i<=pageView.getPageCount();i++){
 %><td>
 <a href="mybuy.jsp?pages=<%=i%>">
 <%if(i==pageView.getCurrentPage()){%>
 	<font color="#FF0000"><%=i %></font>
 <%}
else{%><%=i%>	
 <%}%>
 </a></td>
 <%
 }
  %>
 <td width="36" height="16" background="../bm/images/digital_bg_01.gif"><div align="center"><a href="mybuy.jsp?pages=<%=pageView.getCurrentPage()+1 %>">后页</a></div></td>
<td width="36" height="16" background="../bm/images/digital_bg_01.gif"> <div align="center"><a href="mybuy.jsp?pages=<%=pageView.getPageCount()%>">末页</a></div></td>
  </tr></table>
 </div>	
          </td>
      </tr>
    </table></td>
  </tr>
</table>

<jsp:include page="foot.jsp" flush="true" />
</body>
</html>
