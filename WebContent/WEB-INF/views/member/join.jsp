<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
#joinform {
	justify-content: center;
}

.container {
	display: flex;
	justify-content: center;
	align-items: stretch;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#UserPW").val();
			var pwd2 = $("#UserPWck").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
</script>

<div class="container">


	<form id="joinform" class="form-horizontal"
		action="<%=response.encodeUrl("/member/join")%>" method="post">
		<div class="form-group">
			<label for="UserID" class="col-sm-2 control-label">Email</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" name="UserID" id="UserID"
					placeholder="email" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="pw" class="col-sm-2 control-label">Password</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" name="UserPW"
					id="UserPW" placeholder="password" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="pw" class="col-sm-2 control-label">PasswordCK</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" name="UserPWck"
					id="UserPWck" placeholder="password" required="required"><br>
				<div class="alert alert-success" id="alert-success">비밀번호가
					일치합니다.</div>
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
					않습니다.</div>
			</div>
		</div>
		<div class="form-group">
			<label for="Nick" class="col-sm-2 control-label">닉네임</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="UserNick"
					id="UserNick" placeholder="Nick" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="UserName" class="col-sm-2 control-label">이름</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="UserName"
					id="UserName" placeholder="UserName" required="required">
			</div>
		</div>
		<div class="form-group">
			<label for="UserTel" class="col-sm-2 control-label">전화번호</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" name="UserTel" id="UserTel"
					placeholder="UserTel" required="required">
					<button disabled="disabled">인증번호받기</button>
			</div>
			
			<div class="col-sm-10">
				<input type="text" class="form-control" name="UserTelck" id="UserTelck"
					placeholder="전화번호 인증" required="required">
					<button disabled="disabled">인증번호 확인</button>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">확인</button>
			</div>
		</div>
	</form>

</div>



<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
