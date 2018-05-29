<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.google.code.kaptcha.Constants"%>    
<%@page import="com.yi.util.StringUtils"%>
<%@page import="com.yi.Action.UserInfoAction"%>
<%@page import="com.yi.vo.UserInfoVo"%>
<%
request.setCharacterEncoding("UTF-8");
String kaptchaExpected = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);


StringUtils  s = new StringUtils();

request.setCharacterEncoding("UTF-8");

String kaptcode = s.trimStr(request.getParameter("kaptcode"));

if(!kaptchaExpected.equals(kaptcode)){
	response.sendRedirect("return.jsp?err=-10");
	return;
}


	 String   username  = s.trimStr(request.getParameter("username"));
	 String   password  = s.trimStr(request.getParameter("password"));
	 
	 UserInfoVo vo = new UserInfoVo();
	 UserInfoAction ua = new UserInfoAction();
	 vo.setUsername(username);
	 vo.setPassword(password);
	 
	
	 
	 
	 vo =  ua.getUserInfoInfoAction(username,password);

	if("".equals(vo.getUsername()) || vo.getUsername()==null || "".equals(vo.getPassword()) || vo.getPassword()==null ){
		
		response.sendRedirect("return.jsp?err=-12");
	}
	else{
		session.setAttribute("username",vo.getUsername());
		session.setAttribute("uid",vo.getId()+"");
		session.setAttribute("privateid",vo.getPrivateid());
		response.sendRedirect("Admin_Index.jsp");
	}
%>
