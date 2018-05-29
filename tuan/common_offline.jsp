<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.yi.Action.SubmitAction" %>
<%@ page import="com.yi.Action.RegistrationAction" %>
<%@ page import="com.yi.vo.RegistrationVo" %>
<%@ page import="com.yi.vo.SubmitVo" %>
<%@page import="com.google.code.kaptcha.Constants"%>  
<%@page import="com.yi.util.StringUtils;"%>
<%
request.setCharacterEncoding("UTF-8");
String kaptchaExpected = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);


StringUtils  s = new StringUtils();

request.setCharacterEncoding("UTF-8");

String kaptcode = s.trimStr(request.getParameter("kaptcode"));

if(!kaptchaExpected.equals(kaptcode)){

	out.print("验证码错误，请重新输入");
	return;
}


	 String   username  = s.trimStr(request.getParameter("username"));
	 String   tel  = s.trimStr(request.getParameter("tel"));
	 String   email  = s.trimStr(request.getParameter("email"));

	 String   address  = s.trimStr(request.getParameter("address"));
     String registrationId = s.trimStr(request.getParameter("registrationId"));
      String msgId = s.trimStr(request.getParameter("msgid"));
	 String ip = request.getRemoteAddr();
	 
	 SubmitVo vo = new SubmitVo();
	 SubmitAction tSubmitAction = new SubmitAction();
	 vo.setAddress(address);
	 vo.setEmail(email);
	 vo.setTel(tel);
	 vo.setUsername(username);
	 vo.setIp(ip);
	 
	 vo.setRegistrationId(Integer.parseInt(registrationId));
		vo.setMsgId(Integer.parseInt(msgId));
	 int status = tSubmitAction.insertSubmitAction(vo);
	 
	 if(status==1){
	 
		 response.sendRedirect("../return.jsp?err=2");
	 }
	 else{
	  response.sendRedirect("../return.jsp?err=-9999");
	 }
	// out.print("status="+status);
	 
	 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>

   
    
	<meta http-equiv="pragma" content="no-cache">

  </head>
  
  <body>
   <%if(status==1){
 	 	response.sendRedirect("return.jsp?err=3");
 	 	
 	 	}
 	 
 	 %>
  </body>
</html>
