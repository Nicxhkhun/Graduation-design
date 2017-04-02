<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>500</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/error_page.css">
</head>
<body>
<div class="content">
    <div class="left">
        <div class="img"><img src="<%=request.getContextPath() %>/images/error500.png"></div>
    </div>
    <div class="right">
        <div class="art_500">500</div>
        <div class="art_bold">哎呀！出错了！</div>
        <div class="art_sm">您访问的服务器出错了，请稍后再试</div>
        <div class="ui_img_f" onclick="javascript:history.back(-1);">返回</div>
    </div>
</div>
</body>
</html>
