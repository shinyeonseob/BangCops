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
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {

	$("#btnWrite").click(function() {

// 		console.log(111);

		//스마트에디터의 내용을 <textarea>에 적용
		submitContents($("#btnWrite"));

		//form submit
		$("#write").submit();
	})

});
</script>
<script>
  CKEDITOR.replace('contents');
  </script>


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
		<th><div class="text-center"><button class="btn btn-primary" type="button" style="width:120px">자유게시판</button></div></th>
		<th><div class="text-center"><button class="btn btn-primary" type="button" style="width:120px">이용후기</button></div></th>
		<th><div class="text-center"><button class="btn btn-primary" type="button" style="width:120px">공지사항</button></div></th>
		<th><div class="text-center"><button class="btn btn-primary" type="button" style="width:120px">FAQ</button></div></th>
		<th><div class="text-center"><button class="btn btn-primary" type="button" style="width:120px">고객센터</button></div></th>
	</tr>
</table>

<div class="container">
<h1>게시글 수정</h1>
<c:if test="${boardno eq 1 }">
<h4>>> 자유게시판</h4>
</c:if>
<c:if test="${boardno eq 2 }">
<h4>>> 이용후기게시판</h4>
</c:if>
<c:if test="${boardno eq 3 }">
<h4>>> 공지사항</h4>
</c:if>
<hr style="background:grey;height:2px">
<br>
<form id="write" action="/main/community/board/update" method="POST" enctype="multipart/form-data">
<table style="margin:0 auto;width:1140;">
	<tr style="height:40;margin:auto">
		<th class="text-center" style="width:10%">아이디</th>
		<td class="text-center" style="width:40%">${Userid}</td>
		<th class="text-center" style="width:10%">닉네임</th>
		<td class="text-center" style="width:40%">${UserNick}</td>
	</tr>
	<tr style="height:40">
		<th class="text-center" style="width:10%">제목</th>
		<td colspan="3" class="text-center" style="width:90%"><input id="title" name="title" type="text" size="125" value="${board.title }"/></td>
	</tr>
	<tr style="height:250">
		<th class="text-center">내용</th>
		<td colspan="3"><textarea class="form-control" id="contents" name="contents"  >${board.contents }</textarea>
<script type="text/javascript">
 CKEDITOR.replace('contents', {height: 400});
</script></td>
	</tr>
	<tr>
		<th class="text-center" style="width:10%">첨부<br>파일</th>
		<td colspan="3"><input type="file" name="upfile"/></td>
	</tr>
</table>


<input type="hidden" name="boardno" value="${board.boardNo }" />
<input type="hidden" name="idx" value="${board.idx }" />

<a style="float:right"><button id="btnWrite" class="btn btn-primary" type="button">등록</button></a>
</form>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />