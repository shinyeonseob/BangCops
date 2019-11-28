<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- Bootstrap 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>    
    
<jsp:include page="/WEB-INF/views/admin/adminheader.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	//작성버튼 동작
	$("#btnUpdate").click(function() {

	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
});
</script>

<style type="text/css">
#content {
	width: 98%;
}
</style>

</head>
<body>
<div class="container">

<h3>게시글 쓰기</h3>
<hr>

		<div class="text-center">
			<form action="/admin/memberupdate" method="post">
				<input type="hidden" name="userno" value="${viewBuser.userno }" />


				<table class="table table-bordered">
					<tr>
						<td class="danger">회원번호</td>
						<td colspan="2">${viewBuser.userno }</td>
					</tr>

					<tr>
						<td class="danger">아이디</td>
						<td colspan="2"><input type="text" name="userid"
							style="width: 100%" value="${viewBuser.userid }" /></td>
					</tr>

					<tr>
						<td class="danger">닉네임</td>
						<td colspan="2"><input type="text" name="usernick"
							style="width: 100%" value="${viewBuser.usernick }" /></td>
					</tr>

					<tr>
						<td class="danger">이름</td>
						<td colspan="2"><input type="text" name="username"
							style="width: 100%" value="${viewBuser.username }" /></td>
					</tr>

					<tr>
						<td class="danger">전화번호</td>
						<td colspan="2"><input type="text" name="usertel"
							style="width: 100%" value="${viewBuser.usertel }" /></td>
					</tr>

				</table>

			<button type="submit" id="btnUpdate" class="btn btn-info">수정 적용</button>
			<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
			</form>
		</div>

</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />