<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.yi.Action.AdInfoAction"%>
<%@page import="com.yi.vo.AdInfoVo"%>
<%@page import="java.util.List"%>
 <table border="0" cellspacing="0" cellpadding="0">
 
 		<%
		 AdInfoAction ad = new AdInfoAction();
    List adList =  ad.getAdInfoListByTypeAction("6",0,3);
		for(int i=0;i<adList.size();i++){
				 AdInfoVo ao =(AdInfoVo)adList.get(i);
					   %>
            <tr>
              <td><a href="<%=ao.getUrl() %>"><img src="../upload/<%=ao.getPic() %>" width="234" height="159"  border="0"/></a></td>
            </tr>
            <tr>
              <td height="1" bgcolor="#000000"></td>
            </tr>
<%} %>

          </table>
