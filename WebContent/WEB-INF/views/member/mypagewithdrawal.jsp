<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/mypageheader.jsp" />

<script type="text/javascript">
	$(document).ready(function() {

		//탈퇴버튼 동작
		$("#btnOut").on("click",function() {
			 // 현재 비밀번호 입력
	        if($("#userpw").val() ==''){
	            alert('현재 비밀번호를 입력하세요');
	            $("#userpw").focus();
	            return false;
	        }
	     // 현재 비밀번호 일치 여부 확인
			 if($("#userpw").val() != "${usercurrpw }" ){
				 alert('현재 비밀번호가 일치하지 않습니다');
				 $("#userpw").focus();
		            return false;
			 }
			if(confirm("회원 탈퇴를 진행하시겠습니까?") == true){
			alert("회원탈퇴가 완료되었습니다");
				$("form").submit();	
			}
			else{
// 				history.go(-1);
				return;
			}

		});
		
		
		// 취소 버튼
		$("#btnCancel").click(function() {
			location.href = "/mypage/main";
		});
		
	});
</script>


<style>
#mypage_withdrawal{
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	margin-right: 730px;
	
}
#withdrawal_info{
	width: 80%;
	float : right;	
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;    
}

#btns{
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    margin-left: 220px;
}
#btnCancel{
	margin-left: 30px;
}
#container{
	text-align: center;
	justify-content: center;
}
#div_currpw{
	width : 40%;
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;
	margin-left: 30px;
}
</style>


<div id = "container">
<form name="user_withdrawal" action="/mypage/with" method="post" >
<div id = "mypage_withdrawal" >
	<h2>회원 탈퇴</h2>
</div>
<br>
<div id = "withdrawal_info">
<br><br>
	<p>
	탈퇴 안내<br><br>
	회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.<br>
	<br>
	사용하고 계신 계정은 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br>
	탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.<br>
	<br>
	탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.<br>
	서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>
	삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.<br><br>
	</p>
	
	<h4>회원탈퇴를 진행합니다.</h4>
	<br>
	<h5>비밀번호를 입력해 주세요</h5>
<div id = "div_currpw">
	<input type="password" class="form-control pwinput" id="userpw" name="userpw"  />
</div>

</div>
<br><br>
<br><br>
<br><br><br><hr>
<br><br><br><br><br><br><br><br><br><br><br>	<br>
</form>
<div id = "btns" class="text-center">
         <button type="submit" id="btnCancel" class="btn btn-danger">취소</button>
         <button type="submit" id="btnOut" class="btn btn-warning">회원 탈퇴</button>
</div>
</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />