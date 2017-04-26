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
<script src="<%=request.getContextPath()%>/js/formcheck.js"></script>
<link href="<%=request.getContextPath()%>/dist/zoomify.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/dist/jquery-2.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/dist/zoomify.min.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">  
	
	function stay(){
		var id=$("#id").val();
		var in_no=$("#in_no").val();
		var days=$("#days").val();
		var foregift=$("#foregift").val();
		var room_id=$("#room_id").val();
			/* layer.msg('天数格式错误，请重新输入！', {
				  offset: 't',
				  anim: 6
			}); */
		layer.open({
			  type: 2,
			  skin: 'layui-layer-lan', //加上边框
			  area: ['1140px', '540px'], //宽高
			  resize: true,//拉伸
			  fix: false, //不固定
			  title: '更换客房',
			  content: ['<%=request.getContextPath() %>/occupancy/findRoom.do?ocid='+id, 'yes']
		});
	}
</script>

<body>
 <div id="navbar">
		<div class="navbar_con" style="min-width: 1000px;">
			当前位置：入住管理<b>&gt;</b><span>房间续住</span>
		</div>
	</div>
	
	<form action="<%=request.getContextPath() %>/room/query.do" class="form-inline" method="post">
		<div class="form-group" style="margin-bottom: 8px;min-width: 1000px;">
			<button type="button" class="btn btn-primary" onclick="stay()">查询客房</button>
		</div>
	<div class="container">  	
		<table class="table table-bordered" data-resizable-columns-id="demo-table" style="min-width: 950px;">
			<thead>
				<tr>
					<th style="width: 190px;">房间号</th>
					<th style="width: 120px"> 姓名</th>
					<th style="width: 120px"> 性别</th>
					<th style="width: 20px">证件类型</th>
					<th style="width: 120px">证件号</th>
					<th style="width: 120px">入住时间</th>
					<th style="width: 10px">预计入住天数</th>
					<th style="width: 20px">押金</th>
					<th style="width: 120px">紧急联系方式</th>
					<th style="width: 140px">备注</th>
					<th style="width: 140px">操作员</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="v" items="${list}">
					<tr>
						<td style="padding-top:1.8%">${v.room_number}</td>
						<td style="color:#5457ef;font-weight: bolder;font-size:14px;padding-top:1.8%">${v.c_name}</td>
						<td style="padding-top:1.8%">${v.c_sex}</td>
						<td style="padding-top:1.8%">${v.zj_type}</td>
						<td style="padding-top:1.8%">${v.zj_no}</td>
						<td style="padding-top:1.8%">${fn:substring(v.in_time, 0, 19)}</td>
						<td style="padding-top:1.8%">${v.days}</td>
						<td style="padding-top:1.8%">${v.foregift}</td>
						<td style="padding-top:1.8%">${v.contact}</td>
						<td style="padding-top:1.8%">${v.remark}</td>
						<td style="padding-top:1.8%">${op_name}</td>
						<input type="hidden" id="id" value=${v.id } >
						<input type="hidden" id="in_no" value=${v.in_no } >
						<input type="hidden" id="days" value=${v.days } >
						<input type="hidden" id="foregift" value=${v.foregift } >
						<input type="hidden" id="room_id" value=${v.room_id } >
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
	</form>
</body>
<script>
	$('#d_img img').zoomify();
    $(function(){
      $("table").resizableColumns({
        store: store
      });
    });
 </script>
 
</html>
