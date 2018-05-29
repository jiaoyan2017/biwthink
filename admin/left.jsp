<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.yi.Action.CategoryAction"%>
<%@page import="com.yi.vo.CategoryVo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 <html xmlns="http://www.w3.org/1999/xhtml" >
<head >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>家居商城_搜房家居商城</title>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
 
    <script language=javascript>
	
	function setCategory(id,name)
{
alert(id);
alert(name);

var s=document.getElementById("choose");
  s.options[id]=new Option(id,name);
  s.options.
  s.options[s.options.length]=new Option("A","B");
 }    	


    function CheckSubmit(){
	
	alert (document.myform.choose.value);
        if(document.myform.choose.value==''){
            alert('分类名称不能为空！');
            document.myform.name.focus();
            return false;
        }

    }
    </script>
</head>
<body>

<br /><br />


<div class="sort">

<%
CategoryAction ca = new CategoryAction();
List caList = ca.getCategoryListByParentIdAction("0","1");

for (int i=0;i<caList.size();i++){
CategoryVo caVo = (CategoryVo)caList.get(i);

 %>     
<ul name="sn_ul">

<h4 id='hqb1_<%=caVo.getId() %>'><a href="class.jsp?id=<%=caVo.getId() %>&grade=1&name=<%=caVo.getName() %>" target="_blank"><%=caVo.getName() %></a></h4>

	      <p id='hqb2_<%=caVo.getId() %>'> 
	      
	      <%
	        CategoryAction ca1 = new CategoryAction();
			List caList1 = ca1.getCategoryListByParentIdAction(caVo.getId()+"","1");
			//for (int j=0;j<caList1.size();j++){
			//CategoryVo caVo1 = (CategoryVo)caList1.get(j);
	       %>
	      
		  <a target="_blank" href='class.jsp?id=<%//=caVo1.getId()%>&grade=2&name=<%//=caVo1.getName() %>'><%//=caVo1.getName() %></a>
		  <%//} %>
		  </p>
		  
	<div class="clear"></div>
	
<div class="sort_list" style="top:-1px; display:none">
<dl><span style="margin-top:0"></span>
	<%
	
			for (int j=0;j<caList1.size();j++){
			CategoryVo caVo12 = (CategoryVo)caList1.get(j);
	
	 %>
			<li><dt><a target="_blank" href='class.jsp?id=<%=caVo12.getId() %>&grade=2&name=<%=caVo12.getName() %>'><%=caVo12.getName() %></a><br /></dt>
				<dd>
				<%
				
				CategoryAction ca3 = new CategoryAction();
				List caList3 = ca3.getCategoryListByParentIdAction(caVo12.getId()+"","1");
				for (int h=0;h<caList3.size();h++){
					CategoryVo caVo3 = (CategoryVo)caList3.get(h);
				
				 %>
				
						<em>| <a  href="#"  onclick="setCategory(<%=caVo3.getId() %>,<%=caVo3.getName()%>);"  ><%=caVo3.getName() %></a></em>
					<%} %>		
							  <br /></dd><br /></li>					
				<%} %>			
		
</dl>
</div>

</ul>
 <%}%>
 
 <form name="myform"  onsubmit="CheckSubmit();">
 <select name="choose" id="choose">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>

</select>

 <label>
 <input type="submit" name="Submit" value="提交" />
 </label>
 </form>
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



</body>
</html>

