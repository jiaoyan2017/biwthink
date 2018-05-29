<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.google.code.kaptcha.Constants"%>  
<%@page import="com.yi.util.StringUtils"%>
<%@page import="com.yi.Action.UserInfoAction"%>
<%@page import="com.yi.vo.UserInfoVo"%>
<%
request.setCharacterEncoding("UTF-8");

StringUtils s = new StringUtils();

String kaptchaExpected = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);




String kaptcode = s.trimStr(request.getParameter("kaptcode"));

if(!kaptchaExpected.equals(kaptcode)){
	response.sendRedirect("../return.jsp?err=-10");
	return;
}


	 String   username  = s.trimStr(request.getParameter("username"));
	 String   newpassword  = s.trimStr(request.getParameter("newpassword"));
 String   oldpassword  = s.trimStr(request.getParameter("oldpassword"));
	 UserInfoAction ua = new UserInfoAction();

	 int status = ua.updateUserInfoAction(username,newpassword,oldpassword);

	if(status<0){
		
		response.sendRedirect("return.jsp?err=-12");
	}
	else{
		response.sendRedirect("return.jsp?err=1");
	}
%>
