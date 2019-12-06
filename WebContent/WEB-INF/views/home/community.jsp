
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
    border-right: 0.1px solid #bcbcbc;
    min-height:580px;
}
div .right {
	width:50%;
	float: right;
    box-sizing: border-box;
    border-left: 0.1px solid #bcbcbc;
    min-height:580px;
}
div. sexyback{
	background-color: #242645;
	width:
	height:
}

table {
	width: 522px;
    margin-left: 13px;
    
     table-layout:fixed;  
}

td {
	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
}

</style>

<div class="container" style="width:1170px;">

<hr>
<h2 style="text-align:center"><strong>커뮤니티</strong></h2>
<hr>
<br>
<div class="text-center"><h2><strong>부동산과 관련된 여러 정보를 공유해주세요. &nbsp;<img src="/resources/img/thumb.png" width="40" height="40"></strong></h2></div>
<div class="text-center"><small style="color: #6E6E6E">회원 여러분의 소중한 정보는 저희 방캅스가 소중하게 보관하겠습니다.</small></div>
<br><br><br><br><br>
<div class="left" >





<div  id="left_top" style="witdh:100px;border:1px solid #bcbcbc;height:180px;margin-right:15px;padding:5px">
<div id=left_top_inner style="witdh:50px;height:168px">
<div onclick="location.href='/main/community/board?boardno=3'" style="cursor:pointer"><h4 style="margin-top: 10px"><Strong>&nbsp;공지사항</Strong></h4></div>
<hr style="margin-top:0px;margin-bottom:8px">
<div>
	<table>
	<c:forEach items="${ notice }" var="j">
		<tr>
			<td style="width:400px"><a href="/main/community/board/view?idx=${j.idx }">${j.title } <c:if test="${j.commentCnt ne 0 }">[${j.commentCnt }"]</c:if></a></td>
			<td style="float:right"><span style="float:right;"><font style="color:grey">${j.regDate }&nbsp;</font></span></td>
		<tr>	
	</c:forEach>
	</table>
</div>
</div>
</div><br>



<div  id="left_middle" style="witdh:100px;border:1px solid #bcbcbc;height:180px;margin-right:15px;padding:5px">
<div id=left_middle_inner style="witdh:50px;height:168px">
<div onclick="location.href='/main/community/board?boardno=1'" style="cursor:pointer"><h4 style="margin-top: 10px"><Strong>&nbsp;자유게시판</Strong></h4></div>
<hr style="margin-top:0px;margin-bottom:8px">
<div>
	<table>
	<c:forEach items="${ freeboard }" var="i">
		<tr>
			<td style="width:400px"><a href="/main/community/board/view?idx=${i.idx }">${i.title } <c:if test="${i.commentCnt ne 0 }">[${i.commentCnt }]</c:if></a></td>
			<td style="float:right"><span style="float:right;"><font style="color:grey">${i.usernick } |&nbsp;추천&nbsp;${i.reco }</font></span></td>
		<tr>
	</c:forEach>
	</table>
</div>
</div>
</div><br>



<div  id="left_bottom" style="witdh:100px;border:1px solid #bcbcbc;height:180px;margin-right:15px;padding:5px">
<div id=left_bottom_inner style="witdh:50px;height:168px">
<div onclick="location.href='/main/community/board?boardno=2'" style="cursor:pointer"><h4 style="margin-top: 10px"><Strong>&nbsp;이용후기게시판</Strong> </h4></div>
<hr style="margin-top:0px;margin-bottom:8px">
<div>
	<table>
	<c:forEach items="${ review }" var="k">
		<tr>
			<td style="width:400px"><a href="/main/community/board/view?idx=${k.idx }">${k.title } <c:if test="${k.commentCnt ne 0 }">[${k.commentCnt }]</c:if></a></td>
			<td style="float:right"><span style="float:right;"><font style="color:grey">${k.usernick } |&nbsp;추천&nbsp;${k.reco }</font></span></td>
		<tr>
	</c:forEach>
	</table>
</div>
</div>
</div>
</div>











<div class="right" style="padding-top:50px">
<div  id="right_center" style="margin:auto;width: 400px; height: 500px; border: 1px solid #bcbcbc;">
<div id="right_center_inner" style="witdh:50px;height:358px;cursor:pointer;padding-right:10px;padding-left:10px">
<br><h4><Strong>&nbsp; FAQ</Strong></h4>
<hr style="margin-top:10px;width:265px"><br>
방캅스에 대해 궁금한 사항을 먼저 확인할 수 있습니다.<br><br><br>
<a href="/main/community/board?boardno=5" style="float:right"><br>
<img src="/resources/img/click.png" width="20" height="20"><font size="2em"><Strong>FAQ 게시판 바로가기</Strong></font></a><br><br>
<br><hr style="margin-top:10px;width:265px;background:gray;height:1px">

<br><h4><Strong>&nbsp; 고객센터</Strong></h4>
<hr style="margin-top:10px;width:265px">
사이트 이용방법, 신고방법, 신고절차, 이의신청절차 등 방캅스 회원 여러분들의 궁금한 사항을 1:1대화로 해결해드립니다.<br>

<a href="/serviceCenterView" style="float:right"><font size="2em"><Strong><br><br><br>
<img src="/resources/img/click.png" width="20" height="20">상담하러 가기</Strong></font></a>
</div>

<div>
</div>
</div>
</div>

</div>


<br><br><br><br><br>



<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
