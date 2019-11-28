<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">


div .left {
	width:50%;
	float: left;
    box-sizing: border-box;
    border-right: 1px solid #000;
    min-height:580px;
}
div .right {
	width:50%;
	float: right;
    box-sizing: border-box;
    border-left: 1px solid #000;
    min-height:580px;
}

</style>

<hr style="background:black;height:2px">
<div class="container">


<h1>커뮤니티</h1>
<hr>
<br><br><br>
<div class="text-center"><h2><strong>부동산과 관련된 여러 정보를 공유해주세요.</strong></h2></div><br>
<div class="text-center"><small>회원 여러분의 소중한 정보는 저희 방캅스가 소중하게 보관하겠습니다.</small></div>
<br><br><br><br>
<div class="left" >
<div id=left_top style="witdh:100px;border:1px solid black;height:180px;margin-right:15px;padding:5px">
<div id=left_top_inner style="witdh:50px;height:168px;border:1px solid black">
<h2>공지사항</h2>
<hr>
</div>
</div><br>
<div onclick="location.href='/main/community/boardlist?boardno=1'" id="left_middle" style="witdh:100px;border:1px solid black;height:180px;margin-right:15px;padding:5px">
<div id=left_middle_inner style="witdh:50px;height:168px;border:1px solid black;cursor:pointer">
<h2>자유게시판</h2>
<hr>
</div>
</div><br>
<div id="left_bottom" style="witdh:100px;border:1px solid black;height:180px;margin-right:15px;padding:5px">
<div id=left_bottom_inner style="witdh:50px;height:168px;border:1px solid black">
<h2>이용후기게시판</h2>
<hr>
</div>
</div>
</div>

<div class="right" style="padding-top:80px">
<div id="right_center" style="margin:auto;width: 300px; height: 400px; border: 1px solid black;"></div>
</div>

</div>






<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
