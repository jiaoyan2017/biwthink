/*
* ���ﳵ�¼����ղؿ��¼���ȥ�����¼�
* 2009.2.9
*/

//���ﳵ
function ShowShopCarOk(mallProductID)
{
    if (isLogin){
        if (isDealer){
            //(���ֲ��Ǹ���)������ʾ
            dialog("��ʾ�����̲��Ǹ����û�", "url:get?/Shop/Interface/MustUserOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        } 
        else if(isUser){      
            dialog("��ʾ���ﳵ�ɹ�", "url:get?/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        }
        else{
            dialog("��ʾ���ﳵ�ɹ�", "url:get?/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        }
    }
    else{
        dialog("��ʾ���ﳵ�ɹ�", "url:get?/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
    }
}
//�Ź���Ʒ���ﳵ--2010-8-11�����,�������ж��Ƿ�ѡ�������ͳ���
function ShowShopCar(mallProductID,buyNum) 
{
    var city = document.getElementById("CityItem").innerHTML;
    var cityId = document.getElementById("CityId").value;
    if(city.length==0){
        alert("��ѡ�����ͳ��У�");
        return false;
    }
    else if(city=="��ѡ��"){
        alert("��ѡ�����ͳ��У�");
        return false;
    }
    if (isLogin){
        if (isDealer){
            //(���ֲ��Ǹ���)������ʾ
            dialog("��ʾ�����̲��Ǹ����û�", "url:get?/Shop/Interface/MustUserOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        } 
        else if(isUser){     
            window.location.href= "/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&BuyCount=" + buyNum + "&cityname="+escape(city)+ "&cityid="+cityId+"&r=" + Math.round(Math.random() * 10000);
            //dialog("��ʾ���ﳵ�ɹ�", "url:get?/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&BuyCount=" + buyNum + "&cityname="+escape(city)+"&cityid="+cityId+"&r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        }
        else{
            window.location.href= "/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&BuyCount=" + buyNum + "&cityname="+escape(city)+ "&cityid="+cityId+"&r=" + Math.round(Math.random() * 10000);
           // dialog("��ʾ���ﳵ�ɹ�", "url:get?/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&BuyCount=" + buyNum + "&cityname="+escape(city)+ "&cityid="+cityId+"&r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        }
    }
    else{
        window.location.href= "/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&BuyCount=" + buyNum + "&cityname="+escape(city)+ "&cityid="+cityId+"&r=" + Math.round(Math.random() * 10000);
        //dialog("��ʾ���ﳵ�ɹ�", "url:get?/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&BuyCount=" + buyNum + "&cityname="+escape(city)+"&cityid="+cityId+ "&r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
    }
    return false;
}
//�ղؼ�
function ShowFavoriteOk(mallProductID){
    if (isLogin) {
        if (isDealer) {
            //��½��ɺ�(���ֲ��Ǹ���)������ʾ
            dialog("��ʾ�����̲��Ǹ����û�", "url:get?/Shop/Interface/MustUserOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        } else if(isUser){
            //��½��ɺ�(�̳Ǹ���)�����ղ�
            dialog("��ʾ�ղسɹ�", "url:get?/Shop/Interface/FavoriteOk.aspx?MallProductID=" + mallProductID + "&r=" + Math.round(Math.random() * 10000), "200px", "auto", "text");
        } 
//        else {
//            dialog("��ʾ��Ҫ����", "url:get?/Shop/Interface/MustUserOrDealerOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
//        }        
    } 
    else {
        TopControl_LoginOk = function() {
            RefreshState();
            CloseMessage();
            //alert("��½�ɹ�!");
        }
        dialog("��½", "url:get?/Login2.aspx?r=" + Math.round(Math.random() * 10000), "400px", "auto", "text");
    }
}
//��������
function GoToCreateOrder(pNum,cityName,mallfavoriteids){
    if(mallfavoriteids==""){
         alert("��ѡ��Ҫ����Ĳ�Ʒ��");
         return false;
    }
    if(isLogin&&(isUser||isDealer)){
        if(isDealer){
            dialog("��ʾ�����̲��Ǹ����û�", "url:get?/Shop/Interface/MustUserOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        } 
        else if(isUser){    
            if(pNum>0){
                $("#f_gotoPay").submit();
                //window.location='/OrderCreatePre.aspx?CName='+cityName+'&mallfavoriteids='+mallfavoriteids;
            }else{
                alert("���ﳵ�е���Ʒ����Ϊ0������ѡ����Ʒ��");
                return false;
            }
        }
//        else{ 
//            dialog("��ʾ��Ҫ����", "url:get?/Shop/Interface/MustUserOrDealerOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
//        }
    }
    else{
        TopControl_LoginOk=function(){
             $("#f_gotoPay").submit();
             //isLoginAndisUser=true;
        }
        dialog("��½","url:get?/Login3.aspx?r="+Math.round(Math.random()*10000),"542px","auto","text");    
    }  
}
//�Ź���Ʒ��������
function ScareBuyingCreateOrder()
{
    var city = document.getElementById("CityItem").innerHTML;
    var buycount=$("#BuyCount").val();
    if(buycount>0){}
    else{
        alert("�����빺��������");
        return false;
    }
    if(city.length==0){
        alert("��ѡ�����ͳ��У�");
        return false;
    }
    else if(city=="��ѡ��"){
        alert("��ѡ�����ͳ��У�");
        return false;
    }
    if(isLogin){
        if(isDealer){
            dialog("��ʾ�����̲��Ǹ����û�", "url:get?/Shop/Interface/MustUserOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        } 
        else if(isUser){
            window.location.href="/Order/Createorder_0615.aspx?mallproductid="+$("#mallproductid").val()+"&type=2&BuyCount="+buycount+"&CityId="+$("#CityId").val()+"&CityName="+city;
            //return true;
        } 
//        else{ 
//            dialog("��ʾ��Ҫ����", "url:get?/Shop/Interface/MustUserOrDealerOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
//        }  
    } 
    else{
        TopControl_LoginOk=function(){
             RefreshState();
             CloseMessage();
        }
        dialog("��½","url:get?/Login2.aspx?r="+Math.round(Math.random()*10000),"400px","auto","text");    
    }
    //return false;
}
//������Ʒ�ͳ�̬��Ʒ�������򴴽�����
function ScareBuyingCreateOrder_New()
{
    var city = document.getElementById("CityItem").innerHTML;
    var buycount=$("#BuyCount").val();
    if(buycount>0){}
    else{
        alert("�����빺��������");
        return false;
    }
    if(city.length==0){
        alert("��ѡ�����ͳ��У�");
        return false;
    }
    else if(city=="��ѡ��"){
        alert("��ѡ�����ͳ��У�");
        return false;
    }
    if(isLogin){
        if(isDealer){
            dialog("��ʾ�����̲��Ǹ����û�", "url:get?/Shop/Interface/MustUserOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        } 
        else if(isUser){
            window.location.href="/order/OrderCreatePre_0615.aspx?PID="+$("#mallproductid").val()+"&PCount="+buycount+"&CName="+city;
            //return false;
        }
//        else{ 
//            dialog("��ʾ��Ҫ����", "url:get?/Shop/Interface/MustUserOrDealerOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
//        }  
    } 
    else{
        TopControl_LoginOk=function(){
             RefreshState();
             CloseMessage();
        }
        dialog("��½","url:get?/Login2.aspx?r="+Math.round(Math.random()*10000),"400px","auto","text");    
    }
    //return false;
}
//�ر���ʾ
function CloseMessage() {
    $("#floatBoxBg").animate({opacity:"0"},"normal",function(){$(this).hide();});
    $("#floatBox").animate({top:($(document).scrollTop()-300)+"px"},"normal", function(){ $(this).hide(); }); 
}
//��ת�����ﳵ
function GoToShopCar() {
    this.location.href = '/Cart_New.aspx';
}
//��ת������ҳ
function GoToRegister3() {
    this.location.href = '/Register3.aspx';
}
//ˢ��״̬
function RefreshState()
{
            //���µ�½״̬
            RefreshLoginState();
            //����TopControl״̬
            RefreshTopControlUserInfo();
}
//����TopControl״̬
function RefreshTopControlUserInfo() {
    $.ajax({
        url: "/Interface/HTML_UserInfo.aspx",
        cache: false,
        success: function(html) {
            $("#logo").html(html);
        }
    });
}
//����js��½״̬
function RefreshLoginState() {
    $.ajax({
        url: "/Interface/JS_LoginState.aspx",
        cache: false,
        dataType: "script"
    });
}
RefreshLoginState();