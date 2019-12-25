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
<link href="/resource/css/index.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>
 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

	<table class="table table-bordered table-hover">
		<tr align="center">
			<td>序号</td>
			<td>举报标题</td>
			<td>举报类型</td>
			<td>举报人</td>
			<td>举报时间</td>
			
			
		</tr>
		<c:forEach items="${info.list}" var="u" varStatus="i">
			<tr align="center">
				<td>${i.count}</td>
				<td>${u.article.title }</td>
				<td>${u.typename }</td>
				<td>${u.user.username }</td>
				<td>${u.created }</td> 
			</tr>

		</c:forEach>
		<tr align="center">
			<td colspan="10"><jsp:include
					page="/WEB-INF/view/common/pages.jsp" /></td>

		</tr>

	</table>
	</div>
	<a href="/admin">返回</a>
</body>
<script type="text/javascript">
function goPage(page){
	 
	    //分页调取工具
		location="/admin/article/look?page="+page;
			 
}

</script>
</html>