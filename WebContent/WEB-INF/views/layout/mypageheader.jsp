<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
			<li><a class="menuLink" href="#">나의 정보</a></li>
			<li><a class="menuLink" href="#">정보 수정</a></li>
			<li><a class="menuLink" href="#">비밀번호 변경</a></li>
			<li><a class="menuLink" href="#">내가 쓴 글 내역</a></li>
			<li><a class="menuLink" href="#">내가 쓴 댓글</a></li>
			<li><a class="menuLink" href="#">신고 내역 처리 현황</a></li>	
			<li><a class="menuLink" href="#">이의신청</a></li>	

			

		</ul>
	</nav>


