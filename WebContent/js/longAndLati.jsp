<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>百度地图API地点搜索-获取经纬度DEMO</title>
	<meta name="description" content="百度地图地点搜索和鼠标点击地点获取经纬度，这些都是地图比较基本和实用的代码，其中还包括了根据用户IP进行地图的显示、改变地图上的鼠标样式、启用滚轮缩放" /> 
	<meta name="keywords" content="百度地图,地点搜索,获取经纬度,改变地图鼠标样式,启用滚轮缩放" /> 
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
</head>
<body>
<form action="" method="get">
<div style="margin: 15px 0;">
	<label >地点：</label>
  <input id="where" name="where" type="text" style="padding: 6px 12px;border-radius: 4px;border: 1px solid #ccc;">
  <input type="button" value="查找" onClick="sear(document.getElementById('where').value);" style="padding: 6px 12px;border-radius: 4px;border: 1px solid #ccc;"/>
</div>
  <div style="height:340px;border:1px solid gray" id="container"></div>
  <br />
  经度：
  <input id="longitude" name="longitude" type="text" style="padding: 6px 12px;border-radius: 4px;border: 1px solid #ccc;">
  纬度：
  <input id="latitude" name="latitude" type="text" style="padding: 6px 12px;border-radius: 4px;border: 1px solid #ccc;">
  <input type="button" value="确认" onclick="add()" style="margin-left: 20px;background: #fff;border: 1px solid #ccc;padding: 6px 12px;border-radius: 4px; font-size:14px;">
  <div style="font-size:12px;margin-top:20px;color:#646464;">输入地点然后点击“查找”搜索，点击地图地点获取相应经纬度</div>
</form>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/space.js"></script>
<script type="text/javascript">
var map = new BMap.Map("container");//在指定的容器内创建地图实例
map.setDefaultCursor("crosshair");//设置地图默认的鼠标指针样式
map.enableScrollWheelZoom();//启用滚轮放大缩小，默认禁用。
map.centerAndZoom(new BMap.Point(116.413554,39.919868), 13);
map.addControl(new BMap.NavigationControl()); 
map.addEventListener("click", function(e){//地图单击事件
	document.getElementById("longitude").value = e.point.lng;
	document.getElementById("latitude").value =e.point.lat;
});
function iploac(result){//根据IP设置地图中心
    var cityName = result.name;
    map.setCenter(cityName);
}
var myCity = new BMap.LocalCity();
myCity.get(iploac);
function sear(result){//地图搜索
	var local = new BMap.LocalSearch(map, {
  		renderOptions:{map: map}
	});
	local.search(result);
}
</script>
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-12599330-14']);
  _gaq.push(['_trackPageview']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
  
	function add() {
		var arrayObj = new Array();
		var longitude = document.getElementById("longitude").value;
		var latitude = document.getElementById("latitude").value;

		arrayObj.push(longitude);//经度
		arrayObj.push(latitude);//纬度
		window.parent.add(arrayObj);
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}
</script>
</body>
</html>