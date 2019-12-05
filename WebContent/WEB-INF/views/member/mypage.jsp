<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/mypageheader.jsp" />

<style>
#mypage_info{
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	min-height : 100px;
	margin-right: 730px;
	font-family: 'NIXGONB-Vb';
}

.container {
	width : 1400px;
    display: block;
    text-align: center;
	justify-content: center;
	align-items: stretch;
	
}

#photo{
	width: 20%;
    float : left;
}
#info_name{
	width: 80%;
 	float : right;
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;
}
#info_nick{
	width: 80%;
	float : right;	
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;    
}
#info_info{
	width: 80%;
	float : right;
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;
}



</style>
<script type = "java/script">

</script>


<div id = "mypage_info" >
	<h2  style="font-family: 'NIXGONB-Vb';">나의 정보</h2>
</div>

<div class = "container">
<%-- <div id = "photo" style = "height:200px;width:140px:">
	<img src = "" alt = "사진을 등록해 주세요." width="98" height="98">

</div>--%>
<div id = "info_name"> 
	<label style="font-family: 'NIXGONB-Vb';font-size: 20px;color: black"> 이름  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-family: 'NIXGONB-Vb';font-size: 20px;color: black"><strong>${BUser.username }</strong></label>

</div>
<br>
<div id = "info_nick">
	<label style="font-family: 'NIXGONB-Vb';font-size: 20px;color: black"> 닉네임  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-family: 'NIXGONB-Vb';font-size: 20px;color: black"><strong>${BUser.usernick }</strong> </label>
</div>
<br>
<div id = "info_info"><span  style="font-family: 'NIXGONB-Vb';font-size: 15px;color: #bcbcbc">
 ※ 닉네임 미등록 시 회원 실명이 표시됩니다.</span></div>
</div>



























<jsp:include page="/WEB-INF/views/layout/footer.jsp" />