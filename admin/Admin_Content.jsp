<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page  import="java.util.*"%>
<%@ page import="com.yi.Action.*" %>
<%@ page import="com.yi.vo.*" %>

<%@page import="com.yi.util.PageBean"%>
<%@page import="com.yi.Dao.PublicDao"%>
<%@page import="com.yi.util.StringUtils"%>
<%@ taglib uri="http://ckfinder.com" prefix="ckfinder" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>

<%
request.setCharacterEncoding("UTF-8");
String type = request.getParameter("type");
String Action = request.getParameter("Action");
%>

<html><head><title>文章信息管理<%=Action %></title>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<link href='Admin_STYLE.CSS' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script language=javascript>
	
	
	
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

	var s=document.getElementById("categoryid");
  
  	s.options[0].value=id;
  	s.options[0].text=name;
  
  
  	s.options[0].selected=true;
 }    	
	
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
            alert('文章名称不能为空！');
            document.myform.name.focus();
            return false;
        }
        if(document.myform.categoryid.value==''){
            alert('文章不能为空！');
            document.myform.categoryid.focus();
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
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'  onLoad="hiddenCategory('sort_select');"> 


<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
  <form name='searchmyform' action='Admin_Content.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_Content.jsp'>文章信息管理首页</a>&nbsp;|&nbsp;<a href='Admin_Content.jsp?Action=Add'>添加文章信息</a><%=Action %>
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

recordCount = count.getRecordCount("tbContent",type);

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));



ContentAction getContentList =new ContentAction();
List ContentList = new ArrayList();


ContentList = getContentList.getContentListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Content.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='26'>选中</td>
              <td>文章标题</td>
              <td width="240">所属分类</td>
              <td>简介</td>
            
              <td width='134'>操作</td>
            </tr>
    

        <tr><td colspan='20' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个文章信息</td>
        </tr>
  <%for (int i=0;i<ContentList.size();i++) {
  ContentVo vo = new ContentVo();
  
  vo = (ContentVo)ContentList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <td width='26' align='center'>
                    <input name='ContentID' type='checkbox' onClick="unselectall()" id='ContentID' value='<%=vo.getId() %>'></td>
                    <td width='295'><a href='Admin_Content.jsp'><%=vo.getName() %></a></td>
                    <td><%=vo.getCategoryName() %></td>  
                   
                    <td width='295'><%=vo.getSummary() %></td>
                 
                    <td width='310' align='center'>
          
            <a href='Admin_Content.jsp?Action=Modify&id=<%=vo.getId() %>&type=<%=type%>&pages=<%=pages%>'>修改</a>&nbsp;
            <a href='Admin_Content.jsp?Action=del&id=<%=vo.getId() %>' onClick='return confirm("确定要删除此文章信息吗？");'>删除</a>  
			</td>
                  </tr>
<%} %>
          </table>
  
              <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='375'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有文章信息</td>
                  <td width="946"><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的文章信息吗？');">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                 
                </tr>
              </table>
              
              <a href=Admin_Content.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>&Keyword=<%=Keyword%>>上一页</a>  共<%=pageView.getPageCount() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_Content.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>&Keyword=<%=Keyword%>>下一页</a>
          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_Content.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='196'><b>文章信息查询：</b></td>
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
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Content.jsp'>文章信息管理</a>&nbsp;&gt;&gt;&nbsp;添加文章信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Content.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
              <td height='100' valign='top'>
                <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td  width='11%' height="157" align='right' class='tdbg5'>文章名称：</td>
                            <td width='27%'><input name='name' type='text' id='name' size='35' maxlength='200'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='9%'>分类：</td>
                            <td width='53%'>
							 <div id="select" onMouseMove="showCategory('sort');">
							<select name="categoryid" id="categoryid">
							  <option selected="selected" value="0">请选择...</option>
							  <%
							  CategoryAction getCategoryList =new CategoryAction();
							  List CategoryList = new ArrayList();
							  CategoryList = getCategoryList.getCategoryListAction("",0,0,"0");
							  for(int i=0;i<CategoryList.size();i++){
							    CategoryVo vo = new CategoryVo();
							    vo = (CategoryVo)CategoryList.get(i);
							  %>
							  <option value="<%=vo.getId()%>"><%=vo.getName()%></option>
							  <%} %>
							</select>
							</div>
                            <font color='#FF0000'>*</font>							
							
							
							<%--<div  class='txt_main' id="sort">

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
</div>--%>							</td>
                        </tr>
    
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='11%'>简介：</td>
                            <td width='27%'><input name='summary' type='text' id='summary' size='35' maxlength='200'>							</td>
							
							
                            <td class='tdbg5' align='right'  width='9%'>&nbsp;</td>
                            <td width='53%'>&nbsp;</td>
                        </tr>
					
									<!--		  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='11%'>图片：</td>
                    <td colspan="3"><input name='pic' type='text' id='pic' size='35' maxlength='200'>
                            <font color='#FF0000'>*</font>							
							<iframe  frameborder=0 scrolling=no width="500" height="25" src="up.jsp"  style="top:2px"  ></iframe></td>
                    </tr>-->
					
						
						
						                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='11%'>文章说明：</td>
                            <td colspan="3"><textarea name="content" cols="70" rows="10" id="content"></textarea>
							                
                              <font color='#FF0000'>*</font> </td>
                        </tr>
                    </table>
    
              </td>
            </tr>
    </table>
	
	
    <table width='100%' height='40'><tr align='center'><td><input type='hidden' name='type' value='<%=type%>'>
        <input type='hidden' name='Action' value='SaveAdd'>
        <input type='submit' name='Submit' value='保存文章信息'>
    </td></tr></table>
    </form>
<ckfinder:setupCKEditor basePath="../ckfinder/" editor="content" />  
<ckeditor:replace replace="content" basePath="../ckeditor/" />  
<% }%>
<%if("Modify".equals(Action)){
String pages = request.getParameter("pages");
if(pages==null) pages = "0";
String id = request.getParameter("id");
ContentAction getInfo = new ContentAction();
ContentVo vo = new ContentVo();
vo = getInfo.getContentInfoAction(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Content.jsp'>文章信息管理</a>&nbsp;&gt;&gt;&nbsp;修改文章信息信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Content.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'><table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='11%'>文章名称：</td>
                    <td width='27%'><input name='name' type='text' id='name' size='35' maxlength='200' value='<%=vo.getName() %>'>
                    <font color='#FF0000'>*</font></td>
                    <td class='tdbg5' align='right'  width='10%'>文章：</td>
                    <td width='54%'>
					
					 <select name="categoryid">
                        <%
                             CategoryAction getCategoryList =new CategoryAction();
							  CategoryVo covo = (CategoryVo)getCategoryList.getCategoryInfoAction(vo.getCategoryid());
						%>
                        <option selected="selected"  value="<%=covo.getId()%>"><%=covo.getName()%></option>
                        <%
                            
							   List CategoryList = new ArrayList();
							  CategoryList = getCategoryList.getCategoryListAction("",0,0,"0");
							  for(int i=0;i<CategoryList.size();i++){
							    CategoryVo pvo = new CategoryVo();
							    pvo = (CategoryVo)CategoryList.get(i);
							  %>
                        <option value="<%=pvo.getId()%>"><%=pvo.getName()%></option>
                        <%} %>
                      </select>
                <font color='#FF0000'>*</font>					</td>
                  </tr>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='11%'>简介：</td>
                    <td width='27%'><input name='summary' type='text' id='summary' size='35' maxlength='200' value='<%=vo.getSummary() %>'></td>
                    <td class='tdbg5' align='right'  width='10%'>&nbsp;</td>
                    <td width='54%'><label></label><label></label></td>
                  </tr>
				  
				  <!--    <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='11%'>图片：：</td>
                    <td colspan="3"><input name='pic' type='text' id='pic' size='35' maxlength='200'  value='<%=vo.getPic() %>'>
                          <font color='#FF0000'>*</font><img src="../upload/<%=vo.getPic() %>">
			          <iframe  frameborder=0 scrolling=no width="500" height="25" src="up.jsp"  style="top:2px"  ></iframe></td>
				  </tr>-->
				  
				  
				  
				  						                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='11%'>文章说明：</td>
                            <td colspan="3"><textarea name="content" cols="70" rows="10" id="content"><%=vo.getContent() %></textarea>
                              <font color='#FF0000'>*</font> </td>
                        </tr>
                </table></td>
            </tr>
    </table>
    <table width='100%' height='40'><tr align='center'><td>
        <input type='hidden' name='Action' value='SaveModify'>
		<input type='hidden' name='id' value='<%=vo.getId() %>'>
		<input type='hidden' name='type' value='<%=type%>'>
		<input type='hidden' name='pages' value='<%=pages%>'>
		
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
  	 String   summary  = s.trimStr(request.getParameter("summary"));
	 String   content  = s.trimStr(request.getParameter("content"));
	 
	 String   categoryid  = s.trimStr(request.getParameter("categoryid"));


 String   pic  = s.trimStr(request.getParameter("pic"));
	
	
	 ContentVo vo = new ContentVo();
	 ContentAction tContentAction = new ContentAction();

	 vo.setName(name);
	 vo.setSummary(summary);
	vo.setCategoryid(Integer.parseInt(categoryid));
	vo.setContent(content);
vo.setPic(pic);
	   
	 int status = tContentAction.insertContentAction(vo);
	 response.sendRedirect("Admin_Content.jsp?Action=Main"); 

}


if("SaveModify".equals(Action)){

String pages = request.getParameter("pages");
if(pages==null) pages = "0";

    String id = request.getParameter("id");
     String   name = s.trimStr(request.getParameter("name"));
  	 String   summary  = s.trimStr(request.getParameter("summary"));
	 String   content  = s.trimStr(request.getParameter("content"));
	 
	 String   categoryid  = s.trimStr(request.getParameter("categoryid"));

		 String   pic  = s.trimStr(request.getParameter("pic"));
		
		

		 
	 ContentVo vo = new ContentVo();
	 ContentAction tContentAction = new ContentAction();
	 vo.setId(Integer.parseInt(id));
	 vo.setName(name);
	 vo.setSummary(summary);
	vo.setCategoryid(Integer.parseInt(categoryid));
	vo.setContent(content);
	vo.setPic(pic);
				
				

	 int status = tContentAction.updateContentAction(vo);
 response.sendRedirect("Admin_Content.jsp?Action=Main&pages="+pages);
}

if("del".equals(Action)){
	ContentAction tContentAction = new ContentAction();
	String id = request.getParameter("id");
 	int status = tContentAction.delContentAction(Integer.parseInt(id));
 response.sendRedirect("Admin_Content.jsp?Action=Main");
}




if("DelAll".equals(Action)){

ContentAction tContentAction = new ContentAction();
String[] ContentID= request.getParameterValues("ContentID");//

tContentAction.delContentAction(ContentID);
 response.sendRedirect("Admin_Content.jsp?Action=Main");


}
%>

