$(function(){
var lxfscroll_ul = $(".slide ul");
var lxfscroll_li = $(".slide li");
var lxfscroll_tli = $(".slidenum span");
var lxfscroll_speed = 350;//�л����ٶ�
var lxfscroll_autospeed = 6000;//�Զ����ŵ��ٶ�
var lxfscroll_n = 0;
var lxfscroll_imgheight = $(".slide li img").attr("height");//��ȡͼƬ�߶�
var lxfscroll_lilength = lxfscroll_li.length;//��ȡͼƬ����
var lxfscroll_timer;
//var lxfscroll_alt = $(".lxfscroll-alt");
/* ���ⰴť�¼� */
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
/* �Զ��ֻ� */
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
/* �����ͣ��ֹͣ�Զ��ֻ� */
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
lxfscroll_autoroll();lxfscroll_stoproll();//�����Զ����Ź���
});