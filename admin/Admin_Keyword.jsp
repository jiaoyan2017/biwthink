<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page  import="java.util.*"%>
<%@ page import="com.yi.Action.*" %>
<%@ page import="com.yi.vo.*" %>

<%@page import="com.yi.util.PageBean"%>
<%@page import="com.yi.Dao.PublicDao"%>
<%@page import="com.yi.util.StringUtils;"%>

<%
request.setCharacterEncoding("UTF-8");
//String type = request.getParameter("type");
String Action = request.getParameter("Action");
%>

<html><head><title>关键词信息管理<%=Action %></title>
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
  <form name='searchmyform' action='Admin_Keyword.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_Keyword.jsp'>关键词信息管理首页</a>&nbsp;|&nbsp;<a href='Admin_Keyword.jsp?Action=Add'>添加关键词信息</a>
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

recordCount = count.getRecordCount("tbKeyword","");

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));



KeywordAction getKeywordList =new KeywordAction();
List KeywordList = new ArrayList();


KeywordList = getKeywordList.getKeywordListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Keyword.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='29'>选中</td>
              <td>名称</td>
              <td width="592">简介</td>
			   <td width="592">类别</td>
              <td width='168'>操作</td>
            </tr>
    

        <tr><td colspan='20' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个关键词信息</td></tr>
  <%for (int i=0;i<KeywordList.size();i++) {
  KeywordVo vo = new KeywordVo();
  
  vo = (KeywordVo)KeywordList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <td width='29' align='center'>
                    <input name='KeywordID' type='checkbox' onClick="unselectall()" id='KeywordID' value='<%=vo.getId() %>'></td>
                    <td width='509'><a href='Admin_Keyword.jsp'><%=vo.getName() %></a></td>
                    <td><a href='Admin_Keyword.jsp'><%=vo.getSummary() %></a></td>
                   <td><%if("1".equals(vo.getType())){ %>建材类<%}else{%>团购类<%} %></td>
                    <td width='168' align='center'>
          
            <a href='Admin_Keyword.jsp?Action=Modify&id=<%=vo.getId() %>'>修改</a>&nbsp;
            <a href='Admin_Keyword.jsp?Action=del&id=<%=vo.getId() %>' onClick='return confirm("确定要删除此关键词信息吗？");'>删除</a>                    </td>
                  </tr>
<%} %>
           
          </table>
  
              <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='200'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有关键词信息</td>
                  <td><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的关键词信息吗？');">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                 
                </tr>
              </table>
              
              <a href=Admin_Keyword.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>>上一页</a>  共<%=pageView.getPageSize() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_Keyword.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>>下一页</a>
          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_Keyword.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='113'><b>关键词信息查询：</b></td>
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
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Keyword.jsp'>关键词信息管理</a>&nbsp;&gt;&gt;&nbsp;添加关键词信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Keyword.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>关键词：</td>
                            <td width='38%'><input name='name' type='text' id='name' size='35' maxlength='200'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>简介：</td>
                            <td width='38%'><input name='summary' type='text' id='summary' size='35' maxlength='30' value=''></td>
                        </tr>
						
						   <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>类别：</td>
                            <td width='38%'><label>
                              <select name="type" id="type">
							  <option value="1" selected>建材类关键词</option>
							   <option value="2">团购类键词</option>
                              </select>
                             </label>                              <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'></td>
                            <td width='38%'></td>
                        </tr>
                    </table>
    
                </td>
            </tr>
    </table>
	
	
    <table width='100%' height='40'><tr align='center'><td>
        <input type='hidden' name='Action' value='SaveAdd'>
        <input type='submit' name='Submit' value='保存关键词信息信息'>
    </td></tr></table>
    </form>

<% }%>
<%if("Modify".equals(Action)){
String id = request.getParameter("id");
KeywordAction getInfo = new KeywordAction();
KeywordVo vo = new KeywordVo();
vo = getInfo.getKeywordInfoAction(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Keyword.jsp'>关键词信息管理</a>&nbsp;&gt;&gt;&nbsp;修改关键词信息信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Keyword.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>关键词信息名称：</td>
                            <td width='38%'><input name='name' type='text' id='name' size='35' maxlength='200' value='<%=vo.getName() %>'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>简介：</td>
                            <td width='38%'><input name='summary' type='text' id='summary' size='35' maxlength='30' value='<%=vo.getSummary() %>'></td>
                        </tr>
						
						  <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>类别：</td>
                            <td width='38%'><label>
                              <select name="type" id="type">
							  <%if("1".equals(vo.getType())){%>
							  <option value="1" selected>建材类关键词</option>
							  <%}else{%>
							   <option value="2" selected>团购类键词</option>
							  <%}%>
							   <option value="1">建材类关键词</option>
							   <option value="2">团购类键词</option>
                              </select>
                             </label>                              <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'></td>
                            <td width='38%'></td>
                        </tr>
                    </table>

                </td>
            </tr>
    </table>
    <table width='100%' height='40'><tr align='center'><td>
        <input type='hidden' name='Action' value='SaveModify'><input type='hidden' name='id' value='<%=vo.getId() %>'>
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
  	 String   summary  = s.trimStr(request.getParameter("summary"));
	String    type  = s.trimStr(request.getParameter("type"));
	    


	 
	 
	 KeywordVo vo = new KeywordVo();
	 KeywordAction tKeywordAction = new KeywordAction();
	 
	 vo.setName(name);

	 vo.setSummary(summary);
	vo.setType(type);
	 
	 int status = tKeywordAction.insertKeywordAction(vo);
	 	 response.sendRedirect("Admin_Keyword.jsp?Action=Main");

}


if("SaveModify".equals(Action)){
    String id = request.getParameter("id");
     String   name = s.trimStr(request.getParameter("name"));
  	 String   summary  = s.trimStr(request.getParameter("summary"));
String    type  = s.trimStr(request.getParameter("type"));
	 
	 KeywordVo vo = new KeywordVo();
	 KeywordAction tKeywordAction = new KeywordAction();
	 vo.setId(Integer.parseInt(id));
	 vo.setName(name);
vo.setType(type);
	 vo.setSummary(summary);


	 int status = tKeywordAction.updateKeywordAction(vo);
	 response.sendRedirect("Admin_Keyword.jsp?Action=Main");
}

if("del".equals(Action)){
	KeywordAction tKeywordAction = new KeywordAction();
	String id = request.getParameter("id");
 	int status = tKeywordAction.delKeywordAction(Integer.parseInt(id));
	response.sendRedirect("Admin_Keyword.jsp?Action=Main");
}




if("DelAll".equals(Action)){

 KeywordAction tKeywordAction = new KeywordAction();
String[] KeywordID= request.getParameterValues("KeywordID");//


tKeywordAction.delKeywordAction(KeywordID);
response.sendRedirect("Admin_Keyword.jsp?Action=Main");



}
%>

