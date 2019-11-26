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
</style>

<div id = "mypage_board" >
	<h2>내가 쓴 글</h2>
</div>

<hr style="background:grey;height:2px">
<br>
<table>
	<tr style="height:40">
		<th class="text-center" style="width:5%">글번호</th>
		<th class="text-center" style="width:15%">작성게시판</th>
		<th class="text-center" style="width:55%">제목</th>
		<th class="text-center" style="width:15%">작성일</th>
		<th class="text-center" style="width:5%">조회수</th>
		<th class="text-center" style="width:5%">추천수</th>
	</tr>
<c:forEach items="${ list }" var="i">
	<tr style="text-align:center;height:30">
		<td>${ i.idx }</td>
		<td>${ i.boardname }</td>
		<td><a>${ i.title }</a></td>
		<td>${ i.regDate }</td>
		<td>${ i.hits }</td>
		<td>${ i.reco }</td>
	</tr>
</c:forEach>
<hr style="background:grey;height:2px">
</table>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />