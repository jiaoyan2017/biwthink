/*
��½����

˵��:TopControl_LoginOk����Ϊ��½������еĺ���,��Ĭ��Ϊ:1 �رնԻ���; 2.ˢ��ҳ��;
���ĳ��ҳ�治��Ҫ�����Ĺ���,�����޸�;

����:ĳ��ҳ�����
<SCRIPT language="JavaScript">
TopControl_LoginOk=function()
{
    TopControl_CloseLogin();
}
</SCRIPT>
�����Ļ���ֻ�رնԻ������ˢ����.

����:��־ǿ 2010.2.2
*/

$(document).ready(function(){
   $("#TopControl_Login").click( function () { TopControl_OpenLogin();});
})
//ˢ����֤��
//function TopControl_vcode_Refresh()
//{
//   $("#TopControl_vcode_img").attr("src","/CheckCode.aspx?code=" + Math.round(Math.random() * 10000));
//}
//�򿪵�½��ʾ
function TopControl_OpenLogin()
{
     dialog("��½","url:get?/Login2.aspx?r="+Math.round(Math.random()*10000),"400px","auto","text");
}
function TopControl_OpenLogin_Msg(username,msg)
{
     dialog("��½","url:get?/Login2.aspx?username="+username+"&msg="+encodeURI(msg)+"&r="+Math.round(Math.random()*10000),"400px","auto","text");
}
//�رյ�½��ʾ
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
*��¼ 
*lifl addParm loginPage ��¼���ɹ������صĵ�¼ҳ��,���Ĭ�Ϸ��ص�login2.aspx
callBack ����Ϊ�ա�����
*/
function TopControl_Login(callBack)
{   
    var TopControl_username=$("#TopControl_username").val();
    var TopControl_password=$("#TopControl_password").val();
//    var TopControl_vcode=$("#TopControl_vcode").val();
    
    var isok=true;
    if (TopControl_username=="" || TopControl_username.length<=0 )
    {
        $("#TopControl_msg").show().text('�û�������Ϊ��!');
        return false;
    }
//    if(isok){
        if (TopControl_password=="" || TopControl_password.length<=0 )
        {
             $("#TopControl_msg").show().text('���벻��Ϊ��!');
             return false;
        }
//    }
//    if(isok){
//        if (TopControl_vcode=="" || TopControl_vcode.length<=0 )
//        {
//            $("#TopControl_msg").show().text('��֤�벻��Ϊ��!');
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
//            if(html!="��֤�����")
//            {
//                alert(html);
//            }
         }
      }
    });
}

//��½�ɹ������еĺ���
var TopControl_LoginOk=function()
{   
    TopControl_CloseLogin();
    location.reload();
}