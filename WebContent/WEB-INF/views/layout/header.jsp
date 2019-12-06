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
<title>허위매물신고 사이트 :: Bangcops</title>
<script type="text/javascript"
	src=https://code.jquery.com/jquery-2.2.4.min.js></script>

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

<!--  폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean"
	rel="stylesheet">
<!--  @import url('https://fonts.googleapis.com/css?family=Black+Han+Sans:400'); @import url('https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap&subset=korean'); font-family: 'Black Han Sans', sans-serif; -->
<link
	href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/국립박물관문화재단클래식B.woff">
<!-- @font-face { font-family: '국립박물관문화재단클래식B'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/국립박물관문화재단클래식B.woff') format('woff'); font-weight: normal; font-style: normal; } -->
<!-- @font-face { font-family: 'KBIZHanmaumMyungjo'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/KBIZHanmaumMyungjo.woff') format('woff'); font-weight: normal; font-style: normal; } -->


<!-- 닉스곤폰트B -->
<link
	href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONB-Vb.woff">
<!-- @font-face { font-family: 'NIXGONB-Vb'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONB-Vb.woff') format('woff'); font-weight: normal; font-style: normal; } -->

<!-- <!-- CSS -->
<!-- <link rel="stylesheet" -->
<!--    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
<!-- <!-- JS -->
<!-- <script -->
<!--    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> -->

<!-- </script> -->
<!-- <script -->
<!--    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"> -->

<!-- </script> -->
<!-- <script -->
<!--    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"> -->

<!-- </script> -->

<!--  jQuery -->




<style type="text/css">
p, span, div, form, a, button, strong {
	font-family: 'NIXGONB-Vb';
}

html, body {
	font-family: 'NIXGONB-Vb';
}
</style>

<style>
#topMenu {
	/*    height: 120px; */
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	background-color: #242645;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #242645;
	/*#0066B2  #BDCACC  다크네이비: #242645 #858A99  하늘보라: #36428C  매트블루: #487890*/
	float: left;
	line-height: 80px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 18px;
	font-weight: bold;
	font-family: 'KBIZHanmaumMyungjo';
	border-left: 1px solid #878a91;
	border-right: 1px solid #777;
}

#topMenu .menuLink:hover {
	color: white;
	background-color: #FDB813;
}

#topMenu .menulogin {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 15px;
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
	background: #242645;
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
	background: #242645;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	border: none;
}

.modal-login .btn:hover, .modal-login .btn:focus {
	background: #225793;
	outline: none;
}

.trigger-btn {
	display: inline-block;
}

.logo {
	/* 화면 크기에 따라 적응하도록 설정 */
	width: 145px;
	height: 65px;
	/*     object-fit: none; */
	/* 이미지 크기 보정 */
	margin-left: -75px;
	padding-top: 10px;
}

#mainlogo {
	width: 50px;
}

.headergood {
	background-color: #FFFFFF;
	height: 200px;
	bpx-shadow: 0px 1px 50px #5E5E5E;
	position: fixed;
	top: 0px;
}

.active {
	background-color: #FDB813;
}

ul li.dropdown:hover>ul.dropdown-menu {
	display: block;
	margin: 0;
	/* 	background-color: #FFFFFF; */

	/*    color:white; */
}

.divider {
	color: white;
}

.modal-backdrop {

  z-index: -1;
}

body{
	background-color: #F8F8F8;
}



</style>

<script type="text/javascript">
//    $(document).ready(function() {
  
      
<%--       // 로그인 버튼
<%--       $("#btn_login").click(function() { --%>
<%--          location.href = "/member/login"; --%>
<%--       }); --%> 
      
//       // 검색 버튼
//       $("#btn_search").click(function() {
//          location.href = "/main";
//       });
      
//       // 신고 버튼
//       $("#btn_accuse").click(function() {
//          location.href = "/main/accuse";
//       });
      
//       // 홈 버튼
//       $("#btn_home").click(function() {
//          location.href = "/main/home";
//       });
      
      // 커뮤니티 버튼
//       $("#btn_community").click(function() {
//          location.href = "/main/community";
//       });
      
//    });
$(document).ready(function() {
	
	var uri = '<%=request.getRequestURI()%>';
		if (uri == '/WEB-INF/views/board/boardlist.jsp') {
			$("ul li.dropdown").css("background-color", "#FDB813")
		}

		var flag = "${flag}";
		console.log(flag);
		if (flag == "1") {
			$("#btn_search").addClass("active");
			$("#btn_accuse").removeClass("active");
			$("#btn_home").removeClass("active");
			$("#btn_community").removeClass("active");
		} else if (flag == "2") {
			$("#btn_accuse").addClass("active");
			$("#btn_search").removeClass("active");
			$("#btn_home").removeClass("active");
			$("#btn_community").removeClass("active");
		} else if (flag == "3") {
			$("#btn_home").addClass("active");
			$("#btn_search").removeClass("active");
			$("#btn_accuse").removeClass("active");
			$("#btn_community").removeClass("active");
		} else if (flag == "4") {
			$("#btn_community").addClass("active");
			$("#btn_search").removeClass("active");
			$("#btn_accuse").removeClass("active");
			$("#btn_home").removeClass("active");
		}
		// 회원가입 버튼
		$("#btn_join").click(function() {
			location.href = "/member/join";
		});

	})
	$(document).ready(function() {
		var nowurl = window.document.URL;
		console.log(nowurl);
		$('#nowurl').val(nowurl);
	});
</script>


</head>
<body>
	<div class="firstblank"></div>

	<div id="header.activated">
		<nav id="topMenu">
			<div id="mainlogo" class="navbar-header">
				<a href="/main"><img class="logo"
					src="/resources/img/logo(no_text).png"></a>
			</div>

			<ul role="tablist" style="margin-bottom: 0px;">
				<li role="presentation"><a id="btn_search" class="menuLink "
					href="/main"> <img src="/resources/img/Wsearch.png" width="30"
						height="30">&nbsp;&nbsp;<b>검색</b></a></li>

				<li role="presentation"><a id="btn_accuse" class="menuLink"
					href="/main/accuse"> <img src="/resources/img/Waccuse.png"
						width="30" height="30">&nbsp;<b>신고</b></a></li>

				<li role="presentation"><a id="btn_home" class="menuLink"
					href="/main/home"> <img src="/resources/img/Whome.png"
						width="30" height="30">&nbsp;<b>홈</b></a></li>

				<li class="dropdown" role="presentation"
					onclick="location.href='/main/community'"><a
					href="/main/community" id="btn_community"
					class="menuLink dropdown-toggle" data-toggle="dropdown"
					role="button" aria-expanded="false"> <img
						src="/resources/img/Wcommunity.png" width="30" height="30">&nbsp;<b>커뮤니티
							<span class="caret"></span> <%-- --%>
					</b></a>
					<ul class="dropdown-menu" role="menu"
						style="background-color: #242645; color: white;">
						<li><a style="color: white;"
							href="/main/community/board?boardno=1">자유게시판</a></li>
						<li><a style="color: white;"
							href="/main/community/board?boardno=2">이용후기게시판</a></li>
						<li class="divider"></li>
						<li><a style="color: white;"
							href="/main/community/board?boardno=3">공지사항</a></li>
						<li><a style="color: white;"
							href="/main/community/board?boardno=5">FAQ</a></li>
					</ul></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li><c:if test="${sessionScope.login eq null }">

						<a href="#myModal" class="trigger-btn" data-toggle="modal">
							<button id="btn_login" class="btn_login btn btn-warning btn-lg">
								<b>로그인</b>
							</button>
						</a>&nbsp;
         <button id="btn_join" class="btn_join btn btn-warning btn-lg">
							<b>회원가입</b>
						</button>
					</c:if> <c:if test="${sessionScope.login eq true }">
						<a href="/member/logout"><button
								class="btn btn-warning btn-lg">
								<b>로그아웃</b>
							</button></a>&nbsp;
            <a href="/mypage/main"><button
								class="btn btn-warning btn-lg">
								<b>마이페이지</b>
							</button></a>
					</c:if></li>

			</ul>
	</div>
	</nav>
	<!--          <li><a class="menuLink" href="#"><img src="/resources/img/advertising.png" width="30" height="30">&nbsp;광고/배너</a></li> -->





	<!-- Modal HTML -->
	<div id="myModal" class="modal fade" data-backdrop="static">
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
								placeholder="Password" required="required"> <input
								type="hidden" id="nowurl" name="nowurl" value="">
						</div>
						<div class="form-group">
							<button type="submit"
								class="btn btn-primary btn-lg btn-block login-btn">Login</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<a href="/member/find" target="_blank">비밀번호를 잊으셨나요?</a>
				</div>
			</div>
		</div>
	</div>




	<%-->   <!-- 고객 1:1 상담 채팅창 -->
<!--    <!--Start of Tawk.to Script--> -->
<!-- <!--Start of Tawk.to Script--> -->
<!-- <script type="text/javascript"> -->
// var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
// (function(){
// var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
// s1.async=true;
// s1.src='https://embed.tawk.to/5de4576ad96992700fca30b3/default';
// s1.charset='UTF-8';
// s1.setAttribute('crossorigin','*');
// s0.parentNode.insertBefore(s1,s0);
// })();
<!-- </script> -->
<!-- <!--End of Tawk.to Script--> --> 

 --%>

	<!-- Channel Plugin Scripts -->
	<script>
		(function() {
			var w = window;
			if (w.ChannelIO) {
				return (window.console.error || window.console.log || function() {
				})('ChannelIO script included twice.');
			}
			var d = window.document;
			var ch = function() {
				ch.c(arguments);
			};
			ch.q = [];
			ch.c = function(args) {
				ch.q.push(args);
			};
			w.ChannelIO = ch;
			function l() {
				if (w.ChannelIOInitialized) {
					return;
				}
				w.ChannelIOInitialized = true;
				var s = document.createElement('script');
				s.type = 'text/javascript';
				s.async = true;
				s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
				s.charset = 'UTF-8';
				var x = document.getElementsByTagName('script')[0];
				x.parentNode.insertBefore(s, x);
			}
			if (document.readyState === 'complete') {
				l();
			} else if (window.attachEvent) {
				window.attachEvent('onload', l);
			} else {
				window.addEventListener('DOMContentLoaded', l, false);
				window.addEventListener('load', l, false);
			}
		})();
		ChannelIO('boot', {
			"pluginKey" : "5a9af9c3-4027-46d1-816f-3a08ac8fc945"
		});
	</script>
	<!-- End Channel Plugin -->