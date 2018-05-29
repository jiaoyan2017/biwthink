<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page  import="java.util.*"%>
<%@ page import="com.yi.Action.*" %>
<%@ page import="com.yi.vo.*" %>

<%@page import="com.yi.util.PageBean"%>
<%@page import="com.yi.Dao.PublicDao"%>
<%@page import="com.yi.util.StringUtils;"%>

<%
request.setCharacterEncoding("UTF-8");
String type = request.getParameter("type");
String Action = request.getParameter("Action");
%>

<html><head><title>注册商家管理<%=Action %></title>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<link href='Admin_STYLE.CSS' rel='stylesheet' type='text/css'>


    <script language=javascript>
	
	function unselectall()
{
    if(document.myform.chkAll.checked)
	document.myform.chkAll.checked = document.myform.chkAll.checked;
 }    	


function CheckAll(form)
{
  for (var i=0;i<form.elements.length;i++){
    
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
	   
	   }
    
}
	
	
    function CheckSubmit(){
	

        if(document.myform.company.value==''){
            alert('注册商家名称不能为空！');
            document.myform.company.focus();
            return false;
        }
	

    }
   

    </script>
</head>
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>


<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
  <form name='searchmyform' action='Admin_Company.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_Company.jsp'>注册商家管理首页</a>&nbsp;|&nbsp;<a href='Admin_Company.jsp?Action=Add'>添加注册商家</a><%=Action %>
    </td>
  </tr>
  </form>
</table>

<%if("Main".equals(Action)){%>
<%
String Keyword = "";
Keyword = request.getParameter("Keyword");
if(Keyword==null) Keyword = "";

String pages = "0";
pages = request.getParameter("pages");
if(pages==null) pages = "0";
int recordCount = 0;

PublicDao count = new PublicDao();

recordCount = count.getRecordCount("tbcompany",type);

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));



TuanCompanyAction getCompanyList =new TuanCompanyAction();
List companyList = new ArrayList();

companyList = getCompanyList.getTuanCompnayListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize(),type);
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Company.jsp'>
        <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='30'>选中</td>
              <td>注册商家名称</td>
              <td width="996">联系地址</td>
              <td width='171'>操作</td>
            </tr>
    

        <tr><td colspan='20' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个注册商家</td></tr>
  <%for (int i=0;i<companyList.size();i++) {
  TuanCompanyVo vo = new TuanCompanyVo();
  
  vo = (TuanCompanyVo)companyList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <td width='30' align='center'>
                    <input name='CompanyID' type='checkbox' onClick="unselectall()" id='CompanyID' value='<%=vo.getId() %>'></td>
                    <td width='100'><a href='Admin_Company.jsp'><%=vo.getCompany() %></a></td>
                    <td><a href='Admin_Company.jsp'><%=vo.getSummary() %></a></td>
                  
                    <td width='171' align='center'>
          
            <a href='Admin_Company.jsp?Action=Modify&id=<%=vo.getId() %>&type=<%=type%>'>修改</a>&nbsp;
            <a href='Admin_Company.jsp?Action=del&id=<%=vo.getId() %>' onClick='return confirm("确定要删除此注册商家吗？");'>删除</a>                    </td>
                  </tr>
<%} %>
           
          </table>
  
              <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='200'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有注册商家</td>
                  <td><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的注册商家吗？');">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                 
                </tr>
              </table>
              
              <a href=Admin_Company.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>&type=<%=type%>>上一页</a>  共<%=pageView.getPageSize() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_Company.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>&type=<%=type%>>下一页</a>
          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_Company.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='113'><b>注册商家查询：</b></td>
        <td width="1198">
          <input name='Keyword' type='text' id='Keyword' size='20' maxlength='40'>
          <input type='submit' name='Submit' value='搜 索' id='Submit'>
           <input type='hidden' name='Action' value='Main' id='Action'>
         
        </td>
      </tr>
    </table>
    </form>

    
    <%} %>
<%if("Add".equals(Action)){%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Company.jsp'>注册商家管理</a>&nbsp;&gt;&gt;&nbsp;添加注册商家</td></tr></table>
    <form name='myform' id='myform' action='Admin_Company.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>注册商家名称：</td>
                            <td width='38%'><input name='company' type='text' id='company' size='35' maxlength='200'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>联系人：</td>
                            <td width='38%'><input name='person' type='text' id='person' size='35' maxlength='30' value=''></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>联系电话：</td>
                            <td width='38%'><input name='tel'  id='tel'  type='text' size='35' maxlength='30'></td>
                            <td class='tdbg5' align='right'  width='12%'>手机号码：</td>
                            <td width='38%'><input name='mobile'  id='mobile'  type='text' size='35' maxlength='30'></td>
                        </tr>
						
						                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>用户名：</td>
                            <td width='38%'><input name='username'  id='username'  type='text' size='35' maxlength='30'></td>
                            <td class='tdbg5' align='right'  width='12%'>密码：</td>
                            <td width='38%'><input name='password'  id='password'  type='text' size='35' maxlength='30'></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>email：</td>
                            <td width='38%'><input name='email'   id='email'  type='text' size='35' maxlength='255'></td>
                            <td class='tdbg5' align='right'  width='12%'>&nbsp;</td>
                            <td width='38%'><input name='person'   id='person'  type='text' size='35' maxlength='255'></td>
                        </tr>
                        <tr class='tdbg'>
						 <td class='tdbg5' align='right'  width='12%'>联系地址：</td>
                            <td width='38%'><input name='address' id="address" type='text' size='35' maxlength='255'></td>
                            <td class='tdbg5' align='right'  width='12%'>备注：</td>
                            <td colspan='3'><input name='summary' id="summary" type='text' size='35' value=""></td>
                        </tr>
                    </table>
    
                </td>
            </tr>
    </table>
	
	
    <table width='100%' height='40'><tr align='center'><td><input type='hidden' name='type' value='<%=type%>'>
        <input type='hidden' name='Action' value='SaveAdd'>
        <input type='submit' name='Submit' value='保存注册商家信息'>
    </td></tr></table>
    </form>

<% }%>
<%if("Modify".equals(Action)){
String id = request.getParameter("id");
TuanCompanyAction getInfo = new TuanCompanyAction();
TuanCompanyVo vo = new TuanCompanyVo();
vo = getInfo.getTuanCompnayInfoAction(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Company.jsp'>注册商家管理</a>&nbsp;&gt;&gt;&nbsp;修改注册商家信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Company.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>注册商家名称：</td>
                            <td width='38%'><input name='company' type='text' id='company' size='35' maxlength='200' value='<%=vo.getCompany() %>'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>联系人：</td>
                            <td width='38%'><input name='person' type='text' id='person' size='35' maxlength='30' value='<%=vo.getPerson() %>'></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>联系电话：</td>
                            <td width='38%'><input name='tel' id='tel' type='text' size='35' maxlength='30' value='<%=vo.getTel() %>'></td>
                            <td class='tdbg5' align='right'  width='12%'>手机号码：</td>
                            <td width='38%'><input name='mobile' id='mobile' type='text' size='35' maxlength='30' value='<%=vo.getMobile() %>'></td>
                        </tr>
						
						
						  <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>用户名：</td>
                            <td width='38%'><input name='username'  id='username'  type='text' size='35' maxlength='30' value="<%=vo.getUsername() %>"></td>
                            <td class='tdbg5' align='right'  width='12%'>密码：</td>
                            <td width='38%'><input name='password'  id='password'  type='text' size='35' maxlength='30' value="<%=vo.getPassword() %>"></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>email：</td>
                            <td width='38%'><input name='email' id='email' type='text' size='35' maxlength='255' value='<%=vo.getEmail() %>'></td>
                            <td class='tdbg5' align='right'  width='12%'>&nbsp;</td>
                            <td width='38%'>&nbsp;</td>
                        </tr>
                        <tr class='tdbg'>
						 <td class='tdbg5' align='right'  width='12%'>联系地址：</td>
                            <td width='38%'><input name='address' id='address' type='text' size='35' maxlength='255' value='<%=vo.getAddress() %>'></td>
                            <td class='tdbg5' align='right'  width='12%'>备注：</td>
                            <td colspan='3'><input name='summary' id='summary' type='text' size='35' value="<%=vo.getSummary() %>"></td>
                        </tr>
                    </table>

                </td>
            </tr>
    </table>
    <table width='100%' height='40'><tr align='center'><td>
        <input type='hidden' name='Action' value='SaveModify'><input type='hidden' name='id' value='<%=vo.getId() %>'><input type='hidden' name='type' value='<%=type%>'>
        <input type='submit' name='Submit' value='保存修改结果'>
    </td></tr></table>
    </form>
                </td>
            </tr>
    </table>
    <% }%>
</body>
</html>

<%
StringUtils  s = new StringUtils();

if("SaveAdd".equals(Action)){

     String   company = s.trimStr(request.getParameter("company"));
  
	 String   summary  = s.trimStr(request.getParameter("summary"));
	 String   person  = s.trimStr(request.getParameter("person"));
	 String   username  = s.trimStr(request.getParameter("username"));
	 String   password  = s.trimStr(request.getParameter("password"));
	 //int   status ;
	 String   tel  = s.trimStr(request.getParameter("tel"));
	 String   email  = s.trimStr(request.getParameter("email"));
	 String   mobile  = s.trimStr(request.getParameter("mobile"));
	 String   address  = s.trimStr(request.getParameter("address"));
	 type = s.trimStr(request.getParameter("type"));
	 
	 
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
	 vo.setType(type);
	 int status = tCompanyAction.insertTuanCompnayAction(vo);
	 	 response.sendRedirect("Admin_Company.jsp?Action=Main&type=2");

}


if("SaveModify".equals(Action)){
    String id = request.getParameter("id");
     String   company = s.trimStr(request.getParameter("company"));
	 String   summary  = s.trimStr(request.getParameter("summary"));
	 String   person  = s.trimStr(request.getParameter("person"));
	 String   username  = s.trimStr(request.getParameter("username"));
	 String   password  = s.trimStr(request.getParameter("password"));
	 //int   status ;
	 String   tel  = s.trimStr(request.getParameter("tel"));
	 String   email  = s.trimStr(request.getParameter("email"));
	 String   mobile  = s.trimStr(request.getParameter("mobile"));
	 String   address  = s.trimStr(request.getParameter("address"));
	 type = s.trimStr(request.getParameter("type"));
	 
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
	 vo.setType(type);
	 int status = tCompanyAction.updateTuanCompnayAction(vo);
	 response.sendRedirect("Admin_Company.jsp?Action=Main&type=2");
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


}
%>

