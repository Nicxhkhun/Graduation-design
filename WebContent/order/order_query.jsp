<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery/bootstrap-3.3.6-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.resizableColumns.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/demo.css">
<link href="<%=request.getContextPath()%>/js/layer-v2.3/skin/layer.css" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/jquery/jquery-1.11.1.min.js"></script>
<script src="<%=request.getContextPath()%>/jquery/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/tableutil.js"></script>
<script src="<%=request.getContextPath()%>/js/layer-v2.3/layer.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/js/store.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.resizableColumns.min.js"></script>

<link href="<%=request.getContextPath()%>/dist/zoomify.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/dist/jquery-2.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/dist/zoomify.min.js"></script>
<script src="<%=request.getContextPath()%>/js/My97DatePicker/WdatePicker.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">  

	function add(){
		layer.open({
			  type: 2,
			  skin: 'layui-layer-lan', //加上边框
			  area: ['870px', '520px'], //宽高
			  resize: true,//拉伸
			  fix: false, //不固定
			  title: '添加客房',
			  content: ['<%=request.getContextPath() %>/roomtype/findAll.do', 'yes']
			
			});
	}
	function update(){
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			return;
		
		document.forms[0].action="<%=request.getContextPath() %>/order/initUpdate.do?id="+id;
		document.forms[0].submit();
	}
	function del(){
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			return;
		if(!confirm("是否要删除？")){
			return;
		}
		var durl = "<%=request.getContextPath()%>/room/del.do";
		$.post(durl, {
			"id" : id
		}, function(data) {
			if (data.code == "SUCCESS")
				alert("删除成功！");
			else
				alert("删除失败！");
			window.location.href='<%=request.getContextPath() %>/room/query.do';
		});
	}
	
	
	function sub(){
		var start_time=$("#start_time").val();
		var end_time=$("#end_time").val();
		if(start_time.length==0 && end_time.length!=0){
			alert(" 请选择起始日期！");
		}else if(start_time.length!=0 && end_time.length==0){
			alert(" 请选择截止日期 ！");
		}else if(start_time.length==0 && end_time.length==0){
			query();
		}
		else{
			if(start_time<end_time){
				query();
			}else{
				alert("截止日期不能小于起始日期！");
			}
		}
	}
	function query(){
		document.forms[0].pageNumber.value=1;
		document.forms[0].action="<%=request.getContextPath() %>/order/query.do";
		document.forms[0].submit();
	}
	
</script>

<body>
 <div id="navbar">
		<div class="navbar_con" style="min-width: 1000px;">
			当前位置：账单管理<b>&gt;</b><span>账单信息</span>
		</div>
	</div>
	
	<form action="<%=request.getContextPath() %>/room/query.do" class="form-inline" method="post">
		<div class="form-group" style="margin-bottom: 8px;min-width: 1000px;">
			&nbsp;&nbsp;<b>时间:</b><input type="text" name="start_time" id="start_time" value="${start_time}" class="form-control" style="width: 160px" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',minDate:'1900-01-01 01:00:00'})">
			<a></a><b>到&nbsp;</b><input type="text" name="end_time" id="end_time" value="${end_time }" class="form-control" style="width: 160px" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd',minDate:'1900-01-01 01:00:00'})">
			&nbsp;&nbsp;
			<b>账单号:</b>&nbsp;<input type="text" name="order_num" value="${order_num }" class="form-control" style="width: 150px">
			<button type="button" class="btn btn-primary" onclick="sub()">查询</button>
			<button type="button" class="btn btn-default" onclick="update()">修改</button>
		</div>
	<div class="container">  	
		<table class="table table-bordered" data-resizable-columns-id="demo-table" style="min-width: 1000px;">
			<thead>
				<tr>
					<th data-resizable-column-id="选择" data-noresize>选择</th>
					<th style="width: 190px;">账单号</th>
					<th style="width: 120px"> 房间号</th>
					<th style="width: 120px"> 账单类型</th>
					<th style="width: 20px">金额</th>
					<th style="width: 120px">时间</th>
					<th style="width: 120px">操作员</th>
					<th>备注</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="v" items="${data}">
					<tr>
						<td><input type="checkbox" name="tdcheckbox" value="${v.order_id}"></td>
						<td>${v.order_num}</td>
						<td>${v.room_num}</td>
						<td>${v.type}</td>
						<td>${v.money}</td>
						<td>${fn:substring(v.time, 0, 19)}</td>
						<td>${v.op_name}</td>
						<td>${v.remark}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<tags:pages></tags:pages>
	</form>
</body>
</html>
