<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="utf-8" />
<meta name="description"
   content="The Overflowing church website's main page" />
<meta name="author" content="unikys@gmail.com" />
<title>방캅스 홈페이지</title>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!--  jQuery -->
<script type="text/javascript"
src = https://code.jquery.com/jquery-2.2.4.min.js></script>




<style>
#topMenu {
	height: 30px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
}

#topMenu ul li {
   list-style:none;
   color:white;
   background-color:#333399;
   float:left;
   line-height:30px;
   vertical-align:middle;
   text-align:center;
}

#topMenu .menuLink {
   text-decoration:none;
   color:white;
   display:block;
   width:150px;
   font-size:12px;
   font-weight:bold;
   font-family:"Trebuchet MS", Dotum, Arial;
    border: 1px solid #bcbcbc;
}

#topMenu .menuLink:hover {
   color:red;
   background-color: #FFFF66;
}

#topMenu .menulogin {
   text-decoration:none;
   color:white;
   display:block;
   width:150px;
   font-size:12px;
   font-weight:bold;
   font-family:"Trebuchet MS", Dotum, Arial;
   border: 1px solid #bcbcbc;
}
</style>

<script type = "text/javascript">
$(document).ready(function() {
	// 로그인 버튼
	$("#btn_login").click(function() {
		location.href = "/member/login";
	});
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
         
         <li><a class="menulogin" href="#">
         <c:if test="${sessionScope.login eq null }">
         <button id ="btn_login"  class="btn_login" >로그인</button>
         <button id ="btn_join" class="btn_join">회원가입</button></a></li>
         </c:if>
         
         <c:if test="${sessionScope.login eq true }">
		<a href="/member/logout"><button>로그아웃</button></a>
		<a href="/board/list"><button>게시글</button></a>
		<a href="/board/write"><button>게시글 작성</button></a>
		</c:if>
         
      </ul>
   </nav>

</body>
</html>