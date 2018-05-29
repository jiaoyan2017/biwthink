
$(document).ready(function(){
  
    $("li[name='li_hothit']").each(function(){
        $(this).mouseover(function(){HotHits_jiaju_SetClassOn(this);});

        var img = $(this).children().eq(1).children("a").children("img");
        ImgResize(img);
    });
});
//设置 {最热家具} 的class=on
function HotHits_jiaju_SetClassOn(obj)
{
    $(obj).siblings("li").removeClass("on")
    $(obj).addClass("on");
    var img = $(obj).children().eq(1).children("a").children("img");

    ImgResize(img);
}

//等比例缩放
function ImgResize($img)
{
    $img.load(function(){ImageJtx.Resize(this, 75, 56);SetMiddle(this,56);});
    $img.bind("error",function(){ImageJtx.OnError(this);});
    $img.attr("src",$img.attr("src")); 
}