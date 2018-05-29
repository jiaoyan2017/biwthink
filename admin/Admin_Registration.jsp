<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page  import="java.util.*"%>
<%@ page import="com.yi.Action.*" %>
<%@ page import="com.yi.vo.*" %>

<%@page import="com.yi.util.PageBean"%>
<%@page import="com.yi.Dao.PublicDao"%>
<%@page import="com.yi.util.StringUtils;"%>
<%@ taglib uri="http://ckfinder.com" prefix="ckfinder" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>

<%
request.setCharacterEncoding("UTF-8");
String type = request.getParameter("type");
String Action = request.getParameter("Action");
%>

<html><head><title>线下团购信息管理<%=Action %></title>
<meta http-equiv='Registration-Type' Registration='text/html; charset=UTF-8'>
<link href='Admin_STYLE.CSS' rel='stylesheet' type='text/css'>
<script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
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
            alert('活动名称不能为空！');
            document.myform.name.focus();
            return false;
        }
        if(document.myform.activityTime.value==''){
            alert('活动时间不能为空！');
            document.myform.activityTime.focus();
            return false;
        }
		
		        if(document.myform.address.value==''){
            alert('地址不能为空！');
            document.myform.address.focus();
            return false;
        }
		
		        if(document.myform.busLine.value==''){
            alert('乘车路线不能为空！');
            document.myform.busLine.focus();
            return false;
        }
		
		
				
		        if(document.myform.tel.value==''){
            alert('联系方式不能为空！');
            document.myform.tel.focus();
            return false;
        }
		
		
		
						
		        if(document.myform.msgid.value=='0'){
            alert('短信内容不能为空！');
            document.myform.msgid.focus();
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
  <form name='searchmyform' action='Admin_Registration.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_Registration.jsp'>线下团购信息管理首页</a>&nbsp;|&nbsp;<a href='Admin_Registration.jsp?Action=Add'>添加线下团购信息</a><%=Action %>
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

recordCount = count.getRecordCount("tbregistration",type);

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));





RegistrationAction getRegistrationList =new RegistrationAction();
List RegistrationList = new ArrayList();


RegistrationList = getRegistrationList.getRegistrationListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Registration.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='56'>选中</td>
              <td>名称</td>
              <td width="265">活动时间</td>
              <td>活动地点</td>
            <td>短信标题</td>
              <td width='346'>操作</td>
            </tr>
    

        <tr><td colspan='20' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个线下团购信息</td></tr>
  <%for (int i=0;i<RegistrationList.size();i++) {
  RegistrationVo vo = new RegistrationVo();
  
  vo = (RegistrationVo)RegistrationList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <td width='56' align='center'>
                    <input name='RegistrationID' type='checkbox' onClick="unselectall()" id='RegistrationID' value='<%=vo.getId() %>'></td>
                    <td width='299'><a href='Admin_Registration.jsp'><%=vo.getName() %></a></td>
                    <td><%=vo.getActivityTime() %></td>
                    <td width='326'><%=vo.getAddress() %></td>
                 <td width='326'><%=vo.getMsgTitle() %></td>
                    <td width='346' align='center'>
          
            <a href='Admin_Registration.jsp?Action=Modify&id=<%=vo.getId() %>&type=<%=type%>'>修改</a>&nbsp;
            <a href='Admin_Registration.jsp?Action=del&id=<%=vo.getId() %>' onClick='return confirm("确定要删除此线下团购信息吗？");'>删除</a>                    </td>
                  </tr>
<%} %>
           
          </table>
  
              <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='375'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有线下团购信息</td>
                  <td width="946"><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的线下团购信息吗？');">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                 
                </tr>
              </table>
              
              <a href=Admin_Registration.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>>上一页</a>  共<%=pageView.getPageSize() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_Registration.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>>下一页</a>
          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_Registration.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='196'><b>线下团购信息查询：</b></td>
        <td width="1116">
          <input name='Keyword' type='text' id='Keyword' size='20' maxlength='40'>
          <input type='submit' name='Submit' value='搜 索' id='Submit'>
           <input type='hidden' name='Action' value='Main' id='Action'>
         
        </td>
      </tr>
    </table>
    </form>

    
    <%} %>
<%if("Add".equals(Action)){%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Registration.jsp'>线下团购信息管理</a>&nbsp;&gt;&gt;&nbsp;添加线下团购信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Registration.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>线下团购名称：</td>
                            <td width='38%'><input name='name' type='text' id='name' size='35' maxlength='200'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>是否默认显示：</td>
                            <td width='38%'>
							
							<label>
                              <input type="radio" name="isview" value="1">显示                            </label>
                              <label>
                            <input type="radio" name="isview" checked value="0">不显示							 </label>							</td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>活动地点：</td>
                          <td width='38%'><input name='address' type='text' id='address' size='35' maxlength='200'>
                              <font color='#FF0000'>*</font> </td>
							
							
                            <td class='tdbg5' align='right'  width='12%'>活动时间：</td>
                          <td width='38%'><input name='activityTime' type='text' id='activityTime' size='35' maxlength='200'   class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd'})">
                              <font color='#FF0000'>*</font></td>
                        </tr>
						
						                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>报名电话：</td>
                            <td width='38%'><input name='tel' type='text' id='tel' size='35' maxlength='200'>
                              <font color='#FF0000'>*</font> </td>
							
							
                            <td class='tdbg5' align='right'  width='12%'>乘车路线：</td>
                            <td width='38%'><input name='busLine' type='text' id='busLine' size='35' maxlength='200'>
                              <font color='#FF0000'>*</font></td>
                        </tr>
						
						
						
											                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>报名电话：</td>
                            <td><label>
                                <select name="msgid" id="msgid">
							  <option selected="selected" value="0">请选择短信内容</option>
							  <%
							  MsgAction getMsgList =new MsgAction();
							  List MsgList = new ArrayList();
							  MsgList = getMsgList.getMsgListAction("",0,0);
							  for(int i=0;i<MsgList.size();i++){
							    MsgVo vo = new MsgVo();
							    vo = (MsgVo)MsgList.get(i);
							  %>
							  <option value="<%=vo.getId()%>"><%=vo.getTitle()%></option>
							  <%} %>
							</select>
                            </label>
                              <font color='#FF0000'>*</font></td>
                            <td class='tdbg5'  align='right' >参与人数：</td>
                            <td><input name='count' type='text' id='count' size='35' maxlength='200'></td>
                        </tr>
						
												  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='11%'>图片：</td>
                    <td colspan="3"><input name='pic' type='text' id='pic' size='35' maxlength='200'>
                            <font color='#FF0000'>*</font>							
							<iframe  frameborder=0 scrolling=no width="500" height="25" src="up.jsp"  style="top:2px"  ></iframe></td>
                    </tr>
					
					
												  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='11%'>地图：</td>
                    <td colspan="3"><input name='addresspic' type='text' id='addresspic' size='35' maxlength='200'>
                            <font color='#FF0000'>*</font>							
							<iframe  frameborder=0 scrolling=no width="500" height="25" src="uppic.jsp"  style="top:2px"  ></iframe></td>
                    </tr>
						
						
						                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>活动介绍：</td>
                            <td colspan="3"><textarea name="content" cols="70" rows="10" id="content"></textarea>
                              <font color='#FF0000'>*</font> </td>
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
<ckfinder:setupCKEditor basePath="../ckfinder/" editor="content" />  
<ckeditor:replace replace="content" basePath="../ckeditor/" />  
<% }%>
<%if("Modify".equals(Action)){
String id = request.getParameter("id");
RegistrationAction getInfo = new RegistrationAction();
RegistrationVo vo = new RegistrationVo();
vo = getInfo.getRegistrationInfoAction(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Registration.jsp'>线下团购信息管理</a>&nbsp;&gt;&gt;&nbsp;修改线下团购信息信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Registration.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'><table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>线下团购名称：</td>
                    <td width='38%'><input name='name' type='text' id='name' size='35' maxlength='200' value="<%=vo.getName() %>">
                        <font color='#FF0000'>*</font></td>
                    <td class='tdbg5' align='right'  width='12%'>是否默认显示：</td>
                    <td width='38%'><label>
                      <input type="radio" name="isview" <%if(vo.getIsview()==1) out.print("checked"); %> value="1">
                      </label>
                        <label> 显示
                          <input type="radio" name="isview" <%if(vo.getIsview()==0) out.print("checked"); %> value="0">
                          不显示 </label></td>
                  </tr>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>活动地点：</td>
                    <td width='38%'><input name='address' type='text' id='address' size='35' maxlength='200'  value="<%=vo.getAddress() %>">
                        <font color='#FF0000'>*</font> </td>
                    <td class='tdbg5' align='right'  width='12%'>活动时间：</td>
                    <td width='38%'><input name='activityTime' type='text' id='activityTime' size='35' maxlength='200'  value="<%=vo.getActivityTime() %>" class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd'})">
                        <font color='#FF0000'>*</font></td>
                  </tr>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>报名电话：</td>
                    <td width='38%'><input name='tel' type='text' id='tel' size='35' maxlength='200'  value="<%=vo.getTel() %>">
                        <font color='#FF0000'>*</font> </td>
                    <td class='tdbg5' align='right'  width='12%'>乘车路线：</td>
                    <td width='38%'><input name='busLine' type='text' id='busLine' size='35' maxlength='200'  value="<%=vo.getBusLine() %>">
                        <font color='#FF0000'>*</font></td>
                  </tr>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>报名电话：</td>
                    <td><label>
                      <select name="msgid" id="msgid">
                        <%
                             MsgAction getMsgList =new MsgAction();
							  MsgVo ovo = (MsgVo)getMsgList.getMsgInfoAction(vo.getMsgid());
							  
							  if(ovo.getTitle()==null){
							  %>
                        <option selected="selected" value="0">无上级分类</option>
                        <%
							  }
							  else{
                             %>
                        <option selected="selected"  value="<%=ovo.getId()%>"><%=ovo.getTitle()%></option>
                        <%
                             }
							  List MsgList = new ArrayList();
							  MsgList = getMsgList.getMsgListAction("",0,0);
							  for(int i=0;i<MsgList.size();i++){
							    MsgVo pvo = new MsgVo();
							    pvo = (MsgVo)MsgList.get(i);
							  %>
                        <option value="<%=pvo.getId()%>"><%=pvo.getTitle()%></option>
                        <%} %>
                      </select>
                      </label>
                        <font color='#FF0000'>*</font></td>
                    <td  class='tdbg5' align='right'  >参与人数：</td>
                    <td><input name='count' type='text' id='count' size='35' maxlength='200' value="<%=vo.getCount()%>"></td>
                  </tr>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='11%'>图片：：</td>
                    <td colspan="3"><input name='pic' type='text' id='pic' size='35' maxlength='200'  value='<%=vo.getPic() %>'>
                        <font color='#FF0000'>*</font><img src="../upload/<%=vo.getPic() %>">
                        <iframe  frameborder=0 scrolling=no width="500" height="25" src="up.jsp"  style="top:2px"  ></iframe></td>
                  </tr>
				  
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='11%'>图片：：</td>
                    <td colspan="3"><input name='addresspic' type='text' id='addresspic' size='35' maxlength='200'  value='<%=vo.getAddresspic() %>'>
                        <font color='#FF0000'>*</font><img src="../upload/<%=vo.getAddresspic() %>">
                        <iframe  frameborder=0 scrolling=no width="500" height="25" src="uppic.jsp"  style="top:2px"  ></iframe></td>
                  </tr>				  
				  
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>商品说明：</td>
                    <td colspan="3"><textarea name="content" cols="70" rows="10" id="content"><%=vo.getContent() %></textarea>
                        <font color='#FF0000'>*</font></td>
                  </tr>
                </table></td>
            </tr>
    </table>
    <table width='100%' height='40'><tr align='center'><td>
        <input type='hidden' name='Action' value='SaveModify'><input type='hidden' name='id' value='<%=vo.getId() %>'><input type='hidden' name='type' value='<%=type%>'>
        <input type='submit' name='Submit' value='保存修改结果'>
    </td></tr></table>
    </form>
	<ckfinder:setupCKEditor basePath="../ckfinder/" editor="content" />  
<ckeditor:replace replace="content" basePath="../ckeditor/" />  
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
     
  	 String   content  = s.trimStr(request.getParameter("content"));
	 String   address  = s.trimStr(request.getParameter("address"));
	 String   tel  = s.trimStr(request.getParameter("tel"));
	 String   activityTime  = s.trimStr(request.getParameter("activityTime"));
	 String   busLine  = s.trimStr(request.getParameter("busLine"));
	 	 
 	 String   isview  = s.trimStr(request.getParameter("isview"));
 	  String   msgid  = s.trimStr(request.getParameter("msgid"));
      String  pic   = s.trimStr(request.getParameter("pic"));
      String  addresspic   = s.trimStr(request.getParameter("addresspic"));
    String  count   = s.trimStr(request.getParameter("count"));

	 RegistrationVo vo = new RegistrationVo();
	 RegistrationAction tRegistrationAction = new RegistrationAction();

	vo.setName(name);
	vo.setCount(Integer.parseInt(count));
	 vo.setAddresspic(addresspic);
	vo.setContent(content);
	vo.setAddress(address);
	vo.setTel(tel);
	vo.setActivityTime(activityTime);
	vo.setBusLine(busLine);
	vo.setIsview(Integer.parseInt(isview));
	vo.setMsgid(Integer.parseInt(msgid));
    vo.setPic(pic);
	 
	 int status = tRegistrationAction.insertRegistrationAction(vo);
	 
	 response.sendRedirect("Admin_Registration.jsp?Action=Main");
}


if("SaveModify".equals(Action)){
    String id = request.getParameter("id");
    String   name = s.trimStr(request.getParameter("name"));
     
  	 String   content  = s.trimStr(request.getParameter("content"));
	 String   address  = s.trimStr(request.getParameter("address"));
	 String   tel  = s.trimStr(request.getParameter("tel"));
	 String   activityTime  = s.trimStr(request.getParameter("activityTime"));
	 String   busLine  = s.trimStr(request.getParameter("busLine"));
	 	 
 	 String   isview  = s.trimStr(request.getParameter("isview"));
	  String   msgid  = s.trimStr(request.getParameter("msgid"));
	  String  pic   = s.trimStr(request.getParameter("pic"));
	    String  addresspic   = s.trimStr(request.getParameter("addresspic"));
    String  count   = s.trimStr(request.getParameter("count"));
	
	 RegistrationVo vo = new RegistrationVo();
	 RegistrationAction tRegistrationAction = new RegistrationAction();
	 
	 vo.setId(Integer.parseInt(id));
	vo.setName(name);
	vo.setContent(content);
	vo.setAddress(address);
	vo.setTel(tel);
	vo.setActivityTime(activityTime);
	vo.setBusLine(busLine);
	vo.setIsview(Integer.parseInt(isview));
	vo.setMsgid(Integer.parseInt(msgid));
	vo.setPic(pic);
	vo.setCount(Integer.parseInt(count));
	 vo.setAddresspic(addresspic);


	 int status = tRegistrationAction.updateRegistrationAction(vo);
	 
	 	 response.sendRedirect("Admin_Registration.jsp?Action=Main");

}

if("del".equals(Action)){
	RegistrationAction tRegistrationAction = new RegistrationAction();
	String id = request.getParameter("id");
 	int status = tRegistrationAction.delRegistrationAction(Integer.parseInt(id));
response.sendRedirect("Admin_Registration.jsp?Action=Main");
}




if("DelAll".equals(Action)){
RegistrationAction tRegistrationAction = new RegistrationAction();

String[] RegistrationID= request.getParameterValues("RegistrationID");//

int status = tRegistrationAction.delRegistrationAction(RegistrationID);

response.sendRedirect("Admin_Registration.jsp?Action=Main");



}
%>

