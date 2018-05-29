<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.Action.ProductAction"%>
<%@page import="com.yi.vo.ProductVo"%>
<%@page import="java.util.List"%>
<%
ProductAction getMax = new ProductAction();
 List pcList =  getMax.getProductListByNowAction("1",0,5);
 for(int i=0;i<pcList.size();i++){
 ProductVo vo = (ProductVo)pcList.get(i);

 %>
<style type="text/css">
<!--
.P1 {
	font-size: 20px;
	color: #D11E46;
	font-family: Geneva, Arial, Helvetica, sans-serif;
}
-->
</style>

  <table border="0" cellpadding="0" cellspacing="0">
		   <tr>
            <td background="images/lt_tab_bg04.gif"><a href="info.jsp?id=<%=vo.getId()%>" target="_blank">
            <img src="../upload/<%=vo.getPic() %>" width="255" height="151" border="0" /></a></td>
    </tr>
		            <tr>
            <td height="40"><a href="info.jsp?id=<%=vo.getId()%>" target="_blank"><%=vo.getSummary()%></a></td>
    </tr>
          <tr>
            <td><span class="P1">&nbsp;&yen; <%=vo.getNowprice() %>　　</span>原价：<%=vo.getOldprice() %>　<%=vo.getSum() %>人已购买</td>
    </tr>
		  </table><%}%>