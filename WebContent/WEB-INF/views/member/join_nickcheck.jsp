	<!DOCTYPE html>
<html lang="ko-KR">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700"
	rel="stylesheet">
<title>BangCops</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	color: #fff;
	background: #63738a;
	font-family: 'Roboto', sans-serif;
}

.form-control {
	width: 290px;
	height: 40px;
	box-shadow: none;
	color: #969fa4;
}

.form-control:focus {
	border-color: #5cb85c;
}

.form-control, .btn {
	border-radius: 3px;
}

.signup-form {
	width: 400px;
	margin: 0 auto;
	padding: 30px 0;
}

.signup-form h2 {
	color: #636363;
	margin: 0 0 15px;
	position: relative;
	text-align: center;
}

.signup-form h2:before, .signup-form h2:after {
	content: "";
	height: 2px;
	width: 30%;
	background: #d4d4d4;
	position: absolute;
	top: 50%;
	z-index: 2;
}

.signup-form h2:before {
	left: 0;
}

.signup-form h2:after {
	right: 0;
}

.signup-form .hint-text {
	color: #999;
	margin-bottom: 30px;
	text-align: center;
}

.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #f2f3f7;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	padding: 30px;
}

.signup-form .form-group {
	margin-bottom: 20px;
}

.signup-form input[type="checkbox"] {
	margin-top: 3px;
}

.signup-form .btn {
	font-size: 16px;
	font-weight: bold;
	min-width: 140px;
	outline: none !important;
}

.signup-form .row div:first-child {
	padding-right: 10px;
}

.signup-form .row div:last-child {
	padding-left: 10px;
}

.signup-form a {
	color: #fff;
	text-decoration: underline;
}

.signup-form a:hover {
	text-decoration: none;
}

.signup-form form a {
	color: #5cb85c;
	text-decoration: none;
}

.signup-form form a:hover {
	text-decoration: underline;
}

#pwcheck {
	display: inline;
}

#numcheck {
	display: inline;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"></script>
<script>
$(document).ready(function(){

    var clipboard = new Clipboard('.btn');
    clipboard.on('success', function(e) {
        console.log("Success");

        /*
        아래 함수를 통해서 블록지정을 없앨 수 있습니다.
        */
        var selection = window.getSelection();
        selection.removeAllRanges();
    });
    clipboard.on('error', function(e) {
        console.log("Fail");
    });
});
</script>
</head>
<body>


	<div class="signup-form">
		<form action="/member/check" method="post">

			<div class="form-group">
				<input type="text" class="form-control" id="nick"
					name="UserNick" placeholder="닉네임을 입력해주세요" data-clipboard-action="cut" value="${UserNick }"
					required="required">
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-lg btn-block">닉네임
					중복 확인</button>
			</div>
			<c:if test="${nickcheck eq 1 }">
				<h3>이미 존재하는 닉네임입니다</h3>
				<br>
			</c:if>
			<c:if test="${nickcheck eq 2 }">
				<h3>사용 가능한 닉네임입니다</h3>
				<button class="btn" data-clipboard-target="#nick">클립보드에 ${UserNick }을 복사합니다</button>
			</c:if>
		</form>
		<input class="btn btn-primary btn-lg btn-block" type='BUTTON'
			value=" 창닫기" onClick='self.close()'>

	</div>
</body>
</html>

































