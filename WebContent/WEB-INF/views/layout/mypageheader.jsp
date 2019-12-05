<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>




	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">


	<link rel="stylesheet" href="assets/demo.css">
	<link rel="stylesheet" href="assets/navigation-basic.css">
	<link rel="stylesheet" href="assets/slicknav/slicknav.min.css">
	
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="assets/slicknav/jquery.slicknav.min.js"></script>

<script>
// 		$(function() {
// 			$('ul.tab li').click(function() {
// 				var activeTab = $(this).attr('data-tab');
// 				$('ul.tab li').removeClass('current');
// 				$('.tabcontent').removeClass('current');
// 				$(this).addClass('current');
// 				$('#' + activeTab).addClass('current');
// 			})
// 		});
		
		$(document).ready(function(){
			var datatab = $('data-tab')
			if(datatab == "tab1"){
				$(this).addClass('current');
				$('/mypage/main' + activeTab).addClass('current');
			}else if(datatab == "tab2"){
				$(this).addClass('current');
				$('/mypage/update' + activeTab).addClass('current');
			}else if(datatab == "tab3"){
				$(this).addClass('current');
				$('/mypage/pw' + activeTab).addClass('current');
			}else if(datatab == "tab4"){
				$(this).addClass('current');
				$('/mypage/board' + activeTab).addClass('current');
			}else if(datatab == "tab5"){
				$(this).addClass('current');
				$('/mypage/comment' + activeTab).addClass('current');
			}else if(datatab == "tab6"){
				$(this).addClass('current');
				$('/mypage/with' + activeTab).addClass('current');
			}
			
		})
	</script>

<style type="text/css">
#mypagetitle{
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	min-height : 100px;
	margin-right: 660px;
}
#container {
			width:960px;
			margin:0 auto;
			text-align:center;
		}
		.tab {
			list-style: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
		}
		/* Float the list items side by side */
		.tab li {
			float: left;
		}
		/* Style the links inside the list items */
		.tab li a {
			display: inline-block;
			color: #000;
			text-align: center;
			text-decoration: none;
			padding: 14px 16px;
			font-size: 17px;
			transition:0.3s;
		}
		/* Style the tab content */
		.tabcontent {
			display: none;
			background-color:rgb(0,154,200);
			padding: 6px 12px;
			color:#fff;
		}
		ul.tab li.current{
			background-color: grey;
			color: #222;
		}
		.tabcontent.current {
			display: block;
		}
</style>


<br>
<br>	
<div id = "mypagetitle" class="row"><h1 >마이페이지</h1></div>
-
	<div id="container">

		<ul class="tab  nav nav-tabs">
			<li class="current" data-tab="tab1"><a href="/mypage/main">나의정보</a></li>
			<li data-tab="tab2"><a href="/mypage/update">정보 수정</a></li>
			<li data-tab="tab3"><a href="/mypage/pw">비밀번호 변경</a></li>
			<li data-tab="tab4"><a href="/mypage/board">내가 쓴 글내역</a></li>
			<li data-tab="tab5"><a href="/mypage/comment">내가 쓴 댓글</a></li>
			<li data-tab="tab6"><a href="/mypage/with">회원 탈퇴</a></li>
		</ul>

	</div>

	
    




















<%-- 
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
		// 마이페이지 내가 쓴 댓글 버튼
		$("#btn_mycomment").click(function() {
			location.href = "/mypage/comment";
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
			<li><a id = "btn_mycomment" class="menuLink" href="#">내가 쓴 댓글</a></li>
		<%-- 	<li><a class="menuLink" href="#">이의신청</a></li>	 --%>
	<%--		<li><a id = "btn_withdrawal" class="menuLink" href="#">회원탈퇴</a></li>	

			

		</ul>
	</nav>
	
	--%>
