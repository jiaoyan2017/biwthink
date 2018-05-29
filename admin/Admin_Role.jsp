﻿<%@ page contentType="text/html; charset=UTF-8"%>
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

<html><head><title>角色管理<%=Action %></title>
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
        if(document.myform.roleName.value==''){
            alert('角色名称不能为空！');
            document.myform.roleName.focus();
            return false;
        }
        if(document.myform.summary.value==''){
            alert('角色内容不能为空！');
            document.myform.summary.focus();
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
  <form name='searchmyform' action='Admin_Role.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_Role.jsp'>角色管理首页</a>&nbsp;|&nbsp;<a href='Admin_Role.jsp?Action=Add'>添加角色</a><%=Action %>
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

recordCount = count.getRecordCount("tbRole",type);

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));



RoleAction getRoleList =new RoleAction();
List RoleList = new ArrayList();


RoleList = getRoleList.getRoleListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Role.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='29'>选中</td>
              <td>角色标题</td>
              <td width="592">角色内容</td>
              <td width='168'>操作</td>
            </tr>
    

        <tr><td colspan='20' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个角色</td></tr>
  <%for (int i=0;i<RoleList.size();i++) {
  RoleVo vo = new RoleVo();
  
  vo = (RoleVo)RoleList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <td width='29' align='center'>
                    <input name='RoleID' type='checkbox' onClick="unselectall()" id='RoleID' value='<%=vo.getId() %>'></td>
                    <td width='509'><a href='Admin_Role.jsp'><%=vo.getRolename() %></a></td>
                    <td><a href='Admin_Role.jsp'><%=vo.getRolename() %></a></td>
                  
                    <td width='168' align='center'>
          
            <a href='Admin_Role.jsp?Action=Modify&id=<%=vo.getId() %>&type=<%=type%>'>修改</a>&nbsp;
            <a href='Admin_Role.jsp?Action=del&id=<%=vo.getId() %>' onClick='return confirm("确定要删除此角色吗？");'>删除</a>                    </td>
                  </tr>
<%} %>
           
          </table>
  
              <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='200'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有角色</td>
                  <td><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的角色吗？');">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                 
                </tr>
              </table>
              
              <a href=Admin_Role.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>>上一页</a>  共<%=pageView.getPageSize() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_Role.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>>下一页</a>
          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_Role.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='113'><b>角色查询：</b></td>
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
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Role.jsp'>角色管理</a>&nbsp;&gt;&gt;&nbsp;添加角色</td></tr></table>
    <form name='myform' id='myform' action='Admin_Role.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>角色名称：</td>
                            <td><input name='roleName' type='text' id='roleName' size='35' maxlength='200' value=''> <font color='#FF0000'>*</font></td>
                        </tr>
  <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>权限：</td>
                            <td> 
							<%
							 
                  PrivateAction raction = new PrivateAction();
                  List<PrivateVo> rlist = raction.getPrivateListAction("",0,0);
				  for(int i=0;i<rlist.size();i++){ 
                  PrivateVo rvo =rlist.get(i);
                  %>
							<input name='PrivateID' type='checkbox'  id='PrivateID' value='<%=rvo.getPrivateId()%>'><%=rvo.getPrivatenName() %>
							<br>
							<%}%>
                              <font color='#FF0000'>*</font> </td>
                        </tr>
    
                    </table>
    
                </td>
            </tr>
    </table>
	
	
    <table width='100%' height='40'><tr align='center'><td><input type='hidden' name='type' value='<%=type%>'>
        <input type='hidden' name='Action' value='SaveAdd'>
        <input type='submit' name='Submit' value='保存角色信息'>
    </td></tr></table>
    </form>

<% }%>
<%if("Modify".equals(Action)){
String id = request.getParameter("id");
RoleAction getInfo = new RoleAction();
RoleVo vo = new RoleVo();
vo = getInfo.getRoleInfoAction(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Role.jsp'>角色管理</a>&nbsp;&gt;&gt;&nbsp;修改角色信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Role.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>角色名称：</td>
                            <td><input name='roleName'  id="roleName" type='text'  size='35' maxlength='200' value='<%=vo.getRolename() %>'> <font color='#FF0000'>*</font></td>
                        </tr>
  <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>内容：</td>
                            <td>
                            
							<%
						String PrivateId = vo.getPrivateid();
						String [] arrPrivateId = PrivateId.split(",")	 ;
                  PrivateAction raction = new PrivateAction();
                  List<PrivateVo> rlist = raction.getPrivateListAction("",0,0);
				  for(int i=0;i<rlist.size();i++){ 
                  	PrivateVo rvo =rlist.get(i);
                  		
                  %>
							<input name='PrivateID' type='checkbox'  id='PrivateID' value='<%=rvo.getPrivateId()%>' 
							<%
							for (int j=0;j<arrPrivateId.length;j++){
								if(Integer.parseInt(arrPrivateId[j])==rvo.getPrivateId())
									{out.print("checked");
									} 
							} %>
							><%=rvo.getPrivatenName() %>
							
						<%}%>
                              <font color='#FF0000'>*</font> </td>
                      </tr>
                    </table>

                </td>
            </tr>
    </table>
    <table width='100%' height='40'><tr align='center'><td>
        <input type='hidden' name='Action' value='SaveModify'>
        <input type='hidden' id="id" name='id' value='<%=vo.getId() %>'>
        <input type='hidden' name='type' value='<%=type%>'>
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

     String   roleName = s.trimStr(request.getParameter("roleName"));
  	// String   PrivateID  = s.trimStr(request.getParameter("PrivateID"));
	    
	String[]	 PrivateID= request.getParameterValues("PrivateID");//
	String privateid="";
	
for(int i=0;i<PrivateID.length;i++){
	if(i!=PrivateID.length-1){
		privateid = privateid+PrivateID[i]+",";
	}
	else{
		privateid = privateid+PrivateID[i];
	}
}
	 
	// out.print(privateid);
	 RoleVo vo = new RoleVo();
	 RoleAction tRoleAction = new RoleAction();
	 
	 vo.setRolename(roleName);
	 vo.setPrivateid(privateid);
	// vo.setSummary(summary);
	 
	int status = tRoleAction.insertRoleAction(vo);
 	 response.sendRedirect("Admin_Role.jsp?Action=Main");

}


if("SaveModify".equals(Action)){
    String id = request.getParameter("id");
    String   roleName = s.trimStr(request.getParameter("roleName"));

    System.out.print(id);  
	String[]	 PrivateID= request.getParameterValues("PrivateID");//
	String privateid="";
	
for(int i=0;i<PrivateID.length;i++){
	if(i!=PrivateID.length-1){
		privateid = privateid+PrivateID[i]+",";
	}
	else{
		privateid = privateid+PrivateID[i];
	}
}
	 
	 RoleVo vo = new RoleVo();
	 RoleAction tRoleAction = new RoleAction();
	 
	 vo.setRolename(roleName);
	 vo.setPrivateid(privateid);
	 vo.setId(Integer.parseInt(id));
	// vo.setSummary(summary);


	 int status = tRoleAction.updateRoleAction(vo);
	 response.sendRedirect("Admin_Role.jsp?Action=Main");
}

if("del".equals(Action)){
	RoleAction tRoleAction = new RoleAction();
	String id = request.getParameter("id");
 	int status = tRoleAction.delRoleAction(Integer.parseInt(id));
 	response.sendRedirect("Admin_Role.jsp?Action=Main");

}




if("DelAll".equals(Action)){
RoleAction tRoleAction = new RoleAction();
String[] RoleID= request.getParameterValues("RoleID");//
//int status = tRoleAction.delRoleAction(RoleID);
response.sendRedirect("Admin_Role.jsp?Action=Main");
}
%>

