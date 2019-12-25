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
<div class="container-fluid">

	
	<div>
<ul class="list-unstyled">
	<c:forEach items="${info.list}" var="a">
	
	
  	<li class="media"><img src="/pic/${a.picture}" class="mr-3" alt="..." style=" height:"120px" width="150px"">
    <div class="media-body">
      <h5 class="mt-0 mb-1"><a href="/my/article/article?id=${a.id}" target="blank">${a.title}</a> </h5>
      <div style="margin-top: 50px">
      <fmt:formatDate value="${a.created }" pattern="yyyy-MM-dd HH:mm:dd"/>
      <span style="float: right">
      					<c:if test="${a.deleted==0}">
						 <button type="button" onclick="update(${a.id},this)" class="btn-sm btn-danger">删除</button> 
						</c:if>
					    <c:if test="${a.deleted==1}">
						 <button type="button" onclick="update(${a.id},this)" class="btn-sm btn-warning">已删除</button> 
						</c:if>
      </span>
       </div>
      <div></div>
    </div>
  </li>
  <hr/>
  </c:forEach>
</ul>
	
	</div>
	
	
		
			<jsp:include page="/WEB-INF/view/common/pages.jsp"/>

			
</div>
</table>
</body>
<script type="text/javascript">
function goPage(page) {
	var  url="/my/article/articles?page="+page
	$("#center").load(url);
}
function update(id,obj) {
	//要改变为的状态
	var deleted=$(obj).text()=="删除"?1:0;
	
	$.post("/my/article/update",{id:id,deleted:deleted},function(flag){
		if(flag){
			alert("成功");
			//改变颜色
			$(obj).text(deleted==1?"已删除":"删除");
			$(obj).attr("class",deleted==1?"btn-sm btn-warning":"btn-sm btn-danger");
		}else{
			alert("失败");
		}
	})
	
}
</script>
</html>