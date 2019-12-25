<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>举报</title>
<!-- 引入样式 -->
<link href="/resource/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>

<script type="text/javascript">

//var formData = new FormData($( "#form2" )[0]);

function add(){
	var formData = new FormData($( "#form2" )[0]);
	$.ajax({
		type:"post",
		url:"/complain",
		data:formData,
		processData : false,
		// 告诉jQuery不要去设置Content-Type请求头
		contentType : false,
		success:function(flag){
			if(flag){
				alert("举报成功")
				location.href="/";
			}else{
				alert("举报失败")
			}
		}
		
		
	})
}
</script>
</head>
<body>
	<div align="center" class="container" style="width: 600px">
		<h1>举报信息</h1>
		<hr>
		<form  id="form2">
		<!--文章  -->
		 <input type="hidden" name="articleId" value="${article.id }">
		 <!--用户 -->
		 <input type="hidden" name="user_id" value="${article.user.id }">
			<div class="form-group form-inline">
				举报类型:<!-- <select name="typename" class="form-control">
					<option>涉及黄色</option>
					<option>涉及暴力</option>
					<option>涉及为宗教</option>
					<option>涉及国家安全</option>
					<option>其他</option>
				</select> -->
				<input type="radio" name="typename" value="涉及黄色">涉及黄色&nbsp&nbsp&nbsp&nbsp
				<input type="radio" name="typename" value="涉及暴力">涉及暴力&nbsp&nbsp&nbsp&nbsp
				<input type="radio" name="typename" value="涉及为宗教">涉及为宗教&nbsp&nbsp&nbsp&nbsp
				<input type="radio" name="typename" value="涉及国家安全">涉及国家安全&nbsp&nbsp&nbsp&nbsp
				<input type="radio" name="typename" value="其他">其他
			</div>
			<div class="form-group form-inline">
				举报地址：<input type="text" name="url" class="form-control">
			</div>
			
			
			<div class="form-group form-inline">
				<button type="button" onclick="add()">举报</button>
			</div>
		</form>
	</div>
</body>
</html>