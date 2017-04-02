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
	function checkName() {
	    var tp_name = $("#tp_name").val();
	    if (tp_name == '') {
	        $('#alert_tp_name').html("* 类型名不能为空");
	        return;
	    }
	    $('#alert_tp_name').html("");
	}
	function checkPrice(){
		var price = $("#price").val();
	    if (price == '') {
	        $('#alert_price').html("* 价格不能为空");
	        return;
	    }
	    $('#alert_price').html("");
	}
	function checkBednum(){
		var bednum = $("#bednum").val();
	    if (bednum == '') {
	        $('#alert_bednum').html("* 床位不能为空");
	        return;
	    }
	    $('#alert_bednum').html("");
	}
	function checkBedtype(){
		var bedtype = $("#bedtype").val();
	    if (bedtype == '') {
	        $('#alert_bedtype').html("* 床型不能为空");
	        return;
	    }
	    $('#alert_bedtype').html("");
	}
	function checkPeopleNum(){
		var people_num = $("#people_num").val();
	    if (people_num == '') {
	        $('#alert_people_num').html("* 人数上限不能为空");
	        return;
	    }
	    $('#alert_people_num').html("");
	}
	function formSubmit() {
		var tp_name = $("#tp_name").val();
		var price = $("#price").val();
		var bednum = $("#bednum").val();
		var bedtype = $("#bedtype").val();
		var people_num = $("#people_num").val();
	    if (tp_name == '') {
	        $('#alert_tp_name').html("* 类型名不能为空");
	        return;
	    }
	    if (price == '') {
	        $('#alert_price').html("* 价格不能为空");
	        return;
	    }
	    if (bednum == '') {
	        $('#alert_bednum').html("* 床位不能为空");
	        return;
	    }
	    if (bedtype == '') {
	        $('#alert_bedtype').html("* 床型不能为空");
	        return;
	    }
	    if (people_num == '') {
	        $('#alert_people_num').html("* 人数上限不能为空");
	        return;
	    }
	    /* if (price == '') {
	        $('#alert_price').html("* 价格不能为空");
	        return;
	    } */
	    var reg = new RegExp("^[0-9]*$");  
	    var patten = /^(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/;
	    var obj =document.getElementById("price");
	   	var obj1 = document.getElementById("bednum");
		var obj2 = document.getElementById("people_num");
		if(obj.value!=""){
	   		if(!patten.test(obj.value)){  
			    alert("价格格式错误!"); 
			    obj.value="";
			    obj.focus();
			    return ;
			}
		}
	   	if(obj1.value!=""){
	   		if(!reg.test(obj1.value)){  
			    alert("请输入数字!"); 
			    obj1.value="";
			    obj1.focus();
			    return ;
			}  
			if(!/^[0-9]*$/.test(obj1.value)){  
			    alert("请输入数字!");
			    obj1.value="";
			    obj1.focus();
			    return ;
			} 
	   	}
	   	if(obj2.value!=""){
	   		if(!reg.test(obj2.value)){  
			    alert("请输入数字!"); 
			    obj2.value="";
			    obj2.focus();
			    return ;
			}  
			if(!/^[0-9]*$/.test(obj2.value)){  
			    alert("请输入数字!");
			    obj2.value="";
			    obj2.focus();
			    return ;
			} 
	   	}
	    var formData = new FormData($("#tform")[0]);
	    var url = "<%=request.getContextPath() %>/roomtype/update.do";
	    $.ajax({
			type: 'post',
			url: url,
			data: $("#tform").serialize(),
			async : true,
			success: function(data){
				if(data.code == "SUCCESS"){
					alert("修改成功！");
					window.location.href='<%=request.getContextPath() %>/roomtype/query.do';
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
		<div class="top_title"><strong>客房类型-信息修改</strong></div>
			<input type="hidden" name="id" value="${roomType.id}"> 
		<div style="margin-left:100px">
			<div class="form-group">
		      <label for="lastname" class="clo_sex">类型名称</label>
		      	<div style="width:200px;display: inline-block;">
		         	<input type="text" class="form-control" id="tp_name"  placeholder="请输入类型名称" name="tp_name" value="${roomType.tp_name}" onblur="checkName()">
		    	</div>	
		    	<span id="alert_tp_name"></span>
		 </div>
		<div class="form-group">
		    <label for="lastname" class="clo_sex">价格</label>
		    <div style="width:200px;display: inline-block;" >
		        	<input type="text" class="form-control" name="price" id="price" placeholder="请输入价格" value="${roomType.price}" onblur="checkPrice()" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
			</div>
			<span id="alert_price"></span>
		</div>
		<div class="form-group">
		     <label for="lastname" class="clo_sex">床位</label>
		      <div style="width:200px;display: inline-block;" >
		        	<input type="text" class="form-control" name="bednum" id="bednum" placeholder="请输入床位数" onblur="checkBednum()" value="${roomType.bednum }"
		        	onkeyup='this.value=this.value.replace(/\D/gi,"")' onpaste="return false;">
			</div>
			<span id="alert_bednum"></span>
		</div>
		<div class="form-group">
				<label for="firstname" class="clo_sex">床型</label>
		        <div style="width:200px;display: inline-block;">
		        	<input type="text" class="form-control" id="bedtype" placeholder="请输入床型" name="bedtype" value="${roomType.bedtype }" onblur="checkBedtype();">
		        </div>
		        <span id="alert_bedtype"></span>
		</div>
		<div class="form-group">
		     <label for="lastname" class="clo_sex">提供早餐</label>
		      <div style="width:200px;display: inline-block;" >
		        	<select id="idType" class="form-control" name="breakfast">
		 		  		 <option id="0"  <c:if test="${roomType.breakfast=='0'}">selected="selected"</c:if> value=0>是</option>
		 		  		 <option id="1"  <c:if test="${roomType.breakfast=='1'}">selected="selected"</c:if> value=1>否</option>
					</select> 
				</div>
		</div>
		<div class="form-group">
		     <label for="firstname" class="clo_sex">人数上限</label>
		        <div style="width:200px;display: inline-block;">
		        	<input type="text" class="form-control" id="people_num" placeholder="请输入人数上限" name="people_num" value="${roomType.people_num}" onblur="checkPeopleNum()" 
		        	onkeyup='this.value=this.value.replace(/\D/gi,"")' onpaste="return false;">
		        </div>
		   		<span id="alert_people_num"></span>
		</div>
		<div class="form-group" style="display: inline-block;margin-left: -60px;">
		     <label for="firstname" class="col-sm-2 control-label" style="margin-left: -44px;">备注</label>
		        <div  class="col-sm-10" style="width:200px;display: inline-block;margin-left: 44px;">
						<textarea name="remark" id="remark" class="form-control" rows="3" cols="20" placeholder="请输入备注(非必填项)" rows="6" style="width: 450px;height: 106px;">${roomType.remark}</textarea>
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
   <%--  <% if(request.getAttribute("result")!=null){ %>
		<script type="text/javascript">
			alert("<%=request.getAttribute("result") %>");
			<% if(request.getAttribute("result")=="SUCCESS"){ %>
				window.location.href="<%=request.getContextPath() %>/roomtype/query.do";
			<%} %>
		</script>
	<%} %> --%>
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
		#alert_tp_name,#alert_price,#alert_bednum,#alert_bedtype,#alert_people_num {
			color:#f00;
			font-size:12px;
		}
	</style>
</html>
