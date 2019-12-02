<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3.3.2 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/views/admin/adminheader.jsp" />

<script type="text/javascript">
	$(document).ready( function() {
		//목록버튼 동작
		$("#btnList").click(function() {
			$(location).attr("href", "/admin/memberlist");
		});

		//삭제버튼 동작
		$("#btnDelete").click(function() {
			$(location).attr("href","/admin/boarddelete?boardno=${viewBuser.boardno}");
		});

	});
</script>

</head>
<body>
	<div class="container">

		<h1>회원게시글</h1>

		<hr>

		<table style="width: 1140">
			<tr style="height: 40">
				<th class="text-center" style="width: 5%">글번호</th>
				<th class="text-center" style="width: 15%">회원번호</th>
				<th class="text-center" style="width: 15%">회원아이디</th>
				<th class="text-center" style="width: 15%">제목</th>
				<th class="text-center" style="width: 25%">내용</th>
				<th class="text-center" style="width: 15%">작성날짜</th>
				<th class="text-center" style="width: 10%">회원삭제</th>
			</tr>
			<c:forEach items="${ list }" var="i">
				<tr style="text-align: center; height: 30">
					<td>${ i.idx }</td>
					<td>${ i.userNo }</td>
					<td>${ i.userid }</td>
					<td style="text-align: left"><a
						href="/main/community/board/view?idx=${ i.idx }">${ i.title }</a></td>
					<td>${ i.contents }</td>
					<td>${ i.regDate }</td>
					<td><a href="/admin/boarddelete?idx=${i.idx }"><button id="btnDelete">게시글 삭제</button></a></td>
				</tr>
			</c:forEach>
		</table>

	</div>
	<!-- .container -->

	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />