<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.yi.*" %>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="Admin_STYLE.CSS">
<style type="text/css">
<!--
body {
    background-color: #FFFFFF;
    margin-left: 0px;
}
.STYLE4 {color: #000000}
-->
</style>
</head>
<body topmargin="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="392" rowspan="2"><img src="Images/adminmain01.gif" width="392" height="126"></td>
    <td height="114" valign="top" background="Images/adminmain0line2.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="20"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="8"><img src="Images/adminmain0line.gif" width="283" height="1" /></td>
      </tr>
      <tr>
        <td><div id="peinfo1"></div><div id="peinfo2" style="z-index: 1; visibility: hidden; position: absolute"></div>
          <div id="peinfo5" style=" visibility: hidden;"></div>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="9" valign="bottom" background="Images/adminmain03.gif"><img src="Images/adminmain02.gif" width="23" height="12"></td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" border="0" cellpadding="3" cellspacing="0">
      
      <tr>
        <td width="31%" height="87" align="right"><table width="94%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>您好， </td>
          </tr>
          <tr>
            <td valign="top">今天是
              <script language="JavaScript" type="text/JavaScript" src="../js/Date.js"></script></td>
          </tr>
          <tr>
            <td valign="top"></td>
          </tr>
        </table></td>
        <td width="1%"><table width="3" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="3" height="65" bgcolor="#1890CC"></td>
            </tr>
        </table></td>
        <td width="68%">欢迎您进入网站后台管理系统！在这里您可以利用系统提供的强大的HTML生成功能，便捷的后台管理功能，栏目无限级分类，任意添加网站频道功能，
栏目批量设置、批量移动等功能有效地管理网站。</td>
      </tr>
      <tr>
        <td height="5" colspan="3"></td>
        </tr>
    </table></td>
  </tr>
</table>


<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20"></td>
    <td width="180" valign="top"></td>
    <td width="20"></td>
    <td width="180" valign="top"></td>
    <td width="20"></td>
    <td width="180" valign="top"></td>
    <td width="20"></td>
    <td width="120" valign="top"></td>
    <td width="20"></td>
    <td width="120" valign="top"></td>
    <td width="20"></td>
    <td width="120" valign="top"></td>
  </tr>
</table>


<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<table width="100%" height="10"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td></td>
  </tr>
</table>
<br>
<table cellpadding="2" cellspacing="1" border="0" width="100%" class="border" align=center>
  <tr align="center">
    <td height=25 colspan=2 class="topbg"><span class="Glow">服 务 器 信 息</span>
  </tr>
  <tr class="tdbg" height=23>
    <td width="50%">服务器类型：    (I)</td>
    <td width="50%">脚本解释引擎：    </td>
  </tr>
  <tr class="tdbg" height=23>
    <td width="50%">站点物理路径：      </td>
    <td width="50%">数据库使用：</td>
  </tr>
  <tr class="tdbg" height=23>
    <td width="50%">FSO文本读写：</td>
    <td width="50%">数据流读写：</td>
  </tr>
  <tr class="tdbg" height=23>
    <td width="50%">XMLHTTP组件支持：</td>
    <td width="50%">XMLDOM组件支持：</td>
  </tr>
  <tr class="tdbg" height=23>
    <td width="50%">XML组件支持：</td>
    <td width="50%">AspJpeg组件支持：</td>
  </tr>
  
  <tr class="tdbg" height=23>
    <td width="50%">Jmail组件支持：</td>
    <td width="50%">CDONTS组件支持：</td>
  </tr>
  <tr class="tdbg" height=23>
    <td width="50%">ASPEMAIL组件支持：</td>
    <td width="50%">WebEasyMail组件支持：</td>
  </tr>
  <tr class="tdbg" height=23>
    <td width="50%"> </td>
    <td width="50%" align="right"><!--<a href="Admin_ServerInfo.asp">点此查看更详细的服务器信息&gt;&gt;&gt;</a>--></td>
  </tr>
</table>
<br>
<table cellpadding="2" cellspacing="1" border="0" width="100%" class="border" align=center>
  <tr align="center">
    <td height=25 class="topbg"><span class="Glow">Copyright 2013-2016 &copy;  All Rights Reserved.</span>  
  </tr>
</table>
<div id="peinfo3" style="height:1;overflow=auto;visibility:hidden;">

</div>
<div id="peinfo4" style="height:1;overflow=auto;visibility:hidden;">

</div>
</body>
</html>
