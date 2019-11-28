<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript">
	$(document).ready(function() {

		// 마이페이지 메인 버튼
		$("#btn_mypagemain").click(function() {
			location.href = "/mypage/main";
		});
		
		// 마이페이지 정보수정 버튼
		$("#btn_mypageupdate").click(function() {
			location.href = "/mypage/update";
		});
		
		// 마이페이지 비밀번호변경 버튼
		$("#btn_mypagepw").click(function() {
			location.href = "/mypage/pw";
		});
		// 마이페이지 내가 쓴 글 버튼
		$("#btn_myboard").click(function() {
			location.href = "/mypage/board";
		});
		// 마이페이지 회원탈퇴 버튼
		$("#btn_withdrawal").click(function() {
			location.href = "/mypage/with";
		});
		
		
	});
</script>

<style type = "text/css">

#mypagetitle{
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	min-height : 200px;
	margin-right: 730px;
}

#mypagemenu {
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
}

#mypagemenu ul li {
	list-style: none; 
	color: white;
	background-color: #708090;
	float: left;
	line-height: 40px;
	vertical-align: middle;
	text-align: center;
}

#mypagemenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
	border: 1px solid #bcbcbc;
}

#mypagemenuu .menuLink:hover {
	color: black;
	background-color: #FFFF66;
}


</style>

	






<br>
<br>	
<div id = "mypagetitle"><h1 >마이페이지</h1></div>

<nav id="mypagemenu">
		<ul>
			<li><a id = "btn_mypagemain" class="menuLink" href="#">나의 정보</a></li>
			<li><a id = "btn_mypageupdate" class="menuLink" href="#">정보 수정</a></li>
			<li><a id = "btn_mypagepw"class="menuLink" href="#">비밀번호 변경</a></li>
			<li><a id = "btn_myboard" class="menuLink" href="#">내가 쓴 글 내역</a></li>
			<li><a class="menuLink" href="#">내가 쓴 댓글</a></li>
			<li><a class="menuLink" href="#">이의신청</a></li>	
			<li><a id = "btn_withdrawal" class="menuLink" href="#">회원탈퇴</a></li>	

			

		</ul>
	</nav>


