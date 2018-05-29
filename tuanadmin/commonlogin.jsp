<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.google.code.kaptcha.Constants"%>  
<%@page import="com.yi.util.StringUtils"%>
<%@page import="com.yi.Action.TuanCompanyAction"%>
<%@page import="com.yi.vo.TuanCompanyVo"%>
<%
request.setCharacterEncoding("UTF-8");
String kaptchaExpected = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);


StringUtils  s = new StringUtils();

request.setCharacterEncoding("UTF-8");

String kaptcode = s.trimStr(request.getParameter("kaptcode"));

if(!kaptchaExpected.equals(kaptcode)){
	response.sendRedirect("../return.jsp?err=-10");
	return;
}


	 String   username  = s.trimStr(request.getParameter("username"));
	 String   password  = s.trimStr(request.getParameter("password"));
	 
	 TuanCompanyVo vo = new TuanCompanyVo();
	 TuanCompanyAction ua = new TuanCompanyAction();
	 vo.setUsername(username);
	 vo.setPassword(password);
	 
	
	 
	 
	 vo =  ua.getTuanCompnayInfoActionByLogin(username,password);

	if("".equals(vo.getUsername()) || "".equals(vo.getPassword())){
		
		response.sendRedirect("../return.jsp?err=-12");
	}
	else{
		session.setAttribute("username",vo.getUsername());
		session.setAttribute("cid",vo.getId()+"");
		response.sendRedirect("Admin_Transaction.jsp?Action=Main");
	}
%>
