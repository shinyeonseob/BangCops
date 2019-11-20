<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="utf-8" />
<meta name="description"
   content="The Overflowing church website's main page" />
<meta name="author" content="unikys@gmail.com" />
<title>BangCops</title>


<style type = "text/css">

#topMenu { 
   height:30px;
   text-align : center;
   	display:  flex;
	justify-content:  center;
	align-items : stretch;
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
         <button type="button" class="btn_login" 
         onclick="location.href='/member/login';">로그인</button>
         <button type="button" class="btn_join" 
         onclick="location.href='/member/join';">회원가입</button></a></li>
         
         
         
         
      </ul>
   </nav>

</body>
</html>
