<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.Action.ProductAction"%>
<%@page import="com.yi.vo.ProductVo"%>
<%@page import="com.yi.util.StringUtils"%>

<%
request.setCharacterEncoding("UTF-8");
StringUtils  s = new StringUtils();


String username = "";

//session.setAttribute("username","1");
//session.setAttribute("uid","1");

username = (String)session.getAttribute("username");
if(s.isNullOrEmpty(username)){
	response.sendRedirect("../return.jsp?err=-9");
}

String id = s.trimStr(request.getParameter("id"));

String buyInfo = (String)session.getAttribute("buyInfo");

if(s.isNullOrEmpty(id) && s.isNullOrEmpty(buyInfo)){
	response.sendRedirect("../return.jsp?err=-9999");
}
if(s.isNullOrEmpty(id)){
id = buyInfo;
}

if (s.isNullOrEmpty(buyInfo)){
	
	session.setAttribute("buyInfo",id);
}




ProductAction getInfo = new ProductAction();
ProductVo vo = new ProductVo();

 vo = getInfo.getProductInfoAction(Integer.parseInt(id));

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>青客团购—<%=vo.getName() %></title>
<link rel="shortcut icon" href="../images/qingcall.ico"> 
<script type="text/javascript" src="../bm/js/jquery.js"></script>
<script type="text/javascript" src="../bm/js/Root.Image.js"></script>
<script type="text/javascript"  src="../bm/js/hotHit.js"></script>


<script language=javascript>

	
	
    function sumPrice(price){
	
	
	
		var count = document.getElementById("ProductNum").value;
        if(document.getElementById("ProductNum").value==''){
            alert('购买数量不能为空！');
            document.myform.ProductNum.focus();
            return false;
        }
        
        var  oldcount = document.getElementById("count").value;
		
		if (oldcount>0 && count>oldcount ){
			alert('购买数量不能多余商品数量，请重新选择！');
            document.myform.ProductNum.focus();
            return false;
		}
		
		
		document.getElementById("priceNum").innerText=count*price;
		document.getElementById("priceNum2").innerText=count*price;
		}
		
		
		 function submitForm(){
		        if(document.getElementById("ProductNum").value==''){
            alert('购买数量不能为空！');
            document.myform.ProductNum.focus();
            return false;
        }
		else{
			document.myform.submit();
		}
		
		}
		
		   
    </script>
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
.STYLE20 {color: #D75275}

-->
</style>
</head>

<body>
<jsp:include page="top.jsp" flush="true" />
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/lt_tabbg.gif"><table width="1000" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="38">&nbsp;</td>
        </tr>
      <tr>
        <td height="498" align="center" valign="top"><table width="697" border="0" cellpadding="0" cellspacing="2" bgcolor="#D75275">
          <tr>
            <td height="400" valign="top" bgcolor="#FFFFFF"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="6">&nbsp;</td>
                </tr>
                <tr>
                  <td height="60" colspan="6"><span class="STYLE13">提交订单</span></td>
                </tr>
                <tr>
                  <td height="1" colspan="6" bgcolor="E3E3E3"></td>
                </tr>
                <tr>
                  <td colspan="6">&nbsp;</td>
                </tr>
                <tr>
                  <td height="1" colspan="6" bgcolor="E3E3E3"></td>
                </tr>
                <tr>
                  <td width="40%" height="40" bgcolor="EFEEEE"><div align="center"><span class="STYLE17">商品名称</span></div></td>
                  <td width="13%" bgcolor="EFEEEE"><div align="center"><span class="STYLE17">数量</span></div></td>
                  <td width="9%" bgcolor="EFEEEE">&nbsp;</td>
                  <td width="13%" bgcolor="EFEEEE"><div align="center"><span class="STYLE17">价格</span></div></td>
                  <td width="9%" bgcolor="EFEEEE">&nbsp;</td>
                  <td width="16%" bgcolor="EFEEEE"><div align="center"><span class="STYLE17">总价</span></div></td>
                </tr>
                <tr>
                  <td height="1" colspan="6" bgcolor="E3E3E3"></td>
                </tr>
                <tr>
                  <td colspan="6" bgcolor="F8F8F8"><table width="97%" border="0" align="right" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="10" colspan="6"></td>
                      </tr>
                      <tr>
                        <td width="38%"><span class="STYLE14"><%=vo.getName() %></span></td>
                        <td width="14%" valign="middle"><div align="center"><span class="STYLE14">
                          <form name="myform" id="myform" method="post" action="check.jsp">
                        <label>
                        <input name="ProductNum" type="text" id="ProductNum" onchange="sumPrice(<%= vo.getNowprice()%>);"  value="1" size="3"/>
                        <input type="hidden" name="id" id="id"  value="<%=id%>"/>
                         <input type="hidden" name="count" id="count"  value="<%=vo.getCount()%>"/>
                        </label>
						</form>		
                        </span></div></td>
                        <td width="9%"><div align="center"><span class="STYLE14">×</span></div></td>
                        <td width="13%"><div align="center"><span class="STYLE14"><%=vo.getNowprice() %></span></div></td>
                        <td width="9%"><div align="center"><span class="STYLE14">＝</span></div></td>
                        <td width="17%"><div align="center"><span class="STYLE19">&yen;<div id="priceNum"><%= vo.getNowprice()%></div></span></div></td>
                      </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="8" colspan="6" bgcolor="F8F8F8"></td>
                </tr>
                <tr>
                  <td height="1" colspan="6" bgcolor="E7E7E7"></td>
                </tr>
                <tr>
                  <td height="50" colspan="6"><div class="STYLE19" id="priceNum">
                    <div align="right">总额：<span class="STYLE20">&yen;<div id="priceNum2"><%= vo.getNowprice()%></div></span>　</div>
                  </div>
                    </td>
                </tr>
                <tr>
                  <td height="1" colspan="6" bgcolor="E7E7E7"></td>
                </tr>
                <tr>
                  <td height="70" colspan="6" valign="bottom"><div align="right"><img src="images/con_button.jpg" width="112" height="36"  onclick="submitForm();"/>　</div></td>
                </tr>
                <tr>
                  <td colspan="6">&nbsp;</td>
                </tr>
            </table></td>
          </tr>
        </table>
          <table width="731" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="731">&nbsp;</td>
            </tr>
          </table>          </td>
        </tr>
    </table></td>
  </tr>
</table>

<jsp:include page="foot.jsp" flush="true" />
</body>
</html>
