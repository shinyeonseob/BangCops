<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방캅스 관리자 페이지</title>
<style type="text/css">
.container {
text-align: center;
}

</style>

</head>
<body>
<div class="container">
	<a href="/admin/logout"><img src="/resources/img/logo.png" style="width:250px; height:200px;"></a>
	<h1>⭐관리자 로그인 페이지⭐</h1><hr><br>

	<form action="<%= response.encodeUrl("/admin/login") %>" method="post">
		<label>ID :</label> <input type="text" name="id" id="id" required="required" /><br><br>
		<label>PW :</label> <input type="password" name="pw" id="pw" required="required" /><br><br>
		<button class="btn btn-secondary btn-sm">로그인</button>
	</form>
	</div>

</body>
</html>