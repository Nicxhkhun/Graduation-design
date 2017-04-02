<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Sheraton酒店管理系统</title>
<link rel="stylesheet" type="text/css" href="css/master.css">
<link rel="stylesheet" type="text/css" href="css/layout.css">
<script type="text/javascript">
	if (window != top) 
	top.location.href = location.href;
	
	
	function displayTime() {
		var now=new Date();
		var year=now.getYear();
		var month=now.getMonth();
		var day=now.getDate();
		var hours=now.getHours()+"";
		var minutes=now.getMinutes()+"";
		var seconds=now.getSeconds()+"";
		if(hours.length==1){
			hours="0"+hours;
		}
		if(minutes.length==1){
			minutes="0"+minutes;
		}
		if(seconds.length==1){
			seconds="0"+seconds;
		}
		document.getElementById("time").innerHTML=""+(1900+year)+"年"+(month+1)+"月"+day+"日 "+hours+":"+minutes+":"+seconds+"";
    } 
    setInterval(displayTime,1000);      // 每隔1秒钟调用displayTime函数
</script>
</head>

<body>
<div id="header">
    <div class="user_con">
        <span><i class="ico_user"></i>欢迎您<em id="userName">${sessionScope.name}</em></span>
        <a href="<%=request.getContextPath() %>/apply/updatePassword.jsp" target="frameContent"><span><i class="ico_suo" ></i>修改密码</span></a>
        <a target="frameContent" onclick="loginOut()"><span><i class="ico_kg" ></i>退出系统</span></a>
     <div id="time" style="margin-left: -868px;float: left;font-size:22px;font-family:'楷体';color:#d9be1f;"></div>
    </div>
    <div class="logo"><img src="images/logo.png" alt="logo" /></div>
</div>
<div id="wrap">
    <div id="sidebar">
        <div id="sidebar_list">
        	<dl>
                <dt>入住管理</dt>
                <dd>
                    <ul>
               		<li><a href="<%=request.getContextPath() %>/occupancy/occupancy_query.jsp" target="frameContent"><i class="ico_tri"></i><span>基本信息</span></a></li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>客房维护</dt>
                <dd>
                    <ul>
               			<li><a href="<%=request.getContextPath() %>/roomtype/query.do" target="frameContent"><i class="ico_tri"></i><span>类型管理</span></a></li>
                    </ul>
                    <ul>
               			<li><a href="<%=request.getContextPath() %>/room/query.do" target="frameContent"><i class="ico_tri"></i><span>客房管理</span></a></li>
                    </ul>
                </dd>
            </dl>
            <dl>
                <dt>系统</dt>
                <dd>
                    <ul>
               		<li><a href="<%=request.getContextPath() %>/apply/toUpdate.do" target="frameContent"><i class="ico_tri"></i><span>基本信息</span></a></li>
                    </ul>
                </dd>
            </dl>
         
        </div>
        <div id="sidebar_ico"></div>
    </div>
    <div id="main">
        <iframe id="iframe" name="frameContent" src="<%=request.getContextPath() %>/welcome.html" frameborder="0"></iframe>
    </div> 
</div>
</body>
<script src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
$(function(){
    var wrapHeight=$(window).height()-$('#header').height();
    $('#wrap').height(wrapHeight);
    $('#main').height(wrapHeight);
    $('#iframe').height(wrapHeight).width('100%');
    $(window).resize(function(){
        var wrapHeight=$(window).height()-$('#header').height();
        $('#wrap').height(wrapHeight);
        $('#main').height(wrapHeight);
        $('#iframe').height(wrapHeight).width('100%');
    });
    $('#sidebar_ico').toggle(function(){
            $('#sidebar').animate({left:'-200px'});
            $('#wrap').animate({'padding-left':'6px'});
            $(this).css('background-position','right center')
        },function(){
            $('#sidebar').animate({left:'0'});
            $('#wrap').animate({'padding-left':'206px'});
            $(this).css('background-position','left center')
        });
    $('#sidebar_list dl').eq(0).children('dt').addClass('on').end().children('dt').css('background-image','url(images/ico_minus.png)').end().children('dd').show().find('li').eq(0).addClass('on');
    $('#sidebar_list dl dt').click(function(){
        $(this).parent().siblings().children('dt').removeClass('on').css('background-image','url(images/ico_plus.png)');

        $(this).addClass('on').css('background-image','url(images/ico_minus.png)');
        $(this).parent().siblings().children('dd').slideUp();
        $(this).siblings().slideDown();
    });
    $('#sidebar_list dl li').click(function(){
        $(this).parents('dl').siblings().find('li').removeClass('on');
        $(this).siblings().removeClass('on');
        $(this).addClass('on');
    });
});
function loginOut(){
	var url="<%=request.getContextPath() %>/loginOut.do";
	$.ajax({
		type: 'post',
		url: url,
		data: $("#tform").serialize(),
		async : true,
		success: function(data){
			if(data.code==0)
				window.top.location.href = "login.jsp";
		}
	})
}
</script>
</html>