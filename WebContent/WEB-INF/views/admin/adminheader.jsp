<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>

<!--  jQuery -->
<script type="text/javascript"
	src=https://code.jquery.com/jquery-2.2.4.min.js>
</script>
	
<style>
#topMenu { 
   height:30px;
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



#container {
	list-style: none;
	color: white;
	background-color: #333399;
	float: left;
	line-height: 40px;
	vertical-align: middle;
	text-align: center;
}

</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_admin_memberlist").click(function() {
			location.href = "/admin/memberlist";
		});

	});
</script>

</head>
<body>
<h1>관리자 메인 페이지</h1>

<div class="container">
<nav id="topMenu">
      <ul>
         <li><a id = "btn_admin_memberlist" class="menuLink" href="#">회원리스트</a></li>
         <li><a class="menuLink" href="#">회원 수정</a></li>
         <li><a class="menuLink" href="#">공지사항</a></li>
         <li><a class="menuLink" href="#">자유게시판</a></li>
         <li><a class="menuLink" href="#">이용후기게시판</a></li>
      </ul>
</nav>
<hr>
</div>
