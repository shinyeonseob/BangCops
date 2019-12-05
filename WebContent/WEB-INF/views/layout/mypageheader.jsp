<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="assets/slicknav/jquery.slicknav.min.js"></script>

<script type="text/javascript">
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
			var pageno = "${pageno}";
			console.log(pageno);
			if(pageno == "1"){
				$("#mypagemain").addClass("active");
			}else if(pageno == "2"){
				$("#mypageupdate").addClass("active");
			}else if(pageno == "3"){
				$("#mypagepw").addClass("active");
			}else if(pageno == "4"){
				$("#mypageboard").addClass("active");
			}else if(pageno == "5"){
				$("#mypagecomment").addClass("active");
			}else if(pageno == "6"){
				$("#withdrawal").addClass("active");
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
	font-family: '행복고흥L';
}
#container {
			width:960px;
			margin:0 auto;
			text-align:center;
			font-family: '행복고흥L';
			font-size: 20px;
		}

		
#menubar{
	margin-top:9px;
	margin-bottom:65px;
}
</style>


<br>
<br>	
<div id = "mypagetitle" class="row"><h1 ><b>마이페이지</b></h1></div>
-
	<div id="container">

<!-- 		<ul class="tab  nav nav-tabs"> -->
<!-- 			<li class="current" data-tab="tab1"><a href="/mypage/main">나의정보</a></li> -->
<!-- 			<li data-tab="tab2"><a href="/mypage/update">정보 수정</a></li> -->
<!-- 			<li data-tab="tab3"><a href="/mypage/pw">비밀번호 변경</a></li> -->
<!-- 			<li data-tab="tab4"><a href="/mypage/board">내가 쓴 글내역</a></li> -->
<!-- 			<li data-tab="tab5"><a href="/mypage/comment">내가 쓴 댓글</a></li> -->
<!-- 			<li data-tab="tab6"><a href="/mypage/with">회원 탈퇴</a></li> -->
<!-- 		</ul> -->

<!-- 	</div> -->

	<div role="tabpanel">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist" id="menubar">
			<li role="presentation" id="mypagemain"><a href="/mypage/main" aria-controls="mypagemain" role="tab">
			<span style="color:black">나의정보</span></a></li>
			<li role="presentation" id="mypageupdate"><a href="/mypage/update" aria-controls="mypageupdate" role="tab">
			<span style="color:black">정보 수정</span></a></li>
			<li role="presentation" id="mypagepw"><a href="/mypage/pw" aria-controls="mypagepw" role="tab">
			<span style="color:black">비밀번호 변경</span></a></li>
			<li role="presentation" id="mypageboard"><a href="/mypage/board" aria-controls="mypageboard" role="tab">
			<span style="color:black">내가 쓴 글 내역</span></a></li>
			<li role="presentation" id="mypagecomment"><a href="/mypage/comment" aria-controls="mypagecomment" role="tab">
			<span style="color:black">내가 쓴 댓글</span></a></li>
			<li role="presentation" id="withdrawal"><a href="/mypage/with" aria-controls="withdrawal" role="tab">
			<span style="color:black">회원 탈퇴</span></a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="mypagemain"></div>
			<div role="tabpanel" class="tab-pane" id="mypageupdate"></div>
			<div role="tabpanel" class="tab-pane" id="mypagepw"></div>
			<div role="tabpanel" class="tab-pane" id="mypageboard"></div>
			<div role="tabpanel" class="tab-pane" id="mypagecomment"></div>
			<div role="tabpanel" class="tab-pane" id="withdrawal"></div>
		</div>
	</div>	
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
