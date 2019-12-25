<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="fm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/resource/css/bootstrap.css" rel="stylesheet">
 <script type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.3.min.js">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/index3.css" rel="stylesheet">
<link href="/resource/css/bootstrap.css">

</head>
<body>

	<div class="container" >
	
	
	<div style="margin-bottom: 10px" class="form-inline">
	<label for="username">
	模糊:
	</label>
	<input id="username" type="text" class="form-control" name="username" value="${user.username}">
	
	<button type="button" class="btn btn-info" onclick="query()">查询</button>
	</div>
	
	<table class="table table-dark table-bordered table-hover">
		<tr>
			<td>序号</td>
			<td>用户名</td>
			<td>昵称</td>
			<td>生日</td>
			<td>注册时间</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${info.list}" var="u" varStatus="i">
			<tr align="center">
				<td>${i.count}</td>
				<td>${u.username }</td>
				<td>${u.nickname }</td>
				<td>
				<fmt:formatDate value= "${u.birthday }" pattern="yyyy-MM-dd" />
				</td>
				<td>
				<fmt:formatDate value= "${u.created }" pattern="yyyy-MM-dd" />
				</td>
				<td>
				<c:if test="${u.locked==0}">
					<button type="button" class="btn btn-success" onclick="update(${u.id},this)">正常</button>
				</c:if>
				<c:if test="${u.locked==1}">
					<button type="button" class="btn btn-warning" onclick="update(${u.id},this)">停用</button>
				</c:if>
				</td>
			</tr>

		</c:forEach>
		
		<tr>
			<td colspan="100" >
			<jsp:include page="/WEB-INF/view/common/pages.jsp"/>

			</td>

		</tr>
	
	</div>
</table>
</body>
<script type="text/javascript">
	function goPage(page) {
		var url="/admin/user/list?page="+page;
		$("#center").load(url);
	}
	function query() {
		var url="/admin/user/list?username="+$("[name='username']").val()
		$("#center").load(url);
	}
	function update(id,obj) {
		//要改变为的状态
		var locked=$(obj).text()=="正常"?1:0;
		
		$.post("/admin/user/update",{id:id,locked:locked},function(flag){
			if(flag){
				alert("成功");
				//改变颜色
				$(obj).text(locked==1?"停用":"正常");
				$(obj).attr("class",locked==1?"btn btn-warning":"btn btn-success");
			}else{
				alert("失败");
			}
		})
		
	}
</script>
</html>