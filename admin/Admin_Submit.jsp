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

<html><head><title>线下团购信息管理<%=Action %></title>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<link href='Admin_STYLE.CSS' rel='stylesheet' type='text/css'>
</head>
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>


<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
  <form name='searchmyform' action='Admin_Submit.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_Submit.jsp'>线下团购信息管理首页</a>&nbsp;|&nbsp;<a href='Admin_Submit.jsp?Action=Add'>添加线下团购信息</a><%=Action %>
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

recordCount = count.getRecordCount("tbSubmit",type);

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));



SubmitAction getSubmitList =new SubmitAction();
List SubmitList = new ArrayList();

SubmitList = getSubmitList.getSubmitListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Submit.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='28'>选中</td>
              <td>报名人</td> <td width="120">电话</td>
              <td width="577">联系地址</td>
              <td width='149'>操作</td>
            </tr>
    

        <tr><td colspan='20' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个线下团购信息</td></tr>
  <%for (int i=0;i<SubmitList.size();i++) {
  SubmitVo vo = new SubmitVo();
  
  vo = (SubmitVo)SubmitList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <td width='28' align='center'>
                    <input name='SubmitID' type='checkbox' onClick="unselectall()" id='SubmitID' value='<%=vo.getId() %>'></td>
                    <td width='418'><a href='Admin_Submit.jsp'><%=vo.getUsername() %></a></td> <td><a href='Admin_Submit.jsp'><%=vo.getTel() %></a></td>
                    <td><a href='Admin_Submit.jsp'><%=vo.getAddress() %></a></td>
                  
                    <td width='149' align='center'>
          
            <a href='Admin_Submit.jsp?Action=Modify&id=<%=vo.getId() %>&type=<%=type%>'>查看</a>&nbsp;
            <a href='Admin_Submit.jsp?Action=del&id=<%=vo.getId() %>' onClick='return confirm("确定要删除此线下团购信息吗？");'>删除</a>                    </td>
                  </tr>
<%} %>
           
          </table>
  
              <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='200'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有线下团购信息</td>
                  <td><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的线下团购信息吗？');">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                 
                </tr>
              </table>
              
              <a href=Admin_Submit.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>&type=<%=type%>>上一页</a>  共<%=pageView.getPageSize() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_Submit.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>&type=<%=type%>>下一页</a>
          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_Submit.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='113'><b>线下团购信息查询：</b></td>
        <td width="1198">
          姓名：<input name='Keyword' type='text' id='Keyword' size='20' maxlength='40'>
          <input type='submit' name='Submit' value='搜 索' id='Submit'>
           <input type='hidden' name='Action' value='Main' id='Action'>
         
        </td>
      </tr>
    </table>
    </form>

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
        if(document.myform.Submit.value==''){
            alert('线下团购信息名称不能为空！');
            document.myform.Submit.focus();
            return false;
        }
        if(document.myform.tel.value==''){
            alert('助记名称不能为空！');
            document.myform.tel.focus();
            return false;
        }
        document.myform.Country.value=frm1.document.regionform.Country.value;
        document.myform.Province.value=frm1.document.regionform.Province.value;
        document.myform.City.value=frm1.document.regionform.City.value;
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
    
    <%} %>
<%if("Add".equals(Action)){%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Submit.jsp'>线下团购信息管理</a>&nbsp;&gt;&gt;&nbsp;添加线下团购信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Submit.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>线下团购名：</td>
                            <td width='38%'><input name='Submit' type='text' id='Submit' size='35' maxlength='200'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>密码：</td>
                            <td width='38%'><input name='person' type='text' id='person' size='35' maxlength='30' value=''></td>
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
        <input type='submit' name='Submit' value='保存线下团购信息信息'>
    </td></tr></table>
    </form>

<% }%>
<%if("Modify".equals(Action)){
String id = request.getParameter("id");
SubmitAction getInfo = new SubmitAction();
SubmitVo vo = new SubmitVo();
vo = getInfo.getSubmitInfoAction(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Submit.jsp'>线下团购信息管理</a>&nbsp;&gt;&gt;&nbsp;查看线下团购信息信息</td></tr></table>
    
      <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
        <tr class='tdbg'>
          <td height='100' valign='top'><table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
              <tr class='tdbg'>
                <td class='tdbg5' align='right'  width='12%'>线下团购报名人：</td>
                <td width='38%'><%=vo.getUsername() %></td>
                <td class='tdbg5' align='right'  width='12%'>产品：</td>
                <td width='38%'><%=vo.getRegistrationName() %></td>
              </tr>
              <tr class='tdbg'>
                <td class='tdbg5' align='right'  width='12%'>联系电话：</td>
                <td width='38%'><%=vo.getTel() %></td>
                <td class='tdbg5' align='right'  width='12%'>联系地址：</td>
                <td width='38%'><%=vo.getAddress() %></td>
              </tr>
              <tr class='tdbg'>
                <td class='tdbg5' align='right'  width='12%'>email：</td>
                <td width='38%'><%=vo.getEmail() %></td>
                <td class='tdbg5' align='right'  width='12%'>提交时间：</td>
                <td width='38%'><%=vo.getDatetime() %></td>
              </tr>

              <tr class='tdbg'>
                <td class='tdbg5' align='right'  width='12%'>ip：</td>
                <td width='38%'><%=vo.getIp() %></td>
                <td class='tdbg5' align='right'  width='12%'>&nbsp;</td>
                <td width='38%'>&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      </table>
      <table width='100%' height='40'><tr align='center'><td>

    </td></tr></table>
    
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
	 //stype = s.trimStr(request.getParameter("type"));
	 
	 
	 SubmitVo vo = new SubmitVo();
	 SubmitAction tSubmitAction = new SubmitAction();
	 vo.setAddress(address);
	 vo.setEmail(email);
	 vo.setTel(tel);
	 vo.setUsername(username);

	 int status = tSubmitAction.insertSubmitAction(vo);
	 

}


if("SaveModify".equals(Action)){
    String id = request.getParameter("id");
	 String   username  = s.trimStr(request.getParameter("username"));
     String   registrationid  = s.trimStr(request.getParameter("registrationid"));
	 String   tel  = s.trimStr(request.getParameter("tel"));
	 String   email  = s.trimStr(request.getParameter("email"));
	 String   address  = s.trimStr(request.getParameter("address"));
	 
	 SubmitVo vo = new SubmitVo();
	 SubmitAction tSubmitAction = new SubmitAction();
	 vo.setId(Integer.parseInt(id));
	 vo.setAddress(address);
     vo.setRegistrationId(Integer.parseInt(registrationid));
	 vo.setEmail(email);



	 vo.setTel(tel);
	 vo.setUsername(username);
	 int status = tSubmitAction.updateSubmitAction(vo);

}

if("del".equals(Action)){
	SubmitAction tSubmitAction = new SubmitAction();
	String id = request.getParameter("id");
 	int status = tSubmitAction.delSubmitAction(Integer.parseInt(id));

}




if("DelAll".equals(Action)){
//String  =  request.getParameter("SubmitID");

String[] SubmitID= request.getParameterValues("SubmitID");//


for(int i=0;i<SubmitID.length;i++){
	out.print(SubmitID[i]);

}
	//SubmitAction tSubmitAction = new SubmitAction();
	//String id = request.getParameter("id");
 	//int status = tSubmitAction.delCompnayAction(Integer.parseInt(id));

}
%>

