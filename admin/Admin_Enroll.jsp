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
        if(document.myform.Enrollname.value==''){
            alert('用户名不能为空！');
            document.myform.Enrollname.focus();
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
  <form name='searchmyform' action='Admin_Enroll.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_Enroll.jsp'>用户信息管理首页</a>&nbsp;|&nbsp;<a href='Admin_Enroll.jsp?Action=Add'>添加用户信息</a><%=Action %>
    </td>
  </tr>
  </form>
</table>

<%if("Main".equals(Action)){

String Keyword = "";
Keyword = request.getParameter("Keyword");
if(Keyword==null) Keyword = "";

String pages = "0";
pages = request.getParameter("pages");
if(pages==null) pages = "0";
int recordCount = 0;

PublicDao count = new PublicDao();

recordCount = count.getRecordCount("tbenroll",type);

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));



EnrollAction getEnrollList =new EnrollAction();
List EnrollList = new ArrayList();

EnrollList = getEnrollList.getEnrollListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Enroll.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='27'>选中</td>
              <td>姓名</td>
              <td width="365">性别</td>
              <td width="240">电话</td>
			  <td width="235">课程</td>  <td width="235">是否付款</td>
              <td width='134'>操作</td>
            </tr>
    

        <tr><td colspan='21' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个用户信息</td></tr>
  <%for (int i=0;i<EnrollList.size();i++) {
  EnrollVo vo = new EnrollVo();
  
  vo = (EnrollVo)EnrollList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <td width='27' align='center'>
                    <input name='EnrollID' type='checkbox' onClick="unselectall()" id='EnrollID' value='<%=vo.getId() %>'></td>
                    <td width='200'><a href='Admin_Enroll.jsp'><%=vo.getName() %></a></td>
                    <td>
                        <%
                            if(vo.getSex()==1){
                        %>
                        男
                        <%
                        }
                        else{
                        %>
                        女
                        <%
                            }
                        %>

                   </td>
                  
                    <td><%=vo.getTel() %></td>
					
					<td><%=vo.getClasses() %></td>
					<td><%
                        if(vo.getPaystatus()==1){
                        %>
                        已付款
                        <%
                    }
                    else{
                        %>
                        未付款
                        <%
                    }
                    %></td>
					
                    <td width='134' align='center'>
          
            <a href='Admin_Enroll.jsp?Action=Modify&id=<%=vo.getId() %>&type=<%=type%>'>修改</a>&nbsp;
            <a href='Admin_Enroll.jsp?Action=del&id=<%=vo.getId() %>' onClick='return confirm("确定要删除此用户信息吗？");'>删除</a>                    </td>
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
              
              <a href=Admin_Enroll.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>&type=<%=type%>>上一页</a>  共<%=pageView.getPageSize() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_Enroll.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>&type=<%=type%>>下一页</a>
          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_Enroll.jsp' method='post'>
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
<%if("Add".equals(Action)){ %>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Enroll.jsp'>用户信息管理</a>&nbsp;&gt;&gt;&nbsp;添加用户信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Enroll.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>姓名：</td>
                            <td width='38%'><input name='name' type='text' id='name' size='35' maxlength='200'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>性别：</td>
                            <td width='38%'>

                                <input name="sex" id="sex" type="radio"   value="1">男
                                <input name="sex" id="sex" type="radio"  value="0">女
                            <font color='#FF0000'>*</font></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>联系电话：</td>
                            <td width='38%'><input name='tel'  id='tel'  type='text' size='35' maxlength='30'></td>
                            <td class='tdbg5' align='right'  width='12%'>课程：</td>
                            <td width='38%'><!--<input name='classes'  id='classes'  type='text' size='35' maxlength='30'>-->
							<select name="classes" id="classes">
							<option value="初级精品咖啡达人兴趣班">初级精品咖啡达人兴趣班</option>
							<option value="中级精品咖啡鸡尾酒西点综合班">中级精品咖啡鸡尾酒西点综合班</option>
							<option value="精品咖啡高级务实技术班">精品咖啡高级务实技术班</option>
							<option value="咖啡馆高级技术专业实战全能班">咖啡馆高级技术专业实战全能班</option>
							<option value="咖啡馆高级技术+创业辅导班">咖啡馆高级技术+创业辅导班</option>
							<option value="西点烘焙课程A">西点烘焙课程A</option>
							<option value="西点烘焙课程B">西点烘焙课程B</option>
							<option value="鸡尾酒系统班">鸡尾酒系统班</option>
							</select>
							
							







							
							</td>
                        </tr>
						
						<tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>是否付款：</td>
                            <td width='38%'>
							<input name="paystatus" type="radio" value="1">已付款
							<input name="paystatus" type="radio" value="0">未付款
							</td>
                            <td class='tdbg5' align='right'  width='12%'></td>
                            <td width='38%'></td>
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
EnrollAction getInfo = new EnrollAction();
EnrollVo vo = new EnrollVo();
vo = getInfo.getEnrollInfo(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Enroll.jsp'>用户信息管理</a>&nbsp;&gt;&gt;&nbsp;修改用户信息信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Enroll.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>姓名：</td>
                            <td width='38%'><input name='name' type='text' id='name' size='35' maxlength='200' value='<%=vo.getName() %>'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>性别：</td>
                            <td width='38%'>

                                <input name="sex" id="sex" type="radio" <%if (vo.getSex()==1) out.print("checked"); %>  value="1">男
                                <input name="sex" id="sex" type="radio" <%if (vo.getSex()==0) out.print("checked"); %>  value="0">女

                            <font color='#FF0000'>*</font></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>联系电话：</td>
                            <td width='38%'><input name='tel' id='tel' type='text' size='35' maxlength='30' value='<%=vo.getTel() %>'></td>
                            <td class='tdbg5' align='right'  width='12%'>课程：</td>
                            <td width='38%'>
							
							
							<select name="classes" id="classes">
							<option value="<%=vo.getClasses() %>" selected="selected"><%=vo.getClasses() %></option>
							<option value="初级精品咖啡达人兴趣班">初级精品咖啡达人兴趣班</option>
							<option value="中级精品咖啡鸡尾酒西点综合班">中级精品咖啡鸡尾酒西点综合班</option>
							<option value="精品咖啡高级务实技术班">精品咖啡高级务实技术班</option>
							<option value="咖啡馆高级技术专业实战全能班">咖啡馆高级技术专业实战全能班</option>
							<option value="咖啡馆高级技术+创业辅导班">咖啡馆高级技术+创业辅导班</option>
							<option value="西点烘焙课程A">西点烘焙课程A</option>
							<option value="西点烘焙课程B">西点烘焙课程B</option>
							<option value="鸡尾酒系统班">鸡尾酒系统班</option>
							</select>
							
							<input name='classes' id='classes' type='text' size='35' maxlength='30' value='<%=vo.getClasses() %>'></td>
                        </tr>
    
                     <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>是否付款：</td>
                            <td width='38%'>
							<input name="paystatus" type="radio" <%if (vo.getPaystatus()==1) out.print("checked"); %>  value="1">已付款
							<input name="paystatus" type="radio" <%if (vo.getPaystatus()==0) out.print("checked"); %>  value="0">未付款
							</td>
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




     String   name = s.trimStr(request.getParameter("name"));
	 String   tel  = s.trimStr(request.getParameter("tel"));
	 String   sex  = s.trimStr(request.getParameter("sex"));
    String   paystatus  = s.trimStr(request.getParameter("paystatus"));
    String   classes  = s.trimStr(request.getParameter("classes"));

	 EnrollVo vo = new EnrollVo();
	 EnrollAction tEnrollAction = new EnrollAction();
	 vo.setTel(tel);
 	 vo.setName(name);
	 vo.setClasses(classes);

	 vo.setSex(Integer.parseInt(sex));

	 vo.setPaystatus(Integer.parseInt(paystatus));


	 int status = tEnrollAction.insertEnrollInfoAction(vo);
	 response.sendRedirect("Admin_Enroll.jsp?Action=Main");

}


if("SaveModify".equals(Action)){
    String id = request.getParameter("id");
    String   name = s.trimStr(request.getParameter("name"));
    String   tel  = s.trimStr(request.getParameter("tel"));
    String   sex  = s.trimStr(request.getParameter("sex"));
    String   paystatus  = s.trimStr(request.getParameter("paystatus"));
    String   classes  = s.trimStr(request.getParameter("classes"));

    EnrollVo vo = new EnrollVo();
    EnrollAction tEnrollAction = new EnrollAction();
    vo.setTel(tel);
    vo.setName(name);
    vo.setClasses(classes);

    vo.setSex(Integer.parseInt(sex));

    vo.setPaystatus(Integer.parseInt(paystatus));
    vo.setId(Integer.parseInt(id));
	 int status = tEnrollAction.updateEnrollAction(vo);
	 
	 response.sendRedirect("Admin_Enroll.jsp?Action=Main");

}

if("del".equals(Action)){
	EnrollAction tEnrollAction = new EnrollAction();
	String id = request.getParameter("id");
 	int status = tEnrollAction.delEnrollAction(Integer.parseInt(id));
response.sendRedirect("Admin_Enroll.jsp?Action=Main");
}




if("DelAll".equals(Action)){

EnrollAction tEnrollAction = new EnrollAction();
String[] EnrollID= request.getParameterValues("EnrollID");//
tEnrollAction.delEnrollAction(EnrollID);
response.sendRedirect("Admin_Enroll.jsp?Action=Main");
}
%>

