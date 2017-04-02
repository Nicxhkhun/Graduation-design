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
        <div class="img"><img src="<%=request.getContextPath() %>/images/error404.png" style="width:80%"></div>
    </div>
    <div class="right">
        <div class="art_500">404</div>
        <div class="art_bold">很抱歉，您访问的页面不存在</div>
        <div class="art_sm">请检查您输入的网址是否正确，后者点击链接继续访问</div>
        <div class="ui_img_f" onclick="javascript:history.back(-1);">返回</div>
    </div>
</div>
</body>
</html>
