<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page  import="java.util.*"%>
<%@ page import="com.yi.Action.*" %>
<%@ page import="com.yi.vo.*" %>

<%@page import="com.yi.util.PageBean"%>
<%@page import="com.yi.Dao.PublicDao"%>
<%@page import="com.yi.util.StringUtils"%>

<%
request.setCharacterEncoding("UTF-8");
String type = request.getParameter("type");
String Action = request.getParameter("Action");
%>

<html><head><title>注册用户信息管理<%=Action %></title>
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
        if(document.myform.username.value==''){
            alert('用户名不能为空！');
            document.myform.username.focus();
            return false;
        }
        if(document.myform.password.value==''){
            alert('密码不能为空！');
            document.myform.password.focus();
            return false;
        }

    }
    function ChangeType(Type){
      if(Type==0){
        TabTitle[2].style.display='';
        infoE.style.display='';
        TabTitle[3].style.display='none';
        TabTitle[4].style.display='none';
        infoP.style.display='none';
      }
      else{
        TabTitle[2].style.display='none';
        infoE.style.display='none';
        TabTitle[3].style.display='';
        TabTitle[4].style.display='';
        infoP.style.display='';
      }
    }
    function SelectParentClient(){
        var arr=showModalDialog('Admin_SourceList.jsp?TypeSelect=ClientList','','dialogWidth:600px; dialogHeight:450px; help: no; scroll: yes; status: no');
        if (arr != null){
            var ss=arr.split('$$$');
            document.myform.Parenter.value=ss[0];
            document.myform.ParentID.value=ss[1];
        }
    }
    </script>
</head>
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>


<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
  <form name='searchmyform' action='Admin_User.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_User.jsp'>用户信息管理首页</a>&nbsp;|&nbsp;<a href='Admin_User.jsp?Action=Add'>添加用户信息</a><%=Action %>
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

recordCount = count.getRecordCount("tbUser",type);

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));



UserAction getUserList =new UserAction();
List UserList = new ArrayList();

UserList = getUserList.getUserListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_User.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='29'>选中</td>
              <td>登录用户名</td>
              <td width="435">联系地址</td>
              <td width="436">姓名</td>
			  <td>等级</td>
              <td width='168'>操作</td>
            </tr>
    

        <tr><td colspan='21' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个用户信息</td></tr>
  <%for (int i=0;i<UserList.size();i++) {
  UserVo vo = new UserVo();
  
  vo = (UserVo)UserList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <td width='29' align='center'>
                    <input name='UserID' type='checkbox' onClick="unselectall()" id='UserID' value='<%=vo.getId() %>'></td>
                    <td width='228'><a href='Admin_User.jsp'><%=vo.getUsername() %></a></td>
                    <td><a href='Admin_User.jsp'><%=vo.getAddress() %></a></td>
                  
                    <td><%=vo.getTruename() %></td>
					
					<td><%=vo.getGrade() %></td>
					
					
                    <td width='168' align='center'>
          
            <a href='Admin_User.jsp?Action=Modify&id=<%=vo.getId() %>&type=<%=type%>'>修改</a>&nbsp;
            <a href='Admin_User.jsp?Action=del&id=<%=vo.getId() %>' onClick='return confirm("确定要删除此用户信息吗？");'>删除</a>                    </td>
                  </tr>
<%} %>
          </table>
  
              <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='200'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有用户信息</td>
                  <td><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的用户信息吗？');">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                 
                </tr>
              </table>
              
              <a href=Admin_User.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>&type=<%=type%>>上一页</a>  共<%=pageView.getPageSize() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_User.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>&type=<%=type%>>下一页</a>
          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_User.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='113'><b>用户信息查询：</b></td>
        <td width="1198">
          姓名：<input name='Keyword' type='text' id='Keyword' size='20' maxlength='40'>
          <input type='submit' name='Submit' value='搜 索' id='Submit'>
           <input type='hidden' name='Action' value='Main' id='Action'>
         
        </td>
      </tr>
    </table>
    </form>

    
    <%} %>
<%if("Add".equals(Action)){%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_User.jsp'>用户信息管理</a>&nbsp;&gt;&gt;&nbsp;添加用户信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_User.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>用户名：</td>
                            <td width='38%'><input name='username' type='text' id='username' size='35' maxlength='200'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>密码：</td>
                          <td width='38%'><input name='password' type='text' id='password' size='35' maxlength='30' value=''>
                            <font color='#FF0000'>*</font></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>联系电话：</td>
                            <td width='38%'><input name='tel'  id='tel'  type='text' size='35' maxlength='30'></td>
                            <td class='tdbg5' align='right'  width='12%'>姓名：</td>
                            <td width='38%'><input name='name'  id='name'  type='text' size='35' maxlength='30'></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>email：</td>
                            <td width='38%'><input name='email'   id='email'  type='text' size='35' maxlength='255'></td>
                            <td class='tdbg5' align='right'  width='12%'>联系地址：</td>
                            <td width='38%'><input name='address'   id='address'  type='text' size='35' maxlength='255'></td>
                        </tr>
						
						
						   
						

                    </table>
    
                </td>
            </tr>
    </table>
	
	
    <table width='100%' height='40'><tr align='center'><td><input type='hidden' name='type' value='<%=type%>'>
        <input type='hidden' name='Action' value='SaveAdd'>
        <input type='submit' name='Submit' value='保存用户信息信息'>
    </td></tr></table>
    </form>

<% }%>
<%if("Modify".equals(Action)){
String id = request.getParameter("id");
UserAction getInfo = new UserAction();
UserVo vo = new UserVo();
vo = getInfo.getUserInfo(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_User.jsp'>用户信息管理</a>&nbsp;&gt;&gt;&nbsp;修改用户信息信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_User.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>用户名：</td>
                            <td width='38%'><input name='username' type='text' id='username' size='35' maxlength='200' value='<%=vo.getUsername() %>'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>密码：</td>
                          <td width='38%'><input name='password' type='text' id='password' size='35' maxlength='30' value='<%=vo.getPasswd() %>'>
                            <font color='#FF0000'>*</font></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>联系电话：</td>
                            <td width='38%'><input name='tel' id='tel' type='text' size='35' maxlength='30' value='<%=vo.getMobile() %>'></td>
                            <td class='tdbg5' align='right'  width='12%'>姓名：</td>
                            <td width='38%'><input name='name' id='name' type='text' size='35' maxlength='30' value='<%=vo.getTruename() %>'></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>email：</td>
                            <td width='38%'><input name='email' id='email' type='text' size='35' maxlength='255' value='<%=vo.getEmail() %>'></td>
                            <td class='tdbg5' align='right'  width='12%'>联系地址：</td>
                            <td width='38%'><input name='address' id='address' type='text' size='35' maxlength='255' value='<%=vo.getAddress() %>'></td>
                        </tr>
						
						<tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>用户等级：</td>
                            <td width='38%'><input name='grade' id='grade' type='text' size='35' maxlength='255' value='<%=vo.getGrade() %>'></td>
                            <td class='tdbg5' align='right'  width='12%'></td>
                            <td width='38%'></td>
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



	 String   username  = s.trimStr(request.getParameter("username"));
	 String   password  = s.trimStr(request.getParameter("password"));
     String   name = s.trimStr(request.getParameter("name"));
	 String   tel  = s.trimStr(request.getParameter("tel"));
	 String   email  = s.trimStr(request.getParameter("email"));

	 String   address  = s.trimStr(request.getParameter("address"));
	 String roleid  = s.trimStr(request.getParameter("roleid"));
	 //stype = s.trimStr(request.getParameter("type"));
	 
	 
	 UserVo vo = new UserVo();
	 UserAction tUserAction = new UserAction();
	 vo.setAddress(address);
 	 vo.setUsername(name);
	 vo.setEmail(email);

	 vo.setPasswd(password);

	 vo.setMobile(tel);
	 vo.setUsername(username);
    vo.setTruename(name);
	//vo.setRoleid(Integer.parseInt(roleid));
	 int status = tUserAction.insertUserInfoAction(vo);
	 response.sendRedirect("Admin_User.jsp?Action=Main");

}


if("SaveModify".equals(Action)){
    String id = request.getParameter("id");
	 String   username  = s.trimStr(request.getParameter("username"));
	 String   password  = s.trimStr(request.getParameter("password"));
     String   name = s.trimStr(request.getParameter("name"));
	 String   tel  = s.trimStr(request.getParameter("tel"));
	 String   email  = s.trimStr(request.getParameter("email"));

	 String   address  = s.trimStr(request.getParameter("address"));
	 String grade  = s.trimStr(request.getParameter("grade"));
	 UserVo vo = new UserVo();
	 UserAction tUserAction = new UserAction();
	 vo.setId(Integer.parseInt(id));
	 vo.setAddress(address);
 	 vo.setUsername(name);
	 vo.setEmail(email);
    vo.setTruename(name);
	 vo.setPasswd(password);
    vo.setGrade(grade);
	// vo.setRoleid(Integer.parseInt(roleid));
	 vo.setMobile(tel);
	 vo.setUsername(username);
	 int status = tUserAction.updateUserAction(vo);
	 
	 response.sendRedirect("Admin_User.jsp?Action=Main");

}

if("del".equals(Action)){
	UserAction tUserAction = new UserAction();
	String id = request.getParameter("id");
 	int status = tUserAction.delUserAction(Integer.parseInt(id));
response.sendRedirect("Admin_User.jsp?Action=Main");
}




if("DelAll".equals(Action)){

UserAction tUserAction = new UserAction();
String[] UserID= request.getParameterValues("UserID");//
tUserAction.delUserAction(UserID);
response.sendRedirect("Admin_User.jsp?Action=Main");
}
%>

