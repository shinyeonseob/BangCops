<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
   $(function() {
      $("#alert-success").hide();
      $("#alert-danger").hide();
      $("input").keyup(function() {
         var pwd1 = $("#numcheck2").val();
         var pwd2 = $("#numcheck").val();
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

</head>
<body>

<form action="<%= response.encodeUrl("/member/join") %>" method="post">
<input type="hidden" name="UserID" value="${bUser.userid }" />
<input type="hidden" name="UserPW" value="${bUser.userpw }" />
<input type="hidden" name="UserNick" value="${bUser.usernick }" />
<input type="hidden" name="UserName" value="${bUser.username }" />
<input type="hidden" name="UserTel" value="${bUser.usertel }" />

<div class="form-group">

<p> 입력한 이메일로 보내진 인증번호를 입력하세요</p> 

<input id="numcheck2" type="hidden" class="form-control" name="numcheck2" value="${ranno }" >
<input id="numcheck" type="text" class="form-control" name="Certification" placeholder="인증번호 입력" required="required">

<div class="alert alert-success" id="alert-success"> 인증번호가 일치합니다. <button>확인</button></div>
<div class="alert alert-danger" id="alert-danger">인증번호가 일치하지 않습니다.</div>
</form>

</div>

</body>
</html>