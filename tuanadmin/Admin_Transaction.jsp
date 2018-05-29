<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page  import="java.util.*"%>
<%@ page import="com.yi.Action.*" %>
<%@ page import="com.yi.vo.*" %>

<%@page import="com.yi.util.PageBean"%>
<%@page import="com.yi.Dao.PublicDao"%>
<%@page import="com.yi.util.StringUtils"%>

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

String pages = "0";
pages = request.getParameter("pages");

String Keyword =   s.trimStr(request.getParameter("Keyword"));
if(pages==null) pages = "0";
int recordCount = 0;

TransactionAction getTransactionList =new TransactionAction();
List TransactionList = new ArrayList();


recordCount = getTransactionList.getTransactionListActionByCompanyCount(cid,Keyword);


PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));

TransactionList = getTransactionList.getTransactionListActionByCompany(Keyword,cid,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Transaction.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
             <!-- <td width='26'>选中</td>-->
              <td>购买人</td><td width="212">购买产品</td>
              <td>交易时间</td>
              <td>价格</td>
              <td>购买数量</td>
              <td>订单号</td>
              <td width="141">手机号</td>
              <td width="141">状态</td>
              <td width='163'>操作</td>
            </tr>
    

        <tr><td colspan='24' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个交易信息</td></tr>
  <%for (int i=0;i<TransactionList.size();i++) {
  TransactionVo vo = new TransactionVo();
  
  vo = (TransactionVo)TransactionList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <!--<td width='26' align='center'>
                    <input name='TransactionID' type='checkbox' onClick="unselectall()" id='TransactionID' value='<%//=vo.getId() %>'></td>-->
                    <td width='162'><a href='Admin_Transaction.jsp'><%=vo.getPerson() %></a></td>
                    <td><%=vo.getProductName() %></td>
                    <td width='166'><%=vo.getTransactiontime() %></td>
                    <td width='97'><%=vo.getPrice() %></td>
                    <td width='122'><%=vo.getProductNum() %></td>
                    <td width='68'><%=vo.getOut_trade_no() %></td>
                    <td><%=vo.getMobile() %></td>
                    <td>
                    <%
                    int flag = vo.getFlag(); 
                    
                    if(flag==0){
                    	out.print("买家提交订单");
                    }
                    else if(flag==1){
                    	out.print("等待买家付款");
                    }
                    else if(flag==2){
                    	out.print("等待卖家发货");
                    }
                    else if(flag==3){
                    	out.print("等待买家确认收货");
                    }
                    else if(flag==4){
                    	out.print("交易完成，等待买家使用");
                    }
                    else if(flag==5){
                   	 	out.print("商家确认买家使用");
                    }
                   else if(flag==9){
                   	 	out.print("买家已经使用");
                    }
                    else{
                   	 out.print("交易结束");
                    }
                    %></td>
                    <td width='163' align='center'>
          
            <a href='Admin_TransactionChild.jsp?Action=Main&id=<%=vo.getId() %>'>查看详情</a>&nbsp;
            <%if(flag==2){ %>
            <a href='../tuan/send_goods_confirm_by_platform.jsp?trade_no=<%=vo.getTrade_no() %>' onClick='return confirm("确认发货吗？");'>确认发货</a>
                          <%} %>      </td>
                  </tr>
<%} %>
          </table>
  
<!--              <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='375'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有交易信息</td>
                  <td width="946"><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的交易信息吗？');">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                 
                </tr>
              </table>-->
              
              <a href=Admin_Transaction.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>&Keyword=<%=Keyword%>>上一页</a>  共<%=pageView.getPageCount() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_Transaction.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>&Keyword=<%=Keyword%>>下一页</a>
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
     String id = request.getParameter("id");
     String   isDone = s.trimStr(request.getParameter("isDone"));

	 
	 TransactionVo vo = new TransactionVo();
	 TransactionAction tTransactionAction = new TransactionAction();
	 vo.setId(Integer.parseInt(id));
	 vo.setIsDone(Integer.parseInt(isDone));
	

	 int status = tTransactionAction.updateTransactionAction(vo);

}
%>

