<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page  import="java.util.*"%>
<%@ page import="com.yi.Action.*" %>
<%@ page import="com.yi.vo.*" %>

<%@page import="com.yi.util.PageBean"%>

<%@page import="com.yi.util.StringUtils;"%>

<%
request.setCharacterEncoding("UTF-8");
StringUtils  s = new StringUtils();
String username = "";
String cid = "";
username = (String)session.getAttribute("username");
cid = (String)session.getAttribute("cid");

if(s.isNullOrEmpty(username) || s.isNullOrEmpty(cid)){
	response.sendRedirect("../return.jsp?err=-9");
}


String Action = request.getParameter("Action");
String parentid =  request.getParameter("id");
%>

<html><head><title>交易信息管理<%=Action %></title>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<link href='Admin_STYLE.CSS' rel='stylesheet' type='text/css'>
</head>
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>


<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
  <form name='searchmyform' action='Admin_Transaction.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;操作人：<%=username%>   <a href="updatePassword.jsp">修改密码</a>
    </td>
  </tr>
  </form>
</table>

<%if("Main".equals(Action)){%>
<%


TransactionAction getTransactionList =new TransactionAction();
List TransactionList = new ArrayList();


TransactionList = getTransactionList.getTransactionChildListAction(Integer.parseInt(parentid));
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Transaction.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
             <!-- <td width='26'>选中</td>-->
              <td>购买人</td><td width="212">验证码</td>
              <td>交易时间</td>
               <td>使用状态</td>
              <td width="141">手机号</td>
              <td width='163'>操作</td>
            </tr>
    

        <tr><td colspan='24' height='50' align='center'></td></tr>
  <%for (int i=0;i<TransactionList.size();i++) {
  TransactionVo vo = new TransactionVo();
  
  vo = (TransactionVo)TransactionList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                      <td width='162'><%=vo.getPerson() %></td>
                    <td><%=vo.getCode() %></td>
                    <td width='166'><%=vo.getTransactiontime() %></td>
                    <td><%=vo.getMobile() %></td>
                      <td>
                      <%if(vo.getIsdone()==0){
                      
                     	 out.print("未使用");
                      }else{
                      	out.print("已使用");
                      }
                       %>
                      
                      
                      </td>
                    <td width='163' align='center'>
          
            <a href='Admin_TransactionChild.jsp?Action=SaveModify&childid=<%=vo.getChildid() %>&id=<%=vo.getId() %>&mobile=<%=vo.getMobile() %>&code=<%=vo.getCode() %>'>变更使用状态</a>&nbsp;
 </td>
                  </tr>
<%} %>
          </table>

          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_Transaction.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='196'><b>交易信息查询：</b></td>
        <td width="1116">
          <input name='Keyword' type='text' id='Keyword' size='20' maxlength='40'>
          <input type='submit' name='Submit' value='搜 索' id='Submit'>
           <input type='hidden' name='Action' value='Main' id='Action'>
         
        </td>
      </tr>
    </table>
    </form>
<%}%>
<%if("Modify".equals(Action)){
String id = request.getParameter("id");
TransactionAction getInfo = new TransactionAction();
TransactionVo vo = new TransactionVo();
vo = getInfo.getTransactionInfoAction(Integer.parseInt(id));
%>
    <br><table width='100%'><tr>
      <td align='left'>您现在的位置：<a href='Admin_Transaction.jsp'>交易信息管理</a>&nbsp;&gt;&gt;&nbsp;查看交易信息信息</td>
    </tr></table>
    <form name='myform' id='myform' action='Admin_Transaction.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
              <td height='100' valign='top'><table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>产品名称：</td>
                    <td width='38%'><%=vo.getProductName() %>
                        <font color='#FF0000'>*</font></td>
                    <td class='tdbg5' align='right'  width='12%'>验证码：</td>
                    <td width='38%'><%=vo.getCode() %></td>
                  </tr>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>手机号：</td>
                    <td width='38%'><%=vo.getMobile() %></td>
                    <td class='tdbg5' align='right'  width='12%'>交易价格：</td>
                    <td width='38%'><%=vo.getPrice() %></td>
                  </tr>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>购买人：</td>
                    <td width='38%'><%=vo.getPerson() %></td>
                    <td class='tdbg5' align='right'  width='12%'>交易时间：</td>
                    <td width='38%'><%=vo.getTransactiontime() %></td>
                  </tr>
				  
				  		<tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>是否提货：</td>
                          <td><label>
                      <input type="radio" name="isDone" <%if(vo.getIsDone()==1) out.print("checked"); %> value="1">
                      已使用
                      </label>
                        <label>
                        <input type="radio" name="isDone" <%if(vo.getIsDone()==0) out.print("checked"); %> value="0">
                        未使用</label></td>
                          <td  class='tdbg5' align='right' >&nbsp;</td>
                          <td>&nbsp;</td>
		  		</tr>
                </table></td>
            </tr>
    </table>
    <table width='100%' height='40'><tr align='center'><td>
        <input type='hidden' name='Action' value='SaveModify'><input type='hidden' name='id' value='<%=vo.getId() %>'>>
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
if("SaveAdd".equals(Action)){
     String   name = s.trimStr(request.getParameter("name"));
  	 String   summary  = s.trimStr(request.getParameter("summary"));
	 String   pic  = s.trimStr(request.getParameter("pic"));
	 String   nowprice  = s.trimStr(request.getParameter("nowprice"));
	 String   oldprice  = s.trimStr(request.getParameter("oldprice"));
	 String   sum  = s.trimStr(request.getParameter("sum"));
 	 String   isview  = s.trimStr(request.getParameter("isview"));
	 String   uptime  = s.trimStr(request.getParameter("uptime"));
	 String   downtime  = s.trimStr(request.getParameter("downtime"));
	 String   companyid  = s.trimStr(request.getParameter("companyid"));
	 String   isreturn  = s.trimStr(request.getParameter("isreturn"));
	 String   content  = s.trimStr(request.getParameter("content"));

	 TransactionVo vo = new TransactionVo();
	 TransactionAction tTransactionAction = new TransactionAction();

	 
	 int status = tTransactionAction.insertTransactionAction(vo);
	 

}


if("SaveModify".equals(Action)){
     String childid = request.getParameter("childid");
      String id = request.getParameter("id");
      String   isDone = s.trimStr(request.getParameter("isDone"));
      String mobile = s.trimStr(request.getParameter("mobile"));
      String code = s.trimStr(request.getParameter("code"));

	 TransactionAction tTransactionAction = new TransactionAction();


	 int status = tTransactionAction.updateTransactionChildAction(childid,isDone,mobile,code,id);
 	response.sendRedirect("Admin_TransactionChild.jsp?Action=Main&id="+id);
}
%>

