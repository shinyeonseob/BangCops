<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->

<!-- </body> -->
<!-- </html> -->

<script type="text/javascript">

$(document).ready(function() {
	// 댓글 입력
	$("#btnCommInsert").click(function() {
// 		게시글 번호.... ${list.idx}
			console.log($("#commentWriter").val());
			console.log($("#commentContent").val());
		
		$form = $("<form>").attr({
			action: "/comment/insert",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"idx",
				value:"${list.idx }"
			})
		).append(
			$("<input>").attr({
				type:"hidden",
				name:"userno",
				value:"${sessionScope.Userno }"
			})
		).append(
			$("<textarea>")
				.attr("name", "contents")
				.css("display", "none")
				.text($("#commentContent").val())
		);
		$(document.body).append($form);
		$form.submit();
		
	});
	
});
//댓글 삭제
function deleteComment(commentno) {
	$.ajax({
		type: "post"
		, url: "/comment/delete"
		, dataType: "json"
		, data: {
			commentno: commentno
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-commentno='"+commentno+"']").remove();
				
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
	

}


	//추천
	if(${isRecommend}) {
		$("#btnRecommend")
			.addClass("btn-warning")
			.html('추천취소');
		
	} else {
		$("#btnRecommend")
			.addClass("btn-primary")
			.html('추천하기');
	}
	
	$("#btnRecommend").click(function() {
		
		$.ajax({
			type: "get"
			, url: "/main/community/board/recommend"
			, data: { "idx": '${list.idx }' }
			, dataType: "json"
			, success: function( data ) {
// 				console.log("성공");
// 				console.log(data);

				if( data.result ) { //추천 성공
					$("#btnRecommend")
					.removeClass("btn-primary")
					.addClass("btn-warning")
					.html('추천취소');
				
				} else { //추천 취소 성공
					$("#btnRecommend")
					.removeClass("btn-warning")
					.addClass("btn-primary")
					.html('추천하기!');
				
				}
				
				//추천수 적용
				$("#recommend").html(data.cnt);
				
			}
			, error: function() {
				console.log("실패");
				
			}
		});
		
	});


</script>

<style type="text/css">
th {
	padding: 10px;
	/* 	border:1px solid black; */
	text-align: center;
}
</style>
<script type="text/javascript">
function warning() {
	alert("게시글을 삭제합니다..");
}
</script>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<br>
<table
	style="margin: 0 auto; width: 1200; height: 50; table-layout: fixed">
	
</table>

<div class="container">
	
	<hr style="background: grey; height: 2px">
	<table style="width: 1140">
		<tr>
			<th colspan="2"><h3>${list.title }</h3></th>
		</tr>
		<tr>
			<td><p>${list.usernick }
					|
					<fmt:formatDate value="${list.regDate }"
						pattern="yy-MM-dd hh:mm:ss" />
				<p></td>
			<td style="text-align: right;">조회 ${list.hits } | 추천</td>
			<td id="recommend"
				style="text-align: center; padding-top: 3px; width: 22px;">
				${reco }</td>
		</tr>
	</table>
	<hr>
	<br>
	<table style="width: 1140">
		<tr>
			<td colspan="2" style="text-align: left"><div>신고사이트 : ${accuse.sitename }</div>
				<div >신고된 URL : ${accuse.url }</div>
				<div>지역 : ${accuse.city }시 ${accuse.gu}구</div>
				<div>가격 : 보증금 : ${bDeal.deposit } 월세 :
					${bDeal.price}</div>
				<div>신고된 부동산 : ${accuse.property }</div>
				<div>중개사명 : ${accuse.agent }</div>
				<div>전화번호 : ${accuse.phoneNo }<hr></div></td>
				
		</tr>
		<tr>
			<td colspan="2" style="text-align: left"><div
					style="min-height: 400">${list.contents }</div></td>
		</tr>
		<tr>
			<td colspan="2">
				<div>
					<div class="center"
						style="height: 150; padding-right: 400px; padding-left: 400px; padding-top: 60px; text-align: center">
						게시글이 마음에 드신다면?
						<button class="btn" id="btnRecommend">추천하기!</button>
					</div>
				</div>
			</td>
		</tr>
		<tr style="border: 1px solid black; height: 50">
			<th style="width: 10">첨부<br>파일
			</th>
			<td style="width: 90" class="info"><a
				href="/upload/${bAttached.storedName}">${bAttached.originName }</a></td>
		</tr>
	</table>
	<br> <a href="/main/community/board?boardno=${list.boardNo }"><button>목록보기</button></a>
	<%-- ${session.Userno } | ${list.userNo } --%>
	<c:if test="${Userno eq list.userNo}">
		<a style="float: right"
			href="/main/community/board/update?idx=${list.idx }&boardno=${list.boardNo}"><button>수정하기</button></a>
		<a style="float: right"
			href="/main/community/board/delete?idx=${list.idx }&boardno=${list.boardNo}"
			onclick="warning();"><button>삭제하기</button></a>
		<a style="float: right"><button>댓글작성</button></a>
	</c:if>
	<c:if test="${Userno ne list.userNo || empty login }">
		<a style="float: right"><button>댓글작성</button></a>
	</c:if>





	<!-- 댓글 처리 -->
	<div>
		<div id="commentbody"></div>
		<%-- 댓글입력 시 이동 위치 --%>
		<hr>

		<!-- 비로그인상태 -->
		<c:if test="${not login }">
			<strong>로그인이 필요합니다</strong>
			<br>
			<button onclick='location.href="/main";'>로그인</button>
			<button onclick='location.href="/member/join";'>회원가입</button>
		</c:if>

		<!-- 로그인상태 -->
		<c:if test="${login }">
			<!-- 댓글 입력 -->
			<div class="form-inline text-center">
				<input type="text" size="10" class="form-control" id="commentWriter"
					value="${Userno }" readonly="readonly" />
				<textarea rows="2" cols="60" class="form-control"
					id="commentContent"></textarea>
				<button id="btnCommInsert" class="btn">입력</button>
			</div>
			<!-- 댓글 입력 end -->
		</c:if>
		<!-- 댓글 리스트 -->
		<table class="table table-striped table-hover table-condensed">
			<thead>
				<tr>
					<th style="width: 5%;">번호</th>
					<th style="width: 10%;">작성자</th>
					<th style="width: 50%;">댓글</th>
					<th style="width: 20%;">작성일</th>
					<th style="width: 5%;"></th>
				</tr>
			</thead>
			<tbody id="commentBody">
				<c:forEach items="${commentList }" var="comment">
					<tr data-commentno="${comment.commentno }">
						<td>${comment.rnum }</td>
						<td>${comment.usernick }</td>
						<!-- 닉네임으로 해도 좋음 -->
						<td>${comment.contents }</td>
						<td><fmt:formatDate value="${comment.regDate }"
								pattern="yy-MM-dd hh:mm:ss" /></td>
						<td><c:if test="${sessionScope.Userno eq comment.userno }">
								<button class="btn btn-default btn-xs"
									onclick="deleteComment(${comment.commentno });">삭제</button>
							</c:if></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 댓글 리스트 end -->

	</div>
	<!-- 댓글 처리 end -->




</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />