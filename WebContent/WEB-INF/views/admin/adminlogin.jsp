<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div>
<!-- <form action="/login/login" method="post"> -->
<form action="<%= response.encodeUrl("/admin/login") %>" method="post">
<label>ID :</label> <input type="text" name="id" id="id" required="required" /><br>
<label>PW :</label> <input type="text" name="pw" id="pw" required="required" /><br>
<button>로그인</button>
</form>
</div>

</div><!-- .container -->
</body>
</html>