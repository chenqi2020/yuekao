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
	<table class="table">
	<tr>
	<td>编号</td>
	<td>文章</td>
	<td>投诉用户</td>
	<td>投诉类型</td>
	<td>用户提交</td>
	<td>数量</td>
	</tr>
	<c:forEach items="${findlist}" var="ll">
	<tr>
	<td>${ll.id}</td>
	<td>${ll.article_id.title}</td>
	<td>${ll.user_id.name}</td>
	<td>${ll.complanintyp }</td>
	<td>${ll.urlip }</td>
	<td>${ll.comment}</td>
	</tr>
	</c:forEach>
	</table>

</body>
</html>