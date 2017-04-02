<%@ tag pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	function toFirst() {
		document.forms[0].pageFlag.value = "query";
		var pageNumber = document.getElementById("showPage");
		pageNumber.value = 1;		
		document.forms[0].submit();
		
	}
	function toPrevious() {
		document.forms[0].pageFlag.value = "query";
		
		var pageNumber = document.getElementById("showPage");
		pageNumber.value = parseInt(pageNumber.value) - 1;		
		document.forms[0].submit();
	}
	function toNext() {
		
		document.forms[0].pageFlag.value = "query";
		var pageNumber = document.getElementById("showPage");
		pageNumber.value = parseInt(pageNumber.value) + 1;		
		document.forms[0].submit();
	}
	function toLast() {
		document.forms[0].pageFlag.value = "query";		
		var pageNumber = document.getElementById("showPage");
		pageNumber.value = parseInt(document.forms[0].totalPages.value);
		document.forms[0].submit();
	}
</script>
	
<ul class="pagination" style="margin-top: -25px">
	<c:choose>
		<c:when test="${page.totalPages > 1}">
			<c:choose>
				<c:when test="${page.pageNumber <= 1}">
					<li class="previous disabled"><a href="#">第一页</a></li>
					<li class="previous disabled"><a href="#">上一页</a></li>
				</c:when>
				<c:otherwise>
					 <li><a href="javascript:toFirst();">首页 </a></li>
					 <li><a href="javascript:toPrevious();">上一页 </a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${page.pageNumber==page.totalPages }">
					<li class="previous disabled"><a href="#">下一页</a></li>
					<li class="previous disabled"><a href="#">尾页</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:toNext();">下一页 </a></li>
					<li><a href="javascript:toLast();">尾页 </a></li>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<li class="previous disabled"><a href="#">第一页</a></li>
			<li class="previous disabled"><a href="#">上一页</a></li>
			<li class="previous disabled"><a href="#">下一页</a></li>
			<li class="previous disabled"><a href="#">尾页</a></li>				
		</c:otherwise>
	</c:choose>
	<span style="display:inline-block;padding:7px 0;">
	&nbsp;&nbsp;每页<font >${page.pageSize} </font>条/共<font >${page.totalRows}</font>条记录     	第<font >${page.pageNumber}</font>页/共<font >${page.totalPages}</font>页</span>
</ul>	

<input type="hidden" name="pageFlag" id="pageFlag" value="query">
<input type="hidden" name="pageNumber" id="showPage" value="${page.pageNumber }"/>
<input type="hidden" name="totalRows" id="recordCount" value="${page.totalRows }"> 
<input type="hidden" name="totalPages" id="pageCount" value="${page.totalPages }"> 
