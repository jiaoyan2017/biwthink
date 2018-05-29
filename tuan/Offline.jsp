<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.yi.Action.RegistrationAction" %>
<%@ page import="com.yi.vo.RegistrationVo" %>
<%@page import="com.google.code.kaptcha.Constants;"%>  
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
RegistrationAction getInfo = new RegistrationAction();
RegistrationVo vo = new RegistrationVo();
vo = getInfo.getRegistrationInfoAction(Integer.parseInt(id));

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>青客网--线下团购报名</title>
<link rel="shortcut icon" href="../images/qingcall.ico"> 
<script type="text/javascript" src="../bm/js/jquery.js"></script>
<script type="text/javascript" src="../bm/js/Root.Image.js"></script>
<script type="text/javascript"  src="../bm/js/hotHit.js"></script>
<style type="text/css">
<!--
body {
	background-image: url(images/lt_bg.gif);
	background-repeat: repeat-x;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.sty1 {
	font-size: 18px;
	font-weight: bold;
	font-family: Geneva, Arial, Helvetica, sans-serif;
}
.sty2 {font-size: 30px; font-family: "黑体";color: #000000; }
.STYLE9 {
	font-size: 14px;
	font-weight: bold;
	color: #000000;
	line-height: 24px;
}
.STYLE11 {
	font-family: Geneva, Arial, Helvetica, sans-serif;
	font-size: 16px;
	color: #ce2926;
}
.STYLE12 {
	font-family: Geneva, Arial, Helvetica, sans-serif;
	font-size: 14px;
}
-->
</style>


<script language=javascript>

	
	
    function CheckSubmit(){
	
       // if(document.myform.address.value==''){
        //    alert('地址不能为空！');
         //   document.myform.address.focus();
          //  return false;
        //}
        if(document.myform.username.value==''){
            alert('姓名不能为空！');
            document.myform.username.focus();
            return false;
        }
	
		 if(document.myform.tel.value==''){
            alert('电话不能为空！');
            document.myform.tel.focus();
            return false;
        }
		
		if(!isMobel(document.myform.tel.value)){
		 alert('请输入正确的手机号！');
		return false;
		}
		
		if(document.myform.kaptcode.value==''){
            alert('验证码不能为空！');
            document.myform.kaptcode.focus();
            return false;
        }
		


	if(document.myform.email.value!=''){
        var s =document.myform.email.value; 
             var pattern =/^[a-zA-Z0-9_\-]{1,}@[a-zA-Z0-9_\-]{1,}\.[a-zA-Z0-9_\-.]{1,}$/;
                 if(s!="")
                 {
                     if(!pattern.exec(s))
                     {
                      alert('请输入正确的邮箱地址');
					  return false;
                     }
                 }
        }
		
		
    }
	
	
	function isMobel(value)

{

if(/^13\d{9}$/g.test(value)||(/^15[0-35-9]\d{8}$/g.test(value))|| (/^18[05-9]\d{8}$/g.test(value)))

{ return true; }

else

{ return false; }

}
   
    </script>
</head>

<body>
<jsp:include page="top.jsp" flush="true" />

<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/lt_tabbg.gif"><table width="1000" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="37">&nbsp;</td>
        </tr>
      <tr>
        <td height="441" align="center" valign="top"><table width="1000" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="777"><div align="center" class="sty2">　　　<%=vo.getName() %></div></td>
            <td width="184" height="44" valign="top" background="images/offline_button_01.gif"><table width="184" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="13" colspan="2"></td>
              </tr>
              <tr>
                <td width="116">&nbsp;</td>
                <td width="68"><div align="left"><span class="sty1"><%=vo.getCount()%></span></div></td>
              </tr>
            </table></td>
            <td width="39">&nbsp;</td>
          </tr>
          <tr>
            <td height="10" colspan="3"></td>
            </tr>
        </table>
          <table width="1000" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="22">&nbsp;</td>
              <td width="290" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="cccccc">
                <tr>
                  <td height="530" valign="top" bgcolor="#FFFFFF"><table width="89%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="30%" height="40" valign="baseline"><span class="STYLE9">团购时间：</span></td>
                      <td width="70%"><span class="STYLE9"><%=vo.getActivityTime() %></span></td>
                    </tr>
                    <tr>
                      <td height="40" valign="baseline"><span class="STYLE9">团购地点：</span></td>
                      <td height="35"><span class="STYLE9"><%=vo.getAddress() %></span></td>
                    </tr>
                    <tr>
                      <td height="40"><span class="STYLE9">客服电话：</span></td>
                      <td height="35"><span class="STYLE9"><%=vo.getTel() %></span></td>
                    </tr>
                    <tr>
                      <td height="40"><span class="STYLE9">关注我们：<a href="http://weibo.com/qingcall" target="_blank"></a></span></td>
                      <td height="35"><a href="http://weibo.com/qingcall" target="_blank"><img src="images/sina_button.gif" width="99" height="30" border="0" align="absmiddle" /></a></td>
                    </tr>
                    <tr>
                      <td height="40"><span class="STYLE11">　　　　　<a href="http://weibo.com/qingcall" target="_blank"></a></span></td>
                      <td height="35"><span class="STYLE11"><a href="http://weibo.com/qingcall" target="_blank">http://weibo.com/qingcall</a></span></td>
                    </tr>
                    <tr>
                      <td height="40" valign="baseline"><span class="STYLE9">乘车路线：</span></td>
                      <td height="35" valign="baseline"><span class="STYLE9"><%=vo.getBusLine() %></span></td>
                    </tr>
                    <tr>
                      <td colspan="2"><a href="../upload/<%=vo.getAddresspic() %>" target="_blank"><img src="../upload/<%=vo.getAddresspic() %>"   onload="ImageJtx.Resize(this,240,240);"   border="0" /></a></td>
                    </tr>
                    <tr>
                      <td colspan="2">&nbsp;</td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
              <td width="21">&nbsp;</td>
              <td width="645" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><img src="../upload/<%=vo.getPic() %>" onload="ImageJtx.Resize(this,645,274);"   border="0" /></td>
                </tr>
              </table><form action="common_offline.jsp" name="myform" method="post"  onSubmit='return CheckSubmit();'>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td colspan="3">&nbsp;</td>
                  </tr>

				  
				                    <tr>
                    <td height="40">&nbsp;</td>
                    <td height="35" class="STYLE12"><div align="right">姓　名：</div></td>
                    <td><input type="text" name="username"  id="username"/> 
                  <font color='#FF0000'>*</font></td>
                  </tr>
                  <tr>
                    <td height="40">&nbsp;</td>
                    <td class="STYLE12"><div align="right">手　机：</div></td>
                    <td><input type="text" name="tel" id="tel" /> 
                  <font color='#FF0000'>*</font></td>
                  </tr>
				  
				                    <tr>
                    <td width="26%" height="40">&nbsp;</td>
                    <td width="9%" height="35" class="STYLE12"><div align="right">地　址：</div></td>
                    <td width="65%"><input type="text" name="address" id="address" /></td>
                  </tr>

                  <tr>
                    <td height="40">&nbsp;</td>
                    <td height="35" class="STYLE12"><div align="right"><span class="STYLE12">EMAIL：</span></div></td>
                    <td><input type="text" name="email"  id="email"/></td>
                  </tr>
                  <tr>
                    <td height="40">&nbsp;</td>
                    <td height="35" class="STYLE12"><div align="right">验证码：</div></td>
                    <td><input type="text" name="kaptcode"  id="kaptcode"/>
                  <font color='#FF0000'> * </font><img src="../kaptcha.jpg" height="35" align="absmiddle" /></td>
                  </tr>
                  <tr>
                    <td colspan="3">&nbsp;</td>
                    </tr>
                  <tr>
                    <td height="35">&nbsp;</td>
                    <td height="35" colspan="2"><input name="registrationId"  id="registrationId" type="hidden" value="<%=vo.getId() %>" />
				<input name="msgid"  id="msgid" type="hidden" value="<%=vo.getMsgid() %>" />　　　　
                  <label>
                  <input type="submit" name="Submit" value="提交" />
                  </label>
                  <label>
                  　
                  <input type="reset" name="Submit2" value="重置" />
                  </label></td>
                    </tr>
                  <tr>
                    <td colspan="3">&nbsp;</td>
                  </tr>
                </table> </form></td>
              <td width="22">&nbsp;</td>
            </tr>
          </table>
		 
          <br />
          <table width="990" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="35" valign="top"><img src="images/lt_tab_con_1a.gif" width="35" height="15" /></td>
              <td width="914" height="15" background="images/lt_tab_con_2.gif"></td>
              <td width="31" valign="top"><img src="images/lt_tab_con_5a.gif" width="31" height="15" /></td>
            </tr>
          </table>
          <table width="990" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="274"><img src="images/lt_sub_banner_8.jpg" width="160" height="38" /></td>
              <td width="684">&nbsp;</td>
              <td width="32" background="images/lt_tab_con_16.gif">&nbsp;</td>
            </tr>
          </table>
          <table width="990" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td valign="top" background="images/lt_tab_con_21.gif">&nbsp;</td>
              <td valign="top"><table width="890" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="885"><%=vo.getContent() %></td>
                </tr>
              </table></td>
              <td background="images/lt_tab_con_16.gif">&nbsp;</td>
            </tr>
			
		
            <tr>
              <td width="36" valign="top"><img src="images/lt_tab_con_9a.jpg" width="35" height="24" /></td>
              <td width="922" valign="top" background="images/lt_tab_con_10.gif">&nbsp;</td>
              <td width="32"><img src="images/lt_tab_con_13.gif" width="31" height="24" /></td>
            </tr>
          </table>          </td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1000" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top" background="images/lt_tabbg.gif">&nbsp;</td>
  </tr>
</table>
<jsp:include page="foot.jsp" flush="true" />
</body>
</html>
