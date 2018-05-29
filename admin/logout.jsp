<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.google.code.kaptcha.Constants"%>    
<%@page import="com.yi.util.StringUtils"%>
<%@page import="com.yi.Action.UserInfoAction"%>
<%@page import="com.yi.vo.UserInfoVo"%>
<%
		session.setAttribute("username","");
		session.setAttribute("uid","");
		response.sendRedirect("return.jsp?err=-13");
%>
