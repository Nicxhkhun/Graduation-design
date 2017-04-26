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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/layui.css">
<script src="<%=request.getContextPath()%>/js/idCard.js"></script> 
<script src="<%=request.getContextPath()%>/jquery/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/jquery/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<script src="<%=request.getContextPath()%>/js/formcheck.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/tableutil.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.9.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/layui.all.js"></script>
<script src="<%=request.getContextPath()%>/js/layer-v2.3/layer.js"></script>

<script type="text/javascript">
/* window.onload=function(){
	document.getElementById("hidden").style.display="none";
} */
	function checkCname() {
	    var c_name = $("#c_name1").val();
	    if (c_name == '') {
	        $('#alert_c_name1').html("* 顾客姓名不能为空");
	        return;
	    }
	    $('#alert_c_name1').html("");
	}
	function checkCname2() {
	    var c_name = $("#c_name2").val();
	    if (c_name == '') {
	        $('#alert_c_name2').html("* 顾客姓名不能为空");
	        return;
	    }
	    $('#alert_c_name2').html("");
	}
	function checkCname3() {
	    var c_name = $("#c_name3").val();
	    if (c_name == '') {
	        $('#alert_c_name3').html("* 顾客姓名不能为空");
	        return;
	    }
	    $('#alert_c_name3').html("");
	}
	function checkCname4() {
	    var c_name = $("#c_name4").val();
	    if (c_name == '') {
	        $('#alert_c_name4').html("* 顾客姓名不能为空");
	        return;
	    }
	    $('#alert_c_name4').html("");
	}
	function checkZjno(){
		var zjno = $("#zj_no1").val();
	    if (zjno == '') {
	        $('#alert_zj_no1').html("* 证件号不能为空");
	        return;
	    } else {
	    	var res=Base.isIDCardNo(zjno);
	    	if(res==false){
	    		$('#alert_zj_no1').html("* 证件号格式错误");
	    		return;
	    	}
	    }
	    $('#alert_zj_no1').html("");
	}
	function checkZjno2(){
		var zjno = $("#zj_no2").val();
	    if (zjno == '') {
	        $('#alert_zj_no2').html("* 证件号不能为空");
	        return;
	    } else {
	    	var res=Base.isIDCardNo(zjno);
	    	if(res==false){
	    		$('#alert_zj_no2').html("* 证件号格式错误");
	    		return;
	    	}
	    }
	    $('#alert_zj_no2').html("");
	}
	function checkZjno3(){
		var zjno = $("#zj_no3").val();
	    if (zjno == '') {
	        $('#alert_zj_no3').html("* 证件号不能为空");
	        return;
	    } else {
	    	var res=Base.isIDCardNo(zjno);
	    	if(res==false){
	    		$('#alert_zj_no3').html("* 证件号格式错误");
	    		return;
	    	}
	    }
	    $('#alert_zj_no3').html("");
	}
	function checkZjno4(){
		var zjno = $("#zj_no4").val();
	    if (zjno == '') {
	        $('#alert_zj_no4').html("* 证件号不能为空");
	        return;
	    } else {
	    	var res=Base.isIDCardNo(zjno);
	    	if(res==false){
	    		$('#alert_zj_no4').html("* 证件号格式错误");
	    		return;
	    	}
	    }
	    $('#alert_zj_no4').html("");
	}
	function checkPaccount(){
		var p_account = $("#p_account").val();
	    if (p_account == '') {
	        $('#alert_p_account').html("* 人数不能为空");
	        return;
	    }else {
	    	var res=Base.isInt(p_account);
	    	if(res==false){
	    		$('#alert_p_account').html("* 人数格式错误");
	    		return;
	    	}
	    }
	    $('#alert_p_account').html("");
	}
	function checkTel(){
		var contact = $("#contact").val();
	    if (contact == '') {
	        $('#alert_contact').html("* 紧急联系方式不能为空");
	        return;
	    }else {
	    	var res=Base.isPhone(contact);
	    	if(res==false){
	    		$('#alert_contact').html("* 手机号格式错误");
	    		return;
	    	}
	    }
	    $('#alert_contact').html("");
	}
	function checkDate(){
		var start_date = $("#start_date").val();
		var end_date = $("#end_date").val();
	    if (start_date == '') {
	        $('#alert_date').html("* 入住时间不能为空");
	        return;
	    }else if(end_date == ''){
	    	$('#alert_date').html("* 预计退房时间不能为空");
	        return;
	    }else{
	    	if(start_date>end_date){
	    		$('#alert_date').html("* 时间区间错误");
	    		return;
	    	}
	    	$('#alert_date').html("");
	    }
	    $('#alert_date').html("");
	}
	
	function goback(){
		parent.window.location.reload();
		window.location.href='<%=request.getContextPath() %>/roomtype/query.do';
	}
	
	function formSubmit() {
		var p_account = $("#p_account").val();//人数
		var start_date = $("#start_date").val();
		var end_date = $("#end_date").val();//时间
		var contact = $("#contact").val();
		var c_name1 = $("#c_name1").val();
		var zj_no1=$("#zj_no1").val();
		
		var c_name2 = $("#c_name2").val();
		var zj_no2=$("#zj_no2").val();
		
		var c_name3 = $("#c_name3").val();
		var zj_no3=$("#zj_no3").val();
		
		var c_name4 = $("#c_name4").val();
		var zj_no4=$("#zj_no4").val();
		
	   if (p_account == '') {
	    	$('#alert_p_account').html("* 人数不能为空");
	        return;
	    }
	    if(Base.isInt(p_account)==false){
    		$('#alert_p_account').html("* 人数格式错误");
    		return;
	    }
	    if (contact == '') {
	        $('#alert_contact').html("* 紧急联系方式不能为空");
	        return;
	    }
    	if(Base.isPhone(contact)==false){
    		$('#alert_contact').html("* 手机号格式错误");
    		return;
    	}
	    if (start_date == '') {
	        $('#alert_date').html("* 入住时间不能为空");
	        return;
	    }
	    if(end_date == ''){
	    	$('#alert_date').html("* 预计退房时间不能为空");
	        return;
	    }
	    if(end_date != ''&& start_date != ''){
	    	if(start_date>end_date){
	    		$('#alert_date').html("* 时间区间错误");
	    		return;
	    	}
	    }
	   if (c_name1 == '') {
	        $('#alert_c_name1').html("* 顾客姓名不能为空");
	        return;
	    }
    	if(zj_no1==''){
    		$('#alert_zj_no1').html("* 证件号不能为空");
	        return;
    	}
    	if(Base.isIDCardNo(zj_no1)==false){
    		$('#alert_zj_no1').html("* 证件号格式错误");
    		return;
    	}
    	if (c_name2 != '') {
    		if(zj_no2 == ''){
	        	$('#alert_zj_no2').html("* 证件号不能为空");
		        return;
    		}
    		else if(Base.isIDCardNo(zj_no2)==false){
    			$('#alert_zj_no2').html("* 证件号格式错误");
    			 return;
    		}
	    }
    	if(zj_no2!=''&&c_name2==''){
    		$('#alert_c_name2').html("* 顾客姓名不能为空");
	        return;
    	}
    	if(zj_no2==''&&c_name2==''){
    		$('#alert_zj_no2').html("");
    		$('#alert_c_name2').html("");
    	}
    	
    	if (c_name3 != '') {
    		if(zj_no3 == ''){
	        	$('#alert_zj_no3').html("* 证件号不能为空");
		        return;
    		}
    		else if(Base.isIDCardNo(zj_no3)==false){
    			$('#alert_zj_no3').html("* 证件号格式错误");
    			 return;
    		}
	    }
    	if(zj_no3!=''&&c_name3==''){
    		$('#alert_c_name3').html("* 顾客姓名不能为空");
	        return;
    	}
    	if(zj_no3==''&&c_name3==''){
    		$('#alert_zj_no3').html("");
    		$('#alert_c_name3').html("");
    	}
    	
    	if (c_name4 != '') {
    		if(zj_no4 == ''){
	        	$('#alert_zj_no4').html("* 证件号不能为空");
		        return;
    		}
    		else if(Base.isIDCardNo(zj_no4)==false){
    			$('#alert_zj_no4').html("* 证件号格式错误");
    			 return;
    		}
	    }
    	if(zj_no4!=''&&c_name4==''){
    		$('#alert_c_name4').html("* 顾客姓名不能为空");
	        return;
    	}
    	if(zj_no4==''&&c_name4==''){
    		$('#alert_zj_no4').html("");
    		$('#alert_c_name4').html("");
    	}
    	sub();
	}
	function sub(){
		document.forms[0].action="<%=request.getContextPath() %>/occupancy/occupancy.do";
		document.forms[0].submit();
	}
	</script>
 </head>
<body style="overflow-x:hidden;"> 
	<form class="form-horizontal" role="form" method="post" id="tform" action="<%=request.getContextPath() %>/occupancy/occupancy.do"> 
		<div class="top_title"><strong>入住登记</strong></div>
			<input type="hidden" name="id" value="${learner.id}"> 
		<div style="margin-left:100px">
		
		<input type="hidden" value="${roomid }" name="room_id">
		<!-- -------------------------------------------------- -->
		<div class="div1" style="margin-left:35px">
			 <div class="form-group">
			    	<label for="lastname" class="clo_sex">人数 </label>
			    	<div style="width:200px;display: inline-block;">
			         	<input type="text" class="form-control" id="p_account"  placeholder="请输入人数" name="p_account" onblur="checkPaccount()" onkeyup="value=value.replace(/[^\d]/g,'')">
			    	</div>
			    	<span id="alert_p_account"></span>
			 </div>
			 <div class="form-group">
			    <label for="lastname" class="clo_sex">紧急联系方式</label>
			    <div style="width:200px;display: inline-block;" >
			        	<input type="text" class="form-control" name="contact" id="contact" placeholder="请输入手机号码" onblur="checkTel()" onkeyup="value=value.replace(/[^\d]/g,'')">
				</div>
				<span id="alert_contact"></span>
			</div>
			<div class="form-group">
			     <label for="lastname" class="clo_sex">入住时间 </label>
			      	<div style="width:200px;display: inline-block;">
			         	<input type="text" class="form-control" id="start_date"  placeholder="入住时间" name="start_date" onblur="checkDate()"  onfocus=" WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm'})">
			    	</div>
			    	&nbsp;&nbsp;<font style="font-weight: 800;">至</font>&nbsp;&nbsp;
			    	<div style="width:200px;display: inline-block;">
			         	<input type="text" class="form-control" id="end_date"  placeholder="预计退房时间" name="end_date" onblur="checkDate()" onfocus=" WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd HH:mm'})">
			    	</div>
			    	
			    	<span id="alert_date"></span>
			 </div>
			 <div class="form-group">
			     <label for="firstname" class="clo_sex">备注 </label>
			      	<div style="display: inline-flex;width: 438px">
						<textarea name="remark" id="remark" class="form-control"
							placeholder="请输入备注信息(非必填项)" rows="3"></textarea>
					</div>
			 </div>
		</div>
		
		<!-- =============================================================================== -->
<div class="panel-group" id="accordion" style="width: 950px;">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseOne">
					▼顾客一信息
				</a>
			</h4>
		</div>
		<div id="collapseOne" class="panel-collapse collapse in">
			<div class="panel-body">
						<div class="div1">
							<div class="form-group">
							      <label for="lastname" class="clo_sex">姓名</label>
							      	<div style="width:200px;display: inline-block;">
							         	<input type="text" class="form-control" id="c_name1"  placeholder="请输入姓名" name="c_name" value="" onblur="checkCname()">
							    	</div>	
							    	<span id="alert_c_name1"></span>
							 </div>
							 <div class="form-group">
							     <label for="lastname" class="clo_sex">性别</label>
							      <div style="width:200px;display: inline-block;" >
							        	<select id="c_sex1" class="form-control" name="c_sex">
							 		  		 <option id="" value="男" selected="selected">男</option>
							 		  		 <option id="" value="女">女</option>
										</select>
									</div>
							</div>
							<div class="form-group">
							     <label for="lastname" class="clo_sex">证件类型</label>
							      <div style="width:200px;display: inline-block;" >
							        	<select id="zj_type1" class="form-control" name="zj_type">
							 		  		 <option id="" value="身份证" selected="selected">身份证</option>
							 		  		 <option id="" value="学生证">学生证</option>
							 		  		 <option id="" value="军官证">军官证</option>
							 		  		 <option id="" value="警官证">警官证</option>
							 		  		 <option id="" value="士兵证">士兵证</option>
							 		  		 <option id="" value="驾驶证">驾照证</option>
							 		  		 <option id="" value="户口本">户口本</option>
							 		  		 <option id="" value="驾照">驾照</option>
							 		  		 <option id="" value="护照">护照</option>
										</select>
									</div>
							</div>
							<div class="form-group">
							    <label for="lastname" class="clo_sex">证件号</label>
							    <div style="width:200px;display: inline-block;" >
							        	<input type="text" class="form-control" name="zj_no" id="zj_no1" placeholder="请输入证件号" onblur="checkZjno()" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
								</div>
								<span id="alert_zj_no1"></span>
							</div>
						</div>
				</div>
			</div>
		</div>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseTwo">
					▼顾客二信息
				</a>
			</h4>
		</div>
		<div id="collapseTwo" class="panel-collapse collapse">
			<div class="panel-body">
						<div class="div1">
							<div class="form-group">
							      <label for="lastname" class="clo_sex">姓名</label>
							      	<div style="width:200px;display: inline-block;">
							         	<input type="text" class="form-control" id="c_name2"  placeholder="请输入姓名" name="c_name" onblur="checkCname2()">
							    	</div>	
							    	<span id="alert_c_name2"></span>
							 </div>
							 <div class="form-group">
							     <label for="lastname" class="clo_sex">性别</label>
							      <div style="width:200px;display: inline-block;" >
							        	<select id="c_sex2" class="form-control" name="c_sex">
							 		  		 <option id="" value="男" selected="selected">男</option>
							 		  		 <option id="" value="女">女</option>
										</select>
									</div>
							</div>
							<div class="form-group">
							     <label for="lastname" class="clo_sex">证件类型</label>
							      <div style="width:200px;display: inline-block;" >
							        	<select id="zj_type2" class="form-control" name="zj_type">
							 		  		 <option id="" value="身份证" selected="selected">身份证</option>
							 		  		 <option id="" value="学生证">学生证</option>
							 		  		 <option id="" value="军官证">军官证</option>
							 		  		 <option id="" value="警官证">警官证</option>
							 		  		 <option id="" value="士兵证">士兵证</option>
							 		  		 <option id="" value="驾驶证">驾照证</option>
							 		  		 <option id="" value="户口本">户口本</option>
							 		  		 <option id="" value="驾照">驾照</option>
							 		  		 <option id="" value="护照">护照</option>
										</select>
									</div>
							</div>
							<div class="form-group">
							    <label for="lastname" class="clo_sex">证件号</label>
							    <div style="width:200px;display: inline-block;" >
							        	<input type="text" class="form-control" name="zj_no" id="zj_no2" placeholder="请输入证件号" onblur="checkZjno2()" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
								</div>
								<span id="alert_zj_no2"></span>
							</div>
						</div>
					</div>
			</div>
	</div>
	<div class="panel panel-info">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseThree">
					▼顾客三信息
				</a>
			</h4>
		</div>
		<div id="collapseThree" class="panel-collapse collapse">
			<div class="panel-body">
				
				
				
						<div class="div1">
							<div class="form-group">
							      <label for="lastname" class="clo_sex">姓名</label>
							      	<div style="width:200px;display: inline-block;">
							         	<input type="text" class="form-control" id="c_name3"  placeholder="请输入姓名" name="c_name" value="" onblur="checkCname3()">
							    	</div>	
							    	<span id="alert_c_name3"></span>
							 </div>
							 <div class="form-group">
							     <label for="lastname" class="clo_sex">性别</label>
							      <div style="width:200px;display: inline-block;" >
							        	<select id="c_sex3" class="form-control" name="c_sex">
							 		  		 <option id="" value="男" selected="selected">男</option>
							 		  		 <option id="" value="女">女</option>
										</select>
									</div>
							</div>
							<div class="form-group">
							     <label for="lastname" class="clo_sex">证件类型</label>
							      <div style="width:200px;display: inline-block;" >
							        	<select id="zj_type3" class="form-control" name="zj_type">
							 		  		 <option id="" value="身份证" selected="selected">身份证</option>
							 		  		 <option id="" value="学生证">学生证</option>
							 		  		 <option id="" value="军官证">军官证</option>
							 		  		 <option id="" value="警官证">警官证</option>
							 		  		 <option id="" value="士兵证">士兵证</option>
							 		  		 <option id="" value="驾驶证">驾照证</option>
							 		  		 <option id="" value="户口本">户口本</option>
							 		  		 <option id="" value="驾照">驾照</option>
							 		  		 <option id="" value="护照">护照</option>
										</select>
									</div>
							</div>
							<div class="form-group">
							    <label for="lastname" class="clo_sex">证件号</label>
							    <div style="width:200px;display: inline-block;" >
							        	<input type="text" class="form-control" name="zj_no" id="zj_no3" placeholder="请输入证件号" onblur="checkZjno3()" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
								</div>
								<span id="alert_zj_no3"></span>
							</div>
						</div>
					</div>
		</div>
	</div>
	<div class="panel panel-warning">
		<div class="panel-heading">
			<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseFour">
					▼顾客四信息
				</a>
			</h4>
		</div>
		<div id="collapseFour" class="panel-collapse collapse">
			<div class="panel-body">
				
				
				
				
						<div class="div1">
							<div class="form-group">
							      <label for="lastname" class="clo_sex">姓名</label>
							      	<div style="width:200px;display: inline-block;">
							         	<input type="text" class="form-control" id="c_name4"  placeholder="请输入姓名" name="c_name" value="" onblur="checkCname4()">
							    	</div>	
							    	<span id="alert_c_name4"></span>
							 </div>
							 <div class="form-group">
							     <label for="lastname" class="clo_sex">性别</label>
							      <div style="width:200px;display: inline-block;" >
							        	<select id="c_sex4" class="form-control" name="c_sex">
							 		  		 <option id="" value="男" selected="selected">男</option>
							 		  		 <option id="" value="女">女</option>
										</select>
									</div>
							</div>
							<div class="form-group">
							     <label for="lastname" class="clo_sex">证件类型</label>
							      <div style="width:200px;display: inline-block;" >
							        	<select id="zj_type4" class="form-control" name="zj_type">
							 		  		<option id="" value="身份证" selected="selected">身份证</option>
							 		  		 <option id="" value="学生证">学生证</option>
							 		  		 <option id="" value="军官证">军官证</option>
							 		  		 <option id="" value="警官证">警官证</option>
							 		  		 <option id="" value="士兵证">士兵证</option>
							 		  		 <option id="" value="驾驶证">驾照证</option>
							 		  		 <option id="" value="户口本">户口本</option>
							 		  		 <option id="" value="驾照">驾照</option>
							 		  		 <option id="" value="护照">护照</option>
										</select>
									</div>
							</div>
							<div class="form-group">
							    <label for="lastname" class="clo_sex">证件号</label>
							    <div style="width:200px;display: inline-block;" >
							        	<input type="text" class="form-control" name="zj_no" id="zj_no4" placeholder="请输入证件号" onblur="checkZjno4()" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
								</div>
								<span id="alert_zj_no4"></span>
							</div>
						</div>
					</div>
		</div>
	</div>
</div>
		<!-- <div class="form-group">
		     <label for="lastname" class="clo_sex">床位</label>
		      <div style="width:200px;display: inline-block;" >
		        	<input type="text" class="form-control" name="bednum" id="bednum" placeholder="请输入床位数" onblur="checkBednum()" 
		        	onkeyup='this.value=this.value.replace(/\D/gi,"")' onpaste="return false;">
			</div>
			<span id="alert_bednum"></span>
		</div>
		<div class="form-group">
				<label for="firstname" class="clo_sex">床型</label>
		        <div style="width:200px;display: inline-block;">
		        	<input type="text" class="form-control" id="bedtype" placeholder="请输入床型" name="bedtype" value="" onblur="checkBedtype();">
		        </div>
		        <span id="alert_bedtype"></span>
		</div>
		<div class="form-group">
		     <label for="lastname" class="clo_sex">提供早餐</label>
		      <div style="width:200px;display: inline-block;" >
		        	<select id="idType" class="form-control" name="breakfast">
		 		  		 <option id="0" value=0 selected="selected">是</option>
		 		  		 <option id="1" value=1>否</option>
					</select>
				</div>
		</div>
		<div class="form-group">
		     <label for="firstname" class="clo_sex">人数上限</label>
		        <div style="width:200px;display: inline-block;">
		        	<input type="text" class="form-control" id="people_num" placeholder="请输入人数上限" name="people_num" value="" onblur="checkPeopleNum()" 
		        	onkeyup='this.value=this.value.replace(/\D/gi,"")' onpaste="return false;">
		        </div>
		   		<span id="alert_people_num"></span>
		</div>
		<div class="form-group">
		     <label for="lastname" class="col-sm-2 control-label" style="margin-left: -90px;">备注</label>
		        <div style="width:200px;display: inline-block;margin-left: 61px;width: 394px">
						<textarea name="remark" id="remark" class="form-control"
							placeholder="请输入备注(非必填项)" rows="6"></textarea>
					</div>
		 </div> -->
		     <!--  <div class="form-group">
		      	<div class="clo_sex" style="width:300px;margin-left:105px;margin-top:30px">
		         	<button type="button" class="layui-btn layui-btn-normal layui-btn-radius" style="width: 103px;" onclick="formSubmit()" >保存</button>&nbsp;&nbsp;&nbsp;
		     	 	&nbsp;&nbsp;<button type="button" class="layui-btn layui-btn-normal layui-btn-radius" style="width: 103px;" onclick="goback()">返回</button>
		     	</div>
		   	</div> -->
		</div>

	</form>
  </body>
      <% if(request.getAttribute("result")!=null){ %>
		<script type="text/javascript">
		layer.alert('<%=request.getAttribute("result") %>', {
			  skin: 'layui-layer-lan' //样式类名
			  ,closeBtn: 0
			},function(){
				layer.alert('<%=request.getAttribute("res") %>', {
				    skin: 'layui-layer-molv'
				    ,closeBtn: 0
				    ,anim: 4 
			},function(){
				parent.location.reload();
			})
		});
		</script>
	<%} %> 
	<style type="text/css">
		body {
			font-size:14px;
		}
		input {
			vertical-align:middle;
			margin:0;
			padding:0
		}
		.file-box {
			position:relative;
			width:340px
		}
		.txt {
			height:22px;
			border:1px solid #cdcdcd;
			width:180px;
		}
		.file {
			position:absolute;
			filter:alpha(opacity:0);
			opacity: 0;
			width:200px;
			margin-top: -34px;
			height: 34px;
		}
		.clo_sex {
			width:100px;
			text-align:left;
		}
		#alert_c_name1,#alert_c_name2,#alert_c_name3,#alert_c_name4,#alert_zj_no1,#alert_zj_no2,#alert_zj_no3,#alert_zj_no4,#alert_p_account,#alert_contact,#alert_date {
			color:#f00;
			font-size:12px;
		}
		.div1 {
    		/* border-bottom: 1px solid #d2d2d2; */
    		margin-bottom: 20px;
    		padding-left: 20px;
    		margin: 0 20px;
    	}
    	a:link {text-decoration:none;} 
	</style>
</html>
