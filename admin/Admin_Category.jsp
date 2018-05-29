<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page  import="java.util.*"%>
<%@ page import="com.yi.Action.*" %>
<%@ page import="com.yi.vo.*" %>
<%@ page import="com.yi.vo.CategoryVo" %>
<%@page import="com.yi.util.PageBean"%>
<%@page import="com.yi.Dao.PublicDao"%>
<%@page import="com.yi.util.StringUtils"%>

<%@page import="com.yi.Action.CategoryAction"%>

<%
request.setCharacterEncoding("UTF-8");
String type = request.getParameter("type");
String Action = request.getParameter("Action");
%>

<html><head><title>分类项目管理<%=Action %></title>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<link href='Admin_STYLE.CSS' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script language=javascript>
	
	function unselectall()
{
    if(document.myform.chkAll.checked)
	document.myform.chkAll.checked = document.myform.chkAll.checked;
 }    	


	function hiddenCategory(id){
		document.getElementById(id).style.display="none";
	}
	
	
	function showCategory(id){
		document.getElementById(id).style.display="";
	}
	
	function setCategory(id,name)
{

//alert(id);

//alert(name);

	var s=document.getElementById("parentid");
  
  	s.options[0].value=id;
  	s.options[0].text=name;
  
  
  	s.options[0].selected=true;
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
            alert('分类名称不能为空！');
            document.myform.name.focus();
            return false;
        }

    }
    
    </script>
</head>
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0' onLoad="hiddenCategory('sort');">


<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
  <form name='searchmyform' action='Admin_Category.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_Category.jsp'>分类项目管理首页</a>&nbsp;|&nbsp;<a href='Admin_Category.jsp?Action=Add'>添加分类项目</a><%=Action %>
    </td>
  </tr>
  </form>
</table>

<%if("Main".equals(Action)){%>
<%
//String Keyword = "";
String Keyword = request.getParameter("Keyword");
if(Keyword==null) Keyword = "";

//String pages = "0";
String pages = request.getParameter("pages");
if(pages==null) pages = "0";
int recordCount = 0;

PublicDao count = new PublicDao();

recordCount = count.getRecordCount("tbCategory",type);

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));



CategoryAction getCategoryList =new CategoryAction();
List CategoryList = new ArrayList();


CategoryList = getCategoryList.getCategoryListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Category.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='29'>选中</td>
              <td>分类名称</td>
              <td width="592">分类简介</td>
              <td width='168'>操作</td>
            </tr>
    

        <tr><td colspan='20' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个分类项目</td></tr>
  <%for (int i=0;i<CategoryList.size();i++) {
  CategoryVo vo = new CategoryVo();
  
  vo = (CategoryVo)CategoryList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <td width='29' align='center'>
                    <input name='CategoryID' type='checkbox' onClick="unselectall()" id='CategoryID' value='<%=vo.getId() %>'></td>
                    <td width='509'><a href='Admin_Category.jsp'><%=vo.getName() %></a></td>
                    <td><a href='Admin_Category.jsp'><%=vo.getSummary() %></a></td>
                  
                    <td width='168' align='center'>
          
            <a href='Admin_Category.jsp?Action=Modify&id=<%=vo.getId() %>&type=<%=type%>'>修改</a>&nbsp;
            <a href='Admin_Category.jsp?Action=del&id=<%=vo.getId() %>' onClick='return confirm("确定要删除此分类项目吗？");'>删除</a>                    </td>
                  </tr>
<%} %>
           
          </table>
  
              <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='200'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有分类项目</td>
                  <td><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的分类项目吗？');">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                 
                </tr>
              </table>
              
              <a href=Admin_Category.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>&type=<%=type%>&Keyword=<%=Keyword%>>上一页</a>  共<%=pageView.getPageCount() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_Category.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>&type=<%=type%>&Keyword=<%=Keyword%>>下一页</a>
          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_Category.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='113'><b>分类项目查询：</b></td>
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
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Category.jsp'>分类项目管理</a>&nbsp;&gt;&gt;&nbsp;添加分类项目</td></tr></table>
    <form name='myform' id='myform' action='Admin_Category.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>分类项目名称：</td>
                            <td width='38%'><input name='name' type='text' id='name' size='35' maxlength='200'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>简介：</td>
                            <td width='38%'><input name='summary' type='text' id='summary' size='35' maxlength='30' value=''></td>
                        </tr>
    
                       <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>上级分类：</td>
                          <td width='38%'>
						  <div id="select" onMouseMove="showCategory('sort');">
							<select name="parentid" id="parentid">
							  <option selected="selected" value="0">无上级分类</option>
							  <%
							  CategoryAction getCategoryList =new CategoryAction();
							  List CategoryList = new ArrayList();
							  CategoryList = getCategoryList.getCategoryListAction("",0,0,type);
							  for(int i=0;i<CategoryList.size();i++){
							    CategoryVo vo = new CategoryVo();
							    vo = (CategoryVo)CategoryList.get(i);
							  %>
							  <option value="<%=vo.getId()%>"><%=vo.getName()%></option>
							  <%} %>
							</select>
							<div>
							
							

<div  class='txt_main' id="sort">

<%
CategoryAction ca = new CategoryAction();
List caList = ca.getCategoryListByParentIdAction("0","1");

for (int i=0;i<caList.size();i++){
CategoryVo caVo = (CategoryVo)caList.get(i);

 %>     
<ul name="sn_ul">
<h5 id='hqb1_<%=caVo.getId() %>'><a href="#" onClick="setCategory(<%=caVo.getId() %>,'<%=caVo.getName() %>');"><%=caVo.getName() %></a></h5>
	      <span id='hqb2_<%=caVo.getId() %>'> 
	      
	      <%
	        CategoryAction ca1 = new CategoryAction();
			List caList1 = ca1.getCategoryListByParentIdAction(caVo.getId()+"","1");

	       %>
		 </span>
		  
	<div class="clear"></div>
	
<div class="sort_list" style="top:-1px; display:none">
<dl><span style="margin-top:0"></span>
	<%
	
			for (int j=0;j<caList1.size();j++){
			CategoryVo caVo12 = (CategoryVo)caList1.get(j);
	
	 %>
			<li><dt><a  href='#' onClick="setCategory(<%=caVo12.getId() %>,'<%=caVo12.getName() %>');"><%=caVo12.getName() %></a><br /></dt>
				<dd>
				<%
				
				CategoryAction ca3 = new CategoryAction();
				List caList3 = ca3.getCategoryListByParentIdAction(caVo12.getId()+"","1");
				for (int h=0;h<caList3.size();h++){
					CategoryVo caVo3 = (CategoryVo)caList3.get(h);
				
				 %>
				
						<em>| <a  href="#"  onclick="setCategory(<%=caVo3.getId() %>,'<%=caVo3.getName()%>');"  ><%=caVo3.getName() %></a></em>
					<%} %>		
						</dd></li>					
				<%} %>			
		
</dl>
</div>

</ul>
 <%}%>


<script type="text/javascript"> 
   $("ul[name='sn_ul']").each(function(){
    $(this).hover(function(){
        showMenu(this);
    },
    function(){
        outMenu(this);
    })
});
 
function showMenu(item)
{
    $(item).addClass("on");
    $(item).children(".sort_list").show();
    $(item).siblings("ul").children(".sort_list").hide();
}
function outMenu(item)
{
    $(item).removeClass("on");
    $(item).children(".sort_list").hide();
    $(item).siblings("ul").children(".sort_list").hide();
}
</script>
 
</div>
						  </td>
							
							
                            <td class='tdbg5' align='right'  width='12%'>类别分类：</td>
                            <td width='38%'><label>
                              <input type="radio" name="isview" value="1">
                              商品类别 </label>
                              <label>
                              <input type="radio" name="isview" checked value="0">
                              文章类别 </label></td>
                        </tr>
						
						    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>图片：</td>
                            <td colspan="3"><input name='pic' id='pic' type='text' size='35' maxlength='30'>
							
							
					<iframe  frameborder=0 scrolling=no width="500" height="25" src="up.jsp"  style="top:2px"  ></iframe>
							</td>
                        </tr>
    
                    </table>
    
                </td>
            </tr>
    </table>
	
	
    <table width='100%' height='40'><tr align='center'><td><input type='hidden' name='type' value='<%=type%>'>
        <input type='hidden' name='Action' value='SaveAdd'>
        <input type='submit' name='Submit' value='保存分类项目信息'>
    </td></tr></table>
    </form>

<% }%>
<%if("Modify".equals(Action)){
String id = request.getParameter("id");
CategoryAction getInfo = new CategoryAction();
CategoryVo vo = new CategoryVo();
vo = getInfo.getCategoryInfoAction(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Category.jsp'>分类项目管理</a>&nbsp;&gt;&gt;&nbsp;修改分类项目信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Category.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>分类项目名称：</td>
                            <td width='38%'><input name='name' type='text' id='name' size='35' maxlength='200' value='<%=vo.getName() %>'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='12%'>简介：</td>
                            <td width='38%'><input name='summary' type='text' id='summary' size='35' maxlength='30' value='<%=vo.getSummary() %>'></td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>上级分类：</td>
                            <td width='38%'>
							<select name="parentid">
                            <%
                             CategoryAction getCategoryList =new CategoryAction();
							  CategoryVo ovo = (CategoryVo)getCategoryList.getCategoryInfoAction(vo.getParentid());
							  if(ovo.getName()==null){
							  %>
							  <option selected="selected" value="0">无上级分类</option>
							  <%
							  }
							  else{
                             %>
                             <option selected="selected"  value="<%=ovo.getId()%>"><%=ovo.getName()%></option>
                            
                             <%
                             }
							  List CategoryList = new ArrayList();
							  CategoryList = getCategoryList.getCategoryListAction("",0,0,type);
							  for(int i=0;i<CategoryList.size();i++){
							    CategoryVo pvo = new CategoryVo();
							    pvo = (CategoryVo)CategoryList.get(i);
							  %>
							  <option value="<%=pvo.getId()%>"><%=pvo.getName()%></option>
							  <%} %>
							</select>
                            
                            </td>
                            <td class='tdbg5' align='right'  width='12%'>是否显示：</td>
                          <td width='38%'><label>
                      <input type="radio" name="isview" <%if("1".equals(vo.getIsView())) out.print("checked"); %> value="1">
                      商品类别
                      </label>
                        <label>
                        <input type="radio" name="isview" <%if("0".equals(vo.getIsView())) out.print("checked"); %> value="0">
                      文章类别</label>	</td>
                        </tr>
						
												    
                      <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>图片：</td>
                            <td colspan="3"><input name='pic' id='pic' type='text' size='35' maxlength='30' value='<%=vo.getPic() %>'>
							
							<img src="../upload/<%=vo.getPic() %>">
					<iframe  frameborder=0 scrolling=no width="500" height="25" src="up.jsp"  style="top:2px"  ></iframe>
							</td>
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
  
	 

String   summary  = s.trimStr(request.getParameter("summary"));

String   pic  = s.trimStr(request.getParameter("pic"));
	 
	 String   parentid  = s.trimStr(request.getParameter("parentid"));
 String   isview  = s.trimStr(request.getParameter("isview"));
	 type = s.trimStr(request.getParameter("type"));
	 
	 
	 CategoryVo vo = new CategoryVo();
	 CategoryAction tCategoryAction = new CategoryAction();
	 
	 vo.setName(name);
	 vo.setParentid(Integer.parseInt(parentid));
	 vo.setSummary(summary);
	 vo.setType(type);
	 vo.setPic(pic);
	 vo.setIsView(isview);
	 int status = tCategoryAction.insertCategoryAction(vo);
	 response.sendRedirect("Admin_Category.jsp?Action=Main&type=1");	 

}


if("SaveModify".equals(Action)){
    String id = request.getParameter("id");
     String   name = s.trimStr(request.getParameter("name"));
  
	 String   summary  = s.trimStr(request.getParameter("summary"));
	String   pic  = s.trimStr(request.getParameter("pic"));
	 String   parentid  = s.trimStr(request.getParameter("parentid"));
 String   isview  = s.trimStr(request.getParameter("isview"));
	 type = s.trimStr(request.getParameter("type"));
	 
	 CategoryVo vo = new CategoryVo();
	 CategoryAction tCategoryAction = new CategoryAction();
	 vo.setId(Integer.parseInt(id));
	 vo.setName(name);
	 vo.setParentid(Integer.parseInt(parentid));
	 vo.setSummary(summary);
	// vo.setType(type);
		 vo.setIsView(isview);
     vo.setPic(pic);
	 int status = tCategoryAction.updateCategoryAction(vo);
	 response.sendRedirect("Admin_Category.jsp?Action=Main&type=1");
}

if("del".equals(Action)){
	CategoryAction tCategoryAction = new CategoryAction();
	String id = request.getParameter("id");
 	int status = tCategoryAction.delCategoryAction(Integer.parseInt(id));
response.sendRedirect("Admin_Category.jsp?Action=Main&type=1");

}




if("DelAll".equals(Action)){

CategoryAction tCategoryAction = new CategoryAction();
String[] CategoryID= request.getParameterValues("CategoryID");//
tCategoryAction.delCategoryAction(CategoryID);



response.sendRedirect("Admin_Category.jsp?Action=Main&type=1");

}
%>

