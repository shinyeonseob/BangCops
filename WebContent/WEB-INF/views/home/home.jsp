<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script
	src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
	
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCphNLUHRtOMojdg0FPMyj2F0xEkYHeyMo&callback=initMap">
	
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : "get",
			url : "/crawling",
			data : {},
			dataType : "html",
			success : function(data) {
				console.log("success")
// 				console.log(data)
				$("#newsTable").html(data)
			},
			error : function() {
				console.log("error")
			}
		});
	});
</script>

<style type="text/css">
#jb-container {
	width: 1200px;
	margin: 0px auto;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

#map {
	width: 1100px;
	height : 600px;
	padding: 20px;
    margin: auto auto 30px auto;
	border: 1px solid #bcbcbc;
}

#jb-sidebar {
    width: 1102px;
    height: 245px;
    padding: 20px;
    margin-bottom: 20px;
    margin-left: 28px; 
    /* float: right; */
    border: 1px solid #bcbcbc;
}

#servicecenter {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

#searchbar{
	width : 29%;
	height : auto;
	float: left;
}

#newsbar{
	border: 1px solid black;
	float : right;
	width: 68%;
	height: 200px;
	overflow: auto;
	border: 1px solid #bcbcbc;

}
#board {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

#miniboard {
	overflow:hidden;
	width:240px;
	white-space:nowrap;
	text-overflow:ellipsis;
}

table {
 	table-layout: fixed;
}

#td1 {
	overflow:hidden;
	white-space:nowrap;
	text-overflow:ellipsis;
	
	width:25px;
}
</style>

<div id="jb-container">

	<div id="map"  ></div>



	   <script>
	   //구글맵
	   

	   var result = new Array();
	   function initMap() {
			
			
			var map = new google.maps.Map(document.getElementById('map'), {
					center : {lat : 37.553226, lng : 126.980885 },
					zoom : 13,

				});
				var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
				

				<c:forEach items="${maplist}" var="maplist">

				var json = new Object();
				
				json.guname = "${maplist.guname}"
				json.lat="${maplist.lat}";
	   		    json.lng="${maplist.lng}";
				json.totalaccuse = "${maplist.totalaccuse}";
				json.totalagent = "${maplist.totalagent}";
				result.push(json);
				</c:forEach>
				//   console.log("jsoninfo="+JSON.stringify(result));

				var infowindow = new google.maps.InfoWindow();
				var markers = new Array();
				var marker, i;
				for (i = 0; i < result.length; i++) {
					marker = new google.maps.Marker(
							{
		 						id : result[i].guname,
								name : result[i].guname,
								//label : result[i].cate,
								position : new google.maps.LatLng(result[i].lat, result[i].lng),
								map : map

							});
					markers.push(marker);
						     console.log(result[i]);
							console.log(marker.position);
					google.maps.event	
							.addListener(
									marker, 'click', (function(marker, i) {
										return function() {
	infowindow.setContent(result[i].guname + "구<br>"	+ "<b>허위매물 신고 건수 : <b>"
			+ result[i].totalaccuse	+ "<br>" + "<b>피신고 중개인 수 : <b>" + result[i].totalagent
			+ "<br>"
//		 													+ "<br><button type='button' id = 'insertBtn"
//		 													+ i
//		 													+ "' onclick='addIndex("
//		 													+ i
//		 													+ ");'> 장소 추가 </button>"
// city=seoul 은 이제 작동하지 않음. city=서울 이라고 교체함
			+ ' <a href="/accuselist?city=서울&gu=' +  result[i].guname  + '"><p>해당 지역 신고글 자세히 보러 가기</p></a>');
// 			+ ' <a href="/accuselist?city=seoul&gu=${ result[i].guname }"><p>해당 지역 신고글 자세히 보러 가기</p></a>');
	infowindow.open(map, marker);
		}
	})(marker, i));
					// 클릭시 위치 이동 (확대 + 중앙 이동)
// 					marker.addListener('click', function() {
// 						map.setZoom(14);
// 						map.setCenter(this.getPosition());
// 					});

				};

			}; // map 종료

    </script>




	<div id="jb-sidebar" >
	<div id="searchbar">
		<form class="form-inline" action="/accuselist" method="get">
			<div class="form-group" >
				<label class="sr-only" for="city"></label> <input type="text"
					id="city" name="city" class="form-control" size="10"
					list="listcity" />
				<datalist id="listcity">
					<option value="서울">서울</option>
				</datalist>
			</div>

			<div class="form-group">
				<label class="sr-only" for="gu"></label> <input type="text" id="gu"
					name="gu" class="form-control" size="10" list="listgu" />
				<datalist id="listgu">
					<option value="강남">강남구</option>
					<option value="강동">강동구</option>
					<option value="강북">강북구</option>
					<option value="강서">강서구</option>
					<option value="관악">관악구</option>
					<option value="광진">광진구</option>
					<option value="구로">구로구</option>
					<option value="금천">금천구</option>
					<option value="노원">노원구</option>
					<option value="도봉">도봉구</option>
					<option value="동대문">동대문구</option>
					<option value="동작">동작구</option>
					<option value="마포">마포구</option>
					<option value="서대문">서대문구</option>
					<option value="서초">서초구</option>
					<option value="성동">성동구</option>
					<option value="성북">성북구</option>
					<option value="송파">송파구</option>
					<option value="양천">양천구</option>
					<option value="영등포">영등포구</option>
					<option value="용산">용산구</option>
					<option value="은평">은평구</option>
					<option value="종로">종로구</option>
					<option value="중">중구</option>
					<option value="중랑">중랑구</option>
				</datalist>
			</div>

			<div class="form-group">
				<label class="sr-only" for="search"></label> <input type="text"
					id="search" class="form-control" name="search" size="70"
					placeholder="상세 정보" style="width: 200px;" />
			</div>
			<div class="form-group">
				<button type="submit" id="btnSearch" class="btn btn-default">검색</button>
				<hr>
			</div>
		</form>
		<a href="/main/accuse"><button id="btnAccuse"
				class="btn btn-default">신고하기</button></a>
</div>

		<div id="newsbar">
			<b>최신 뉴스</b> <a href = "http://www.donga.com/news/List/Economy/RE" target="_blank">더보기</a>
			<div id="newsTable">

			</div>
		</div>

	</div>

	<div style="clear: both;"></div>
	<div id="board">
		<div id="noticeboard"
			style="border: 1px solid #bcbcbc; width: 33%; height: 100px; display: inline-block;">
			<a href="/main/community/board?boardno=3">&nbsp;공지사항 >></a>
			<div >
				<ol  start="1">
				<c:forEach items="${notice }" var="i">
					<li><div id="miniboard"><a id="miniboard"  href="/main/community/board/view?idx=${i.idx }">${i.title } <c:if test="${i.commentCnt ne 0 }">[${i.commentCnt }]</c:if></a></div></li>
				</c:forEach>
				</ol>
			</div>
		</div>
		<div id="freeboard"
			style="border: 1px solid #bcbcbc; width: 33%; height: 100px; display: inline-block">
			<a href="/main/community/board?boardno=1">&nbsp;자유게시판 >></a>
			<div>
				<ol  start="1">
				<c:forEach items="${free }" var="j">
					<li><div id="miniboard"><a id="miniboard"  href="/main/community/board/view?idx=${j.idx }">${j.title } <c:if test="${j.commentCnt ne 0 }">[${j.commentCnt }]</c:if></a></div></li>
				</c:forEach>
				</ol>
			</div>
		</div>
		<div id="reviewboard"
			style="border: 1px solid #bcbcbc; width: 33%; height: 100px; display: inline-block">
			<a href="/main/community/board?boardno=2">&nbsp;이용후기 게시판 >></a>
			<div>
				<ol  start="1">
				<c:forEach items="${review }" var="k">
					<li ><div id="miniboard"><a id="miniboard"  href="/main/community/board/view?idx=${k.idx }">${k.title } <c:if test="${k.commentCnt ne 0 }">[${k.commentCnt }]</c:if></a></div></li>
				</c:forEach>
				</ol>
			</div>
		</div>
	</div>

	<br> <br>

	<div id="servicecenter">
		<a href="/serviceCenterView"><img alt="고객센터" src="/resources/img/img_SC2.png" style="width: 10%; " ></a>
	</div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />