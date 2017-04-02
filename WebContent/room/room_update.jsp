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
	function checkRoomNumber() {
	    var room_number = $("#room_number").val();
	    if (room_number == '') {
	        $('#alert_room_number').html("* 房间号不能为空");
	        return;
	    }
	    $('#alert_room_number').html("");
	}
	function checkPhone(){
		var phone =$("#phone").val();
		var reg = new RegExp("^[0-9]*$");
		if(phone==''){
			$("#alert_phone").html("* 分机号不能为空");
			return;
		}
		if(!reg.test(phone)){  
			$("#alert_phone").html("请输入正确的号码!"); 
		    obj2.value="";
		    obj2.focus();
		    return ;
		} 
	}
	function formSubmit() {
		var room_number = $("#room_number").val();
		var type_id = $("#type_id").val();
		var phone =$("#phone").val();
	    if (room_number == '') {
	        $('#alert_room_number').html("* 房间号不能为空");
	        return;
	    }
	    if (type_id == '') {
	        $('#alert_type_id').html("* 请选择房间类型");
	        return;
	    }else{
	    	$('#alert_type_id').html("");
	    }
	    if (phone == '') {
	        $('#alert_phone').html("* 请输入分机号");
	        return;
	    }else{
	    	$('#alert_phone').html("");
	    }
	    var formData = new FormData($("#tform")[0]);
	    var url = "<%=request.getContextPath() %>/room/update.do";
	    $.ajax({
			type: 'post',
			url: url,
			data: $("#tform").serialize(),
			async : true,
			success: function(data){
				if(data.code == "SUCCESS"){
					alert("修改成功！");
					window.location.href='<%=request.getContextPath() %>/room/query.do';
				}
	  			else{
	  				layer.msg('修改失败！', {
						  offset: 't',
						  anim: 6
					});
	  			}
		}
		})
	}
	</script>
 </head>
<body style="overflow-x:hidden;"> 
	<form class="form-horizontal" role="form" method="post" id="tform"> 
		<div class="top_title"><strong>客房-信息修改</strong></div>
		<input type="hidden" name="id" value="${room.id}"> 
		<div style="margin-left:100px">
			<div class="form-group">
		      <label for="lastname" class="clo_sex">房间号</label>
		      	<div style="width:200px;display: inline-block;">
		         	<input type="text" class="form-control" id="room_number"  placeholder="请输入房间号" name="room_number" value="${room.room_number }" onblur="checkRoomNumber()">
		    	</div>	
		    	<span id="alert_room_number"></span>
		 </div>
		<div class="form-group">
		    <label for="lastname" class="clo_sex">类型</label>
		    <div style="width:200px;display: inline-block;" >
				<select name="type_id" id="type_id"  class="form-control">
					<option value="" selected="selected">--请选择--</option>
					<c:forEach var="v" items="${type_data}">
						<option <c:if test="${room.type_id==v.id }">selected='selected'</c:if> value="${v.id}">${v.tp_name }</option>
					</c:forEach>
				</select> 
			</div>
			
			<span id="alert_type_id"></span>
		</div>
		<div class="form-group">
		     <label for="lastname" class="clo_sex">状态</label>
		      <div style="width:200px;display: inline-block;" >
		        	<select id="state" class="form-control" name="state">
		 		  		 <option id="0" <c:if test="${room.state==0 }">selected='selected'</c:if> value=0>空闲</option>
		 		  		 <option id="1" <c:if test="${room.state==1 }">selected='selected'</c:if> value=1>使用中</option>
		 		  		 <option id="2" <c:if test="${room.state==2 }">selected='selected'</c:if> value=2>清洁中</option>
					</select>
				</div>
		</div>
		<div class="form-group">
		      <label for="lastname" class="clo_sex">分机号</label>
		      	<div style="width:200px;display: inline-block;">
		         	<input type="text" class="form-control" id="phone"  placeholder="请输入分机号" name="phone" value="${room.phone}" onblur="checkPhone()" onkeyup='this.value=this.value.replace(/\D/gi,"")' onpaste="return false;">
		    	</div>	
		    	<span id="alert_phone"></span>
		 </div>
		<div class="form-group" style="display: inline-block;">
		     <label for="lastname" class="col-sm-2 control-label" style="margin-left: -90px;">位置</label>
		        <div style="width:200px;display: inline-block;margin-left: 61px;width: 394px">
						<textarea name="position" id="position" class="form-control"
							placeholder="请输入位置信息(非必填项)" rows="6"> ${room.position } </textarea>
					</div>
		 </div>
	      <div class="form-group">
	      	<div class="clo_sex" style="width:300px;margin-left:105px;margin-top:30px">
	         	<button type="button" class="layui-btn layui-btn-normal layui-btn-radius" style="width: 103px;" onclick="formSubmit()" >修改</button>&nbsp;&nbsp;&nbsp;
	     	 	&nbsp;&nbsp;<button type="button" class="layui-btn layui-btn-normal layui-btn-radius" style="width: 103px;" onclick="history.go(-1)">返回</button>
	     	</div>
	   	</div>
	</div>

	</form>
  </body>
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
		#alert_room_number,#alert_type_id{
			color:#f00;
			font-size:12px;
		}
	</style>
</html>
