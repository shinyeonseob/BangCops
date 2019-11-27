<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->

<!-- </body> -->
<!-- </html> -->

<style type="text/css">
th {
	padding:10px;
/* 	border:1px solid black; */
	text-align:center;
}
</style>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<br>
<table style="margin:0 auto;width:1200;height:50;table-layout:fixed">
	<tr>
		<th><div class="text-center"><button style="width:120px">자유게시판</button></div></th>
		<th><div class="text-center"><button style="width:120px">이용후기</button></div></th>
		<th><div class="text-center"><button style="width:120px">공지사항</button></div></th>
		<th><div class="text-center"><button style="width:120px">FAQ</button></div></th>
		<th><div class="text-center"><button style="width:120px">고객센터</button></div></th>
	</tr>
</table>

<div class="container">
<h1>자유게시판</h1>
<h4>당신의 자유로운 이야기를 올려주세요.</h4>
<hr style="background:grey;height:2px">
<br>
<table>
	<tr style="height:40">
		<th class="text-center" style="width:5%">글번호</th>
		<th class="text-center" style="width:55%">제목</th>
		<th class="text-center" style="width:15%">닉네임</th>
		<th class="text-center" style="width:15%">작성일</th>
		<th class="text-center" style="width:5%">조회수</th>
		<th class="text-center" style="width:5%">추천수</th>
	</tr>
<c:forEach items="${ list }" var="i">
	<tr style="text-align:center;height:30">
		<td>${ i.idx }</td>
		<td><a>${ i.title }</a></td>
		<td>${ i.usernick }</td>
		<td>${ i.regDate }</td>
		<td>${ i.hits }</td>
		<td>${ i.reco }</td>
	</tr>
</c:forEach>
</table>
<hr style="background:grey;height:2px">
<a href="/main/community/freeboard/write"><button>게시글작성</button></a>
<input style="float:right" id="select" name="select" type="text" />
<a style="float:right"><select>
	<option>제목</option>
	<option>작성자</option>
	<option>제목+작성자</option>
</select></a>
</div>

<c:import url="/WEB-INF/views/layout/paging.jsp">
	<c:param name="url" value="${url }" />
</c:import>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />