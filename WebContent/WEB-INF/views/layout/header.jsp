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

<<<<<<< HEAD
=======
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


>>>>>>> refs/remotes/origin/develop
<!--  jQuery -->
<script type="text/javascript"
   src=https://code.jquery.com/jquery-2.2.4.min.js></script>


<style type="text/css">

</style>

<style>
#topMenu {
   height: 120px;
   text-align: center;
   display: flex;
   justify-content: center;
   align-items: stretch;
}
#topMenu ul li {
   list-style: none;
   color: white;
   background-color: #0066B2;
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
   font-size: 15px;
   font-weight: bold;
   font-family: "Trebuchet MS", Dotum, Arial;
   border: 1px solid #FFFFFF;
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
   background: #60c7c1;
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
   background: #60c7c1;
   text-decoration: none;
   transition: all 0.4s;
   line-height: normal;
   border: none;
}
.modal-login .btn:hover, .modal-login .btn:focus {
   background: #45aba6;
   outline: none;
}
.trigger-btn {
   display: inline-block;
}
.logo {


   /* 화면 크기에 따라 적응하도록 설정 */
      width: 120px;
      height: 80px;
/*     object-fit: none; */
   /* 이미지 크기 보정 */
       margin-left: -75px;
}
#mainlogo{
   width: 50px;
}

</style>

<script type="text/javascript">
   $(document).ready(function() {
      // 회원가입 버튼
      $("#btn_join").click(function() {
         location.href = "/member/join";
      });
      
      <%--// 로그인 버튼
      $("#btn_login").click(function() {
         location.href = "/member/login";
      }); --%>
      
      // 검색 버튼
      $("#btn_search").click(function() {
         location.href = "/main";
      });
      
      // 신고 버튼
      $("#btn_accuse").click(function() {
         location.href = "/main/accuse";
      });
      
      // 홈 버튼
      $("#btn_home").click(function() {
         location.href = "/main/home";
      });
      
      // 커뮤니티 버튼
      $("#btn_community").click(function() {
         location.href = "/main/community";
      });
      
   });
</script>


</head>
<body>
      <div class="jumbotron text-center">
      <h1>방캅스</h1>
      <p>KH 방갑조</p>
   </div>

   <nav id="topMenu">
   <div id = "mainlogo" class="navbar-header">
   <a href="/main"><img class="logo" src="/resources/img/logo2.png"></a>
   </div>
      <ul>
         <li><a id = "btn_search" class="menuLink" href="#"><img src="/resources/img/search.png" width="30" height="30" >&nbsp;&nbsp;검색</a></li>
         <li><a id = "btn_accuse" class="menuLink" href="#"><img src="/resources/img/accuse.png" width="30" height="30">&nbsp;신고</a></li>
         <li><a id = "btn_home" class="menuLink" href="#"><img src="/resources/img/home.png" width="30" height="30">&nbsp;홈</a></li>
         <li><a id = "btn_community" class="menuLink" href="#"><img src="/resources/img/community.png" width="30" height="30">&nbsp;커뮤니티</a></li>
         <li><a class="menuLink" href="#"><img src="/resources/img/advertising.png" width="30" height="30">&nbsp;광고/배너</a></li>

         <li>
         
         <c:if test="${sessionScope.login eq null }">
         <a href="#myModal" class="trigger-btn" data-toggle="modal">
         <button id = "btn_login" class = "btn_login" on>로그인</button></a>
         <button id="btn_join" class="btn_join">회원가입</button></li>
         </c:if>

         <c:if test="${sessionScope.login eq true }">
            <a href="/member/logout"><button>로그아웃</button></a>
            <a href="/mypage/main"><button>마이페이지</button></a>
         </c:if>
 
      </ul>
   </nav>
   <!-- Modal HTML -->
   <div id="myModal" class="modal fade">
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
                        placeholder="Password" required="required">
                  </div>
                  <div class="form-group">
                     <button type="submit"
                        class="btn btn-primary btn-lg btn-block login-btn">Login</button>
                  </div>
               </form>
            </div>
            <div class="modal-footer">
               <a href="/member/find" target="_blank">비밀번호를 잊으셨나요</a>
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
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
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
    "pluginKey": "5a9af9c3-4027-46d1-816f-3a08ac8fc945"
  });
</script>
<!-- End Channel Plugin -->




   