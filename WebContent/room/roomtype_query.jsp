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
			  area: ['90%', '90%'],
			  skin: 'layui-layer-lan',
			  fix: false, //不固定
			  maxmin: true,
			  title: '添加客房类型',
			  content: '<%=request.getContextPath() %>'/room/roomtype_add.jsp,
			  btn: '确认',
	          yes : function(index,dom){
	        	  window["layui-layer-iframe" + index].formSubmit();
	          },
	          end: function () {
	              location.reload();
	          }
			});
	}
	function a(){
		layer.open({
			  type: 2,
			  skin: 'layui-layer-lan', //加上边框
			  area: ['870px', '520px'], //宽高
			  resize: true,//拉伸
			  fix: false, //不固定
			  title: '添加客房类型',
			  content: ['<%=request.getContextPath() %>/room/roomtype_add.jsp', 'yes']
			
			});
	}
	function update(){
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			return;
		
		document.forms[0].action="<%=request.getContextPath() %>/roomtype/initUpdate.do?id="+id;
		document.forms[0].submit();
	}
	function del(){
		var id=getSelectedCheckBoxValue("tdcheckbox");	
		if(id =="")
			return;
		if(!confirm("是否要删除？")){
			return;
		}
		var durl = "<%=request.getContextPath()%>/roomtype/del.do";
		$.post(durl, {
			"id" : id
		}, function(data) {
			if (data.code == "SUCCESS")
				alert("删除成功！");
			else
				alert("删除失败！");
			window.location.href='<%=request.getContextPath() %>/roomtype/query.do';
		});
	}
	
	function query(){
		/* validate(); */
		var reg = new RegExp("^[0-9]*$");  
	   	var obj = document.getElementById("bednum");  
	   	if(obj.value!=""){
	   		if(!reg.test(obj.value)){  
			    alert("请输入数字!"); 
			    obj.value="";
			    obj.focus();
			    return ;
			}  
			if(!/^[0-9]*$/.test(obj.value)){  
			    alert("请输入数字!");
			    obj.value="";
			    obj.focus();
			    return ;
			} 
	   	}
		document.forms[0].pageNumber.value=1;
		document.forms[0].action="<%=request.getContextPath() %>/roomtype/query.do";
		document.forms[0].submit();
	}
	
</script>

<body>
 <div id="navbar">
		<div class="navbar_con" style="min-width: 1000px;">
			当前位置：客房管理<b>&gt;</b><span>类型管理</span>
		</div>
	</div>
	
	<form action="<%=request.getContextPath() %>/roomtype/query.do" class="form-inline" method="post">
		<div class="form-group" style="margin-bottom: 8px;min-width: 1000px;">
			类型名称&nbsp;<input type="text" name="tp_name" value="${tp_name }" class="form-control" style="width: 150px">
		          床位&nbsp;<input type="text" name="bednum" id="bednum" value="${bednum }" class="form-control" style="width: 100px" onkeyup='this.value=this.value.replace(/\D/gi,"")' onpaste="return false;"> &nbsp;&nbsp;
			<button type="button" class="btn btn-primary" onclick="query()">查询</button>
			<button type="button" class="btn btn-default" onclick="a()">增加</button>
			<button type="button" class="btn btn-default" onclick="update()">修改</button>
			<button type="button" class="btn btn-danger" onclick="del()">删除</button>
		</div>
	<div class="container">  	
		<table class="table table-bordered" data-resizable-columns-id="demo-table" style="min-width: 1000px;">
			<thead>
				<tr>
					<th data-resizable-column-id="选择" data-noresize>选择</th>
					<th style="width: 190px;">名称</th>
					<th style="width: 120px"> 价格</th>
					<th style="width: 120px">床位</th>
					<th style="width: 120px">床型</th>
					<th style="width: 120px">早餐提供</th>
					<th style="width: 120px">人数上限</th>
					<th>备注</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="v" items="${data}">
					<tr>
						<td><input type="checkbox" name="tdcheckbox" value="${v.id}"></td>
						<td style="color:#5457ef;font-weight: bolder;font-size:14px">${v.tp_name}</td>
						<td>¥${v.price}</td>
						<td>${v.bednum}</td>
						<td>${v.bedtype}</td>
						<td>
							<c:if test="${v.breakfast=='0'}">是</c:if>
							<c:if test="${v.breakfast=='1'}">否</c:if>
						</td>
						<td>${v.people_num}</td>
						<td>${v.remark}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
 
</html>
