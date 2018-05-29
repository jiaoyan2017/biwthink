<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page  import="java.util.*"%>
<%@ page import="com.yi.Action.*" %>
<%@ page import="com.yi.vo.*" %>
<%
request.setCharacterEncoding("UTF-8");
String Action = request.getParameter("Action");
%>
<%
if("SaveAdd".equals(Action)){

     String   company = request.getParameter("company");
     out.print(company);
	 String   summary  = request.getParameter("summary");
	 String   person  = request.getParameter("person");
	 String   username  = request.getParameter("username");
	 String   password  = request.getParameter("password");
	 //int   status ;
	 String   tel  = request.getParameter("tel");
	 String   email  = request.getParameter("email");
	 String   mobile  = request.getParameter("mobile");
	 String   address  = request.getParameter("address");
	 
	 
	 TuanCompanyVo vo = new TuanCompanyVo();
	 TuanCompanyAction tCompanyAction = new TuanCompanyAction();
	 vo.setAddress(address);
	 vo.setCompany(company);
	 vo.setEmail(email);
	 vo.setMobile(mobile);
	 vo.setPassword(password);
	 vo.setPerson(person);
	 vo.setSummary(summary);
	 vo.setTel(tel);
	 vo.setUsername(username);
	 int status = tCompanyAction.insertTuanCompnayAction(vo);
	 

}


if("SaveModify".equals(Action)){
   String id = request.getParameter("id");
   String   company = request.getParameter("company");
	 String   summary  = request.getParameter("summary");
	 String   person  = request.getParameter("person");
	 String   username  = request.getParameter("username");
	 String   password  = request.getParameter("password");
	 //int   status ;
	 String   tel  = request.getParameter("tel");
	 String   email  = request.getParameter("email");
	 String   mobile  = request.getParameter("mobile");
	 String   address  = request.getParameter("address");
	 
	 
	 TuanCompanyVo vo = new TuanCompanyVo();
	 TuanCompanyAction tCompanyAction = new TuanCompanyAction();
	 vo.setId(Integer.parseInt(id));
	 vo.setAddress(address);
	 vo.setCompany(company);
	 vo.setEmail(email);
	 vo.setMobile(mobile);
	 vo.setPassword(password);
	 vo.setPerson(person);
	 vo.setSummary(summary);
	 vo.setTel(tel);
	 vo.setUsername(username);
	 int status = tCompanyAction.updateTuanCompnayAction(vo);

}

if("del".equals(Action)){
	TuanCompanyAction tCompanyAction = new TuanCompanyAction();
	String id = request.getParameter("id");
 	int status = tCompanyAction.delTuanCompnayAction(Integer.parseInt(id));

}




if("DelAll".equals(Action)){
//String  =  request.getParameter("CompanyID");

String[] CompanyID= request.getParameterValues("CompanyID");//


for(int i=0;i<CompanyID.length;i++){
	out.print(CompanyID[i]);

}
	//TuanCompanyAction tCompanyAction = new TuanCompanyAction();
	//String id = request.getParameter("id");
 	//int status = tCompanyAction.delTuanCompnayAction(Integer.parseInt(id));

}
%>