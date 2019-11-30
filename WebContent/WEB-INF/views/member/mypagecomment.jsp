<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
	
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/mypageheader.jsp" />

<style type = "text/css">
td{
	
}

#mypage_comment{
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	margin-right: 730px;
}
</style>

<div id = "mypage_comment" >
	<h2>내가 쓴 댓글</h2>
</div>

<hr style="background:grey;height:2px">
<br>
<table>
	<tr style="height:40">
<!-- 		<th class="text-center" style="width:5%">글번호</th> -->
		<th class="text-center" style="width:10%">번호</th>
		<th class="text-center" style="width:60%">댓글 내용</th>
		<th class="text-center" style="width:20%">원문</th>
		<th class="text-center" style="width:10%">작성날짜</th>
	</tr>
<c:forEach items="${ list }" var="i">
	<tr style="text-align:center;height:30">
		<td>${ i.commentno }</td>
		<td>${ i.contents }</td>
		<td style="text-align:center"><a href ="/main/community/board/view?idx=${ i.idx }">${ i.title }</a></td>
		<td>${ i.regDate }</td>
	</tr>
</c:forEach>
<hr style="background:grey;height:2px">
</table>
















<jsp:include page="/WEB-INF/views/layout/paging.jsp" />

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />