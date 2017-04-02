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
		
		document.forms[0].action="<%=request.getContextPath() %>/room/initUpdate.do?id="+id;
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
	
	function query(){
		document.forms[0].pageNumber.value=1;
		document.forms[0].action="<%=request.getContextPath() %>/room/query.do";
		document.forms[0].submit();
	}
	
	function openDistrict() {
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			return;
		//iframe层-父子操作
		layer.open({
		  type: 2,
		  area: ['90%', '90%'],
		  skin: 'layui-layer-lan',
		  fix: false, //不固定
		  maxmin: true,
		  title: '分区选择',
		  content: '<%=request.getContextPath() %>/district/select.do?id='+id,
		  btn: '确认',
          yes : function(index,dom){
        	  window["layui-layer-iframe" + index].formSubmit();
          },
          end: function () {
              location.reload();
          }
		});
	}
	
	function openCombo() {
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			return;
		//iframe层-父子操作
		layer.open({
		  type: 2,
		  area: ['90%', '90%'],
		  skin: 'layui-layer-lan',
		  fix: false, //不固定
		  maxmin: true,
		  title: '套餐选择',
		  content: '<%=request.getContextPath() %>/coach/selectCombo.do?id='+id,
		  btn: '确认',
          yes : function(index,dom){
        	  window["layui-layer-iframe" + index].formSubmit();
          },
          end: function () {
              location.reload();
          }
		});
	}
</script>

<body>
 <div id="navbar">
		<div class="navbar_con" style="min-width: 1000px;">
			当前位置：客房管理<b>&gt;</b><span>房间管理</span>
		</div>
	</div>
	
	<form action="<%=request.getContextPath() %>/roomtype/query.do" class="form-inline" method="post">
		<div class="form-group" style="margin-bottom: 8px;min-width: 1000px;">
		类型
		<select name="type_id" id="type_id" style="width:150px;height: 32px;" class="form-control">
				<option value="" selected="selected">--请选择--</option>
				<c:forEach var="v" items="${type_data}">
				<option <c:if test="${type_id==v.id}">selected="selected"</c:if> value="${v.id}">${v.tp_name }</option>
				</c:forEach>
		</select> 
			房间号&nbsp;<input type="text" name="room_number" value="${room_number }" class="form-control" style="width: 150px">
		         <%--  床位&nbsp;<input type="text" name="bednum" id="bednum" value="${bednum }" class="form-control" style="width: 100px" onkeyup='this.value=this.value.replace(/\D/gi,"")' onpaste="return false;"> &nbsp;&nbsp; --%>
			<button type="button" class="btn btn-primary" onclick="query()">查询</button>
			<button type="button" class="btn btn-default" onclick="add()">增加</button>
			<button type="button" class="btn btn-default" onclick="update()">修改</button>
			<button type="button" class="btn btn-danger" onclick="del()">删除</button>
		</div>
	<div class="container">  	
			<div class="room" style="">
				<input type="checkbox" name="tdcheckbox" value="${v.id}" style="margin-top:-62px;margin-left:-28px;">
			<a href="#">1002</a></div>
			<div class="room" style="">1003</div>
			<div class="room" style="">1004</div>
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
			<div class="room" style="">1016</div>
			
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
 .room{
	    background-color: #74b7f9;
	    width: 110px;
	    height: 80px;
	    margin-left: 10px;
	    margin-bottom: 10px;
	    margin-top: 12px;
	    border-radius: 5px;/*圆角*/
	    text-align: center;
   		line-height: 80px;
   		color: #333333;
   		font-size: 20px;
   		float: left;
	 }
	 .sss{
	    width:200px;height:200px;  /*设置div的大小*/
	    border:1px solid green;    /*边框*/
	    text-align: center;        /*文字水平居中对齐*/
	    line-height: 200px;        /*设置文字行距等于div的高度*/
	    overflow:hidden;
}
 </style>
</html>
