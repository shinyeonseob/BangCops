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
	margin: 5px auto;
	padding: 20px;
	border: 0px solid #bcbcbc;
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
    border: 0px solid #bcbcbc;
}

#servicecenter {
	clear: both;
	padding: 20px;
	border: 0px solid #bcbcbc;
}

#searchbar{
	width : 20%;
	height : auto;
	float: left;
}

#newsbar{
	border: 1.5px solid black;
	float : right;
	width: 79%;
	height: 200px;
	overflow: auto;
	border: 1px solid #bcbcbc;

}
#board {
	clear: both;
	padding: 20px;
	border: 0px solid #bcbcbc;
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
.articleList{
	margin-left: 5px;
	width: 780px !important;
}
body{
	background-color: #F8F8F8;
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
				

				// 모델에서 받은 '구' 좌표
				<c:forEach items="${maplist}" var="maplist">

				var json = new Object();
				
				json.guname = "${maplist.guname}"
				json.lat="${maplist.lat}";
	   		    json.lng="${maplist.lng}";
				json.totalaccuse = "${maplist.totalaccuse}"; // 구에 해당하는 총 신고건수
				json.totalagent = "${maplist.totalagent}"; // 구에 해당하는 총 피중개인 수
				result.push(json);
				</c:forEach>
				//   console.log("jsoninfo="+JSON.stringify(result));

				var infowindow = new google.maps.InfoWindow(); // 핀 클릭 시 정보 팝업
				var markers = new Array(); // 핀 리스트
				var marker, i; // 핀 객체
				for (i = 0; i < result.length; i++) {
					marker = new google.maps.Marker(
							{
		 						id : result[i].guname, // 구  id
								name : result[i].guname, // 구 이름
								//label : result[i].cate,
								position : new google.maps.LatLng(result[i].lat, result[i].lng), // 맵의 좌표 설정
								map : map

							});
					markers.push(marker);
						     console.log(result[i]);
							console.log(marker.position);
					google.maps.event	
							.addListener(
									marker, 'click', (function(marker, i) {
										return function() { // 정보창 내용
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
					marker.addListener('click', function() {
						map.setZoom(14);
						map.setCenter(this.getPosition());
					});

				};

			}; // map 종료

    </script>




	<div id="jb-sidebar" >
	<div id="searchbar">
		<form class="form-inline" action="/accuselist" method="get">
			<div class="form-group" >
				<label class="sr-only" for="city"></label> <input type="text"
					id="city" name="city" class="form-control" size="5"
					list="listcity" placeholder="시"/>
				<datalist id="listcity">
					<option value="서울"></option>
				</datalist>
			</div> 

			<div class="form-group">
				<label class="sr-only" for="gu"></label> <input type="text" id="gu"
					name="gu" class="form-control" size="7" list="listgu" placeholder="구"/>
				<datalist id="listgu"  >
					<option selected value="강남">강남구</option>
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
			<br><br>
			<div class="form-group">
				<label class="sr-only" for="search"></label> <input type="text"
					id="search" class="form-control" name="search" size="70"
					placeholder="상세 정보" style="width: 182px;" />
			</div>
			<br><br>
			<div class="form-group">
				<button type="submit" id="btnSearch" class="btn btn-default" style="width: 183px;">검색</button>
				
			</div>
		</form>
		<br>
		<a href="/main/accuse"><button id="btnAccuse"
				class="btn btn-default"style = "width: 182px; height: 55px; background-color: #FDB813;">
				<span style ="font-size: 18px; color: white;"><b>신고하기</b></span></button></a>
				<!-- style = "width: 182px; height: 78px; background-color: #fbb;" -->
	</div>

	&nbsp;&nbsp;<b>최신 뉴스</b> <a href = "http://www.donga.com/news/List/Economy/RE" target="_blank">더보기</a>
		<div id="newsbar">
			<div id="newsTable">

			</div>
		</div>

	</div>

	<div style="clear: both;"></div>
	<div id="board">
		<div id="noticeboard"
			style="border: 1px solid #bcbcbc; width: 33%; height: 100px; display: inline-block;">
			<a href="/main/community/board?boardno=3" style="color: #000000">&nbsp;공지사항&nbsp;<img src="/resources/img/chat2.png" width="15" height="15"></a>
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
			<a href="/main/community/board?boardno=1" style="color: #000000">&nbsp;자유게시판&nbsp;<img src="/resources/img/chat2.png" width="15" height="15"></a>
			<div>
				<ol  start="1">
				<c:forEach items="${free }" var="j">
					<li><div id="miniboard"><a id="miniboard"  href="/main/community/board/view?idx=${j.idx }">${j.title } <c:if test="${j.commentCnt ne 0 }">[${j.commentCnt }]</c:if></a></div></li>
				</c:forEach>
				</ol>
			</div>
		</div>
		<div id="reviewboard" style-color="black"
			style="border: 1px solid #bcbcbc; width: 33%; height: 100px; display: inline-block">
			<a href="/main/community/board?boardno=2" style="color: #000000">&nbsp;이용후기 게시판&nbsp;<img src="/resources/img/chat2.png" width="15" height="15"></a>
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

	<div id="servicecenter" class="text-center" style="min-width:541px;min-height:300px;">
		<div style="float:left">
		<a href="/serviceCenterView"><img alt="고객센터" src="/resources/img/img_SC.png" style="width:540px; " ><br><h3><strong>상담가능시간: 09:00시 ~ 18:00시</strong></h3></a>
		</div>
		<div style="float:right;border:2px solid grey">
			<img src="/resources/img/자라나라머리머리.png">
		</div>
	</div>

</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />