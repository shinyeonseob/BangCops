<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
var curPage = 1;	
var totalPage = "${paging.totalPage}";
var loading = false;
function loadList() {
	$.ajax({
		type : "post",
		url : "/freeboard/list",
		data : { "curPage" : curPage, "search" : "${paging.search}", "categoryno" : "${paging.categoryno}", "searchno" : "${paging.searchno}" },
		dataType : "json",
		success : function(data) {
			
			for (var i = 0; i < data.length; i++) {
				var caption = $("<div class='caption caption-free' onclick=\"location.href='/freeboard/view?free_no=" + data[i].free_no + "'\"></div>");
				
				// 카테고리 추가
				if (data[i].categoryno == 1) {
					caption.append($("<a href=\"/freeboard/list?categoryno=1\"></a>").text("[아이디어]"));
				} else if (data[i].categoryno == 2) {
					caption.append($("<a href=\"/freeboard/list?categoryno=2\"></a>").text("[정보]"));
				} else if (data[i].categoryno == 3) {
					caption.append($("<a href=\"/freeboard/list?categoryno=3\"></a>").text("[공모전]"));
				} else {
					caption.append($("<a href='/freeboard/list'></a>").text("[기타]"));
				}
				
				// 제목
				caption.append($("<h4 class='overtext'></h4>").text(data[i].free_title));
				// 태그 제거하기
				var content = data[i].free_content;
				// <br>포함하기
				content = content.replace(/<br\/>/ig, "\n");
				// 태그 제거
				content = content.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
				
				// 본문
				caption.append($("<div class='free_content overtext'></div>").text(content));
				
				// 작성자
				caption.append($("<div class='text-right'>").text("작성자 : " + data[i].username));
				// 조회, 작성일
				caption.append($("<div></div>").html($("<span style='float: left;'>조회 : " + data[i].views + "</span><span style='float: right;'>" + data[i].free_time + "</span>")));
				
				var board = $("<div class='col-sm6 col-md-4 col-lg-3'></div>").append($("<div class='thumbnail'></div>").append(caption));
				
				$("#board").append(board);
			}			
			
			loading = false;
		},
		error : function(e) {
			console.log(e);
		}
	});
}
$(document).ready(function() {
	loadList();
	
	var categoryno = "${paging.categoryno}";
	
	if (categoryno == "1") {
		$("#ideaBtn").addClass("active");
	} else if (categoryno == "2") {
		$("#infoBtn").addClass("active");
	} else if (categoryno == "3") {
		$("#compBtn").addClass("active");
	} else {
		$("#allBtn").addClass("active");
	}
	
	$("#ideaBtn").on("click", function() {
		location.href = "/freeboard/list?categoryno=1";
	});
	$("#infoBtn").on("click", function() {
		location.href = "/freeboard/list?categoryno=2";
	});
	$("#compBtn").on("click", function() {
		location.href = "/freeboard/list?categoryno=3";
	});
	$("#allBtn").on("click", function() {
		location.href = "/freeboard/list";
	});
	
	$("#writeBtn").popover({"show" : 500, "hide" : 100});
	
	$("#writeBtn").on("click", function() {
		var login = "${login}"
		if (login != "" && login) {
			$(this).popover('destroy');
			
			location.href = "/freeboard/write";
		}
	});
	
	
	$(window).scroll(function() {
		if (loading) {
			return;
		}
		if (curPage >= totalPage) {
			return;
		}
        
        if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	curPage += 1;
	    	loading = true;
	    	
	    	loadList();
        }
	});
});
</script>

<div id="board" class="container list-container">
<br><br>
	<h1 class="text-center">검색하신 서울특별시 ""구 ""동의 게시물</h1>
	<div class="row" style="margin-left: 20px;">
		<form action="/freeboard/list" method="get">
			<div style="width: 10%; float: left;">
				<select name="searchno">
					<option value="">선택없음</option>
					<option value="1">제목</option>
					<option value="2">내용</option>
					<option value="3">제목&amp;내용</option>
				</select>
			</div>
			<div class="input-group" style="width: 31%; float: left;">
				<input type="text" class="form-control" name="search" placeholder="Search for...">
				<span class="input-group-btn">
					<button class="btn btn-warning" type="submit" style="margin: 10px;">검색</button>
				</span>
			</div>
			<div style="width: 57.6%; text-align: right; float: left;">
				<input type="hidden" value="${paging.categoryno }" name="categoryno">
				<button type="button" id="writeBtn" class="btn btn-info" style="margin-top: 10px;" data-container="body" data-placement="top" 
						data-content="게시글을 작성하기 위해서는 로그인이 필요합니다.">&emsp;&emsp;새로운 게시글 작성&emsp;&emsp;</button>
			</div>
		</form>
	</div>
	<br>
	<hr>
</div>
<div style="clear: both;"></div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />   
