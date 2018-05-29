<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
　<%@ page import="com.yi.*" %>
<html>
<head>
<title>顶部管理导航菜单</title>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
<style type='text/css'>
a:link { color:#ffffff;text-decoration:none}
a:hover {color:#ffffff;}
a:visited {color:#f0f0f0;text-decoration:none}
.spa {FONT-SIZE: 9pt; FILTER: Glow(Color=#0F42A6, Strength=2) dropshadow(Color=#0F42A6, OffX=2, OffY=1,); COLOR: #8AADE9; FONT-FAMILY: '宋体'}
img {filter:Alpha(opacity:100); chroma(color=#FFFFFF)}
</style>
<base target='main'>
<script language='JavaScript' type='text/JavaScript'>
function preloadImg(src) {
  var img=new Image();
  img.src=src
}
preloadImg('Images/admin_top_open.gif');

var displayBar=true;
function switchBar(obj) {
  if (displayBar) {
    parent.frame.cols='0,*';
    displayBar=false;
    obj.src='Images/admin_top_open.gif';
    obj.title='打开左边管理导航菜单';
  } else {
    parent.frame.cols='200,*';
    displayBar=true;
    obj.src='Images/admin_top_close.gif';
    obj.title='关闭左边管理导航菜单';
  }
}
</script>
</head>

<body background='Images/admin_top_bg.gif' leftmargin='0' topmargin='0'>
<table width='100%' border='0' cellpadding='0' cellspacing='0'>
  <tr valign='middle'>
  <td width=60><img onclick='switchBar(this)' src='Images/admin_top_close.gif' title='关闭左边管理导航菜单' style='cursor:hand'></td>
<!--  
        <td width=92><a href='Admin_ModifyPwd.asp'><img src='Images/top_an_1.gif' border='0'></a></td>
        <td width=92><a href='Admin_MailList.asp'><img src='Images/top_an_2.gif' border='0'></a></td>

    <td width=104><a href='../User/User_Message.asp' target='_blank'><img src='Images/top_an_4.gif' border='0'></a></td>

        <td width=92><a href='Admin_Cache.asp'><img src='Images/top_an_5.gif' border='0'></a></td>

    <td width=92><a href='http://help.powereasy.net'  target='_blank'><img src='Images/top_an_6.gif' border='0'></a></td>-->
    <td align='right' class='spa'>YI.co.,LTD  Build 2015-08-10</td>
  </tr>
</table>

</body>
</html>
