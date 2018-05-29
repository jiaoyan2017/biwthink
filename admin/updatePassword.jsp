<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page  import="java.util.*"%>
<%@ page import="com.yi.Action.*" %>
<%@ page import="com.yi.vo.*" %>

<%@page import="com.yi.util.PageBean"%>
<%@page import="com.yi.Dao.PublicDao"%>
<%@page import="com.yi.util.StringUtils"%>
<%@page import="com.google.code.kaptcha.Constants"%>  
<%
request.setCharacterEncoding("UTF-8");
StringUtils  s = new StringUtils();


%>

<html><head><title>交易信息管理</title>
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>
<link href='Admin_STYLE.CSS' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="../bm/js/jquery.js"></script>

<script language=javascript>
  function CheckSubmit(){
	

        if(document.myform.username.value==''){
            alert('用户名不能为空！');
            document.myform.username.focus();
            return false;
        }

       
		
		 if(document.myform.oldpassword.value==''){
            alert('旧密码不能为空！');
            document.myform.oldpassword.focus();
            return false;
        }
        
        
        if(document.myform.newpassword.value==''){
            alert('新密码不能为空！');
            document.myform.newpassword.focus();
            return false;
        }
        
        
        if(document.myform.newpassword.value!=document.myform.renewpassword.value){
            alert('验证密码与新密码不符！');
            document.myform.renewpassword.focus();
            return false;
        }
        
		
		if(document.myform.kaptcode.value==''){
            alert('验证码不能为空！');
            document.myform.kaptcode.focus();
            return false;
        }
		


		
		

		
    }
	
 $(function() {  
$('#onClickText').click(function() {  

$('#kaptchaImage').attr('src', '../kaptcha.jpg?' + Math.floor(Math.random() * 100));  
})  
});  

   
    </script>
</head>
<body leftmargin='2' topmargin='0' marginwidth='0' marginheight='0'>

<table width='100%'><tr>
      <td align='left'></td>
    </tr></table>
    <form name='myform' id='myform' action='commonrepassword.jsp' method='post' onSubmit='return CheckSubmit();'>
    <table width='100%'  border='0' align='center' cellpadding='5' cellspacing='1' class='border'>
            <tr class='tdbg'>
              <td height='100' valign='top'><table width='95%' align='center' cellpadding='2' cellspacing='1' bgcolor='#FFFFFF' id='Tabs' style='display:'>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>用户名：</td>
                    <td width='38%'><input id="username"  size="30" name="username" />   </td>
                  </tr>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>旧密码：</td>
                    <td width='38%'>  <input id="oldpassword" type="password"size="30" name="oldpassword" /></td>
                  </tr>
				                    <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>新密码：</td>
                    <td width='38%'>  <input id="newpassword" type="password"size="30" name="newpassword" /></td>
                  </tr>
				                    <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>验证新密码：</td>
                    <td width='38%'>  <input id="renewpassword" type="password"size="30" name="renewpassword" /></td>
					
                  </tr>
                  <tr class='tdbg'>
                    <td class='tdbg5' align='right'  width='12%'>验证码：</td>
                    <td width='38%'><input id="kaptcode"  size="15" name="kaptcode" />
              　   <img src="../kaptcha.jpg" align="absmiddle" id="kaptchaImage"/> 
              <a  id="onClickText">看不清，换一个</a> </td>
                  </tr>
                </table></td>
            </tr>
    </table>
    <table width='100%' height='40'><tr align='center'><td>
        
        <input type='submit' name='Submit' value='登录'>
    </td></tr></table>
    </form>

                </td>
            </tr>
    </table>

</body>
</html>


