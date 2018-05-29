<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
　<%@ page import="com.yi.*" %>
<%@page import="com.yi.util.StringUtils"%>
<%
StringUtils  s = new StringUtils();
String privateid = "";

privateid = (String)session.getAttribute("privateid");
out.print(privateid);

 %>
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<title>管理导航菜单</title>
<script src="prototype.js"></script>
    <script language=javascript>
	
	function checkPrivate(privateid){

 		var pirvate = []  ;
		pirvate = privateid.split(",");

	    
		for(j=0;j<pirvate.length;j++){
			 document.getElementById('menu'+pirvate[j]).style.display="";
		}
	}    
 
 
 </script>
<link href='Admin_left.CSS' rel='stylesheet' type='text/css'>
</head>
<BODY leftmargin='0' topmargin='0' marginheight='0' marginwidth='0'  onLoad="checkPrivate('<%=privateid %>');">
<table width=180 border='0' align=center cellpadding=0 cellspacing=0>
  <tr>
    <td height=44 valign=top><img src='Images/title.gif'></td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=180 align=center>
  <tr>
    <td height=26 class=menu_title onMouseOver="this.className='menu_title2';" onMouseOut="this.className='menu_title';" background='Images/title_bg_quit.gif' id='menuTitle0'>&nbsp;&nbsp;<a href='Admin_Index_Main.asp' target='main'><b><span class='glow'>管理首页</span></b></a><span class='glow'> | <a href='logout.jsp' target='_top'><b><span class='glow'>退出</span></b> </a>  </td>
  </tr>
  <tr>
    <td height=97 background='Images/title_bg_admin.gif' style='display:' id='submenu0'><div style='width:180'>
        <table cellpadding=0 cellspacing=0 align=center width=130>
          <tr>
            <td height=25>您的用户名：：<%=(String)session.getAttribute("username")%></td>
          </tr>
          <tr>
            <td height=25>

            </td>
          </tr>
        </table>
      </div>
        <div  style='width:167'>
          <table cellpadding=0 cellspacing=0 align=center width=130>
            <tr>
              <td height=20></td>
            </tr>
          </table>
      </div></td>
  </tr>
</table>


<div id=menu7 style="display:">		
<table cellpadding=0 cellspacing=0 width=167 align=center>
          <tr>
            <td height=28 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background='Images/admin_left_05.gif' id=menuTitle199 onClick="new Element.toggle('submenu199')" style='cursor:hand;'><span class=glow>分类管理</span></a></td></tr><tr><td  align='right' id='submenu199'><div class=sec_menu style='width:165'><table cellpadding=0 cellspacing=0 align=center width=130>
                  <tr>
                    <td height=20><a href=Admin_Category.jsp?Action=Add&type=1 target=main>添加分类</a></td>
                  </tr>
                  <tr>
                    <td height=20><a href=Admin_Category.jsp?Action=Main&type=1  target=main>分类管理</a></td>
                  </tr>
                    
                </table>
              </div>
                <div  style='width:167'>
                  <table cellpadding=0 cellspacing=0 align=center width=130>
                    <tr>
                      <td height=5></td>
                    </tr>
                  </table>
              </div></td>
          </tr>
        </table>
		
</div>
<div id=menu8 style="display:">		
		<table cellpadding=0 cellspacing=0 width=167 align=center>
          <tr>
            <td height=28 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background='Images/admin_left_05.gif' id=menuTitle215 onClick="new Element.toggle('submenu215')" style='cursor:hand;'><span class=glow>文章管理</span></a></td></tr><tr><td  align='right' id='submenu215'><div class=sec_menu style='width:165'><table cellpadding=0 cellspacing=0 align=center width=130>
                  <tr>
                    <td height=20><a href=Admin_Content.jsp?Action=Add target=main>添加文章</a></td>
                  </tr>
                  <tr>
                    <td height=20><a href=Admin_Content.jsp?Action=Main  target=main>文章管理</a></td>
                  </tr>
                    
                </table>
              </div>
                <div  style='width:167'>
                  <table cellpadding=0 cellspacing=0 align=center width=130>
                    <tr>
                      <td height=5></td>
                    </tr>
                  </table>
              </div></td>
          </tr>
        </table>
</div>
<!--

<div id=menu19 style="display:">
		<table cellpadding=0 cellspacing=0 width=167 align=center>
          <tr>
            <td height=28 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background='Images/admin_left_05.gif' id=menuTitle213 onClick="new Element.toggle('submenu213')" style='cursor:hand;'><span class=glow>商城信息管理</span></a></td></tr><tr><td  align='right' id='submenu213'><div class=sec_menu style='width:165'><table cellpadding=0 cellspacing=0 align=center width=130>
                  <tr>
                    <td height=20><a href=Admin_Market.jsp?Action=Add target=main>添加商品信息</a></td>
                  </tr>
                  <tr>
                    <td height=20><a href=Admin_Market.jsp?Action=Main  target=main>商品信息管理</a></td>
                  </tr>
                    
                </table>
              </div>
                <div  style='width:167'>
                  <table cellpadding=0 cellspacing=0 align=center width=130>
                    <tr>
                      <td height=5></td>
                    </tr>
                  </table>
              </div></td>
          </tr>
        </table>
		
		  
</div>-->


<!--

<div id=menu20 style="display:">
		<table cellpadding=0 cellspacing=0 width=167 align=center>
          <tr>
            <td height=28 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background='Images/admin_left_05.gif' id=menuTitle20 onClick="new Element.toggle('submenu20')" style='cursor:hand;'><span class=glow>轮播图管理</span></a></td></tr><tr><td  align='right' id='submenu20'><div class=sec_menu style='width:165'><table cellpadding=0 cellspacing=0 align=center width=130>
                  <tr>
                    <td height=20><a href=Admin_ADInfo.jsp?Action=Add target=main>添加轮播图</a></td>
                  </tr>
                  <tr>
                    <td height=20><a href=Admin_ADInfo.jsp?Action=Main  target=main>轮播图管理</a></td>
                  </tr>
                    
                </table>
              </div>
                <div  style='width:167'>
                  <table cellpadding=0 cellspacing=0 align=center width=130>
                    <tr>
                      <td height=5></td>
                    </tr>
                  </table>
              </div></td>
          </tr>
        </table>
		
		  
</div>



<div id=menu25 style="display:">
    <table cellpadding=0 cellspacing=0 width=167 align=center>
        <tr>
            <td height=28 class=menu_title onmouseover=this.className='menu_title25'; onmouseout=this.className='menu_title'; background='Images/admin_left_05.gif' id=menuTitle25 onClick="new Element.toggle('submenu25')" style='cursor:hand;'><span class=glow>报名信息管理</span></a></td></tr><tr><td  align='right' id='submenu25'><div class=sec_menu style='width:165'><table cellpadding=0 cellspacing=0 align=center width=130>
        <tr>
            <td height=20><a href=Admin_Enroll.jsp?Action=Add target=main>添加报名信息</a></td>
        </tr>
        <tr>
            <td height=20><a href=Admin_Enroll.jsp?Action=Main  target=main>报名信息管理</a></td>
        </tr>

    </table>
    </div>
        <div  style='width:167'>
            <table cellpadding=0 cellspacing=0 align=center width=130>
                <tr>
                    <td height=5></td>
                </tr>
            </table>
        </div></td>
    </tr>
    </table>


</div>

<div id=menu21 style="display:">
		<table cellpadding=0 cellspacing=0 width=167 align=center>
          <tr>
            <td height=28 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background='Images/admin_left_05.gif' id=menuTitle21 onClick="new Element.toggle('submenu21')" style='cursor:hand;'><span class=glow>文件管理</span></a></td></tr><tr><td  align='right' id='submenu21'><div class=sec_menu style='width:165'><table cellpadding=0 cellspacing=0 align=center width=130>
                  <tr>
                    <td height=20><a href=Admin_Pic.jsp?Action=Add target=main>添加文件</a></td>
                  </tr>
                  <tr>
                    <td height=20><a href=Admin_Pic.jsp?Action=Main  target=main>文件管理</a></td>
                  </tr>
                    
                </table>
              </div>
                <div  style='width:167'>
                  <table cellpadding=0 cellspacing=0 align=center width=130>
                    <tr>
                      <td height=5></td>
                    </tr>
                  </table>
              </div></td>
          </tr>
        </table>
		
		  
</div>


-->
<!--
<div id=menu22 style="display:">
		<table cellpadding=0 cellspacing=0 width=167 align=center>
          <tr>
            <td height=28 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background='Images/admin_left_05.gif' id=menuTitle22 onClick="new Element.toggle('submenu22')" style='cursor:hand;'><span class=glow>注册用户管理</span></a></td></tr><tr><td  align='right' id='submenu22'><div class=sec_menu style='width:165'><table cellpadding=0 cellspacing=0 align=center width=130>
                  <tr>
                    <td height=20><a href=Admin_User.jsp?Action=Add target=main>添加注册用户</a></td>
					                   
                  </tr>
                  <tr>
                    <td height=20><a href=Admin_User.jsp?Action=Main  target=main>注册用户管理</a></td>
                  </tr>
                    
                </table>
              </div>
                <div  style='width:167'>
                  <table cellpadding=0 cellspacing=0 align=center width=130>
                    <tr>
                      <td height=5></td>
                    </tr>
                  </table>
              </div></td>
          </tr>
        </table>
		
		  
</div>

-->
<div id=menu13 style="display:">
		<table cellpadding=0 cellspacing=0 width=167 align=center>
          <tr>
            <td height=28 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background='Images/admin_left_05.gif' id=menuTitle218 onClick="new Element.toggle('submenu218')" style='cursor:hand;'><span class=glow>管理员信息管理</span></a></td></tr><tr><td  align='right' id='submenu218'><div class=sec_menu style='width:165'><table cellpadding=0 cellspacing=0 align=center width=130>
                  <tr>
                    <td height=20><a href=Admin_UserInfo.jsp?Action=Add target=main>添加管理员信息</a></td>
                  </tr>
                  <tr>
                    <td height=20><a href=Admin_UserInfo.jsp?Action=Main  target=main>管理员信息管理</a></td>
                  </tr>
                    
                </table>
              </div>
                <div  style='width:167'>
                  <table cellpadding=0 cellspacing=0 align=center width=130>
                    <tr>
                      <td height=5></td>
                    </tr>
                  </table>
              </div></td>
          </tr>
        </table>
		</div>

<div id=menu17 style="display:">
		
		<table cellpadding=0 cellspacing=0 width=167 align=center>
          <tr>
            <td height=28 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background='Images/admin_left_05.gif' id=menuTitle222 
			 onClick="new Element.toggle('submenu222')" style='cursor:hand;'><span class=glow>权限管理</span></a></td></tr><tr><td  align='right' id='submenu222'><div class=sec_menu style='width:165'><table cellpadding=0 cellspacing=0 align=center width=130>
                <tr>
                    <td height=20><a href=Admin_Role.jsp?Action=Add target=main>添加权限</a></td>
                  </tr>
                  <tr>
                    <td height=20><a href=Admin_Role.jsp?Action=Main  target=main>权限管理</a></td>
                  </tr>
                    
                </table>
              </div>
                <div  style='width:167'>
                  <table cellpadding=0 cellspacing=0 align=center width=130>
                    <tr>
                      <td height=5></td>
                    </tr>
                  </table>
              </div></td>
          </tr>
        </table>
		
		</div>
		

<table cellpadding=0 cellspacing=0 width=167 align=center>
  <tr>
    <td height=28 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background='Images/admin_left_04.gif' id=menuTitle208><span>系统信息</span> </td>
  </tr>
  <tr>
    <td align='right'><div class=sec_menu style='width:165'>
        <table cellpadding=0 cellspacing=0 align=center width=130>
          <tr>
            <td height=20><br>
              版权所有：&nbsp;<a href='http://www.powereasy.net/' target=_blank>小议网络</a><br>
              设计制作：&nbsp;<a href='http://www.powereasy.net/' target=_blank>小议网络</a><BR>
              <br>
            </td>
          </tr>
        </table>
    </div></td>
  </tr>
</table>
</body>
</html>

