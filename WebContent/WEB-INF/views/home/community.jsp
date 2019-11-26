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
<div class="left" >
<div id=left_top style="witdh:100px;border:1px solid black;height:180px;margin-right:15px;padding:5px">
<div id=left_top_inner style="witdh:50px;height:168px;border:1px solid black">
<h2>공지사항</h2>
<hr>
</div>
</div><br>
<div onclick="location.href='/main/community/freeboardlist'" id="left_middle" style="witdh:100px;border:1px solid black;height:180px;margin-right:15px;padding:5px">
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
