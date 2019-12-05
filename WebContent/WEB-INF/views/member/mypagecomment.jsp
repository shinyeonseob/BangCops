<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
	
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/layout/mypageheader.jsp" />

<style type = "text/css">
table, th{
	text-align: center;
}

/* 두번째자식(내용)은 왼쪽정렬 */
tr td:nth-child(2){
	text-align: left;
}
/* 첫번째자식이 아닌 tr td에 세로 선 입력 */
tr td:not(:first-child), tr th:not(:first-child){
	border-left : 3px solid white;
}

#mypage_comment{
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	margin-right: 730px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	// 선택체크 삭제
	$("#btnChkDelete").click(function() {
		if(confirm("댓글을 삭제하시겠습니까?") == true){
			alert("댓글이 삭제되었습니다");
			// 선택된 체크박스
			var $checkboxes = $("input:checkbox[name='checkRow']:checked");
			
				
			
			//방법1
			// 체크된 대상들을 하나씩 꺼내서 문자열로 합치기
		//		var names = "";
		//		var len = $checkboxes.length;
		//		$checkboxes.each( function(idx) {
		//			names += $(this).val();
				
		//			if( len-1 != idx ) {
		//				names += ",";
		//			}
		//		});
		//		console.log(names);
		
		
		
			//방법2
			// 체크된 대상들을 map으로 만들고 map을 문자열로 만들기
			var map = $checkboxes.map(function() {
				return $(this).val();
			});
			var names = map.get().join(",");
		//		console.log("names : " + names);
		
		//		console.log($checkboxes);
		//		console.log( "map:" + map );	// 맵
		//		console.log( "map->array : " + map.get() );	// 맵->배열
		//		console.log( "array tostring : " + map.get().join(",") ); // toString
			
		
			
			
			// 전송 폼
			var $form = $("<form>")
				.attr("action", "/mypage/comment/listdelete")
				.attr("method", "post")
				.append(
					$("<input>")
						.attr("type", "hidden")
						.attr("name", "names")
						.attr("value", names)
				);
			$(document.body).append($form);
			$form.submit();
			}
		
		
			else{
				return false;
			}
		
	
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

<div id = "mypage_comment" >
	<h2 style="font-family: 'NIXGONB-Vb';">내가 쓴 댓글</h2>
</div>
<br>
<div class="container list-container table-hover">
<hr style="background:grey;height:2px">
<div>
	<button  id = "btnChkDelete" class="btn btn-default"
	style="font-family: 'NIXGONB-Vb';">체크 삭제</button>
</div>
<table class="table table-hover">
	<tr style="height:40;font-family: 'NIXGONB-Vb';">
<!-- 		<th class="text-center" style="width:5%">글번호</th> -->
		<th class="text-center" style="width:3%"><input type="checkbox" id="checkAll" onclick="checkAll();" /></th>
		<th class="text-center" style="width:60%">댓글 내용</th>
		<th class="text-center" style="width:27%">원문</th>
		<th class="text-center" style="width:10%">작성날짜</th>
	</tr>
<c:forEach items="${ list }" var="i">
	<tr style="text-align:center;height:30;font-family: 'NIXGONB-Vb';">
		<td><input type = "checkbox"  id = "checkRow" name="checkRow" value = "${ i.commentno }"/></td>
		<td>${ i.contents }</td>
		<td style="text-align:center"><a href ="/main/community/board/view?idx=${ i.idx }">${ i.title }</a></td>
		<td>${ i.regDate }</td>
	</tr>
</c:forEach>
</table>
<hr style="background:grey;height:2px">

</div>














<jsp:include page="/WEB-INF/views/layout/paging.jsp" />

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />