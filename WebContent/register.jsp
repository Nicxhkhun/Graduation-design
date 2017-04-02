<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/bootstrap-3.3.6-dist/css/bootstrap.min.css">
<link href="http://getbootstrap.com/2.3.2/assets/js/google-code-prettify/prettify.css" rel="stylesheet" />

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/head.css">
<script src="<%=request.getContextPath()%>/jquery/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/jquery/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js"></script>
<script>window.jQuery || document.write('<script src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js"><\/script>')</script>
<script src="<%=request.getContextPath()%>/js/distpicker.data.js"></script>
<script src="<%=request.getContextPath()%>/js/distpicker.js"></script>
<script src="<%=request.getContextPath()%>/js/formcheck.js"></script>
<!--引入时间控件 -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function formSubmit() {
		var loginName=document.getElementById("loginName").value;
		var password=document.getElementById("password").value;
		var name=document.getElementById("name").value;
		var sex=document.getElementsByName("sex").value;
		var phone=document.getElementById("phone").value;
		var birthDay=document.getElementById("birthDay").value;
		var province=document.getElementById("province").value;
		var city=document.getElementById("city").value;
		var district=document.getElementById("district").value;
		var photo=document.getElementById("photo").value;
		if(loginName==''){
			alert("请输入登录名！");
			return;
		}
		if(password==''){
			alert("请输入密码！");
			return;
		}
		if(name==''){
			alert("请输入真实姓名！");
			return;
		}
		if(phone==''){
			alert("请输入电话号！");
			return;
		}
		if(province!=''&&city==''){
			alert("请选择城市！");
			return;
		}
		if(city!=''&&district==''){
			alert("请选择地区！");
			return;
		}
		/* if(birthDay==''){
			alert("请输入生日！");
			return;
		} */
		if(Base.isPhone(phone)==false){
			alert("请输入正确手机号！");
			return;
		}
		var formData = new FormData($( "#tform" )[0]); 
 	 	var url = "<%=request.getContextPath() %>/register.do";
 	 	$.ajax({
 			  url: url,  
 	          type: 'POST',  
 	          data: formData,  
 	          async: false,  
 	          cache: false,  
 	          contentType: false,  
 	          processData: false,  
 			success: function(data){
 				if(data=="SUCCESS"){
		  			alert("注册成功!");
 					window.location.href='<%=request.getContextPath() %>/main.jsp';
 				}else if(data=="EXIST"){
 					alert("用户名已存在！");
 				}else{
 					alert("注册失败!");
 				}
			}
 		})
  	}

	function fillForm() {   
	  var pName=ML_IDCard.Name; 
	  var pSex=ML_IDCard.Sex;
	  var pNation=ML_IDCard.Nation;
	  var pBorn=ML_IDCard.Born;
	  var pAddress=ML_IDCard.Address;
	  var pCardNo=ML_IDCard.CardNo;
	  var pPolice=ML_IDCard.IssuedAt;
	  var pActivityLFrom=ML_IDCard.EffectedDate; 
	  var pActivityLTo=ML_IDCard.ExpiredDate; 
	  var pDeviceNo=ML_IDCard.CardReaderId;
	  var pPhotoBuffer=ML_IDCard.Picture; 

	  document.all['Name'].value = pName; 
	  document.all['Sex'].value = pSex; 
	  document.all['Nation'].value = pNation; 
	  document.all['Born'].value = pBorn; 
	  document.all['Address'].value = pAddress; 
	  document.all['CardNo'].value = pCardNo; 
	  document.all['Police'].value = pPolice;  
	  document.all['ActivityLFrom'].value = pActivityLFrom; 
	  document.all['DeviceNo'].value = pDeviceNo; 
	  document.all['ActivityLTo'].value = pActivityLTo; 
	  document.all['PhotoBuffer'].value = pPhotoBuffer; 
	  document.all['PhotoDisplay'].src = 'data:image/jpeg;base64,' + pPhotoBuffer; 
	}

	function clearForm() {
	  document.all['Name'].value = ''; 
	  document.all['Sex'].value = ''; 
	  document.all['Nation'].value = ''; 
	  document.all['Born'].value = ''; 
	  document.all['Address'].value = ''; 
	  document.all['CardNo'].value = ''; 
	  document.all['Police'].value = '';  
	  document.all['ActivityLFrom'].value = ''; 
	  document.all['ActivityLTo'].value = ''; 
	  document.all['PhotoBuffer'].value = ''; 
	  document.all['PhotoDisplay'].src = ''; 
	  document.all['DeviceNo'].value = ''; 

	}
function comparePass(){
	var pass1=document.getElementById('password').value;
	var pass2=document.getElementById('password2').value;
	if(pass1!=pass2){
		alert("密码不一致，请重新输入！");
		document.getElementById('password2').value='';
	}
}
function checkPass(){
	var pass1=document.getElementById('password').value.length;
	if(pass1<3){
		alert("密码长度过短，请重新输入！");
		document.getElementById('password2').value='';
	}
}
</script>
<style type="text/css">
		body{ font-size:14px;}
			input{ vertical-align:middle; margin:0; padding:0}
			.file-box{ position:relative;width:340px}
			.txt{ height:22px; border:1px solid #cdcdcd; width:180px;}
			.file{ position:absolute;filter:alpha(opacity:0);opacity: 0;width:200px;margin-top:-34px;height:34px; }
			.clo_sex{width:100px;text-align:left;}
			#alert_art,#alert_name,#alert_pho,#alert_time{color:#f00;font-size:12px;}
	</style> 
 </head>
<body>
<form class="form-horizontal" role="form" method="post" id="tform"> 
         	<!-- <input type="hidden" class="form-control" id="password" name="password" value="123"> -->
<div style="display: none;">
			性别<INPUT size=49 name=Sex>
			生日<INPUT size=49 name=Born>
			民族<INPUT size=49 name=Nation>
			地址<INPUT size=49 name=Address>
			发证机关<INPUT size=49 name=Police>
                              有效开始日期<INPUT size=49 name=ActivityLFrom>
			有效截止日期<INPUT size=49 name=ActivityLTo>
			设备id<INPUT size=49 name=DeviceNo>
			照片编码<TEXTAREA name=PhotoBuffer></TEXTAREA>
    </div>
<div class="top_title"><strong>管理员注册</strong></div>
<div style="margin-left:100px">
<div class="form-group">
      <label for="lastname" class="clo_sex">登录名</label>
      	<div style="width:200px;display: inline-block;">
         	<input type="text" class="form-control" id="loginName" placeholder="请输入登录名" name="loginName">
    	</div>
    	<span style="color:red;font-size:16px">*</span>
 </div>
<div class="form-group">
      <label for="lastname" class="clo_sex">密码</label>
      	<div style="width:200px;display: inline-block;">
         	<input type="password" class="form-control" id="password" placeholder="请输入 密码" name="password" onblur="checkPass()">
    	</div>
    	<span style="color:red;font-size:16px">*</span>&nbsp;&nbsp;
    	<span class="lastSpan" style="color:gray;font-size:12px">长度3-16</span>
 </div>
 <div class="form-group">
      <label for="lastname" class="clo_sex">确认密码</label>
      	<div style="width:200px;display: inline-block;">
         	<input type="password" class="form-control" id="password2" placeholder="再次输入密码" name="" onblur="comparePass()">
    	</div>
    	<span style="color:red;font-size:16px">*</span>
 </div>

<div class="form-group">
      <label for="lastname" class="clo_sex">姓名</label>
      	<div style="width:200px;display: inline-block;">
         	<input type="text" class="form-control" id="name" placeholder="请输入姓名" name="name">
    	</div>
    	<span style="color:red;font-size:16px">*</span>
</div>
 <div class="form-group">   	
 	<label for="firstname" class="clo_sex">性别</label>
        <div style="width:200px;display: inline-block;">
        	<input type="radio"  name="sex" value="男" checked="checked">男&nbsp;&nbsp;
        	<input type="radio"  name="sex" value="女">女
        </div>
</div>
<div class="form-group">
     <label for="firstname" class="clo_sex">生日</label>
        <div style="width:200px;display: inline-block;">
            <input type="text" class="form-control" id="birthDay" placeholder="请输入生日" name="birthDay" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',minDate:'1990-03-08 11:30:00'})" ">
		</div>
		<span id="bri_num"></span>
</div>
<div class="form-group">
      <label for="lastname" class="clo_sex">电话</label>
      	<div style="width:200px;display: inline-block;">
         	<input type="text" class="form-control" id="phone" placeholder="请输入电话" name="phone">
    	</div>
    	<span style="color:red;font-size:16px">*</span>
</div>
<div data-toggle="distpicker">
<div class="form-group">
	<input id="c_province" type="hidden" value="${apply.province}" />
	<label for="province" class="clo_sex">省份</label>
	<div style="width:200px;display: inline-block;" >
		 <select id="province" name="address" class="form-control" data-province="${apply.province}"></select>
	</div>
</div>
<div class="form-group" style="margin-bottom: -4px;">
	<input id="c_city" type="hidden" value="${apply.city}" />
	<label for="city" class="clo_sex" style="float: left;margin-top: 8px;">城市</label>
	<div style="width:200px;display: inline-block;margin-left: 4px;" >
		<select id="city" name="address" class="form-control" data-city="${apply.city}"></select> 
	</div>
</div>
<div class="form-group" style="margin-bottom: -4px;">
	<input id="c_district" type="hidden" value="${apply.district}" />
	<label for="district" class="clo_sex" style="float: left;margin-top: 8px;">地区</label>
	<div style="width:200px;display: inline-block;margin-left: 4px;" >
		<select id="district" name="address" class="form-control" data-district="${apply.district}"></select> 
	</div>
</div>
</div>
<div class="form-group" style="margin-bottom: -4px;">
	<label for="firstname" class="clo_sex" style="float: left;margin-top: 8px;">头像</label>
	<div style="width: 200px;display: inline-block;margin-left: 4px;">
			<input type="file" name="photoFile" id="photo" class="form-control"onchange="loadImage(this)" />
	</div>
</div>

<!-- <div class="form-group">
      <label for="lastname" class="clo_sex">头像</label>
      	<div style="width:200px;display: inline-block;">
			<IMG style="WIDTH: 124px; HEIGHT: 150px" name=PhotoDisplay>
    	</div>
</div> -->
      <div class="form-group">
      	<div class="clo_sex" style="width:300px;margin-left:92px;margin-top:30px">
         	<button type="button" class="btn btn-default" onclick="formSubmit()" style="background-color: #85acff;width: 96px;" >注册</button>&nbsp;&nbsp;&nbsp;&nbsp;
     	 	<button type="button" class="btn btn-default" onclick="history.go(-1);" style="background-color: #85acff;width: 96px;">返回</button>
     	</div>
   	</div>
   	</div>
</form>
	
  </body>
</html>
