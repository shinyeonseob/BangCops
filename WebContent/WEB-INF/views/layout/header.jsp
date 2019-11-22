<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="utf-8" />
<meta name="description"
	content="The Overflowing church website's main page" />
<meta name="author" content="unikys@gmail.com" />
<title>방캅스 홈페이지</title>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--  jQuery -->
<script type="text/javascript"
	src=https://code.jquery.com/jquery-2.2.4.min.js></script>




<style>
#topMenu {
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #333399;
	float: left;
	line-height: 40px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
	border: 1px solid #bcbcbc;
}

#topMenu .menuLink:hover {
	color: red;
	background-color: #FFFF66;
}

#topMenu .menulogin {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
	border: 1px solid #bcbcbc;
}

.modal-login {
	color: #636363;
	width: 350px;
}

.modal-login .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
}

.modal-login .modal-header {
	border-bottom: none;
	position: relative;
	justify-content: center;
}

.modal-login h4 {
	text-align: center;
	font-size: 26px;
	margin: 30px 0 -15px;
}

.modal-login .form-control:focus {
	border-color: #70c5c0;
}

.modal-login .form-control, .modal-login .btn {
	min-height: 40px;
	border-radius: 3px;
}

.modal-login .close {
	position: absolute;
	top: -5px;
	right: -5px;
}

.modal-login .modal-footer {
	background: #ecf0f1;
	border-color: #dee4e7;
	text-align: center;
	justify-content: center;
	margin: 0 -20px -20px;
	border-radius: 5px;
	font-size: 13px;
}

.modal-login .modal-footer a {
	color: #999;
}

.modal-login .avatar {
	position: absolute;
	margin: 0 auto;
	left: 0;
	right: 0;
	top: -70px;
	width: 95px;
	height: 95px;
	border-radius: 50%;
	z-index: 9;
	background: #60c7c1;
	padding: 15px;
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
}

.modal-login .avatar img {
	width: 100%;
}

.modal-login.modal-dialog {
	margin-top: 80px;
}

.modal-login .btn {
	color: #fff;
	border-radius: 4px;
	background: #60c7c1;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	border: none;
}

.modal-login .btn:hover, .modal-login .btn:focus {
	background: #45aba6;
	outline: none;
}

.trigger-btn {
	display: inline-block;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		// 회원가입 버튼
		$("#btn_join").click(function() {
			location.href = "/member/join";
		});
	});
</script>


</head>
<body>
	※방캅스※

	<nav id="topMenu">
		<ul>
			<li><a class="menuLink" href="#">검색</a></li>
			<li><a class="menuLink" href="#">신고</a></li>
			<li><a class="menuLink" href="#">홈</a></li>
			<li><a class="menuLink" href="#">커뮤니티</a></li>
			<li><a class="menuLink" href="#">광고/배너</a></li>

			<li>
			<c:if test="${sessionScope.login eq null }">
			<a href="#myModal" class="trigger-btn" data-toggle="modal"><button>로그인</button></a>
			<button id="btn_join" class="btn_join">회원가입</button></li>
			</c:if>

			<c:if test="${sessionScope.login eq true }">
				<a href="/member/logout"><button>로그아웃</button></a>
				<a href="/board/list"><button>게시글</button></a>
				<a href="/board/write"><button>게시글 작성</button></a>
			</c:if>

		</ul>
	</nav>
	<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<div class="avatar">
						<img src="/resources/img/logo.png" alt="Avatar">
					</div>
					<h4 class="modal-title">Member Login</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="/member/login" method="post">
						<div class="form-group">
							<input type="email" class="form-control" name="UserID"
								placeholder="UserEmail" required="required">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="UserPW"
								placeholder="Password" required="required">
						</div>
						<div class="form-group">
							<button type="submit"
								class="btn btn-primary btn-lg btn-block login-btn">Login</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<a href="#">Forgot Password?</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>