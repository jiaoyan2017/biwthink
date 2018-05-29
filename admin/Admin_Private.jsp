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

<html><head><title>权限管理<%=Action %></title>
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
        if(document.myform.title.value==''){
            alert('权限名称不能为空！');
            document.myform.title.focus();
            return false;
        }
        if(document.myform.summary.value==''){
            alert('权限内容不能为空！');
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
  <form name='searchmyform' action='Admin_Private.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_Private.jsp'>权限管理首页</a>&nbsp;|&nbsp;<a href='Admin_Private.jsp?Action=Add'>添加权限</a><%=Action %>
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

recordCount = count.getRecordCount("tbPrivate",type);

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));



PrivateAction getPrivateList =new PrivateAction();
List PrivateList = new ArrayList();


PrivateList = getPrivateList.getPrivateListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Private.jsp'>
          <td><table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='29'>选中</td>
              <td>权限</td>
              <td width="592">路径</td>
              <td width='168'>操作</td>
            </tr>
            <tr>
              <td colspan='20' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个权限</td>
            </tr>
            <%for (int i=0;i<PrivateList.size();i++) {
  PrivateVo vo = new PrivateVo();
  
  vo = (PrivateVo)PrivateList.get(i);
  %>
            <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
              <td width='29' align='center'><input name='PrivateID' type='checkbox' onClick="unselectall()" id='PrivateID' value='<%=vo.getPrivateId() %>'></td>
              <td width='509'><a href='Admin_Private.jsp'><%=vo.getPrivatenName() %></a></td>
              <td><a href='Admin_Private.jsp'><%=vo.getUrl() %></a></td>
              <td width='168' align='center'><a href='Admin_Private.jsp?Action=Modify&id=<%=vo.getPrivateId() %>&type=<%=type%>'>修改</a>&nbsp; <a href='Admin_Private.jsp?Action=del&id=<%=vo.getPrivateId() %>' onClick='return confirm("确定要删除此权限吗？");'>删除</a> </td>
            </tr>
            <%} %>
          </table>
            <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='200'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有权限</td>
                  <td><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的权限吗？');">
&nbsp;&nbsp;&nbsp;&nbsp;                </tr>
            </table>
              
              <a href=Admin_Private.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>>上一页</a>  共<%=pageView.getPageSize() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_Private.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>>下一页</a>
        </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_Private.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='113'><b>权限查询：</b></td>
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
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Private.jsp'>权限管理</a>&nbsp;&gt;&gt;&nbsp;添加权限</td></tr></table>
    <form name='myform' id='myform' action='Admin_Private.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>权限名称：</td>
                            <td><input name='Privatename' type='text' id='Privatename' size='35' maxlength='200' value=''> <font color='#FF0000'>*</font></td>
                        </tr>
  <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>URL：</td>
                            <td><input name='url' type='text' id='url' size='35' maxlength='200' value=''>
                              <font color='#FF0000'>*</font> </td>
                        </tr>
    
                    </table>
    
                </td>
            </tr>
    </table>
	
	
    <table width='100%' height='40'><tr align='center'><td><input type='hidden' name='type' value='<%=type%>'>
        <input type='hidden' name='Action' value='SaveAdd'>
        <input type='submit' name='Submit' value='保存权限信息'>
    </td></tr></table>
    </form>

<% }%>
<%if("Modify".equals(Action)){
String id = request.getParameter("id");
PrivateAction getInfo = new PrivateAction();
PrivateVo vo = new PrivateVo();
vo = getInfo.getPrivateInfoAction(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Private.jsp'>权限管理</a>&nbsp;&gt;&gt;&nbsp;修改权限信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Private.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>权限名称：</td>
                            <td><input name='Privatename' type='text' id='Privatename' size='35' maxlength='200' value='<%=vo.getPrivatenName() %>'> <font color='#FF0000'>*</font></td>
                        </tr>
  <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>URL：</td>
                            <td><input name='url' type='text' id='url' size='35' maxlength='200' value='<%=vo.getUrl() %>'>
                              <font color='#FF0000'>*</font> </td>
                      </tr>
                    </table>

                </td>
            </tr>
    </table>
    <table width='100%' height='40'><tr align='center'><td>
        <input type='hidden' name='Action' value='SaveModify'><input type='hidden' name='id' value='<%=vo.getPrivateId() %>'><input type='hidden' name='type' value='<%=type%>'>
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

     String   Privatename = s.trimStr(request.getParameter("Privatename"));
  	 String    url  = s.trimStr(request.getParameter("url"));
	    


	 
	 
	 PrivateVo vo = new PrivateVo();
	 PrivateAction tPrivateAction = new PrivateAction();
	 
	 vo.setPrivatenName(Privatename);

	 vo.setUrl(url);
	 
	 int status = tPrivateAction.insertPrivateAction(vo);
	 	 response.sendRedirect("Admin_Private.jsp?Action=Main");

}


if("SaveModify".equals(Action)){
    String id = request.getParameter("id");
     String   Privatename = s.trimStr(request.getParameter("Privatename"));
  	 String    url  = s.trimStr(request.getParameter("url"));

	 
	 PrivateVo vo = new PrivateVo();
	 PrivateAction tPrivateAction = new PrivateAction();
	 
	 vo.setPrivateId(Integer.parseInt(id));
	 
	 vo.setPrivatenName(Privatename);

	 vo.setUrl(url);


	 int status = tPrivateAction.updatePrivateAction(vo);
	 response.sendRedirect("Admin_Private.jsp?Action=Main");
}

if("del".equals(Action)){
	PrivateAction tPrivateAction = new PrivateAction();
	String id = request.getParameter("id");
 	int status = tPrivateAction.delPrivateAction(Integer.parseInt(id));
 	response.sendRedirect("Admin_Private.jsp?Action=Main");

}




if("DelAll".equals(Action)){
PrivateAction tPrivateAction = new PrivateAction();
String[] PrivateID= request.getParameterValues("PrivateID");//
int status = tPrivateAction.delPrivateAction(PrivateID);

response.sendRedirect("Admin_Private.jsp?Action=Main");
}
%>

