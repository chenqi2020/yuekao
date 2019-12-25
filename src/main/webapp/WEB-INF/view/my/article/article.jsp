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
<title>${a.title}</title>
<link href="<%=request.getContextPath() %>/css/index3.css" rel="stylesheet">
<link href="/resource/css/bootstrap.css">
</head>
<body>
<div class="container">
	
	<h1 align="center" >${a.title}</h1>
	<h3>${a.user.username} 
	<fmt:formatDate value="${a.created}" pattern="yyyy-MM-dd HH:mm:dd"/> </h3>
	<div align="center">
	${a.content }
	</div> 
			
</div>

</body>
</html>