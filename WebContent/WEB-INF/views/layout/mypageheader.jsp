<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	var link = document.location.href;
	console.log(link);
// 	if (mypagemain) {
// 		$("#mypagemain").addClass("active");
// 	} else if (mypageupdate) {
// 		$("#mypageupdate").addClass("active");
// 	} else if (mypagepw) {
// 		$("#mypagepw").addClass("active");
// 	} else if (myboard) {
// 		$("#myboard").addClass("active");
// 	} else if (mycomment) {
// 		$("#mycomment").addClass("active");
// 	} else {
// 		$("#withdrawal").addClass("active");
// 	}
	
	
	// 마이페이지 메인 버튼
// 	if ($("#mypagemain").click(function()){
// 		$("#mypagemain").addClass("active");
// 	}
// 	// 마이페이지 정보수정 버튼
// 	else if($("#mypageupdate").click(function()){
// 		$("#mypageupdate").addClass("active");		
// 	}
// 	// 마이페이지 비밀번호변경 버튼
// 	else if($("#mypagepw").click(function()){
// 		$("#mypagepw").addClass("active")
// 	}
// 	// 마이페이지 내가 쓴 글 버튼
// 	else if($("#myboard").click(function()){
// 		$("#myboard").addClass("active")
// 	}
// 	// 마이페이지 내가 쓴 댓글 버튼
// 	else if($("#mycomment").click(function()){
// 		$("#mycomment").addClass("active")
// 	}
// 	// 마이페이지 회원탈퇴 버튼
// 	else if($("#withdrawal").click(function()){
// 		$("#withdrawal").addClass("active")
// 	}

	$(document).ready(function(){
		  $(".nav-tabs a").click(function(){
		     $(this).tab('show');
		  });
		});

});
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
#mypagemenu {
	text-align: center;
	display: flex;
	justify-content: center;
	margin-right: 240px;
}
#menubar{
	margin-top:9px;
	margin-bottom:65px;
}
#logo{
	height: 10px;
}
</style>


<br>
<br>	
<div class="container list-container">
<div id = "mypagetitle" class="row"><h1 >마이페이지</h1></div>

	<div id = "mypagemenu" role="tabpanel">
		<ul class="nav nav-tabs" role="tablist" id="menubar">
			<li id="mypagemain" role="presentation" ><a href="/mypage/main" aria-controls="mypagemain" role="tab">나의 정보</a></li>
			<li id="mypageupdate" role="presentation" ><a href="/mypage/update" aria-controls="mypageupdate" role="tab">정보 수정</a></li>
			<li id="mypagepw" role="presentation" ><a href="/mypage/pw" aria-controls="mypagepw" role="tab">비밀번호 변경</a></li>
			<li id="myboard" role="presentation" ><a href="/mypage/board" aria-controls="myboard" role="tab">내가 쓴 글 내역</a></li>
			<li id="mycomment" role="presentation" ><a href="/mypage/comment" aria-controls="mycomment" role="tab">내가 쓴 댓글</a></li>
			<li id="withdrawal" role="presentation" ><a href="/mypage/with" aria-controls="withdrawal" role="tab">회원탈퇴</a></li>
		</ul>

		<!-- Tab panes -->
	<%-- 	<div class="tab-content">
			<div id="mypagemain" role="tabpanel" class="tab-pane" ></div>
			<div id="mypageupdate" role="tabpanel" class="tab-pane" ></div>
			<div id="mypagepw" role="tabpanel" class="tab-pane" ></div>
			<div id="myboard" role="tabpanel" class="tab-pane" ></div>
			<div id="mycomment" role="tabpanel" class="tab-pane" ></div>
			<div id="withdrawal" role="tabpanel" class="tab-pane" ></div>
		</div>--%>
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
