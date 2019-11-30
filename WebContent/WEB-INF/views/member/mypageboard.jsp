<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
	
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/mypageheader.jsp" />

<style type = "text/css">
#mypage_board{
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	margin-right: 730px;
}
table, th{
	text-align: center;
}

/* 세번째자식(제목)은 왼쪽정렬 */
tr td:nth-child(3){
	text-align: left;
}
/* 첫번째자식이 아닌 tr td에 세로 선 입력 */
tr td:not(:first-child), tr th:not(:first-child){
	border-left : 3px solid white;
}
</style>

<div id = "mypage_board" >
	<h2>내가 쓴 글</h2>
</div>

<br>

<div class="container list-container">
<hr style="background:grey;height:2px">
<br>
<table class="table table-hover">
	<tr style="height:40">
		<th class="text-center" style="width:7%">글번호</th>
		<th class="text-center" style="width:15%">작성게시판</th>
		<th class="text-center" style="width:51%">제목</th>
		<th class="text-center" style="width:15%">작성일</th>
		<th class="text-center" style="width:6%">조회수</th>
		<th class="text-center" style="width:6%">추천수</th>
	</tr>
<c:forEach items="${ list }" var="i">
	<tr style="text-align:center;height:30">
		<td>${ i.idx }</td>
		<td>${ i.boardname }</td>
		<td style="text-align:left"><a href ="/main/community/board/view?idx=${ i.idx }">${ i.title }</a></td>
		<td>${ i.regDate }</td>
		<td>${ i.hits }</td>
		<td>${ i.reco }</td>
	</tr>
</c:forEach>
</table>
<hr style="background:grey;height:2px">

</div>
<jsp:include page="/WEB-INF/views/layout/paging.jsp" />

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />