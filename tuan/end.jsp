<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.Action.ProductAction"%>
<%@page import="com.yi.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
ProductAction getInfo = new ProductAction();
ProductVo vo = new ProductVo();
vo = getInfo.getProductInfoAction(Integer.parseInt(id));
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
        <td width="731" height="498" align="center" valign="top"><table width="697" border="0" cellpadding="0" cellspacing="2" bgcolor="#D75275">
          <tr>
            <td valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="17" background="images/lt_tab_bg02.jpg">&nbsp;</td>
                <td valign="top" background="images/lt_tab_bg02.jpg">&nbsp;</td>
                <td background="images/lt_tab_bg02.jpg">&nbsp;</td>
              </tr>
              <tr>
                <td width="3%" height="136" background="images/lt_tab_bg02.jpg">&nbsp;</td>
                <td width="94%" valign="top" background="images/lt_tab_bg02.jpg"><strong><%=vo.getSummary() %></strong></td>
                <td width="3%" background="images/lt_tab_bg02.jpg">&nbsp;</td>
              </tr>
            </table>
              <table width="693" border="0" cellspacing="0" cellpadding="0">
                
                <tr>
                  <td width="225" rowspan="3" valign="top"><table width="225" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td colspan="2"><table width="225" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="31"><img src="images/lt_sub_button_4a.jpg" width="31" height="63" /></td>
                          <td width="102" background="images/lt_sub_button_4b.jpg">&nbsp;</td>
                          <td width="92"><img src="images/lt_sub_button_4d.jpg" width="92" height="63" /></td>
                        </tr>
                      </table></td>
                      </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="53" background="images/lt_tab_bg03.gif"><%=vo.getOldprice() %></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td height="1" bgcolor="#F5ADBA"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="60" background="images/lt_tab_bg03.gif"><%=vo.getNowprice() %></td>
                    </tr>
                    <tr>
                      <td height="1"></td>
                      <td bgcolor="#F5ADBA"></td>
                    </tr>
                    <tr>
                      <td height="10"></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td width="23" height="10"></td>
                      <td width="202"><table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#DDD4D6">
                        <tr>
                          <td height="108" bgcolor="#FAF9F9"><%=vo.getSum() %></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
                  <td width="12">&nbsp;</td>
                  <td width="442" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#DDD4D6">
                    <tr>
                      <td height="269" bgcolor="#FFFFFF"><img src="upload/<%=vo.getPic() %>"/></td>
                    </tr>
                  </table></td>
                  <td width="14">&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td height="28" align="center" valign="top" background="images/lt_tab_bg05.gif"><table width="440" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="16">&nbsp;</td>
                      <td width="135"><%if (vo.getIsreturn()==1){ %><img src="images/lt_sub_botton_5.gif" width="112" height="28" /><%} %></td>
                      <td width="289"><%if (vo.getIsreturn()==0){ %><img src="images/lt_sub_botton_6.gif" width="109" height="28" /><%} %></td>
                    </tr>
                  </table></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td></td>
                  <td valign="top"><table width="442" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="442" height="1" bgcolor="#DDD4D6"></td>
                    </tr>
                  </table></td>
                  <td></td>
                </tr>
              </table>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table>
          <table width="731" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="731">&nbsp;</td>
            </tr>
          </table>
          <table width="731" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="35" valign="top"><img src="images/lt_tab_con_1.gif" width="35" height="15" /></td>
              <td width="448" height="15" background="images/lt_tab_con_2.gif"></td>
              <td width="18" valign="top"><img src="images/lt_tab_con_3.gif" width="18" height="15" /></td>
              <td width="199" height="15" background="images/lt_tab_con_4.gif"></td>
              <td width="31" valign="top"><img src="images/lt_tab_con_5.gif" width="31" height="15" /></td>
            </tr>
          </table>
          <table width="731" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="483" valign="top" background="images/lt_tab_con_6.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td colspan="2" align="left"><img src="images/lt_sub_banner_1.jpg" width="161" height="38" /></td>
                </tr>
                <tr>
                  <td width="7%"></td>
                  <td width="93%"><%=vo.getContent() %></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
              <td width="18" background="images/lt_tab_con_7.gif">&nbsp;</td>
              <td width="199" valign="top" bgcolor="#FAF9F9">&nbsp;</td>
              <td width="31" background="images/lt_tab_con_8.gif">&nbsp;</td>
            </tr>
          </table>
          <table width="731" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="35" valign="top"><img src="images/lt_tab_con_9.gif" width="35" height="24" /></td>
              <td width="448" height="15" background="images/lt_tab_con_10.gif">&nbsp;</td>
              <td width="18" valign="top"><img src="images/lt_tab_con_11.gif" width="18" height="24" /></td>
              <td width="199" height="15" background="images/lt_tab_con_12.gif">&nbsp;</td>
              <td width="31" valign="top"><img src="images/lt_tab_con_13.gif" width="31" height="24" /></td>
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
