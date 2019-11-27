<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
table, th {
	text-align: center;
}

tr td:nth-child(3) {
	text-align:left;
}

tr td:not(:first-child), tr th:not(:first-child) {
	border-left: 1px solid white;
}

</style>
</head>

<body>
<div class="container">

<h1>회원정보 목록</h1>
<hr>

<table class="table table-hover table-condensed table-striped">

<tr class="danger">
	<th style="width: 15%">회원번호</th>
	<th style="width: 30%">아이디</th>
	<th style="width: 20%">닉네임</th>
	<th style="width: 10%">이름</th>
	<th style="width: 25%">전화번호</th>
</tr>

<c:forEach var="list" items="${list }">
<tr>
	<td>${list.userno }</td>
	<td>${list.userid }</td>
	<td>${list.usernick }</td>
	<td>${list.username }</td>
	<td>${list.usertel }</td>
</tr>
</c:forEach>
	
</table>


<%-- <jsp:include page="/WEB-INF/views/layout/paging.jsp" /> --%>

<c:import url="/WEB-INF/views/layout/paging.jsp">
	<c:param name="url" value="${url }" />
</c:import>

</div> <!-- .container -->

</body>
</html>