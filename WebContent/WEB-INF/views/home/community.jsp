
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">


div .left {
	width:50%;
	float: left;
    box-sizing: border-box;
    border-right: 1px solid #bcbcbc;
    min-height:580px;
}
div .right {
	width:50%;
	float: right;
    box-sizing: border-box;
    border-left: 1px solid #bcbcbc;
    min-height:580px;
}

#commini {
	width: 522px;
    margin-left: 13px;
    

    
 table-layout:fixed;

/* 	overflow:hidden; */
/* 	white-space:nowrap; */
/* 	text-overflow:ellipsis; */
}

#commini_td {
	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
}

</style>

<div class="container">


<h2 style="text-align:center"><strong>커뮤니티</strong></h2>
<hr>
<br><br><br>
<div class="text-center"><h2><strong>부동산과 관련된 여러 정보를 공유해주세요.</strong></h2></div><br>
<div class="text-center"><small style="color: #6E6E6E">회원 여러분의 소중한 정보는 저희 방캅스가 소중하게 보관하겠습니다.</small></div>
<br><br><br>
<div class="left" >



<div  id="left_top" style="witdh:100px;border:1px solid #bcbcbc;height:180px;margin-right:15px;padding:5px">
<div id=left_top_inner style="witdh:50px;height:168px">
<div onclick="location.href='/main/community/board?boardno=3'" style="cursor:pointer"><h2 style="margin-top: 10px"> &nbsp;공지사항</h2></div>
<hr style="margin-top:0px;margin-bottom:8px">
<div>
	<table id="commini">
	<c:forEach items="${ notice }" var="j">
		<tr>
			<td id="commini_td" style="width:400px"><a href="/main/community/board/view?idx=${j.idx }">${j.title } <c:if test="${j.commentCnt ne 0 }">[${j.commentCnt }"]</c:if></a></td>
			<td id="commini_td" style="float:right"><span style="float:right;"><font style="color:grey">${j.regDate }&nbsp;</font></span></td>
		<tr>
	</c:forEach>
	</table>
</div>
</div>
</div><br>



<div  id="left_middle" style="witdh:100px;border:1px solid #bcbcbc;height:180px;margin-right:15px;padding:5px">
<div id=left_middle_inner style="witdh:50px;height:168px">
<div onclick="location.href='/main/community/board?boardno=1'" style="cursor:pointer"><h2 style="margin-top: 10px"> &nbsp;자유게시판</h2></div>
<hr style="margin-top:0px;margin-bottom:8px">
<div>
	<table id="commini">
	<c:forEach items="${ freeboard }" var="i">
		<tr>
			<td id="commini_td" style="width:400px"><a href="/main/community/board/view?idx=${i.idx }">${i.title } <c:if test="${i.commentCnt ne 0 }">[${i.commentCnt }]</c:if></a></td>
			<td id="commini_td" style="float:right"><span style="float:right;"><font style="color:grey">${i.usernick } |&nbsp;추천&nbsp;${i.reco }</font></span></td>
		<tr>
	</c:forEach>
	</table>
</div>
</div>
</div><br>



<div  id="left_bottom" style="witdh:100px;border:1px solid #bcbcbc;height:180px;margin-right:15px;padding:5px">
<div id=left_bottom_inner style="witdh:50px;height:168px">
<div onclick="location.href='/main/community/board?boardno=2'" style="cursor:pointer"><h2 style="margin-top: 10px"> &nbsp;이용후기게시판</h2></div>
<hr style="margin-top:0px;margin-bottom:8px">
<div>
	<table id="commini">
	<c:forEach items="${ review }" var="k">
		<tr>
			<td id="commini_td" style="width:400px"><a href="/main/community/board/view?idx=${k.idx }">${k.title } <c:if test="${k.commentCnt ne 0 }">[${k.commentCnt }]</c:if></a></td>
			<td id="commini_td" style="float:right"><span style="float:right;"><font style="color:grey">${k.usernick } |&nbsp;추천&nbsp;${k.reco }</font></span></td>
		<tr>
	</c:forEach>
	</table>
</div>
</div>
</div>
</div>











<div class="right" style="padding-top:80px">
<div  id="right_center" style="margin:auto;width: 300px; height: 400px; border: 1px solid #bcbcbc;border-radius:25px">
<div id="right_center_inner" style="witdh:50px;height:358px;cursor:pointer;padding-right:10px;padding-left:10px">
<h2>&nbsp; FAQ</h2>
<hr style="margin-top:10px;width:265px">
빠르게 궁금한 점을 해결할 수 있는 자주 묻는 질문 게시판입니다.<br>
<a href="/main/community/board?boardno=5" style="float:right"><font size="4em">FAQ 게시판 바로가기 >></font></a>
<hr style="margin-top:10px;width:265px;background:grey;height:2px">

<h2>&nbsp; 고객센터</h2>
<hr style="margin-top:10px;width:265px">
사이트 이용방법, 신고방법, 신고절차, 이의신청절차 등 방캅스 회원 여러분들의 궁금한 사항을 1:1대화로 해결해드립니다.<br>
<font size="3em"  style="font-weight: bold">상담 가능 시간<br>
오전 09:00시 ~ 오후 06:00시</font>
<a href="/serviceCenterView" style="float:right"><font size="4em">상담하러 가기 >></font></a>
</div>

<div>
</div>
</div>
</div>

</div>






<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
