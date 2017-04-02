<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>酒店管理系统</title>
<link rel="stylesheet" type="text/css" href="css/master.css">
<link rel="stylesheet" type="text/css" href="css/layout.css">
<script type="text/javascript">
	if (window != top) 
	top.location.href = location.href; 
	
</script>
</head>

<body style=" background:#fafafa; ">
<div class="login_head">
    <div class="log_img"><img src="images/logo.png" alt="" /></div>
    <div class="log_txt"><img src="images/log_txt.png" alt="" /></div>
</div>
<div id="inpCon">
<form id="myform" method="post">
    <p><strong>用户名：</strong><span><input type="text" name="loginName" class="form-control" placeholder="请输入用户名或邮箱" value="admin"></span></p>
    <p><strong>密&nbsp;&nbsp;&nbsp;码：</strong><span><input type="password" name="password" class="form-control" placeholder="请输入密码" value="123"></span></p>
    <div style="color: red;" align="center">
		<%
		String mess = (String)request.getAttribute("message");
			if(mess!=null){
			out.println(mess);
		}
		%>
		</div>
    <p id="btn">
    <input id="land" type="button" value="确定" name="" onclick="submits()"/>
    <input id="register" type="button" value="注册" name="" onclick="regist()"/>
    </p>
</form>
</div>
<div class="footer">copyright©2017 版权所有 陈欣</div>
</body>
<div class="footer">copyright©2017 版权所有 陈欣</div>
<script src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	$('.login_head').height($(window).height() * 0.45);
	$(window).resize(function() {
		$('.login_head').height($(window).height() * 0.45);
	});
	function submits() {
		document.forms[0].action="<%=request.getContextPath() %>/login.do";
		document.forms[0].submit();
	}
	
	function regist(){
		document.forms[0].action="<%=request.getContextPath() %>/toRegister.do";
		document.forms[0].submit();
	}
</script>
</body>
</html>




