<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Bootstrap 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<jsp:include page="/WEB-INF/views/admin/adminheader.jsp" />

<!--그림 리스트로 보이는 화면, 검색시 유저에게 노출-->

<script type="text/javascript">
	var curPage = 1;
	var totalPage = "${paging.totalPage}";
	var loading = false;
</script>

<script type="text/javascript">
$(document).ready(function() {
	// 선택체크 삭제
	$("#btndelete").click(function() {
		// 선택된 체크박스
		var $checkboxes = $("input:checkbox[name='checkRow']:checked");

		var map = $checkboxes.map(function() {
			return $(this).val();
		});
		var names = map.get().join(",");
		
		// 전송 폼
		var $form = $("<form>")
			.attr("action", "/admin/memberlistdelete")
			.attr("method", "post")
			.append(
				$("<input>")
					.attr("type", "hidden")
					.attr("name", "names")
					.attr("value", names)
			);
		$(document.body).append($form);
		$form.submit();
	
	});
});
		
//전체 체크/해제
function checkAll() {
	// checkbox들
	var $checkboxes=$("input:checkbox[name='checkRow']");

	// checkAll 체크상태 (true:전체선택, false:전체해제)
	var check_status = $("#checkAll").is(":checked");
	
	if( check_status ) {
		// 전체 체크박스를 checked로 바꾸기
		$checkboxes.each(function() {
			this.checked = true;	
		});
	} else {
		// 전체 체크박스를 checked 해제하기
		$checkboxes.each(function() {
			this.checked = false;	
		});
	}
}
</script>

<style type="text/css">
div {contain list-conta
	
}

.list-container {
	text-align: center;
	width: 100%;
}
</style>
<div>
<div class="list-container">
	<br> <br> <br> <br>
	<h3>검색한 결과 ${gu }구의 신고된 허위매물 목록입니다.</h3>
</div>


<br>
<br>
<br>
<br>
<br>

<table class="table table-hover table-condensed table-striped">

<tr class="danger">
	<th>
		<input type="checkbox" id="checkAll" onclick="checkAll();" />
	</th>
	<th style="width: 12%">회원번호</th>
	<th style="width: 15%">아이디</th>
	<th style="width: 15%">닉네임</th>
	<th style="width: 10%">이름</th>
	<th style="width: 18%">전화번호</th>
	<th style="width: 10%">회원정보</th>
	<th style="width: 10%">회원글</th>
	<th style="width: 10%">회원삭제</th>
</tr>

<c:forEach items="${list }" var="al">
	<div class="floater">
		<div class="list-container">
			<div class="col-xs-4 col-md-2">
				<div class="thumbnail">
					<img src="/resources/img/logo.png" alt="허위매물정보">
					<!--       //로고부분 넣는 실제로 들어가야함 -->
					<div class="caption">


						<h6>신고사이트 : ${al.sitename }</h6>
						<h6>지역 : ${al.city }시 ${al.gu }구</h6>
						<h6>신고된 부동산 : ${al.property }</h6>
						<h6>중개사명 : ${al.agent }</h6>
						<h6>전화번호 : ${al.phoneNo }</h6>

						<a href="/aview?accuseno=${al.accuseno }" class="btn btn-primary" role="button">상세보기</a>

					</div>
				</div>
			</div>

		</div>
	</div>
</c:forEach>

</table>

<button id="btndelete" class="btn btn-warning pull-left">삭제</button>

<hr>
</div>
<p style="clear: both"> </p>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />