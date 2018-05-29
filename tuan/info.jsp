<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.yi.Action.ProductAction"%>
<%@page import="com.yi.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%@page import="com.yi.Action.AdInfoAction"%>
<%@page import="com.yi.vo.AdInfoVo"%>
<%@page import="com.yi.util.StringUtils"%>
<%

request.setCharacterEncoding("utf-8");
StringUtils s = new StringUtils();
String id = request.getParameter("id");
ProductAction getInfo = new ProductAction();
ProductVo vo = new ProductVo();
vo = getInfo.getProductInfoActionByPage(Integer.parseInt(id));
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
	font-size: 20px;
	font-weight: bold;
	font-family: "黑体";
}
.text1 {
	font-size: 26px;
	color: #FFFFFF;
	font-family: Geneva, Arial, Helvetica, sans-serif;
}
body,td,th {
	font-size: 12px;
}
.text2 {	font-size: 14px;
	font-weight: bold;
	color: #333333;
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
                <td height="22">&nbsp;</td>
                <td valign="top">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td width="3%">&nbsp;</td>
                <td width="94%" valign="top"><div align="left"><span class="text"><%=vo.getSummary() %></span></div></td>
                <td width="3%">&nbsp;</td>
              </tr>
              <tr>
                <td height="20" colspan="3"></td>
                </tr>
            </table>
              <table width="693" border="0" cellspacing="0" cellpadding="0">
                
                <tr>
                  <td width="225" rowspan="3" valign="top"><table width="225" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td colspan="2"><table width="225" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="31"><img src="images/lt_sub_button_4a.jpg" width="31" height="63" /></td>
                            <td width="102" valign="top" background="images/lt_sub_button_4b.jpg"><table width="102" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="102" height="14"></td>
                                </tr>
                                <tr>
                                  <td><div align="left"><span class="text1">&yen;&nbsp;<%=vo.getNowprice() %></span></div></td>
                                </tr>
                            </table></td>
                            <td width="92"><a href = "buy.jsp?id=<%=id %>"><img src="images/lt_sub_button_4c.jpg" width="92" height="63" align="absmiddle"  border="0"/></a></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="53" background="images/lt_tab_bg03.gif"><div align="left" class="text2">　　原价：<%=vo.getOldprice() %>元</div></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td height="1" bgcolor="#F5ADBA"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="60" background="images/lt_tab_bg03.gif"><div align="left" class="text2">　　现价：<%=vo.getNowprice() %>元</div></td>
                    </tr>
					
					<%if(vo.getCount()>0){%>
					 <tr>
                      <td>&nbsp;</td>
                      <td height="60" background="images/lt_tab_bg03.gif"><div align="left" class="text2">　　  商品数量：<%=vo.getCount() %>个</div></td>
                    </tr>
					<%}%>
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
                            <td height="53" bgcolor="#FAF9F9"><div align="left"><span class="text2">剩余时间：<%
                            String timer = s.getQuot(vo.getDowntime(),"");
                            if(!"".equals(timer)){
                           
                            String[] arr  = timer.split(",");
                            out.print(arr[0]+"天"+arr[1]+"小时"+arr[2]+"分"+arr[3]+"秒");
                           }
                            
                            
                            %>
                            
                            </span></div></td>
                          </tr>
                          <tr>
                            <td height="54" bgcolor="#FAF9F9"><span class="text2">　　<%=vo.getSum() %>人已购买</span></td>
                          </tr>
                      </table></td>
                    </tr>
                  </table></td>
                  <td width="12">&nbsp;</td>
                  <td width="442" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#DDD4D6">
                    <tr>
                      <td height="269" bgcolor="#FFFFFF"><img src="../upload/<%=vo.getPic() %>" onload="ImageJtx.Resize(this,442,269);"   border="0" /></td>
                    </tr>
                  </table></td>
                  <td width="14">&nbsp;</td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td height="28" align="center" valign="top" background="images/lt_tab_bg05.gif"><table width="440" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="16">&nbsp;</td>
                      <td width="135"><%if (vo.getIsreturn()==1){ %>
                          <img src="images/lt_sub_botton_6.gif" width="109" height="28" />
                          <%} %></td>
                      <td width="289"><%if (vo.getIsreturn()==0){ %>
                          <img src="images/lt_sub_botton_8.gif" width="124" height="28" />
                          <%} %></td>
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
              <td width="199" valign="top" bgcolor="#FAF9F9"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="10" colspan="2"></td>
                  </tr>
                  <tr>
                    <td width="20%" height="20"><div align="left">店名：</div></td>
                    <td width="80%"><div align="left"><%=vo.getCompanyName() %></div></td>
                  </tr>
                  <tr>
                    <td height="20"><div align="left">电话：</div></td>
                    <td height="20"><div align="left"><%=vo.getTel() %></div></td>
                  </tr>
                  <tr>
                    <td height="20" valign="baseline"><div align="left">地址：</div></td>
                    <td height="20" valign="baseline"><div align="left"><%=vo.getCompanyaddress() %></div></td>
                  </tr>
                  <tr>
                    <td height="20" colspan="2"><div align="left">交通：</div></td>
                  </tr>
                  <tr>
                    <td height="20" colspan="2"><div align="center"><a href="../upload/<%=vo.getAddresspic() %>" target="_blank"><img src="../upload/<%=vo.getAddresspic() %>" width="190" height="190" border="0" /></a></div></td>
                  </tr>
              </table></td>
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
        <td width="269" valign="top">
		
		<table width="255" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/lt_sub_banner_6.jpg" width="255" height="30" /></td>
          </tr>
		  
		  <tr><td>
		  
	<jsp:include page="Max.jsp" flush="true" />
		  
		  
		  
		  </td></tr>
		  
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>
			
			
 		<%
		 AdInfoAction ad = new AdInfoAction();
    List adList =  ad.getAdInfoListByTypeAction("7",0,3);
		for(int i=0;i<adList.size();i++){
				 AdInfoVo ao =(AdInfoVo)adList.get(i);
					   %>
 <a href="<%=ao.getUrl() %>"><img src="../upload/<%=ao.getPic() %>" width="255" height="120"  border="0"/></a>
  
<%} %></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>
		</td>
      </tr>
    </table></td>
  </tr>
</table>

<jsp:include page="foot.jsp" flush="true" />
</body>
</html>
