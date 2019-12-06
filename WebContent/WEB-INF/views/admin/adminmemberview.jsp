<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>    
    
<jsp:include page="/WEB-INF/views/admin/adminheader.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	//목록버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "/admin/memberlist");
	});
	
	//수정버튼 동작
	$("#btnUpdate").click(function() {
		$(location).attr("href", "/admin/memberupdate?userno=${viewBuser.userno}");
	});

	//삭제버튼 동작
	$("#btnDelete").click(function() {
		var delConfirm = confirm('정말 탈퇴하시겠습니까?');
		if (delConfirm) {
		$(location).attr("href", "/admin/memberdelete?userno=${viewBuser.userno}");
		      alert('탈퇴 되었습니다.');
		   }
		   else {
		      alert('탈퇴가 취소되었습니다.');
		   }
	});
	
});
</script>

</head>
<body>
<div class="container">

<h1>📁 회원정보 - 상세보기</h1>

<hr>

<table class="table table-bordered">
<tr>
<td class="danger">회원번호</td><td colspan="2">${viewBuser.userno }</td>
</tr>

<tr>
<td class="danger">아이디</td><td colspan="2">${viewBuser.userid }</td>
</tr>

<tr>
<td class="danger">이름</td><td colspan="2">${viewBuser.username }</td>
</tr>

<tr>
<td class="danger">닉네임</td><td colspan="2">${viewBuser.usernick }</td>
</tr>

<tr>
<td class="danger">전화번호</td><td colspan="2">${viewBuser.usertel }</td>
</tr>

<tr>
<td class="danger">비밀번호</td><td colspan="2">${viewBuser.userpw }</td>
</tr>

</table>

<div class="text-center">	
	<button id="btnList" class="btn btn-primary">목록</button>
	<button id="btnUpdate" class="btn btn-info">수정</button>
	<button id="btnDelete" class="btn btn-danger">삭제</button>
</div>

</div><!-- .container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />