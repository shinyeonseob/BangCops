<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/mypageheader.jsp" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
#mypage_pw {
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	margin-right: 730px;
}

#div_currpw {
	width: 40%;
	height: 50px;
	color: #1C5B8C;
	font-family: dotum;
	line-height: 150%;
	text-align: left;
	margin-left: 300px;
}

#div_updatepw {
	width: 40%;
	height: 50px;
	color: #1C5B8C;
	font-family: dotum;
	line-height: 150%;
	text-align: left;
	margin-left: 300px;
}

#div_updatepw_chk {
	width: 40%;
	height: 50px;
	color: #1C5B8C;
	font-family: dotum;
	line-height: 150%;
	text-align: left;
	margin-left: 300px;
}



#container {
	text-align: center;
	justify-content: center;
}

#btn_updatepw {
	color: #1C5B8C;
	font-family: dotum;
	line-height: 150%;
	margin-left: 300px;
}

#check_info {
    width: 35.7%;
    float: right;
    text-align: center;
    margin-right: 265px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		//작성버튼 동작 ${usercurrpw }
		$("#btn_updatepw").click(function() {
			// 현재 비밀번호 입력
			if ($("#userpw").val() == '') {
				alert('현재 비밀번호를 입력하세요');
				$("#userpw").focus();
				return false;
			}
			// 현재 비밀번호 일치 여부 확인
			if ($("#userpw").val() != "${usercurrpw }") {
				alert('현재 비밀번호가 일치하지 않습니다');
				$("#userpw").focus();
				return false;
			}

			// 변경할 비밀번호 입력
			if ($("#updatepw").val() == '') {
				alert('변경할 비밀번호를 입력하세요');
				$("#updatepw").focus();
				return false;
			}
			// 비밀번호 확인
			if ($("#updatepw_chk").val() == '') {
				alert('비밀번호를 다시 한번 더 입력하세요');
				$("#update_chk").focus();
				return false;
			}
			if ($("#updatepw").val() != $("#updatepw_chk").val()) {
				alert('변경 비밀번호가 일치하지 않습니다');
				$("#update_chk").focus();
				return false;
			}

			else {
				//form submit 수행
				$("form").submit();

			}
			// 취소 버튼

		});
		$("#btnCancel").click(function() {
			location.href = "/mypage/main";
		});

	});
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var pwd1 = $("#updatepw").val();
			var pwd2 = $("#updatepw_chk").val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled")
					return false;
				}
			}
		});
	});
</script>
<div id="mypage_pw">
	<h2>비밀번호 변경</h2>
</div>

<div class="container list-container">

	<form name="updatepw" action="/mypage/pw" method="post">
		<input type="hidden" name="userno" value="${buser.userno }" /> <br>
		<br>
		<div class="row">
			<br>
			<div class="col-lg-2"></div>
			<div class="col-md-8">
				<hr>
			</div>
			<br>
			<div class="col-lg-2"></div>
		</div>
		
		<div id="div_currpw" class="form-group">
			<label for="userpw" class="col-lg-4 control-label"> 현재 비밀번호 </label>
			
			<div class="col-lg-8">
				<input type="password" class="form-control" id="userpw"
					name="userpw" />
			</div>

		</div>

		<div class="row">
			<br>
			<div class="col-lg-2"></div>
			<div class="col-md-8">
				<hr>
			</div>
			<br>
			<div class="col-lg-2"></div>
		</div>

		<div id="div_updatepw" class="row">
			
				<label class="col-lg-4 control-label"> 변경 비밀번호 </label>
			
			<div class="col-md-8">
				<input type="password" class="form-control" id="updatepw"
					name="updatepw" />
			</div>

		</div>

		<div class="row">
			<br>
			<div class="col-lg-2"></div>
			<div class="col-md-8">
				<hr>
			</div>
			<br>
			<div class="col-lg-2"></div>
		</div>

		<div id="div_updatepw_chk" class="row">

				<label class="col-lg-4 control-label"> 비밀번호 확인 </label>
		
			<div class="col-md-8">
				<input type="password" class="form-control"
					id="updatepw_chk" name="updatepw_chk" />
			</div>
		</div>
		<div id="check_info" class="row " >
			
			<div class="alert alert-success col-lg-8" id="alert-success">비밀번호가 일치합니다.</div>
			<div class="alert alert-danger col-lg-8" id="alert-danger">비밀번호가 일치하지 않습니다.</div>

		</div>
		<div class="row">
			<br><br><br><br>
			<div class="col-lg-2"></div>
			<div class="col-md-8">
				<hr>
			</div>
			<br>
			<div class="col-lg-2"></div>
		</div>

		<button type="submit" id="btn_updatepw" class="btn btn-info">
			비밀번호 변경</button>
		<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
	</form>
</div>



























<jsp:include page="/WEB-INF/views/layout/footer.jsp" />