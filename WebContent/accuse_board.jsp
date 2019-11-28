<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />


<style type="text/css">
table, th {
	text-align: center;
}

tr td:nth-child(2) {
	text-align: left;
}

tr td:not(:first-child), tr th:not(:first-child) {
	border-left: 1px solid white;
}

</style>



<div class="container">

<h1>신고게시판 목록</h1>
<hr>

<table class="table table-hover table-condensed table-striped">
<tr class="info">
	<th>
		<input type="checkbox" id="checkAll" onclick="checkAll();" />
	</th>
	<th style="width: 10%">글번호</th>
	<th style="width: 15%">부동산이름</th>
	<th style="width: 15%">중개인이름</th>
	<th style="width: 15%">전화번호</th>
	<th style="width: 10%">지역</th>
	<th style="width: 15%">아이디</th>
	<th style="width: 20%">신고일</th>
</tr>

<c:forEach items="${list }" var="board">
<tr>
	<td><input type="checkbox" name="checkRow" value="${board.boardno }" /></td>
	<td>${board.boardno }</td>
	<td><a href="/board/view?boardno=${board.boardno }">${board.title }</a></td>
	<td>${board.id }</td>
	<td>${board.hit }</td>
	<td><fmt:formatDate value="${board.writtendate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>

</table> 

<button id="btnDelete" class="btn btn-warning pull-left">삭제</button>
<div class="clearfix"></div>

<jsp:include page="/WEB-INF/views/layout/paging.jsp" />

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" />
	<button id="btnSearch" class="btn">검색</button>
</div>

</div><!-- .container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />




<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
