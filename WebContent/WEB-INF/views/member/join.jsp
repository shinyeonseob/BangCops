<!DOCTYPE html>
<html lang="ko-KR">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<title>BangCops</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
   body{
      color: #fff;
      background: #63738a;
      font-family: 'Roboto', sans-serif;
   }
    .form-control{
      width: 290px;
      height: 40px;
      box-shadow: none;
      color: #969fa4;
   }
   .form-control:focus{
      border-color: #5cb85c;
   }
    .form-control, .btn{        
        border-radius: 3px;
    }
   .signup-form{
      width: 400px;
      margin: 0 auto;
      padding: 30px 0;
   }
   .signup-form h2{
      color: #636363;
        margin: 0 0 15px;
      position: relative;
      text-align: center;
    }
   .signup-form h2:before, .signup-form h2:after{
      content: "";
      height: 2px;
      width: 30%;
      background: #d4d4d4;
      position: absolute;
      top: 50%;
      z-index: 2;
   }   
   .signup-form h2:before{
      left: 0;
   }
   .signup-form h2:after{
      right: 0;
   }
    .signup-form .hint-text{
      color: #999;
      margin-bottom: 30px;
      text-align: center;
   }
    .signup-form form{
      color: #999;
      border-radius: 3px;
       margin-bottom: 15px;
        background: #f2f3f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
   .signup-form .form-group{
      margin-bottom: 20px;
   }
   .signup-form input[type="checkbox"]{
      margin-top: 3px;
   }
   .signup-form .btn{        
        font-size: 16px;
        font-weight: bold;      
      min-width: 140px;
        outline: none !important;
    }
   .signup-form .row div:first-child{
      padding-right: 10px;
   }
   .signup-form .row div:last-child{
      padding-left: 10px;
   }       
    .signup-form a{
      color: #fff;
      text-decoration: underline;
   }
    .signup-form a:hover{
      text-decoration: none;
   }
   .signup-form form a{
      color: #5cb85c;
      text-decoration: none;
   }   
   .signup-form form a:hover{
      text-decoration: underline;
   }
   
   #pwcheck {
      display: inline;
   }
   
   #numcheck {
      display: inline;
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
</head>
<body>
<div class="signup-form">
    <form action="/member/join" method="post">
      <h2>회원가입</h2>
      <div class="form-group">
         <input type="text" class="form-control" name="nickname" placeholder="닉네임을 입력해주세요" required="required">
      </div> 
      <div class="form-group">
         <input type="text" class="form-control" name="name" placeholder="이름(실명)을 입력해주세요" required="required">
      </div>           
        <div class="form-group">
           <input type="email" class="form-control" name="email" placeholder="이메일주소를 입력해주세요" required="required">
        </div>
      <div class="form-group">
            <input type="password" class="form-control" name="password"
             placeholder="4자리이상 비밀번호 입력(특수문자/한/영 제외)" required="required">
        </div>
      <div class="form-group">
            <input id="pwcheck" type="password" class="form-control" name="confirm_password" placeholder="비밀번호 확인" required="required">
            
         </div>
         				<div class="alert alert-success" id="alert-success">비밀번호가
					일치합니다.</div>
				<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
					않습니다.</div>
         <div class="form-group">
            <label for="Phone">연락처</label>
            <select>
               <option value="010">010
               <option value="011">011
               <option value="016">016
               <option value="019">019
            </select> - <input type="text" size='4' /> - <input type="text" size='4' />
         </div>
         <div class="form-group">
         <input id="numcheck"type="text" class="form-control" name="Certification" placeholder="인증번호 입력" required="required">
         <button>확인</button>
      </div>  
        <div class="form-group">
         <label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a></label>
      </div>
      
      <div class="form-group">
            <button type="submit" class="btn btn-success btn-lg btn-block">회원가입 완료</button>
        </div>
    </form>
   <div class="text-center">Already have an account? <a href="#">Sign in</a></div>
</div>
</body>
</html>

