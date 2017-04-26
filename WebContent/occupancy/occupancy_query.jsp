<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/jquery/bootstrap-3.3.6-dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery.resizableColumns.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/demo.css">
<link href="<%=request.getContextPath()%>/js/layer-v2.3/skin/layer.css"
	rel="stylesheet" />
<script src="<%=request.getContextPath()%>/jquery/jquery-1.11.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/jquery/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery/tableutil.js"></script>
<script src="<%=request.getContextPath()%>/js/layer-v2.3/layer.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/store.js"></script>
<script
	src="<%=request.getContextPath()%>/js/jquery.resizableColumns.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">  
	function clean(){
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			return;
		var url = "<%=request.getContextPath() %>/occupancy/findById.do";
			$.ajax({
				type: 'post',
				url: url,
				data: {"id":id},
				async : true,
				success: function(data){
					if(data.code == "SUCCESS"){
						if(data.room.state==0||data.room.state==1){
							layer.msg('该房间当前无法清房！', {
							  offset: 't',
							  anim: 6
							});
						}else{
							toclean(id);
						}
					}else{
		  				alert("抱歉，出错了！"); 
		  			}
			}
			})
		
	}
	function toclean(id){
		$.ajax({
 			type: 'post',
 			url: "<%=request.getContextPath() %>/occupancy/clean.do",
 			data: {"id":id},
 			async : true,
 			success: function(data){
 				if(data.res == "SUCCESS"){
 					layer.msg('房间已清理完毕！', {
					  offset: 't',
					  anim: 6
					});
 				}
		  		else{
		  			alert("抱歉，出错了！"); 
		  		}
			}
 		})
	}
	function rzhu(){
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			return;
		var url = "<%=request.getContextPath() %>/occupancy/findById.do";
 		$.ajax({
 			type: 'post',
 			url: url,
 			data: {"id":id},
 			async : true,
 			success: function(data){
 				if(data.code == "SUCCESS"){
 					if(data.room.state==1){
 						layer.msg('该房间使用中，请选择其他房间！', {
							  offset: 't',
							  anim: 6
						});
 					}else if(data.room.state==2){
 						layer.msg('该房间清洁中，目前无法使用！', {
 							  offset: 't',
 							  anim: 6
 						});
 					}else{
 						tocus(id);
 					}
 				}
		  		else{
		  			alert("抱歉，出错了！"); 
		  		}
			}
 		})
		
	}
	function tocus(id){
		layer.open({
			  type: 2,
			  area: ['98%', '98%'],
			  skin: 'layui-layer-lan',
			  fix: false, //不固定
			  maxmin: true,
			  title: '顾客入住',
			  content: '<%=request.getContextPath() %>/occupancy/toCustomer.do?roomid='+id,
			  btn: '确认',
	          yes : function(index,dom){
	         	  window["layui-layer-iframe" + index].formSubmit(); 
	          },
	          end: function () {
	              location.reload();
	          }
			});
	}
	function xzhu(){
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			return;
		
		$.ajax({
 			type: 'post',
 			url: "<%=request.getContextPath() %>/occupancy/findById.do",
 			data: {"id":id},
 			async : true,
 			success: function(data){
 				if(data.code == "SUCCESS"){
 					if(data.room.state==1){
 						layer.open({
 	 						  type: 2,
 	 						  skin: 'layui-layer-lan', //加上边框
 	 						  area: ['1140px', '540px'], //宽高
 	 						  resize: true,//拉伸
 	 						  fix: false, //不固定
 	 						  title: '房间续住',
 	 						  content: ['<%=request.getContextPath() %>/occupancy/toStay.do?room_id='+id, 'yes']
 	 					});
 					}else{
 						layer.msg('该房间无人入住中，无法续住！', {
							  offset: 't',
							  anim: 6
						});
 					}
 				}
		  		else{
		  			alert("抱歉，出错了！"); 
		  		}
			}
 		})
	}
	
	function tfang(){
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			return;
		
		$.ajax({
 			type: 'post',
 			url: "<%=request.getContextPath() %>/occupancy/findById.do",
 			data: {"id":id},
 			async : true,
 			success: function(data){
 				if(data.code == "SUCCESS"){
 					if(data.room.state==1){
 						window.location.href='<%=request.getContextPath() %>/occupancy/toChange.do?room_id='+id;
 					}else{
 						layer.msg('该房间无人入住中，无法换房！', {
							  offset: 't',
							  anim: 6
						});
 					}
 				}
		  		else{
		  			alert("抱歉，出错了！"); 
		  		}
			}
 		})
	}
	<%-- function del(){
		
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			{ return; }
		if(!confirm("是否要删除？")){
			{ return; }
		}
		var durl = "<%=request.getContextPath()%>/room/del.do";
		$.post(durl, {
			"id" : id
		}, function(data) {
			if (data.code == "SUCCESS")
				{ alert("删除成功！"); }
			else
				{ alert("删除失败！"); }
			window.location.href='<%=request.getContextPath() %>/room/query.do';
		});
	} --%>
	
	function query(){
		document.forms[0].pageNumber.value=1;
		document.forms[0].action="<%=request.getContextPath() %>/occupancy/queryroom.do";
		document.forms[0].submit();
	}
	
	
	function checkOut(){
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			return;
		
		$.ajax({
 			type: 'post',
 			url: "<%=request.getContextPath() %>/occupancy/findById.do",
 			data: {"id":id},
 			async : true,
 			success: function(data){
 				if(data.code == "SUCCESS"){
 					if(data.room.state==1){
 						layer.open({
 	 						  type: 2,
 	 						  skin: 'layui-layer-lan', //加上边框
 	 						  area: ['1140px', '540px'], //宽高
 	 						  resize: true,//拉伸
 	 						  fix: false, //不固定
 	 						  title: '退房办理',
 	 						  content: ['<%=request.getContextPath() %>/occupancy/tocheckOut.do?room_id='+id, 'yes']
 	 					});
 					}else{
 						layer.msg('该房间无人入住中，无法退房！', {
							  offset: 't',
							  anim: 6
						});
 					}
 				}
		  		else{
		  			alert("抱歉，出错了！"); 
		  		}
			}
 		})
	}
</script>

<body>
	<div id="navbar">
		<div class="navbar_con" style="min-width: 1000px;">
			当前位置：住宿管理<b>&gt;</b><span>住宿信息</span>
		</div>
	</div>

	<form action="<%=request.getContextPath() %>/occupancy/queryroom.do"
		class="form-inline" method="post">
		<div class="form-group" style="margin-bottom: 8px; min-width: 1000px;">
			<b>类型:</b> <select name="type_id" id="type_id"
				style="width: 150px; height: 32px;" class="form-control">
				<option value="" selected="selected">--请选择--</option>
				<c:forEach var="v" items="${type_data}">
					<option <c:if test="${type_id==v.id}">selected="selected"</c:if>
						value="${v.id}">${v.tp_name }</option>
				</c:forEach>
			</select> 
			&nbsp;<b>房间号:</b>&nbsp;<input type="text" name="room_number" value="${room_number }" class="form-control" style="width: 150px">
			<button type="button" class="btn btn-primary" onclick="query()">查询</button>
			<button type="button" class="btn btn-warning" onclick="clean()">清房</button>
			<button type="button" class="btn btn-default" onclick="rzhu()">入住</button>
			<button type="button" class="btn btn-default" onclick="tfang()">换房</button>
			<button type="button" class="btn btn-default" onclick="xzhu()">续住</button>
			<button type="button" class="btn btn-danger" onclick="checkOut()">退房</button>
			（<span style="color: #74b7f9;">空闲</span>、<span
				style="color: #FF5C5C;">使用中</span>、<span
				style="color: rgb(255, 218, 113);">清洁中</span>）
		</div>
		<div class="container">
			<c:forEach var="vo" items="${data}">
				<c:choose>
					<c:when test="${vo.state==1 }">
						<div class="useroom" style="">
							<input type="checkbox" name="tdcheckbox" id="${vo.id }"
								value="${vo.id}" style="margin-top: -62px; margin-left: -28px;">${vo.room_number }</div>
					</c:when>
					<c:when test="${vo.state==2 }">
						<div class="cleanroom" style="">
							<input type="checkbox" name="tdcheckbox" value="${vo.id}"
								style="margin-top: -62px; margin-left: -28px;">${vo.room_number }</div>
					</c:when>
					<c:otherwise>
						<div class="room" style="" name="${vo.state }">
							<input type="checkbox" name="tdcheckbox" value="${vo.id}"
								style="margin-top: -62px; margin-left: -28px;">
							${vo.room_number }
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- <div class="room" style="">1004</div>
			<div class="room" style="">1005</div>
			<div class="room" style="">1006</div>
			<div class="room" style="">1007</div>
			<div class="room" style="">1008</div>
			<div class="room" style="">1009</div>
			<div class="room" style="">1010</div>
			<div class="room" style="">1011</div>
			<div class="room" style="">1012</div>
			<div class="room" style="">1013</div>
			<div class="room" style="">1014</div>
			<div class="room" style="">1015</div>
			<div class="room" style="">1016</div> -->

			<!-- <div class="sss" style="color:red;">1002</div> -->
		</div>
		<tags:pages></tags:pages>
	</form>
</body>
<script>
    $(function(){
      $("table").resizableColumns({
        store: store
      });
    });
 </script>
<style type="text/css">
.room {
	background-color: #74b7f9;
	width: 110px;
	height: 80px;
	margin-left: 10px;
	margin-bottom: 10px;
	margin-top: 12px;
	border-radius: 10px; /*圆角*/
	text-align: center;
	line-height: 80px;
	color: #333333;
	font-size: 20px;
	float: left;
}

.useroom {
	background-color: #FF5C5C;
	width: 110px;
	height: 80px;
	margin-left: 10px;
	margin-bottom: 10px;
	margin-top: 12px;
	border-radius: 10px; /*圆角*/
	text-align: center;
	line-height: 80px;
	color: #333333;
	font-size: 20px;
	float: left;
}

.cleanroom {
	background-color: rgb(255, 218, 113);
	width: 110px;
	height: 80px;
	margin-left: 10px;
	margin-bottom: 10px;
	margin-top: 12px;
	border-radius: 10px; /*圆角*/
	text-align: center;
	line-height: 80px;
	color: #333333;
	font-size: 20px;
	float: left;
}

.sss {
	width: 200px;
	height: 200px; /*设置div的大小*/
	border: 1px solid green; /*边框*/
	text-align: center; /*文字水平居中对齐*/
	line-height: 200px; /*设置文字行距等于div的高度*/
	overflow: hidden;
}
</style>
<% if(request.getAttribute("result")!=null){ %>
<script type="text/javascript">
		layer.alert('<%=request.getAttribute("result") %>', {
			  skin: 'layui-layer-molv' //样式类名
			  ,closeBtn: 0
			  ,anim: 4
			},function(){
				parent.location.reload();
			});
		</script>
<%} %>
</html>
