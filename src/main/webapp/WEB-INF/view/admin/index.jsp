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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/css/index3.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
</head>
<body>
<div class="container">
	<div class="row" style="height: 70px;margin-top: 10px;">
	
	<div class="col-md-12" style="background-color: #ff0">
	<img alt="" src="/resource/images/logo.png" width="80px">
	<font color="white">CMS后管理</font>
	<span><font color="white"> 登录人:${sessionScope.admin.username } </font>
	<a href="/passport/logout">注销</a>
	
	</span>
	</div>
</div>
	<hr style="height: 2px;border: none;border-top: 2px dotted #185598;">
<div class="row" style="height: 550px">
	<!--导航  -->
	<div class="col-md-3" style="background-color: pink" >
	<div style="margin-top: 30px">
	<nav class="navbar navbar-light bg-light">
	  <a class="navbar-brand" href="#" data="/admin/user/list" >用户管理</a>
	</nav>
	
	<nav class="navbar navbar-light bg-light" >
	 <a class="navbar-brand" href="#" data="/admin/article/selects" >文章管理</a>
	 
	</nav>
	<nav class="navbar navbar-light bg-light">
		<span class="navbar-brand mb-0 h1">
		<a class="navbar-brand" href="#" data="/admin/article/complains">举报管理</a>
		</span>
	</nav>
	<nav class="navbar navbar-light bg-light">
	  <span class="navbar-brand mb-0 h1">栏目管理</span>
	</nav>
	
	<nav class="navbar navbar-light bg-light">
	  <span class="navbar-brand mb-0 h1">分类管理</span>
	</nav>
	<nav class="navbar navbar-light bg-light">
	  <span class="navbar-brand mb-0 h1">系统管理</span>
	</nav>
	</div>
	</div>
	<!--中间  -->
	<div class="col-md-9"  id="center">
	
	</div>
	
	</div>
</div>
</body>
<script type="text/javascript">
	$(function () {
		
		//中间默认显示用户列表
		$("#center").load("/admin/user/list");
		
		$("a").click(function () {
			var url=$(this).attr("data");
			//先删除已选择的样式
			$("a").removeClass("list-group-item-info");
			
			//为点击的a标签添加点击样式
			$(this).addClass("list-group-item-info");
			//在中间区域加载
			$("#center").load(url);
		})
		
	})
</script>
</html>