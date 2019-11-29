<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	//검색 버틀 클릭
	$("#btnSearch").click(function() {
		location.href="/board/list?search="+$("#search").val();
	});
	
});
</script>	


<script type="text/javascript">
$(document).ready(function() {
	// 선택체크 삭제
	$("#btnDelete").click(function() {
		// 선택된 체크박스
		var $checkboxes = $("input:checkbox[name='checkRow']:checked");
		
		// 체크된 대상들을 map으로 만들고 map을 문자열로 만들기
		var map = $checkboxes.map(function() {
			return $(this).val();
		});
		var names = map.get().join(",");	
		
		
		// 전송 폼
		var $form = $("<form>")
			.attr("action", "/board/listDelete")
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
table, th {
	text-align: center;
}

tr td:nth-child(2) {
	text-align: left;
}

tr td:not(:first-child), tr th:not(:first-child) {
	border-left: 1px solid white;
}

</style>



<div class="container">

<h1>신고게시판 목록</h1>
<hr>

<table class="table table-hover table-condensed table-striped">
<tr class="info">
	<th>
		<input type="checkbox" id="checkAll" onclick="checkAll();" />
	</th>
	<th style="width: 10%">글번호</th>
	<th style="width: 15%">부동산이름</th>
	<th style="width: 15%">중개인이름</th>
	<th style="width: 15%">전화번호</th>
	<th style="width: 10%">지역</th>
	<th style="width: 15%">아이디</th>
	<th style="width: 20%">신고일</th>
</tr>

<c:forEach items="${viewABoard }" var="Aboard">
<tr>
	<td><input type="checkbox" name="checkRow" value="${Aboard.Aboardno }" /></td>
	<td>${Aboard.Aboardno }</td>
	<td><a href="/board/view?boardno=${Aboard.Aboardno }">${Aboard.Property }</a></td>
	<td>${Aboard.Agent }</td>
	<td>${Aboard.PhoneNo }</td>
	<td>${Aboard.City } 시 ${Aboard.Gu } 구 </td>
	<td>${Aboard.id }</td>
	<td>${Aboard.RegDate }</td>
	<td><fmt:formatDate value="${Aboard.writtendate }" pattern="yyyy-MM-dd"/></td>
</tr>
</c:forEach>

</table> 

<button id="btnDelete" class="btn btn-warning pull-left">삭제</button>
<div class="clearfix"></div>

<jsp:include page="/WEB-INF/views/layout/paging.jsp" />

<div class="form-inline text-center">
	<input class="form-control" type="text" id="search" />
	<button id="btnSearch" class="btn">검색</button>
</div>

</div><!-- .container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
