
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

<div class="container">


<h2 style="text-align:center"><strong>커뮤니티</strong></h2>
<hr>
<br><br><br>
<div class="text-center"><h2><strong>부동산과 관련된 여러 정보를 공유해주세요.</strong></h2></div><br>
<div class="text-center"><small style="color: #6E6E6E">회원 여러분의 소중한 정보는 저희 방캅스가 소중하게 보관하겠습니다.</small></div>
<br><br><br>
<div class="left" >



<div  id="left_top" style="witdh:100px;border:1px solid black;height:180px;margin-right:15px;padding:5px">
<div id=left_top_inner style="witdh:50px;height:168px">
<div onclick="location.href='/main/community/board?boardno=3'" style="cursor:pointer"><h2 style="margin-top: 10px"> &nbsp;공지사항</h2></div>
<hr style="margin-top:0px;margin-bottom:8px">
<div>
	<ol start="1">
	<c:forEach items="${ notice }" var="j">
		<li><a href="/main/community/board/view?idx=${j.idx }"><span style="text-overflow:ellipsis">${j.title } [${j.commentCnt }]</span></a><span style="float:right;">${j.regDate }&nbsp;</span></li>
	</c:forEach>
	</ol>
</div>
</div>
</div><br>



<div  id="left_middle" style="witdh:100px;border:1px solid black;height:180px;margin-right:15px;padding:5px">
<div id=left_middle_inner style="witdh:50px;height:168px">
<div onclick="location.href='/main/community/board?boardno=1'" style="cursor:pointer"><h2 style="margin-top: 10px"> &nbsp;자유게시판</h2></div>
<hr style="margin-top:0px;margin-bottom:8px">
<div>
	<ol start="1">
	<c:forEach items="${ freeboard }" var="i">
		<li><a href="/main/community/board/view?idx=${i.idx }">${i.title } [${ i.commentCnt}]</a><span style="float:right;text-overflow:ellipsis">${i.usernick } | 추천 ${i.reco }&nbsp;</span></li>
	</c:forEach>
	</ol>
</div>
</div>
</div><br>



<div  id="left_bottom" style="witdh:100px;border:1px solid black;height:180px;margin-right:15px;padding:5px">
<div id=left_bottom_inner style="witdh:50px;height:168px">
<div onclick="location.href='/main/community/board?boardno=2'" style="cursor:pointer"><h2 style="margin-top: 10px"> &nbsp;이용후기게시판</h2></div>
<hr style="margin-top:0px;margin-bottom:8px">
<div>
	<ol start="1">
	<c:forEach items="${ review }" var="k">
		<li><a href="/main/community/board/view?idx=${k.idx }">${k.title } [${ k.commentCnt}]</a><span style="float:right">${k.usernick } | 추천 ${k.reco }&nbsp;</span></li>
	</c:forEach>
	</ol>
</div>
</div>
</div>
</div>











<div class="right" style="padding-top:80px">
<div onclick="location.href='/main/community/board?boardno=5'" id="right_center" style="margin:auto;width: 300px; height: 400px; border: 1px solid black;border-radius:25px">
<div id="right_center_inner_top" style="witdh:50px;height:168px;cursor:pointer">
<h2>&nbsp; FAQ</h2>
<hr>
</div>
</div>
</div>

</div>






<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
