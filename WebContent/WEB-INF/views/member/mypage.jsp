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
	min-height : 200px;
	margin-right: 730px;
}

.container {
	width : 100%;
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
	<h2>나의 정보</h2>
</div>

<div class = "container">
<%-- <div id = "photo" style = "height:200px;width:140px:">
	<img src = "" alt = "사진을 등록해 주세요." width="98" height="98">

</div>--%>
<div id = "info_name"> 
	<label> 이름  </label>
	<label>${BUser.username } </label>

</div>
<br>
<div id = "info_nick">
	<label> 닉네임  </label>
	<label>${BUser.usernick } </label>
</div>
<br>
<div id = "info_info"> ※ 닉네임 미등록 시 회원 실명이 표시됩니다.</div>
</div>



























<jsp:include page="/WEB-INF/views/layout/footer.jsp" />