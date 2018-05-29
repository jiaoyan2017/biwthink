/*
* 购物车事件和收藏框事件和去结算事件
* 2009.2.9
*/

//购物车
function ShowShopCarOk(mallProductID)
{
    if (isLogin){
        if (isDealer){
            //(发现不是个人)进入提示
            dialog("提示是商铺不是个人用户", "url:get?/Shop/Interface/MustUserOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        } 
        else if(isUser){      
            dialog("提示购物车成功", "url:get?/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        }
        else{
            dialog("提示购物车成功", "url:get?/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        }
    }
    else{
        dialog("提示购物车成功", "url:get?/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
    }
}
//团购商品购物车--2010-8-11新添加,增加了判断是否选择了配送城市
function ShowShopCar(mallProductID,buyNum) 
{
    var city = document.getElementById("CityItem").innerHTML;
    var cityId = document.getElementById("CityId").value;
    if(city.length==0){
        alert("请选择配送城市！");
        return false;
    }
    else if(city=="请选择"){
        alert("请选择配送城市！");
        return false;
    }
    if (isLogin){
        if (isDealer){
            //(发现不是个人)进入提示
            dialog("提示是商铺不是个人用户", "url:get?/Shop/Interface/MustUserOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        } 
        else if(isUser){     
            window.location.href= "/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&BuyCount=" + buyNum + "&cityname="+escape(city)+ "&cityid="+cityId+"&r=" + Math.round(Math.random() * 10000);
            //dialog("提示购物车成功", "url:get?/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&BuyCount=" + buyNum + "&cityname="+escape(city)+"&cityid="+cityId+"&r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        }
        else{
            window.location.href= "/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&BuyCount=" + buyNum + "&cityname="+escape(city)+ "&cityid="+cityId+"&r=" + Math.round(Math.random() * 10000);
           // dialog("提示购物车成功", "url:get?/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&BuyCount=" + buyNum + "&cityname="+escape(city)+ "&cityid="+cityId+"&r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        }
    }
    else{
        window.location.href= "/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&BuyCount=" + buyNum + "&cityname="+escape(city)+ "&cityid="+cityId+"&r=" + Math.round(Math.random() * 10000);
        //dialog("提示购物车成功", "url:get?/Shop/Interface/ShopCarOk.aspx?MallProductID=" + mallProductID + "&BuyCount=" + buyNum + "&cityname="+escape(city)+"&cityid="+cityId+ "&r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
    }
    return false;
}
//收藏夹
function ShowFavoriteOk(mallProductID){
    if (isLogin) {
        if (isDealer) {
            //登陆完成后(发现不是个人)进入提示
            dialog("提示是商铺不是个人用户", "url:get?/Shop/Interface/MustUserOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        } else if(isUser){
            //登陆完成后(商城个人)进入收藏
            dialog("提示收藏成功", "url:get?/Shop/Interface/FavoriteOk.aspx?MallProductID=" + mallProductID + "&r=" + Math.round(Math.random() * 10000), "200px", "auto", "text");
        } 
//        else {
//            dialog("提示需要升级", "url:get?/Shop/Interface/MustUserOrDealerOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
//        }        
    } 
    else {
        TopControl_LoginOk = function() {
            RefreshState();
            CloseMessage();
            //alert("登陆成功!");
        }
        dialog("登陆", "url:get?/Login2.aspx?r=" + Math.round(Math.random() * 10000), "400px", "auto", "text");
    }
}
//创建订单
function GoToCreateOrder(pNum,cityName,mallfavoriteids){
    if(mallfavoriteids==""){
         alert("请选择要结算的产品！");
         return false;
    }
    if(isLogin&&(isUser||isDealer)){
        if(isDealer){
            dialog("提示是商铺不是个人用户", "url:get?/Shop/Interface/MustUserOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        } 
        else if(isUser){    
            if(pNum>0){
                $("#f_gotoPay").submit();
                //window.location='/OrderCreatePre.aspx?CName='+cityName+'&mallfavoriteids='+mallfavoriteids;
            }else{
                alert("购物车中的商品数量为0，请先选择商品！");
                return false;
            }
        }
//        else{ 
//            dialog("提示需要升级", "url:get?/Shop/Interface/MustUserOrDealerOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
//        }
    }
    else{
        TopControl_LoginOk=function(){
             $("#f_gotoPay").submit();
             //isLoginAndisUser=true;
        }
        dialog("登陆","url:get?/Login3.aspx?r="+Math.round(Math.random()*10000),"542px","auto","text");    
    }  
}
//团购商品创建订单
function ScareBuyingCreateOrder()
{
    var city = document.getElementById("CityItem").innerHTML;
    var buycount=$("#BuyCount").val();
    if(buycount>0){}
    else{
        alert("请输入购买数量！");
        return false;
    }
    if(city.length==0){
        alert("请选择配送城市！");
        return false;
    }
    else if(city=="请选择"){
        alert("请选择配送城市！");
        return false;
    }
    if(isLogin){
        if(isDealer){
            dialog("提示是商铺不是个人用户", "url:get?/Shop/Interface/MustUserOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        } 
        else if(isUser){
            window.location.href="/Order/Createorder_0615.aspx?mallproductid="+$("#mallproductid").val()+"&type=2&BuyCount="+buycount+"&CityId="+$("#CityId").val()+"&CityName="+city;
            //return true;
        } 
//        else{ 
//            dialog("提示需要升级", "url:get?/Shop/Interface/MustUserOrDealerOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
//        }  
    } 
    else{
        TopControl_LoginOk=function(){
             RefreshState();
             CloseMessage();
        }
        dialog("登陆","url:get?/Login2.aspx?r="+Math.round(Math.random()*10000),"400px","auto","text");    
    }
    //return false;
}
//抢购商品和常态商品立即购买创建订单
function ScareBuyingCreateOrder_New()
{
    var city = document.getElementById("CityItem").innerHTML;
    var buycount=$("#BuyCount").val();
    if(buycount>0){}
    else{
        alert("请输入购买数量！");
        return false;
    }
    if(city.length==0){
        alert("请选择配送城市！");
        return false;
    }
    else if(city=="请选择"){
        alert("请选择配送城市！");
        return false;
    }
    if(isLogin){
        if(isDealer){
            dialog("提示是商铺不是个人用户", "url:get?/Shop/Interface/MustUserOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
        } 
        else if(isUser){
            window.location.href="/order/OrderCreatePre_0615.aspx?PID="+$("#mallproductid").val()+"&PCount="+buycount+"&CName="+city;
            //return false;
        }
//        else{ 
//            dialog("提示需要升级", "url:get?/Shop/Interface/MustUserOrDealerOK.aspx?r=" + Math.round(Math.random() * 10000), "300px", "auto", "text");
//        }  
    } 
    else{
        TopControl_LoginOk=function(){
             RefreshState();
             CloseMessage();
        }
        dialog("登陆","url:get?/Login2.aspx?r="+Math.round(Math.random()*10000),"400px","auto","text");    
    }
    //return false;
}
//关闭提示
function CloseMessage() {
    $("#floatBoxBg").animate({opacity:"0"},"normal",function(){$(this).hide();});
    $("#floatBox").animate({top:($(document).scrollTop()-300)+"px"},"normal", function(){ $(this).hide(); }); 
}
//跳转到购物车
function GoToShopCar() {
    this.location.href = '/Cart_New.aspx';
}
//跳转到升级页
function GoToRegister3() {
    this.location.href = '/Register3.aspx';
}
//刷新状态
function RefreshState()
{
            //更新登陆状态
            RefreshLoginState();
            //更新TopControl状态
            RefreshTopControlUserInfo();
}
//更新TopControl状态
function RefreshTopControlUserInfo() {
    $.ajax({
        url: "/Interface/HTML_UserInfo.aspx",
        cache: false,
        success: function(html) {
            $("#logo").html(html);
        }
    });
}
//更新js登陆状态
function RefreshLoginState() {
    $.ajax({
        url: "/Interface/JS_LoginState.aspx",
        cache: false,
        dataType: "script"
    });
}
RefreshLoginState();