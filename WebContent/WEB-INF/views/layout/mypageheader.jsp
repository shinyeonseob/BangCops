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

		$(function(){

	        var menu = $('.menu-navigation-basic');

	        menu.slicknav();

	        // Mark the clicked item as selected

	        menu.on('click', 'a', function(){
	            var a = $(this);

	            a.siblings().removeClass('selected');
	            a.addClass('selected');
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
/*  .nav-tabs{  */
/*  	display: flex;  */
/*  	flex-direction: row;  */
/*  	width:100%;  */
/*  	margin: 0;  */
/*  	padding: 0;  */
/*  	background-color: navy;  */
/*  	list-style-type:none;  */
/*  }  */
/*  .nav-item{  */
/*  	padding: 15px;  */
/*  	cursor: pointer;  */
/*  }  */
/*  .nav-item a{  */
/*  	text-align:cener;  */
/*  	text-decoration: none;  */
/*  	color:white;  */
/*  }  */
/*  .nav-item:nth-child(1){  */
/*  	background-color: lightseagreen;  */
/*  }  */
/*  .nav-item:hover{  */
/*  	background-color : grey;  */
/*  }  */
/*  .nav-container{  */
/*  	position: fixed;  */
/*  	top:0;  */
/*  }  */
</style>


<br>
<br>	
<div class="container list-container">
<div id = "mypagetitle" class="row"><h1 >마이페이지</h1></div>

	<div id = "mypagemenu" role="tabpanel">
		<ul class="nav nav-tabs" role="tablist" id="menubar">
			<li id="mypagemain" class= "nav-item" role="presentation" ><a href="/mypage/main" aria-controls="mypagemain" role="tab">나의 정보</a></li>
			<li id="mypageupdate" class= "nav-item" role="presentation" ><a href="/mypage/update" aria-controls="mypageupdate" role="tab">정보 수정</a></li>
			<li id="mypagepw" class= "nav-item" role="presentation" ><a href="/mypage/pw" aria-controls="mypagepw" role="tab">비밀번호 변경</a></li>
			<li id="myboard" class= "nav-item" role="presentation" ><a href="/mypage/board" aria-controls="myboard" role="tab">내가 쓴 글 내역</a></li>
			<li id="mycomment" class= "nav-item" role="presentation" ><a href="/mypage/comment" aria-controls="mycomment" role="tab">내가 쓴 댓글</a></li>
			<li id="withdrawal" class= "nav-item" role="presentation" ><a href="/mypage/with" aria-controls="withdrawal" role="tab">회원탈퇴</a></li>
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
