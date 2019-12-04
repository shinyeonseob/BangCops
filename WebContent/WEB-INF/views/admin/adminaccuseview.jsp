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
		$(location).attr("href", "/admin/accuselist");
	});
	
/* 	//수정버튼 동작
	$("#btnUpdate").click(function() {
		$(location).attr("href", "/admin/memberupdate?userno=${viewBuser.userno}");
	}); */

	//삭제버튼 동작
	$("#btnDelete").click(function() {
		$(location).attr("href", "/admin/accusedelete?accuseno=${bAccuse2.accuseno }");
	});
	
});
</script>

</head>
<body>
<div class="container">

<h1> 신고 - 상세보기</h1>

<hr>

<table class="table table-bordered">
<tr>
<td class="danger">신고사이트</td><td colspan="2">${bAccuse2.sitename }</td>
</tr>

<tr>
<td class="danger">신고된 URL</td><td colspan="2">${bAccuse2.url }</td>
</tr>

<tr>
<td class="danger">지역</td><td colspan="2">${bAccuse2.city }시 ${bAccuse2.gu}구</td>
</tr>

<tr>
<td class="danger">가격</td><td colspan="2">보증금 : ${bDeal.deposit } 월세 : ${bDeal.price}</td>
</tr>

<tr>
<td class="danger">신고된 부동산</td><td colspan="2">${bAccuse2.property }</td>
</tr>
<tr>
<td class="danger">중개사명</td><td colspan="2">${bAccuse2.agent }</td>
</tr>
<tr>
<td class="danger">전화번호</td><td colspan="2">${bAccuse2.phoneNo }</td>
</tr>
<tr>
<td class="danger">작성자</td><td colspan="2">${bAccuse2.userid }</td>
</tr>
<tr>
<td class="danger">상세신고내역</td><td colspan="2">${bAccuse2.contents }</td>
</tr>


</table>

<div class="text-center">	
	<button id="btnList" class="btn btn-primary">목록</button>
<!-- 	<button id="btnUpdate" class="btn btn-info">수정</button> -->
	<button id="btnDelete" class="btn btn-danger">삭제</button>
</div>

</div><!-- .container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />