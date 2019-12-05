<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<br><br><br><br>
<div class="text-center">
<h3><Strong>로그인 실패</Strong></h3><br><br>
<p>아이디가 존재하지 않거나 비밀번호가 올바르지 않습니다</p>
<br><br>

<c:if test="${sessionScope.login eq null }">
<a href="#myModal" class="trigger-btn" data-toggle="modal">
<button id = "btn_login" class = "btn_login btn btn-primary" on >로그인</button></a>
</c:if>
<br><br>
</div>

<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">
					<div class="avatar">
						<img src="/resources/img/logo.png" alt="Avatar">
					</div>
					<h4 class="modal-title">Member Login</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="/member/login" method="post">
						<div class="form-group">
							<input type="email" class="form-control" name="UserID"
								placeholder="UserEmail" required="required">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" name="UserPW"
								placeholder="Password" required="required">
						</div>
						<div class="form-group">
							<button type="submit"
								class="btn btn-primary btn-lg btn-block login-btn">Login</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<a href="/member/find" target="_blank">비밀번호를 잊으셨나요</a>
				</div>
			</div>
		</div>
	</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />