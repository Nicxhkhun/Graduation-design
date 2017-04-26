<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	function update() {
		var remark = $("#remark").val();
		var id=$("#id").val();
		
	    var formData = new FormData($("#tform")[0]);
	    var url = "<%=request.getContextPath() %>/order/update.do";
	    $.ajax({
			type: 'post',
			url: url,
			data: {"remark":remark,"id":id},
			async : true,
			success: function(data){
				if(data.res == "SUCCESS"){
					alert("修改成功！");
					window.location.href='<%=request.getContextPath() %>/order/query.do';
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
		<input type="hidden" id="id" value="${order.order_id}"> 
		<div style="margin-left:100px">
			<div class="form-group">
		      <label for="lastname" class="clo_sex">账单号</label>
		      	<div style="width:200px;display: inline-block;">
		         	<input type="text" class="form-control" id="order_num"  placeholder="请输入账单号" name="order_num" value="${order.order_num }" readonly="readonly">
		    	</div>	
		 </div>
	
		<div class="form-group">
		      <label for="lastname" class="clo_sex">房间号</label>
		      	<div style="width:200px;display: inline-block;">
		         	<input type="text" class="form-control" id="room_num"  placeholder="请输入房间号" name="room_num" value="${order.room_num}" readonly="readonly">
		    	</div>	
		 </div>
		 <div class="form-group">
		      <label for="lastname" class="clo_sex">订单类型</label>
		      	<div style="width:200px;display: inline-block;">
		         	<input type="text" class="form-control" id="type"  placeholder="请输入订单类型" name="type" value="${order.type}" readonly="readonly">
		    	</div>	
		 </div>
		  <div class="form-group">
		      <label for="lastname" class="clo_sex">金额</label>
		      	<div style="width:200px;display: inline-block;">
		         	<input type="text" class="form-control" id="money"  placeholder="请输入金额" name="money" value="${order.money}" readonly="readonly">
		    	</div>	
		 </div>
		  <div class="form-group">
		      <label for="lastname" class="clo_sex">下单时间</label>
		      	<div style="width:200px;display: inline-block;">
		         	<input type="text" class="form-control" id="time"  placeholder="请输入时间" name="time" value="${fn:substring(order.time, 0, 19)}" readonly="readonly">
		    	</div>	
		 </div>
		  <div class="form-group">
		      <label for="lastname" class="clo_sex">操作员</label>
		      	<div style="width:200px;display: inline-block;">
		         	<input type="text" class="form-control" id="op_name"  placeholder="请输入操作员" name="op_name" value="${order.op_name}" readonly="readonly">
		    	</div>	
		 </div>
		<div class="form-group" style="display: inline-block;">
		     <label for="lastname" class="col-sm-2 control-label" style="margin-left: -90px;">备注</label>
		        <div style="width:200px;display: inline-block;margin-left: 61px;width: 394px">
						<textarea name="remark" id="remark" class="form-control"
							placeholder="请输入备注信息" rows="6">${order.remark }</textarea>
					</div>
		 </div>
	      <div class="form-group">
	      	<div class="clo_sex" style="width:300px;margin-left:105px;margin-top:30px">
	         	<button type="button" class="layui-btn layui-btn-normal layui-btn-radius" style="width: 103px;" onclick="update()" >修改</button>&nbsp;&nbsp;&nbsp;
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
