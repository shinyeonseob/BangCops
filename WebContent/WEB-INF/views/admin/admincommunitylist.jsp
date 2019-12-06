<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style type="text/css">
th {
	padding:10px;
c	text-align:center;
}

td {
	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
}

</style>

<jsp:include page="/WEB-INF/views/admin/adminheader.jsp" />
<script type="text/javascript">
$(document).ready(function() {

	$("#btnSearch").click(function() {
		location.href="/admin/community/board?boardno="
				+${boardno}+"&searchcategory="
				+$("#searchcategory").val()
				+"&searchtarget="+$("#searchtarget")
				.val();
	});
	
});
</script>

<br>
<table style="margin:0 auto;width:1200;height:50;table-layout:fixed" >
	<tr>
		<th><div class="text-center"><button class="btn btn-secondary" onclick="location.href='/admin/community/board?boardno=1'" style="width:120px">자유게시판</button></div></th>
		<th><div class="text-center"><button class="btn btn-secondary" onclick="location.href='/admin/community/board?boardno=2'"style="width:120px">이용후기</button></div></th>
		<th><div class="text-center"><button class="btn btn-secondary" onclick="location.href='/admin/community/board?boardno=3'"style="width:120px">공지사항</button></div></th>
		<th><div class="text-center"><button class="btn btn-secondary" onclick="location.href='/admin/community/board?boardno=5'"style="width:120px">FAQ</button></div></th>
		<th><div class="text-center"><button class="btn btn-secondary" onclick="location.href='/admin/qna'"style="width:120px">고객센터</button></div></th>
	</tr>
</table>

<div class="container">
<c:if test="${boardno eq 1}">
<h1>💬 자유게시판</h1>
<h4>당신의 자유로운 이야기를 들려주세요.</h4>
</c:if>
<c:if test="${boardno eq 2}">
<h1>💬 이용후기게시판</h1>
<h4>피해사례와 방캅스 이용에 대한 다양한 후기를 남겨주세요.</h4>
</c:if>
<c:if test="${boardno eq 3}">
<h1>📢 공지사항</h1>
<h4>방캅스 회원 여러분들에게 공지사항을 전해드립니다.</h4>
</c:if>
<c:if test="${boardno eq 5}">
<h1>📑 FAQ</h1>
<h4>방캅스 회원 여러분의 궁금한 사항을 빠르게 해결해드립니다.</h4>
</c:if>
<hr style="background:grey;height:2px">
<br>
<table style="width:1140; table-layout: fixed;" class="table table-hover">
	<tr style="height:40">
		<th class="text-center" style="width:9%">글번호</th>
		<th class="text-center" style="width:34%">제목</th>
		<th class="text-center" style="width:15%">닉네임</th>
		<th class="text-center" style="width:15%">작성일</th>
		<th class="text-center" style="width:6%">조회수</th>
		<th class="text-center" style="width:6%">추천수</th>
		<th class="text-center" style="width:15%">게시글삭제</th>
	</tr>
<c:forEach items="${ list }" var="i">
	<tr style="text-align:center; height:30">
		<td>${ i.idx }</td>
		<td style="text-align:left"><a href ="/admin/community/board/view?idx=${ i.idx }">${ i.title }</a></td>
		<td>${ i.usernick }</td>
		<td>${ i.regDate }</td>
		<td>${ i.hits }</td>
		<td>${ i.reco }</td>
		<td><a class="btn btn-outline-secondary" id="btnDelete" href="/admin/community/board/delete?boardno=${boardno }&idx=${i.idx }">게시글 삭제</a></td>
	</tr>
</c:forEach>
</table>
<hr style="background:grey;height:2px">
<div>
<%-- <c:if test="${adminlogin && boardno ne 3 && boardno ne 5}"> --%>
<%-- <a href="/admin/community/board/write?boardno=${boardno }"><button>게시글작성</button></a> --%>
<%-- </c:if> --%>
<c:if test="${!empty adminlogin && adminlogin}">
<a style="float:left" href="/admin/community/board/write?boardno=${boardno }" class="trigger-btn"><button>게시글 작성</button></a>
<%-- <button id="btndelete" onclick="location.href='/admin/community/board/delete?boardno=${boardno }&idx=${i.idx }'">삭제</button> --%>
</c:if>

	
	<button id="btnSearch" style="float:right" >검색</button>
	<input type="text" id ="searchtarget" name="searchtarget" size="15" placeholder="검색어를 입력하세요" style="float:right" />
	<select id="searchcategory" Style="float:right;height:26px" >
		<option value="title">제목</option>
		<option value="usernick">작성자</option>
		<option value="contents">내용</option>
	</select>
	
</div>
</div>
<div style="margin:0 auto" ><jsp:include page="/WEB-INF/views/layout/paging.jsp" /></div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />