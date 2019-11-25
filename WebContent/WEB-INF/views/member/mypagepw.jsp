<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/mypageheader.jsp" />

<style type = "text/css">
#mypage_pw{
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	margin-right: 730px;
}
#currpw{
	width : 40%;
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;
}
#updatepw{
	width : 40%;
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;
}
#updatepw_chk{
	width : 40%;
	
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;
}
.pwinput{
	width : 40%;
	float:right;
}


#container{
	text-align: center;
	justify-content: center;
}
</style>



<div id = "container">

<form name="updatepw" action="/mypage/pw" method="post" >
<div id = "mypage_pw" >
	<h2>비밀번호 변경</h2>
</div>
<br>
<br>
<hr>
<div id = "currpw">
	<label> 현재 비밀번호  </label>
	<input type="password" class="form-control pwinput" id="userpw" name="userpw"  />
</div>

<hr>
<div id = "updatepw">
	<label> 변경 비밀번호  </label>
	<input  type="password" class="form-control pwinput" id="updatepw" name="updatepw"  />
</div>
<hr>
<div id = "updatepw_chk">
	<label> 비밀번호 확인  </label>
	<input  type="password" class="form-control pwinput" id="updatepw_chk" name="updatepw_chk"  />
</div>

</div>
</div>
<hr>
</form>
<button class="btn btn-info"> 비밀번호 변경</button>

























<jsp:include page="/WEB-INF/views/layout/footer.jsp" />