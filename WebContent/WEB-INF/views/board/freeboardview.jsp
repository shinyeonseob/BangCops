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
<script type="text/javascript">
function warning() {
	alert("게시글을 삭제합니다..");
}
</script>

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

<table style="width:1140">
	<tr>
		<th colspan="2"><h3>${list.title }</h3></th>
	</tr>
	<tr>
		<td><p>${list.usernick } | ${list.regDate }<p></td>
		<td style="text-align:right;"><p>조회 ${list.hits } | 추천 ${list.reco }</p></td>
	</tr>
</table>
<hr>
<br>
<table style="width:1140">
	<tr>
		<td colspan="2" style=";text-align:left"><div style="min-height:400">${list.contents }</div></td>
	</tr>
	<tr style="border:1px solid black;height:50">
		<th style="width:10" >첨부파일</th>
		<td style="width:90" class="info"><a href="/upload/${bAttached.storedName}">${bAttached.originName }</a></td>
	</tr>
</table>
<br>
<a href="/main/community/freeboardlist"><button>목록보기</button></a>
<%-- ${session.Userno } | ${list.userNo } --%>
<c:if test="${Userno eq list.userNo}">
	<a style="float:right"><button>수정하기</button></a>
	<a style="float:right" href="/main/community/board/delete?idx=${list.idx }" onclick="warning();"><button>삭제하기</button></a>
	<a style="float:right"><button>댓글작성</button></a>
</c:if>
<c:if test="${empty login }">
	<a style="float:right"><button>댓글작성</button></a>
</c:if>
<c:if test="${Userno ne list.userNo }">
	<a style="float:right"><button>댓글작성</button></a>
</c:if>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />