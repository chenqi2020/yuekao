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
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${a.title}</title>
<link href="<%=request.getContextPath() %>/css/index3.css" rel="stylesheet">
<link href="/resource/css/bootstrap.css">
</head>
<script type="text/javascript">
  function chk(status,id){
	  $.post("/admin/article/update",{id:id,status:status},function(flag){
		  if(flag){
			  alert("操作成功");
		  }else{
			  alert("操作失败");
		  }
	  })
  }
 
 </script>
<body>
<div class="container">
	 
	  <h1 align="center">${a.title }</h1>
	  <div>
	  <button type="button" class="btn btn-success" onclick="chk(1,${a.id})">同意</button>
	  <button type="button" class="btn btn-danger"  onclick="chk(-1,${a.id})">驳回</button>
	  <button type="button" class="btn btn-info"  onclick="window.close()">关闭</button>
	  
	  </div>
	  <h3>${a.user.username} <fmt:formatDate value="${a.created }" pattern="yyyy-MM-dd HH:mm:ss"/></h3>
	  <div align="center"> ${a.content }</div> 
	
	</div>

</body>
</html>