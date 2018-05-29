$(function(){
var lxfscroll_ul = $(".slide ul");
var lxfscroll_li = $(".slide li");
var lxfscroll_tli = $(".slidenum span");
var lxfscroll_speed = 350;//切换的速度
var lxfscroll_autospeed = 6000;//自动播放的速度
var lxfscroll_n = 0;
var lxfscroll_imgheight = $(".slide li img").attr("height");//获取图片高度
var lxfscroll_lilength = lxfscroll_li.length;//获取图片数量
var lxfscroll_timer;
//var lxfscroll_alt = $(".lxfscroll-alt");
/* 标题按钮事件 */
function lxfscroll() {
lxfscroll_tli.mouseenter(function(){
var lxfscroll_index = lxfscroll_tli.index($(this));
var lxfscroll_lipoint = lxfscroll_index*lxfscroll_imgheight;
var lxfscroll_imgTitle = $(".slide li img").eq(lxfscroll_index).attr("alt");
//lxfscroll_alt.text(lxfscroll_imgTitle);
lxfscroll_tli.removeClass("curr");
$(this).addClass("curr");
lxfscroll_ul.stop(true,false).animate({"top":-lxfscroll_lipoint+"px"},lxfscroll_speed);
});
};
/* 自动轮换 */
function lxfscroll_autoroll() {
if(lxfscroll_n >= lxfscroll_lilength) {lxfscroll_n = 0;}
var lxfscroll_lipoint = lxfscroll_n*lxfscroll_imgheight;
var lxfscroll_imgTitle = $(".slide li img").eq(lxfscroll_n).attr("alt");
lxfscroll_ul.stop(true,false).animate({"top":-lxfscroll_lipoint+"px"},lxfscroll_speed);
lxfscroll_tli.removeClass("curr").eq(lxfscroll_n).addClass("curr");
//lxfscroll_alt.text(lxfscroll_imgTitle);
lxfscroll_n++;
lxfscroll_timer = setTimeout(lxfscroll_autoroll, lxfscroll_autospeed);
};
/* 鼠标悬停即停止自动轮换 */
function lxfscroll_stoproll() {
lxfscroll_li.hover(function() {
clearTimeout(lxfscroll_timer);
lxfscroll_n = $(this).prevAll().length+1;
}, function() {
lxfscroll_timer = setTimeout(lxfscroll_autoroll, lxfscroll_autospeed);
});
lxfscroll_tli.hover(function() {
clearTimeout(lxfscroll_timer);
lxfscroll_n = $(this).prevAll().length+1;
}, function() {
lxfscroll_timer = setTimeout(lxfscroll_autoroll, lxfscroll_autospeed);
});
};
lxfscroll();
lxfscroll_autoroll();lxfscroll_stoproll();//启动自动播放功能
});