<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://opensource.keycdn.com/fontawesome/4.7.0/font-awesome.min.css" />

<style type="text/css">

.nav-tabs { border-bottom: 2px solid #DDD; }
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover { border-width: 0; }
    .nav-tabs > li > a { border: none; color: #ffffff;background: #5a4080; }
        .nav-tabs > li.active > a, .nav-tabs > li > a:hover { border: none;  color: #5a4080 !important; background: #fff; }
        .nav-tabs > li > a::after { content: ""; background: #5a4080; height: 2px; position: absolute; width: 100%; left: 0px; bottom: -1px; transition: all 250ms ease 0s; transform: scale(0); }
    .nav-tabs > li.active > a::after, .nav-tabs > li:hover > a::after { transform: scale(1); }
.tab-nav > li > a::after { background: ##5a4080 none repeat scroll 0% 0%; color: #fff; }
.tab-pane { padding: 15px 0; }
.tab-content{padding:20px}
.nav-tabs > li  {width:20%; text-align:center;}
.card {background: #FFF none repeat scroll 0% 0%; box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3); margin-bottom: 30px; }
body{ background: #EDECEC; padding:50px}

@media all and (max-width:724px){
.nav-tabs > li > a > span {display:none;}	
.nav-tabs > li > a {padding: 5px 5px;}
}

.logo {
text-align: center;
}

</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_admin_memberlist").click(function() {
			location.href = "/admin/memberlist";
		});

		$("#btn_admin_boardlist").click(function() {
			location.href = "/admin/community";
		});
		
		$("#btn_admin_community").click(function() {
			location.href = "/admin/community";
		});
		$("#btn_admin_qna").click(function() {
			location.href = "/admin/qna";
		});

		$("#btn_admin_note").click(function() {
			location.href = "/admin/note";
		});
		
	});
</script>

<div class="logo">
	<a href="/admin/logout"><img src="/resources/img/logo.png" style="width:200px; height:150px;"></a>
</div>
	
  <div class="row">
    <div class="col-md-12"> 
      <!-- Nav tabs -->
      <div class="card">
        <ul class="nav nav-tabs" role="tablist">
          <li role="presentation" class="active"><a id="btn_admin_memberlist" class="menuLink" href="#" aria-controls="home" role="tab" data-toggle="tab"><i class="fa fa-home"></i>  <span>회원리스트</span></a></li>
          <li role="presentation"><a id="btn_admin_boardlist" class="menuLink" href="#" aria-controls="profile" role="tab" data-toggle="tab"><i class="fa fa-user"></i>  <span>공지사항</span></a></li>
          <li role="presentation"><a id="btn_admin_community" class="menuLink" href="#" aria-controls="messages" role="tab" data-toggle="tab"><i class="fa fa-envelope-o"></i>  <span>게시판</span></a></li>
          <li role="presentation"><a id="btn_admin_qna" class="menuLink" href="#" aria-controls="settings" role="tab" data-toggle="tab"><i class="fa fa-cog"></i>  <span>QnA</span></a></li>
          <li role="presentation"><a id="btn_admin_note" class="menuLink" href="#" aria-controls="settings" role="tab" data-toggle="tab"><i class="fa fa-plus-square-o"></i>  <span>패치노트</span></a></li>
        </ul>
        
      </div>
    </div>
  </div>
</head>
<body>

<hr>
