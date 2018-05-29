<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.google.code.kaptcha.Constants"%>  
<%@page import="com.yi.util.StringUtils"%>
<%@page import="com.yi.Action.TuanCompanyAction"%>
<%@page import="com.yi.vo.TuanCompanyVo"%>
<%
request.setCharacterEncoding("UTF-8");

StringUtils s = new StringUtils();

String cid = "";
cid = (String)session.getAttribute("cid");

if(s.isNullOrEmpty(cid)){
	response.sendRedirect("../return.jsp?err=-9");
}

String kaptchaExpected = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);




String kaptcode = s.trimStr(request.getParameter("kaptcode"));

if(!kaptchaExpected.equals(kaptcode)){
	response.sendRedirect("../return.jsp?err=-10");
	return;
}


	 String   username  = s.trimStr(request.getParameter("username"));
	 String   newpassword  = s.trimStr(request.getParameter("newpassword"));
	 
	 TuanCompanyVo vo = new TuanCompanyVo();
	 TuanCompanyAction ua = new TuanCompanyAction();
	 vo.setUsername(username);
	 vo.setPassword(newpassword);
	 
	
	 
	 
	 int status = ua.updateTuanCompnayActionByPassword(newpassword,Integer.parseInt(cid));

	if(status<0){
		
		response.sendRedirect("../return.jsp?err=-12");
	}
	else{
		response.sendRedirect("../return.jsp?err=1");
	}
%>
