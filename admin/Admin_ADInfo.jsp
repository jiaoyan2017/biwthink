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

<html><head><title>图片信息管理<%=Action %></title>
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
            alert('图片名称不能为空！');
            document.myform.name.focus();
            return false;
        }
        if(document.myform.url.value==''){
            alert('链接地址不能为空！');
            document.myform.url.focus();
            return false;
        }
		
		        if(document.myform.pic.value==''){
            alert('图片不能为空！');
            document.myform.pic.focus();
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
  <form name='searchmyform' action='Admin_ADInfo.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_ADInfo.jsp'>图片信息管理首页</a>&nbsp;|&nbsp;<a href='Admin_ADInfo.jsp?Action=Add'>添加图片信息</a><%=Action %>
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

recordCount = count.getRecordCount("tbadinfo",type);

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));



AdInfoAction getADInfoList =new AdInfoAction();
List ADInfoList = new ArrayList();

ADInfoList = getADInfoList.getAdInfoListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_ADInfo.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='30'>选中</td>
              <td>图片名称</td>
              <td width="996">链接地址</td>
              
              <td width="996">图片类型</td>
              <td width='171'>操作</td>
            </tr>
    

        <tr><td colspan='20' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个图片信息</td></tr>
  <%for (int i=0;i<ADInfoList.size();i++) {
  AdInfoVo vo = new AdInfoVo();
  
  vo = (AdInfoVo)ADInfoList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <td width='30' align='center'>
                    <input name='ADInfoID' type='checkbox' onClick="unselectall()" id='ADInfoID' value='<%=vo.getId() %>'></td>
                    <td width='100'><a href='Admin_ADInfo.jsp'><%=vo.getName() %></a></td>
                    <td><a href='Admin_ADInfo.jsp'><%=vo.getUrl() %></a></td>
                  
                   <td><a href='Admin_ADInfo.jsp'>
                     <%
                            if("1".equals(vo.getType())){
                            
                            %>
                             首页轮播图
                            
                            <%
                            }
                            else{
                            %>
                            
                            二级页轮播图
                           <%
                            }
                             %>
                             </a></td>
                    <td width='171' align='center'>
          
            <a href='Admin_ADInfo.jsp?Action=Modify&id=<%=vo.getId() %>&type=<%=type%>'>修改</a>&nbsp;
            <a href='Admin_ADInfo.jsp?Action=del&id=<%=vo.getId() %>' onClick='return confirm("确定要删除此图片信息吗？");'>删除</a>                    </td>
                  </tr>
<%} %>
           
          </table>
  
              <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='200'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有图片信息</td>
                  <td><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的图片信息吗？');">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                 
                </tr>
              </table>
              
              <a href=Admin_ADInfo.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>&type=<%=type%>>上一页</a>  共<%=pageView.getPageCount() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_ADInfo.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>&type=<%=type%>>下一页</a>
          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_ADInfo.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='113'><b>图片信息查询：</b></td>
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
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_ADInfo.jsp'>图片信息管理</a>&nbsp;&gt;&gt;&nbsp;添加图片信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_ADInfo.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>图片名称：</td>
                            <td width='38%'><input name='name' type='text' id='name' size='35' maxlength='200'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>链接地址：</td>
                            <td width='38%'><input name='url' type='text' id='url' size='35' maxlength='200'></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>图片：</td>
                            <td colspan="3"><input name='pic'  id='pic'  type='text' size='35' maxlength='30'>
							
								<iframe  frameborder=0 scrolling=no width="500" height="25" src="up.jsp"  style="top:2px"  ></iframe>							</td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>类别：</td>
                           <td colspan="3"><select name="type" id="type">
                             <option value="1" selected="selected">首页轮播图</option>
                             <option value="2">二级页轮播图</option>
                           </select></td>
                        </tr>
                    </table>
    
                </td>
            </tr>
    </table>
	
	
    <table width='100%' height='40'><tr align='center'><td><input type='hidden' name='type' value='<%=type%>'>
        <input type='hidden' name='Action' value='SaveAdd'>
        <input type='submit' name='Submit' value='保存图片信息信息'>
    </td></tr></table>
    </form>

<% }%>
<%if("Modify".equals(Action)){
String id = request.getParameter("id");
AdInfoAction getInfo = new AdInfoAction();
AdInfoVo vo = new AdInfoVo();
vo = getInfo.getAdInfoInfoAction(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_ADInfo.jsp'>图片信息管理</a>&nbsp;&gt;&gt;&nbsp;修改图片信息信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_ADInfo.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>图片名：</td>
                            <td width='38%'><input name='name' type='text' id='name' size='35' maxlength='200' value='<%=vo.getName() %>'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>链接地址：</td>
                            <td width='38%'><input name='url' type='text' id='url' size='35' maxlength='200' value='<%=vo.getUrl() %>'></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>图片：</td>
                            <td colspan="3"><input name='pic' id='pic' type='text' size='35' maxlength='30' value='<%=vo.getPic() %>'>
							
							<img src="../upload/<%=vo.getPic() %>">
					<iframe  frameborder=0 scrolling=no width="500" height="25" src="up.jsp"  style="top:2px"  ></iframe>
							</td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>类别：</td>
                            <td colspan="3"><select name="type" id="type">
                            
                            <option value="<%=vo.getType() %>" selected>
                            <%
                            if("1".equals(vo.getType())){
                            %>
                            首页轮播图
                            <%
                            }
                            else{
                            %>
                            二级页轮播图
                            <%
                            }
                             %>
                            </option>
							  		<option value="1">首页轮播图</option>
							    	<option value="2">二级页轮播图</option>
						
                              </select></td>
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



	 String   pictype  = s.trimStr(request.getParameter("type"));
	 String   url  = s.trimStr(request.getParameter("url"));
     String   name = s.trimStr(request.getParameter("name"));
	 String   pic  = s.trimStr(request.getParameter("pic"));

	 
	 
	 AdInfoVo vo = new AdInfoVo();
	 AdInfoAction tADInfoAction = new AdInfoAction();
	 vo.setType(pictype);
 	 vo.setName(name);
	 vo.setPic(pic);
	 vo.setUrl(url);


	 int status = tADInfoAction.insertAdInfoAction(vo);
	 	 	 response.sendRedirect("Admin_ADInfo.jsp?Action=Main");

}


if("SaveModify".equals(Action)){
    String id = request.getParameter("id");
	 String   pictype  = s.trimStr(request.getParameter("type"));
	 String   url  = s.trimStr(request.getParameter("url"));
     String   name = s.trimStr(request.getParameter("name"));
	 String   pic  = s.trimStr(request.getParameter("pic"));
	 
	 
	 AdInfoVo vo = new AdInfoVo();
	 AdInfoAction tADInfoAction = new AdInfoAction();
	 vo.setId(Integer.parseInt(id));
	 vo.setType(pictype);
 	 vo.setName(name);
	 vo.setPic(pic);
	 vo.setUrl(url);
	 int status = tADInfoAction.updateAdInfoAction(vo);
	 	 response.sendRedirect("Admin_ADInfo.jsp?Action=Main");
}

if("del".equals(Action)){
	AdInfoAction tADInfoAction = new AdInfoAction();
	String id = request.getParameter("id");
 	int status = tADInfoAction.delAdInfoAction(Integer.parseInt(id));
 response.sendRedirect("Admin_ADInfo.jsp?Action=Main");
}




if("DelAll".equals(Action)){


String[] ADInfoID= request.getParameterValues("ADInfoID");//

AdInfoAction tADInfoAction = new AdInfoAction();
tADInfoAction.delAdInfoAction(ADInfoID);
 response.sendRedirect("Admin_ADInfo.jsp?Action=Main");

}
%>

