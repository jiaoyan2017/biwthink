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

<html><head><title>团购商品信息管理<%=Action %></title>
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
            alert('商品名称不能为空！');
            document.myform.name.focus();
            return false;
        }
        if(document.myform.pic.value==''){
            alert('图片不能为空！');
            document.myform.pic.focus();
            return false;
        }
if(document.myform.companyid.value==''){
            alert('商家名称不能为空！');
            document.myform.companyid.focus();
            return false;
        }
        if(document.myform.uptime.value==''){
            alert('上线时间不能为空！');
            document.myform.uptime.focus();
            return false;
        }
		
if(document.myform.downtime.value==''){
            alert('下线时间不能为空！');
            document.myform.downtime.focus();
            return false;
        }
		
		
        if(document.myform.tel.value==''){
            alert('助记名称不能为空！');
            document.myform.tel.focus();
            return false;
        }
		
if(document.myform.oldprice.value==''){
            alert('原价格不能为空！');
            document.myform.oldprice.focus();
            return false;
        }
        if(document.myform.nowprice.value==''){
            alert('折后价格不能为空！');
            document.myform.nowprice.focus();
            return false;
        }	
		
		        if(document.myform.address.value==''){
            alert('地址不能为空！');
            document.myform.address.focus();
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
<script language="javascript" type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
</head>
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>


<table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
  <form name='searchmyform' action='Admin_Product.jsp' method='get'>
  <tr class='tdbg'>
    <td height='30'>
        &nbsp;&nbsp;&nbsp;&nbsp;<a href='Admin_Product.jsp'>团购商品信息管理首页</a>&nbsp;|&nbsp;<a href='Admin_Product.jsp?Action=Add'>添加团购商品信息</a><%=Action %>
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

recordCount = count.getRecordCount("tbproduct",type);

PageBean pageView = new PageBean(recordCount,Integer.parseInt(pages));



ProductAction getProductList =new ProductAction();
List ProductList = new ArrayList();


ProductList = getProductList.getProductListAction(Keyword,pageView.getFromIndex(),pageView.getPageSize());
 %>
    <table width='100%' border='0' cellpadding='0' cellspacing='0'>
      <tr>
      <form name='myform' method='Post' action='Admin_Product.jsp'>
          <td>
          <table width='100%' border='0' align='center' cellpadding='2' cellspacing='1' class='border'>
            <tr class='title' height='22' align='center'>
              <td width='26'>选中</td>
              <td>商品名称</td><td width="162">所属商家</td>
              <td>销售数量</td>
              <td width="677">商品简介</td>
              <td width='148'>操作</td>
            </tr>
    

        <tr><td colspan='20' height='50' align='center'>共找到 <font color=red><%=recordCount%></font> 个团购商品信息</td></tr>
  <%for (int i=0;i<ProductList.size();i++) {
  ProductVo vo = new ProductVo();
  
  vo = (ProductVo)ProductList.get(i);
  %>
                  <tr class='tdbg' onMouseOut="this.className='tdbg'" onMouseOver="this.className='tdbgmouseover'">
                    <td width='26' align='center'>
                    <input name='ProductID' type='checkbox' onClick="unselectall()" id='ProductID' value='<%=vo.getId() %>'></td>
                    <td width='178'><a href='Admin_Product.jsp'><%=vo.getName() %></a></td>
                    <td><%=vo.getCompanyName() %></td>
                    <td width='96'><%=vo.getSum() %></td>
                    <td><%=vo.getSummary() %></td>
                    <td width='148' align='center'>
          
            <a href='Admin_Product.jsp?Action=Modify&id=<%=vo.getId() %>&type=<%=type%>&pages=<%=pages%>'>修改</a>&nbsp;
            <a href='Admin_Product.jsp?Action=del&id=<%=vo.getId() %>' onClick='return confirm("确定要删除此团购商品信息吗？");'>删除</a>                    </td>
                  </tr>
<%} %>
           
          </table>
  
              <table width='100%' border='0' cellpadding='0' cellspacing='0'>
                <tr height='30'>
                  <td width='375'><input name='chkAll' type='checkbox' id='chkAll' onclick='CheckAll(this.form);' value='checkbox'>
                  选中本页显示的所有团购商品信息</td>
                  <td width="946"><input type='hidden' name='Action' value='DelAll'>
                  <input name='Del' type='submit' value=' 批量删除 ' onClick="document.myform.Action.value='DelAll';return confirm('确定要删除选定的团购商品信息吗？');">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                 
                </tr>
              </table>
              
              <a href=Admin_Product.jsp?Action=Main&pages=<%=pageView.getCurrentPage()-1 %>&Keyword=<%=Keyword%>>上一页</a>  共<%=pageView.getPageSize() %>页  第<%=pageView.getCurrentPage() %>页 <a href=Admin_Product.jsp?Action=Main&pages=<%=pageView.getCurrentPage()+1 %>&Keyword=<%=Keyword%>>下一页</a>
          </td>
      </form>
      </tr>
    </table>
   

    <br>
    <form name='SearchForm' action='Admin_Product.jsp' method='post'>
    <table width='100%'  border='0' align='center' cellpadding='1' cellspacing='1' class='border'>
      <tr class='tdbg'>
        <td width='196'><b>团购商品信息查询：</b></td>
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
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Product.jsp'>团购商品信息管理</a>&nbsp;&gt;&gt;&nbsp;添加团购商品信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Product.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
                <td height='100' valign='top'>
                    <table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='11%'>团购商品名称：</td>
                            <td width='35%'><input name='name' type='text' id='name' size='70' maxlength='200'> <font color='#FF0000'>*</font></td>
                            <td class='tdbg5' align='right'  width='5%'>简介：</td>
                          <td width='49%'><input name='summary' type='text' id='summary' size='100' maxlength='200' value=''></td>
                        </tr>
    
                        <tr class='tdbg' height="25">
                            <td class='tdbg5' align='right'  width='11%'>图片：</td>
                          <td colspan="3" valign="baseline"><input name='pic' type='text' id='pic' size='35' maxlength='200'>
                            <font color='#FF0000'>*</font>							
							<iframe  frameborder=0 scrolling=no width="500" height="25" src="up.jsp"  style="top:2px"  ></iframe>						  </td>
                        </tr>
							
												  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='11%'>地图：</td>
                    <td colspan="3"><input name='addresspic' type='text' id='addresspic' size='35' maxlength='200'>
                            <font color='#FF0000'>*</font>							
							<iframe  frameborder=0 scrolling=no width="500" height="25" src="uppic.jsp"  style="top:2px"  ></iframe></td>
                    </tr>
						                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='11%'>所属团购商家：</td>
                            <td width='35%'>
                            					<select name="companyid">
							  <option selected="selected" value="0">请选择...</option>
							  <%
							  TuanCompanyAction getCompanyList =new TuanCompanyAction();
							  List CompanyList = new ArrayList();
							  CompanyList = getCompanyList.getTuanCompnayListAction("",0,0,"1");
							  for(int i=0;i<CompanyList.size();i++){
							    TuanCompanyVo vo = new TuanCompanyVo();
							    vo = (TuanCompanyVo)CompanyList.get(i);
							  %>
							  <option value="<%=vo.getId()%>"><%=vo.getCompany()%></option>
							  <%} %>
							</select>
                            					<font color='#FF0000'>*</font> </td>
							
							
		
							
							
                            <td class='tdbg5' align='right'  width='5%'>原价格：</td>
                            <td width='49%'><input name='oldprice' type='text' id='oldprice' size='35' maxlength='200'>
                              <font color='#FF0000'>*</font></td>
                        </tr>
						
						
						
						    <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='11%'>所属区域：</td>
                            <td width='35%'>
                            					<select name="areaid">
							  <option selected="selected" value="0">请选择...</option>
							  <%
							  AreaAction getAreaList =new AreaAction();
							  List AreaList = new ArrayList();
							  AreaList = getAreaList.getAreaListAction("",0,0);
							  for(int i=0;i<AreaList.size();i++){
							    AreaVo vo = new AreaVo();
							    vo = (AreaVo)AreaList.get(i);
							  %>
							  <option value="<%=vo.getId()%>"><%=vo.getName()%></option>
							  <%} %>
							</select>
           					  <font color='#FF0000'>*</font> </td>
							
							
		
							
							
                            <td class='tdbg5' align='right'  width='5%'>分类：</td>
                            <td width='49%'><select name="categoryid">
							  <option selected="selected" value="0">请选择...</option>
							  <%
							  CategoryAction getCategoryList =new CategoryAction();
							  List CategoryList = new ArrayList();
							  CategoryList = getCategoryList.getCategoryListAction("",0,0,"3");
							  for(int i=0;i<CategoryList.size();i++){
							    CategoryVo vo = new CategoryVo();
							    vo = (CategoryVo)CategoryList.get(i);
							  %>
							  <option value="<%=vo.getId()%>"><%=vo.getName()%></option>
							  <%} %>
							</select>
                              <font color='#FF0000'>*</font></td>
                        </tr>
						
												                        <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='11%'>上线时间：</td>
                            <td width='35%'>
							<input name='uptime' type='text' id='uptime' size='35' maxlength='200'   class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})">
							<font color='#FF0000'>*</font> </td>
							
							
                            <td class='tdbg5' align='right'  width='5%'>折后价格：</td>
                            <td width='49%'><input name='nowprice' type='text' id='nowprice' size='35' maxlength='200'>
                              <font color='#FF0000'>*</font></td>
                        </tr>
						
						<tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='11%'>下线时间：</td>
                          <td width='35%'><input name='downtime' type='text' id='downtime' size='35' maxlength='200'  class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})">
                          <font color='#FF0000'>*</font> </td>
							
							
                            <td class='tdbg5' align='right'  width='5%'>销售数：</td>
                          <td width='49%'><input name='sum' type='text' id='sum' size='35' maxlength='200'></td>
                        </tr>
						
						
						<tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='11%'>地址 ：</td>
                            <td width='35%'><input name='address' type='text' id='address' size='35' maxlength='200'  >
                          <font color='#FF0000'>*</font> </td>
							
							
                            <td class='tdbg5' align='right'  width='5%'>是否热卖：</td>
                            <td width='49%'><label>
                              <input type="radio" name="ishot" value="1">
                              热卖 </label>
                              <label>
                              <input type="radio" name="ishot" checked value="0">
                          非热卖                          </label></td>
						</tr>
						
						
												<tr class='tdbg'>
                            
                            <td class='tdbg5'  align='right' ><span class="tdbg5">是否首页显示：</span></td>
                            <td><label>
                              <input type="radio" name="isview" value="1">
                              显示 </label>
                              <label>
                              <input type="radio" name="isview" checked value="0">
                              不显示 </label></td>
							<td class='tdbg5' align='right'  width='5%'>是否退款：</td>
                            <td>
							<label>
                              <input type="radio" name="isreturn" value="1">退款                            </label>
                              <label>
                            <input type="radio" name="isreturn" checked value="0">不退款							 </label>													</td>
							</tr>
							
							
								<tr class='tdbg'>
                            
                            <td class='tdbg5'  align='right' ><span class="tdbg5">显示顺序：</span></td>
                            <td><input name='sort' type='text' id='sort' size='35' maxlength='200'  ></td>
							<td  align='right'  class='tdbg5'  width='5%'>商品数量：</td>
                            <td><input name='count' type='text' id='count' size='35' maxlength='200'>												</td>
							</tr>
						
												<tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='11%'>产品说明：</td>
                            <td colspan="3"><textarea name="textarea" cols="70" rows="10" id="textarea"></textarea>
                              <font color='#FF0000'>*</font> </td>
                            </tr>
                    </table>
    
                </td>
            </tr>
    </table>
	
	
    <table width='100%' height='40'><tr align='center'><td><input type='hidden' name='type' value='<%=type%>'>
        <input type='hidden' name='Action' value='SaveAdd'>
        <input type='submit' name='Submit' value='保存团购商品信息信息'>
    </td></tr></table>
    </form>
	<ckfinder:setupCKEditor basePath="../ckfinder/" editor="content" />  
<ckeditor:replace replace="content" basePath="../ckeditor/" />  
<% }%>
<%if("Modify".equals(Action)){
String id = request.getParameter("id");

String pages = request.getParameter("pages");
if(pages==null) pages = "0";

ProductAction getInfo = new ProductAction();
ProductVo vo = new ProductVo();
vo = getInfo.getProductInfoAction(Integer.parseInt(id));
%>
    <br><table width='100%'><tr><td align='left'>您现在的位置：<a href='Admin_Product.jsp'>团购商品信息管理</a>&nbsp;&gt;&gt;&nbsp;修改团购商品信息信息</td></tr></table>
    <form name='myform' id='myform' action='Admin_Product.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
              <td height='100' valign='top'><table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>团购商品名称：</td>
                    <td width='38%'><input name='name' type='text' id='name' size='70' maxlength='200' value='<%=vo.getName() %>'>
                        <font color='#FF0000'>*</font></td>
                    <td class='tdbg5' align='right'  width='12%'>简介：</td>
                    <td width='38%'><input name='summary' type='text' id='summary' size='100' maxlength='200'  value='<%=vo.getSummary() %>'></td>
                  </tr>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>图片：</td>
                    <td colspan="3"><input name='pic' type='text' id='pic' size='35' maxlength='200' value='<%=vo.getPic() %>'>
					
					  <font color='#FF0000'>*</font><img src="../upload/<%=vo.getPic() %>">
					<iframe  frameborder=0 scrolling=no width="500" height="25" src="up.jsp"  style="top:2px"  ></iframe>
                            <label><font color =#FF0000 size = 2>jpg|gif|png|bmp</font> </label>					</td>
                  </tr>
				  
				  
				  				  
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='11%'>图片：：</td>
                    <td colspan="3"><input name='addresspic' type='text' id='addresspic' size='35' maxlength='200'  value='<%=vo.getAddresspic() %>'>
                        <font color='#FF0000'>*</font><img src="../upload/<%=vo.getAddresspic() %>">
                        <iframe  frameborder=0 scrolling=no width="500" height="25" src="uppic.jsp"  style="top:2px"  ></iframe></td>
                  </tr>	
				  
				  
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>所属团购商家：</td>
                    <td width='38%'>


	<select name="companyid">
	
	                            <%
                              TuanCompanyAction getCompanyList =new TuanCompanyAction();
                              
							  TuanCompanyVo ovo = (TuanCompanyVo)getCompanyList.getTuanCompnayInfoAction(vo.getCompanyid());
						%>
                             <option selected="selected"  value="<%=ovo.getId()%>"><%=ovo.getCompany()%></option>
	
							 
							  <%
							
							  List CompanyList = new ArrayList();
							  CompanyList = getCompanyList.getTuanCompnayListAction("",0,0,"1");
							  for(int i=0;i<CompanyList.size();i++){
							    TuanCompanyVo cvo = new TuanCompanyVo();
							    cvo = (TuanCompanyVo)CompanyList.get(i);
							  %>
							  <option value="<%=cvo.getId()%>"><%=cvo.getCompany()%></option>
							  <%} %>
					  </select>
    <font color='#FF0000'>*</font> </td>
                    <td class='tdbg5' align='right'  width='12%'>原价格：</td>
                    <td width='38%'><input name='oldprice' type='text' id='oldprice' size='35' maxlength='200' value='<%=vo.getOldprice() %>'>
                      <font color='#FF0000'>*</font></td>
                  </tr>
				  
				  
				  
				  
						    <tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>所属区域：</td>
                            <td width='38%'>
                            					<select name="areaid">       <%
                              AreaAction getAreaList =new AreaAction();
                              
							  AreaVo aovo = (AreaVo)getAreaList.getAreaInfoAction(vo.getAreaid());
						%>
                             <option selected="selected"  value="<%=aovo.getId()%>"><%=aovo.getName()%></option>
	
												
												
												
							
							  <%
							  AreaAction areaList =new AreaAction();
							  List AreaList = new ArrayList();
							  AreaList = areaList.getAreaListAction("",0,0);
							  for(int i=0;i<AreaList.size();i++){
							    AreaVo avo = new AreaVo();
							    avo = (AreaVo)AreaList.get(i);
							  %>
							  <option value="<%=avo.getId()%>"><%=avo.getName()%></option>
							  <%} %>
							</select>
                            					<font color='#FF0000'>*</font> </td>
							
							
		
							
							
                            <td class='tdbg5' align='right'  width='12%'>分类：</td>
                            <td width='38%'><select name="categoryid">
                                    <%
                              CategoryAction cagegoryList =new CategoryAction();
                              
							  CategoryVo covo = (CategoryVo)cagegoryList.getCategoryInfoAction(vo.getCategoryid());
						%>
                             <option selected="selected"  value="<%=covo.getId()%>"><%=covo.getName()%></option>
	
                              <%
							  CategoryAction getCategoryList =new CategoryAction();
							  List CategoryList = new ArrayList();
							  CategoryList = getCategoryList.getCategoryListAction("",0,0,"3");
							  for(int i=0;i<CategoryList.size();i++){
							    CategoryVo cvo = new CategoryVo();
							    cvo = (CategoryVo)CategoryList.get(i);
							  %>
                              <option value="<%=cvo.getId()%>"><%=cvo.getName()%></option>
                              <%} %>
                            </select>
                              <font color='#FF0000'>*</font></td>
                        </tr>
				  
				  
				  
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>上线时间：</td>
                    <td width='38%'><input name='uptime' type='text' id='uptime' size='35' maxlength='200' value='<%=vo.getUptime() %>'  class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})">
                      <font color='#FF0000'>*</font> </td>
                    <td class='tdbg5' align='right'  width='12%'>折后价格：</td>
                    <td width='38%'><input name='nowprice' type='text' id='nowprice' size='35' maxlength='200' value='<%=vo.getNowprice() %>'>
                      <font color='#FF0000'>*</font></td>
                  </tr>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>下线时间：</td>
                    <td width='38%'><input name='downtime' type='text' id='downtime' size='35' maxlength='200' value='<%=vo.getDowntime() %>'  class="Wdate" onFocus="WdatePicker({isShowClear:false,readOnly:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})">
                      <font color='#FF0000'>*</font> </td>
                    <td class='tdbg5' align='right'  width='12%'>销售数：</td>
                    <td width='38%'><input name='sum' type='text' id='sum' size='35' maxlength='200' value='<%=vo.getSum() %>'></td>
                  </tr>
				  
				  						<tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>地址 ：</td>
                            <td width='38%'><input name='address' type='text' id='address' size='35' maxlength='200'  value='<%=vo.getAddress() %>'>
                            <font color='#FF0000'>*</font> </td>
							
							
                            <td class='tdbg5' align='right'  width='12%'>是否热卖</td>
                            <td width='38%'>  <label>
                      <input type="radio" name="ishot" <%if(vo.getIsHot()==1) out.print("checked"); %> value="1">
                      热卖
                      </label>
                        <label>
                        <input type="radio" name="ishot" <%if(vo.getIsHot()==0) out.print("checked"); %> value="0">
                    非热卖</label>
							  </td>
						</tr>
				  
				  		<tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>是否前台显示：</td>
                          <td><label>
                      <input type="radio" name="isview" <%if(vo.getIsview()==1) out.print("checked"); %> value="1">
                      显示
                      </label>
                        <label>
                        <input type="radio" name="isview" <%if(vo.getIsview()==0) out.print("checked"); %> value="0">
                      不显示</label>																				</td>
                          <td  class='tdbg5' align='right' ><span class="tdbg5">是否退款：</span></td>
                          <td><label>
                      <input type="radio" name="isreturn" <%if(vo.getIsreturn()==1) out.print("checked"); %> value="1">
                      退款</label>
                        <label>
                        <input type="radio" name="isreturn" <%if(vo.getIsreturn()==0) out.print("checked"); %> value="0">
                        不退款</label></td>
		  		</tr><tr class='tdbg'>
                            
                            <td class='tdbg5'  align='right' ><span class="tdbg5">显示顺序：</span></td>
                            <td><input name='sort' type='text' id='sort' size='35' maxlength='200'  value='<%=vo.getSort() %>'></td>
							<td  align='right' class='tdbg5' width='5%'>商品数量：</td>
                            <td><input name='count' type='text' id='count' size='35' maxlength='200'>	
												</td>
							</tr>
						
												<tr class='tdbg'>
                            <td class='tdbg5' align='right'  width='12%'>产品说明：</td>
                            <td colspan="3"><textarea name="content" cols="70" rows="10" id="content"><%=vo.getContent() %></textarea>
                              <font color='#FF0000'>*</font></td>
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
	 
	  String   address  = s.trimStr(request.getParameter("address"));
	   String   areaid  = s.trimStr(request.getParameter("areaid"));
	     String   categoryid  = s.trimStr(request.getParameter("categoryid"));
		 String  ishot   = s.trimStr(request.getParameter("ishot"));
		   String  addresspic   = s.trimStr(request.getParameter("addresspic"));
		   String  sort   = s.trimStr(request.getParameter("sort"));
		 String   count  = s.trimStr(request.getParameter("count"));

	 ProductVo vo = new ProductVo();
	 ProductAction tProductAction = new ProductAction();

	 vo.setName(name);
	 vo.setSummary(summary);
	 vo.setPic(pic);
	 vo.setAddresspic(addresspic);
	 vo.setNowprice(Float.parseFloat(nowprice));
	 vo.setOldprice(oldprice);
	 if("".equals(sum)){
		sum="0";
	 }
	 vo.setSum(Integer.parseInt(sum));
	 vo.setIsview(Integer.parseInt(isview));
	 vo.setUptime(uptime);
	 vo.setDowntime(downtime);
	 vo.setCompanyid(Integer.parseInt(companyid));
	 vo.setIsreturn(Integer.parseInt(isreturn));
		vo.setContent(content);
		vo.setAddress(address);
		vo.setAreaid(Integer.parseInt(areaid));
		vo.setCategoryid(Integer.parseInt(categoryid));
	  vo.setIsHot(Integer.parseInt(ishot));
	  vo.setSort(Integer.parseInt(sort));
	  if("".equals(count)){
		count="-1";
	 }
	  vo.setCount(Integer.parseInt(count));
	 int status = tProductAction.insertProductAction(vo);
	 
	 response.sendRedirect("Admin_Product.jsp?Action=Main");
}


if("SaveModify".equals(Action)){
String pages = request.getParameter("pages");
if(pages==null) pages = "0";
    String id = request.getParameter("id");
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
	  String   address  = s.trimStr(request.getParameter("address"));
	 	   String   areaid  = s.trimStr(request.getParameter("areaid"));
	     String   categoryid  = s.trimStr(request.getParameter("categoryid"));
	     String  ishot   = s.trimStr(request.getParameter("ishot"));
		   String  addresspic   = s.trimStr(request.getParameter("addresspic"));
		   		   String  sort   = s.trimStr(request.getParameter("sort"));
				   
				    String   count  = s.trimStr(request.getParameter("count"));
				   
	 ProductVo vo = new ProductVo();
	 ProductAction tProductAction = new ProductAction();
	 vo.setId(Integer.parseInt(id));
	 	 vo.setAddresspic(addresspic);
	 vo.setName(name);
	 vo.setSummary(summary);
	 vo.setPic(pic);
	 vo.setNowprice(Float.parseFloat(nowprice));
	 
	 
	 vo.setOldprice(oldprice);
	 if("".equals(sum)){
		sum="0";
	 }
	 vo.setSum(Integer.parseInt(sum));
	 vo.setIsview(Integer.parseInt(isview));
	 vo.setUptime(uptime);
	 vo.setDowntime(downtime);
	 vo.setCompanyid(Integer.parseInt(companyid));
	 vo.setIsreturn(Integer.parseInt(isreturn));
		vo.setContent(content);
vo.setAddress(address);
		vo.setAreaid(Integer.parseInt(areaid));
		vo.setCategoryid(Integer.parseInt(categoryid));
		vo.setIsHot(Integer.parseInt(ishot));
		  vo.setSort(Integer.parseInt(sort));
		  
		  	  if("".equals(count)){
		count="-1";
	 }
	  vo.setCount(Integer.parseInt(count));
		  
	 int status = tProductAction.updateProductAction(vo);
	 response.sendRedirect("Admin_Product.jsp?Action=Main&pages="+pages);
}

if("del".equals(Action)){
	ProductAction tProductAction = new ProductAction();
	String id = request.getParameter("id");
 	int status = tProductAction.delProductAction(Integer.parseInt(id));
 		 response.sendRedirect("Admin_Product.jsp?Action=Main");

}




if("DelAll".equals(Action)){


String[] ProductID= request.getParameterValues("ProductID");//
ProductAction tProductAction = new ProductAction();

tProductAction.delProductAction(ProductID);


	 response.sendRedirect("Admin_Product.jsp?Action=Main");



}
%>

