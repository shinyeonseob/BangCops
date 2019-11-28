<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>관리자 로그인 페이지</h1>
<hr><br>

<div>
<!-- <form action="/login/login" method="post"> -->
<form action="<%= response.encodeUrl("/admin/login") %>" method="post">
<label>ID :</label> <input type="text" name="id" id="id" required="required" /><br><br>
<label>PW :</label> <input type="text" name="pw" id="pw" required="required" /><br><br>
<button>로그인</button>
</form>
</div>

</div><!-- .container -->
</body>
</html>