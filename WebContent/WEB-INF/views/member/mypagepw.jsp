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

<style type = "text/css">
#mypage_pw{
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	margin-right: 730px;
}
#div_currpw{
	width : 40%;
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;
	margin-left: 300px;
}
#div_updatepw{
	width : 40%;
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;
    margin-left: 300px;
}
#div_updatepw_chk{
	width : 40%;
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;
    margin-left: 300px;
}
.pwinput{
	width : 40%;
	float:right;
	margin-right: 200px;
}


#container{
	text-align: center;
	justify-content: center;
	
}

#btn_updatepw {
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    margin-left: 300px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	//작성버튼 동작
	$("#btn_updatepw").click(function() {
		
		//스마트에디터의 내용으로 <textarea>에 적용시키기
		submitContents($("#btn_updatepw"));
		
		//form submit 수행
		$("form").submit();
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
             $("#submit").attr("disabled", "disabled");
          }
       }
    });
 });
</script>

<div id = "container">

<form name="updatepw" action="/mypage/pw" method="post" >
<input type="hidden" name="userno" value="${buser.userno }" />
<div id = "mypage_pw" >
	<h2>비밀번호 변경</h2>
</div>
<br>
<br>
<hr>
<div id = "div_currpw">
	<label> 현재 비밀번호  </label>
	<input type="password" class="form-control pwinput" id="userpw" name="userpw"  />
</div>

<hr>
<div id = "div_updatepw">
	<label> 변경 비밀번호  </label>
	<input  type="password" class="form-control pwinput" id="updatepw" name="updatepw"  />
</div>
<hr>
<div id = "div_updatepw_chk">
	<label> 비밀번호 확인  </label>
	<input  type="password" class="form-control pwinput" id="updatepw_chk" name="updatepw_chk"  />
	         <div class="alert alert-success" id="alert-success">비밀번호가
            일치합니다.</div>
         <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
            않습니다.</div>
</div>

</div>
</div>
<hr>
<button type = "submit" id = "btn_updatepw" class="btn btn-info"> 비밀번호 변경</button>
</form>

























<jsp:include page="/WEB-INF/views/layout/footer.jsp" />