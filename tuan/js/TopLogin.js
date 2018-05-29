/*
登陆框类

说明:TopControl_LoginOk函数为登陆完成运行的函数,现默认为:1 关闭对话框; 2.刷新页面;
如果某个页面不需要这样的功能,可以修改;

例子:某个页面加上
<SCRIPT language="JavaScript">
TopControl_LoginOk=function()
{
    TopControl_CloseLogin();
}
</SCRIPT>
这样的话就只关闭对话框而不刷新了.

作者:赵志强 2010.2.2
*/

$(document).ready(function(){
   $("#TopControl_Login").click( function () { TopControl_OpenLogin();});
})
//刷新验证码
//function TopControl_vcode_Refresh()
//{
//   $("#TopControl_vcode_img").attr("src","/CheckCode.aspx?code=" + Math.round(Math.random() * 10000));
//}
//打开登陆提示
function TopControl_OpenLogin()
{
     dialog("登陆","url:get?/Login2.aspx?r="+Math.round(Math.random()*10000),"400px","auto","text");
}
function TopControl_OpenLogin_Msg(username,msg)
{
     dialog("登陆","url:get?/Login2.aspx?username="+username+"&msg="+encodeURI(msg)+"&r="+Math.round(Math.random()*10000),"400px","auto","text");
}
//关闭登陆提示
function TopControl_CloseLogin()
{   
  $("#floatBoxBg").animate({opacity:"0"},"normal",function(){$(this).hide();});
  $("#floatBox").animate({top:($(document).scrollTop()-300)+"px"},"normal", function(){ $(this).hide(); }); 
  if($("#createOrder").length>0&&$("#gotobuy").length>0&&$("#loading").length>0){
    $("#createOrder").show();
    $("#gotobuy").show();
    $("#loading").hide();
  }
}


/*
*登录 
*lifl addParm loginPage 登录不成功，返回的登录页面,不填，默认返回到login2.aspx
callBack 可以为空、不填
*/
function TopControl_Login(callBack)
{   
    var TopControl_username=$("#TopControl_username").val();
    var TopControl_password=$("#TopControl_password").val();
//    var TopControl_vcode=$("#TopControl_vcode").val();
    
    var isok=true;
    if (TopControl_username=="" || TopControl_username.length<=0 )
    {
        $("#TopControl_msg").show().text('用户名不能为空!');
        return false;
    }
//    if(isok){
        if (TopControl_password=="" || TopControl_password.length<=0 )
        {
             $("#TopControl_msg").show().text('密码不能为空!');
             return false;
        }
//    }
//    if(isok){
//        if (TopControl_vcode=="" || TopControl_vcode.length<=0 )
//        {
//            $("#TopControl_msg").show().text('验证码不能为空!');
//             isok=false;
//        }
//    }
    
    $.ajax({
      url: "/Interface/Login.aspx",
      cache: false,
      data: "username="+escape(TopControl_username)+"&password="+escape(TopControl_password),
      dataType:"json",
      success: function(html){
       var jsonResult=eval('('+html+')');
       isLogin= Boolean(parseInt(jsonResult.isLogin));
       isUser= Boolean(parseInt(jsonResult.isUser));
       isDealer= Boolean(parseInt(jsonResult.isDealer));
         if(isLogin)
         {            
            TopControl_LoginOk();
            TopControl_CloseLogin();
            var oHead = document.getElementsByTagName('HEAD').item(0);
            var oScript= document.createElement("script");
            oScript.type = "text/javascript";
            oScript.src="../../TopControl1.aspx";
            oHead.appendChild(oScript);
         }
         else
         {
         if(callBack&&callBack.length>0)
         {
           callBack(jsonResult.msg,TopControl_username);
         }
         else
            {
                TopControl_OpenLogin_Msg(TopControl_username,jsonResult.msg);
            }
//            if(html!="验证码错误")
//            {
//                alert(html);
//            }
         }
      }
    });
}

//登陆成功后运行的函数
var TopControl_LoginOk=function()
{   
    TopControl_CloseLogin();
    location.reload();
}