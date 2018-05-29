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

<html><head><title>模板信息管理<%=Action %></title>
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
        if(document.myform.name.value==''){
            alert('名称不能为空！');
            document.myform.name.focus();
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
  <form name='searchmyform' action='Admin_Init.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_Init.jsp'>模板信息管理首页</a>&nbsp;|&nbsp;<a href='Admin_Init.jsp?Action=Add'>添加模板信息</a>
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

recordCount = count.getRecordCount("tbInit","");

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));



InitAction getInitList =new InitAction();
List InitList = new ArrayList();


InitList = getInitList.getInitListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Init.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='29'>选中</td>
              <td>名称</td>
              <td width="592">简介</td>
              <td width='168'>操作</td>
            </tr>
    

        <tr><td colspan='20' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个模板信息</td></tr>
  <%for (int i=0;i<InitList.size();i++) {
  InitVo vo = new InitVo();
  
  vo = (InitVo)InitList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <td width='29' align='center'>
                    <input name='InitID' type='checkbox' onClick="unselectall()" id='InitID' value='<%=vo.getId() %>'></td>
                    <td width='509'><a href='Admin_Init.jsp'><%=vo.getName() %></a></td>
                    <td><a href='Admin_Init.jsp'><%=vo.getTitle() %></a></td>
                  
                    <td width='168' align='center'>
          
            <a href='Admin_Init.jsp?Action=Modify&id=<%=vo.getId() %>&type=<%=type%>'>修改</a>&nbsp;
            <a href='Admin_Init.jsp?Action=del&id=<%=vo.getId() %>' onClick='return confirm("确定要删除此模板信息吗？");'>删除</a>                    </td>
                  </tr>
<%} %>
           
          </table>
  
              <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='200'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有模板信息</td>
                  <td><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的模板信息吗？');">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                 
                </tr>
              </table>
              
              <a href=Admin_Init.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>&Keyword=<%=Keyword%>>上一页</a>  共<%=pageView.getPageSize() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_Init.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>&Keyword=<%=Keyword%>>下一页</a>
          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_Init.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='113'><b>模板信息查询：</b></td>
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
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Init.jsp'>模板信息管理</a>&nbsp;&gt;&gt;&nbsp;添加模板信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Init.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>名称：</td>
                            <td width='38%'><input name='name' type='text' id='name' size='35' maxlength='200'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>路径：</td>
                            <td width='38%'><input name='path' type='text' id='path' size='35' maxlength='30' value=''></td>
                        </tr>
						                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>标题：</td>
                            <td width='38%'><input name='title' type='text' id='title' size='35' maxlength='200'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>公司名称：</td>
                            <td width='38%'><input name='company' type='text' id='company' size='35' maxlength='30' value=''></td>
                        </tr>
						     <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>是否使用：</td>
                            <td width='38%'><label>
                              <input name="isselect" type="radio" checked value="1" >
                              使用<input type="radio" name="isselect"  value="0">
                              不使用</label>
                              <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>&nbsp;</td>
                            <td width='38%'>&nbsp;</td>
						     </tr>
                    </table>
    
                </td>
            </tr>
    </table>
	
	
    <table width='100%' height='40'><tr align='center'><td><input type='hidden' name='type' value='<%=type%>'>
        <input type='hidden' name='Action' value='SaveAdd'>
        <input type='submit' name='Submit' value='保存模板信息信息'>
    </td></tr></table>
    </form>

<% }%>
<%if("Modify".equals(Action)){
String id = request.getParameter("id");
InitAction getInfo = new InitAction();
InitVo vo = new InitVo();
vo = getInfo.getInitInfoAction(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Init.jsp'>模板信息管理</a>&nbsp;&gt;&gt;&nbsp;修改模板信息信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Init.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>模板信息名称：</td>
                            <td width='38%'><input name='name' type='text' id='name' size='35' maxlength='200' value='<%=vo.getName() %>'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>路径：</td>
                            <td width='38%'><input name='path' type='text' id='path' size='35' maxlength='30' value='<%=vo.getPath() %>'></td>
                        </tr>
						
						     <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>标题：</td>
                            <td width='38%'><input name='title' type='text' id='title' size='35' maxlength='200'  value='<%=vo.getTitle() %>'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>公司名称：</td>
                            <td width='38%'><input name='company' type='text' id='company' size='35' maxlength='30' value='<%=vo.getCompany()%>'></td>
                        </tr>
											     <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>是否使用：</td>
                            <td width='38%'><label>
                              <input name="isselect" type="radio" 
                              <%
                              if(vo.getIsSelect()==1){
                              	out.print("checked");
                              }
                              %>  value="<%=vo.getIsSelect()%>" >
                              使用<input type="radio" name="isselect" <%if(vo.getIsSelect()!=1) out.print("checked");%> value="<%=vo.getIsSelect()%>">
                              不使用</label>
                              <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>&nbsp;</td>
                            <td width='38%'>&nbsp;</td>
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

     String   name = s.trimStr(request.getParameter("name"));
  	 String   path  = s.trimStr(request.getParameter("path"));
 String   title  = s.trimStr(request.getParameter("title"));
	    
String company = s.trimStr(request.getParameter("company"));

String isselect   = s.trimStr(request.getParameter("isselect"));

out.print("isselect=" + isselect);
	 
	 InitVo vo = new InitVo();
	 InitAction tInitAction = new InitAction();
	 
	 vo.setName(name);

	 vo.setCompany(company);
vo.setPath(path);
vo.setTitle(title);
vo.setIsSelect(Integer.parseInt(isselect));
	 
	 int status = tInitAction.insertInitAction(vo);
	 response.sendRedirect("Admin_Init.jsp?Action=Main");

}


if("SaveModify".equals(Action)){
    String id = request.getParameter("id");

     String   name = s.trimStr(request.getParameter("name"));
  	 String   path  = s.trimStr(request.getParameter("path"));
 String   title  = s.trimStr(request.getParameter("title"));
	    
String company = s.trimStr(request.getParameter("company"));

String isselect   = s.trimStr(request.getParameter("isselect"));
	 
	 InitVo vo = new InitVo();
	 InitAction tInitAction = new InitAction();
	 vo.setId(Integer.parseInt(id));
	 
	 vo.setName(name);

	 vo.setCompany(company);
vo.setPath(path);
vo.setTitle(title);
vo.setIsSelect(Integer.parseInt(isselect));

	 int status = tInitAction.updateInitAction(vo);
	 response.sendRedirect("Admin_Init.jsp?Action=Main");
}

if("del".equals(Action)){
	InitAction tInitAction = new InitAction();
	String id = request.getParameter("id");
 	int status = tInitAction.delInitAction(Integer.parseInt(id));
	response.sendRedirect("Admin_Init.jsp?Action=Main");
}




if("DelAll".equals(Action)){

 InitAction tInitAction = new InitAction();
String[] InitID= request.getParameterValues("InitID");//


tInitAction.delInitAction(InitID);
response.sendRedirect("Admin_Init.jsp?Action=Main");



}
%>

