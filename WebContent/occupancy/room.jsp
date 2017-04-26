<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<title>Insert title here</title>
</head>
<script type="text/javascript">  
	function change(){
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			return;
		if(!confirm("是否要更换？")){
			return;
		}
		var ocid=$("#ocid").val();
		alert(ocid);
		var durl = "<%=request.getContextPath()%>/occupancy/change.do";
		$.post(durl, {
			"roomid" : id,
			"ocid" :ocid
		}, function(data) {
			if (data.res == "SUCCESS"){
				layer.alert(data.money, {
					  skin: 'layui-layer-lan' //样式类名
					  ,closeBtn: 0
					},function(){
						layer.alert('换房成功', {
						    skin: 'layui-layer-molv'
						    ,closeBtn: 0
						    ,anim: 4 
					},function(){
						window.location.href='<%=request.getContextPath() %>/occupancy/queryroom.do';
					})
				});
			}
			else{
				alert("抱歉，出错了！");
				window.location.href='<%=request.getContextPath() %>/occupancy/queryroom.do';
			}
		});
		
	}
	
	function query(){
		document.forms[0].pageNumber.value=1;
		document.forms[0].action="<%=request.getContextPath() %>/occupancy/findRoom.do";
		document.forms[0].submit();
	}
	/*var durl = "<%=request.getContextPath()%>/occupancy/change.do";
		$.post(durl, {
			"roomid" : id,
			"ocid" :ocid
		}, function(data) {
			if (data.code == "SUCCESS")
				alert(data.money);
			else
				alert("失败！");
			window.location.href='<%=request.getContextPath() %>/room/query.do';
		});*/
</script>

<body>
 <div id="navbar">
		<div class="navbar_con" style="min-width: 1000px;">
			当前位置：住宿管理<b>&gt;</b><span>更换客房</span><b>&gt;</b><span>客房查询</span>
		</div>
	</div>
	
	<form action="<%=request.getContextPath() %>/room/query.do" class="form-inline" method="post">
		<div class="form-group" style="margin-bottom: 8px;min-width: 1000px;">
		<b>类型:</b>
		<select name="type_id" id="type_id" style="width:150px;height: 32px;" class="form-control">
				<option value="" selected="selected">--请选择--</option>
				<c:forEach var="v" items="${type_data}">
				<option <c:if test="${type_id==v.id}">selected="selected"</c:if> value="${v.id}">${v.tp_name }</option>
				</c:forEach>
		</select> &nbsp;&nbsp;
			<b>房间号:</b>&nbsp;<input type="text" name="room_number" value="${room_number }" class="form-control" style="width: 150px">
		         <%--  床位&nbsp;<input type="text" name="bednum" id="bednum" value="${bednum }" class="form-control" style="width: 100px" onkeyup='this.value=this.value.replace(/\D/gi,"")' onpaste="return false;"> &nbsp;&nbsp; --%>
			<button type="button" class="btn btn-primary" onclick="query()">查询</button>
			<button type="button" class="btn btn-danger" onclick="change()">换房</button>
		</div>
		<input type="hidden" id="ocid" value="${ocid }">
	<div class="container">  	
		<table class="table table-bordered" data-resizable-columns-id="demo-table" style="min-width: 1000px;">
			<thead>
				<tr>
					<th data-resizable-column-id="选择" data-noresize>选择</th>
					<th style="width: 190px;">房间号</th>
					<th style="width: 120px"> 类型</th>
					<th style="width: 120px"> 价格</th>
					<th style="width: 20px">床位</th>
					<th style="width: 120px">床型</th>
					<th style="width: 120px">使用状态</th>
					<th style="width: 20px">早餐提供</th>
					<th style="width: 20px">人数上限</th>
					<th style="width: 120px">位置</th>
					<th style="width: 140px">分机号</th>
					<th style="width: 140px">图片</th>
					<th>备注</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="v" items="${data}">
					<tr>
						<td><input type="checkbox" name="tdcheckbox" value="${v.id}"></td>
						<td style="color:#5457ef;font-weight: bolder;font-size:14px;padding-top:1.8%">${v.room_number}</td>
						<td style="padding-top:1.8%">${v.tp_name}</td>
						<td style="padding-top:1.8%">¥${v.price}</td>
						<td style="padding-top:1.8%">${v.bednum}</td>
						<td style="padding-top:1.8%">${v.bedtype}</td>
						<td style="padding-top:1.8%">
							<c:if test="${v.state=='0'}"><font style="color:#0ac345;font-weight:800">空闲</font></c:if>
							<c:if test="${v.state=='1'}"><font style="color:#ff4f18;font-weight:800">使用中</font></c:if>
							<c:if test="${v.state=='2'}"><font style="color:#ffbb4a;font-weight:800">清洁中</font></c:if>
						</td>
						<td style="padding-top:1.8%">
							<c:if test="${v.breakfast=='0'}">是</c:if>
							<c:if test="${v.breakfast=='1'}">否</c:if>
						</td>
						<td style="padding-top:1.8%">${v.people_num}</td>
						<td style="padding-top:1.8%">${v.position}</td>
						<td style="padding-top:1.8%">${v.phone}</td>
						<td>
						<c:choose>
							<c:when test="${empty v.imgurl}">
								<div id="d_img" style="width=17px;height=14px"><img src="<%=request.getContextPath() %>/picture/no_img.png"></div>
							</c:when>
							<c:otherwise>
								<div id="d_img"><img src="<%=request.getContextPath() %>/picture/${v.imgurl}" ></div>
							</c:otherwise>
						</c:choose>
						</td>
						<td style="padding-top:1.8%">${v.remark}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<tags:pages></tags:pages>
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
