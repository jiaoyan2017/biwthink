<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.yi.Action.ContentAction" %>
<%@page import="com.yi.vo.ContentVo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>铂澳智库</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
<!--
body {
	background-image: url(images/bg.gif);
	margin-left: 0px;
	margin-top: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-family: "微软雅黑";
	color: #828384;
	line-height: 21px;
	font-size: 14px;
}
.STYLE2 {
    font-size: 14px;
	font-family: "微软雅黑";
	color: #5a90ad;
	line-height: 21px;
}
-->
</style>
<script type="text/javascript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>
<body bgcolor="#FFFFFF" onload="MM_preloadImages('images/menu_01b.png','images/menu_04b.png','images/menu_02b.png','images/menu_03b.png','images/menu_05b.png')">
<!-- Save for Web Slices (top.psd) -->
<table width="1025" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="440" bgcolor="#FFFFFF"><img src="images/top_logo.gif" width="440" height="120" /></td>
    <td width="585" valign="top" bgcolor="#FFFFFF"><table width="585" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="11" colspan="7"></td>
      </tr>
      <tr>
        <td width="320">&nbsp;</td>
        <td width="68"><a href="media.jsp"><img src="images/topmenu_01.gif" width="68" height="23" border="0" /></a></td>
        <td width="12">&nbsp;</td>
        <td width="68"><a href="team.jsp"><img src="images/topmenu_02.gif" width="68" height="23" border="0" /></a></td>
        <td width="12">&nbsp;</td>
        <td width="68"><a href="contact.jsp"><img src="images/topmenu_03.gif" width="68" height="23" border="0" /></a></td>
        <td width="37">&nbsp;</td>
      </tr>
      <tr>
        <td height="24" colspan="7">&nbsp;</td>
      </tr>
    </table>
      <table width="585" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="94">&nbsp;</td>
          <td width="87"><a href="index.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image28','','images/menu_01b.png',1)"><img src="images/menu_01.png" name="Image28" width="87" height="38" border="0" id="Image28" /></a></td>
          <td width="97"><a href="about.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image22','','images/menu_02b.png',1)"><img src="images/menu_02.png" name="Image22" width="97" height="38" border="0" id="Image22" /></a></td>
          <td width="97"><a href="randd.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image21','','images/menu_03b.png',1)"><img src="images/menu_03.png" name="Image21" width="97" height="38" border="0" id="Image21" /></a></td>
          <td width="95"><a href="service.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image23','','images/menu_04b.png',1)"><img src="images/menu_04.png" name="Image23" width="95" height="38" border="0" id="Image23" /></a></td>
          <td width="115"><a href="case.jsp" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image24','','images/menu_05b.png',1)"><img src="images/menu_05.png" name="Image24" width="115" height="38" border="0" id="Image24" /></a></td>
        </tr>
        <tr>
          <td height="24" colspan="6">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="1025" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="264"><img src="images/sub_pic_01.jpg" width="264" height="157" /></td>
    <td width="264"><img src="images/sub_pic_08.jpg" width="264" height="157" /></td>
    <td width="247"><img src="images/sub_pic_03.jpg" width="247" height="157" /></td>
    <td width="250"><img src="images/sub_pic_04.jpg" width="250" height="157" /></td>
  </tr>
</table>
<table width="1025" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="218" valign="top" background="images/sub_left_11.png" bgcolor="#FFFFFF"><table width="218" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3"><img src="images/personnel_left_01.jpg" width="218" height="54" /></td>
        </tr>
      <tr>
        <td width="27"><img src="images/sub_left_02.jpg" width="27" height="312" /></td>
        <td width="23"><img src="images/sub_left_03.png" width="23" height="312" /></td>
        <td width="168"><img src="images/rd_left_06.jpg" width="168" height="312" /></td>
      </tr>
      
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/sub_left_10.jpg" width="218" height="175" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
    </table></td>
    <td valign="top" bgcolor="#FFFFFF"><table width="807" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="54" colspan="4" valign="bottom" background="images/sub_title_bg.jpg"> &nbsp;<img src="images/sub_title_09.png" width="220" height="25" /></td>
        </tr>
      <tr>
        <td width="49" height="520">&nbsp;</td>
        <td width="649" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="43">&nbsp;</td>
          </tr>
          <tr>	
		  <%
ContentAction getInfo = new ContentAction();
ContentVo vo = new ContentVo();
vo = getInfo.getContentInfoAction(13);
%>
            <td height="43"><p class="STYLE2">
			
			 <%=vo.getContent() %>
                            </p>
              </td>
          </tr>
          <tr>
            <td height="40">&nbsp;</td>
          </tr>
        </table></td>
        <td width="63" valign="top">&nbsp;</td>
        <td width="46" bgcolor="#8cb0c9">&nbsp;</td>
      </tr>
      
    </table></td>
  </tr>
</table>
<table width="1025" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="203" height="31" bgcolor="#8cb0c9">&nbsp;</td>
    <td width="1"></td>
    <td width="774" background="images/sub_textbg.jpg">&nbsp;</td>
    <td width="1"></td>
    <td width="46" bgcolor="#8cb0c9">&nbsp;</td>
  </tr>
</table>
<table width="1025" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#8cb0c9">
  <tr>
    <td width="199">&nbsp;</td>
    <td width="65"><img src="images/sub_foot_01.jpg" width="65" height="110" /></td>
    <td width="473"><img src="images/sub_foot_02.jpg" width="473" height="110" /></td>
    <td width="288">&nbsp;</td>
  </tr>
</table>
<!-- End Save for Web Slices -->
</body>
</html>