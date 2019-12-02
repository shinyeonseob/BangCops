<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		type: "get"
		, url: "/crawling"
		, data: {}
		, dataType: "html"
		, success: function( data ) {
			console.log("success")
			console.log(data)
			$("#newsTable").html(data)
		}
		, error: function() {
			console.log("error")
		}
	});
});
</script>

<style type="text/css">
#jb-container {
	width: 940px;
	margin: 0px auto;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

#map {
	width: 580px;
	padding: 20px;
	margin-bottom: 20px;
	float: left;
	border: 1px solid #bcbcbc;
}

#jb-sidebar {
	width: 260px;
	padding: 20px;
	margin-bottom: 20px;
/* 	float: right; */
	border: 1px solid #bcbcbc;
}

#servicecenter {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

.new {
	width: 260px;
	padding: 20px;
	margin-bottom: 20px;
	float: right;
	border: 1px solid #bcbcbc;
}

#board {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
}
</style>

<div id="jb-container">

	<div id="map" style="height: 473px; width: 70%;"></div>
	<script>
	function initMap() {

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 11,
          center: {lat: 37.553226, lng: 126.980885}
        });

        var labels = '방캅스';

        var markers = locations.map(function(location, i) {
          return new google.maps.Marker({
            position: location,
            label: labels
          });
          
        });

        var markerCluster = new MarkerClusterer(map, markers,
            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
      }
      var locations = [
    	  {lat: 37.6658609	, lng: 127.0317674},
    	  {lat: 37.6176125	, lng: 126.9227004},
    	  {lat: 37.5838012	, lng: 127.0507003},
    	  {lat: 37.4965037	, lng: 126.9443073},
    	  {lat: 37.4600969	, lng: 126.9001546},
    	  {lat: 37.4954856	, lng: 126.858121},
    	  {lat: 37.5990998	, lng: 126.9861493},
    	  {lat: 37.6469954	, lng: 127.0147158},
    	  {lat: 37.5953795	, lng: 127.0939669},
    	  {lat: 37.4959854	, lng: 127.0664091},
    	  {lat: 37.5657617	, lng: 126.8226561},
    	  {lat: 37.5579452	, lng: 126.9941904},
    	  {lat: 37.5492077	, lng: 127.1464824},
    	  {lat: 37.5481445	, lng: 127.0857528},
    	  {lat: 37.5622906	, lng: 126.9087803},
    	  {lat: 37.4769528	, lng: 127.0378103},
    	  {lat: 37.606991	, lng: 127.0232185},
    	  {lat: 37.655264	, lng: 127.0771201},
    	  {lat: 37.5048534	, lng: 127.1144822},
    	  {lat: 37.5820369	, lng: 126.9356665},
    	  {lat: 37.5270616	, lng: 126.8561534},
    	  {lat: 37.520641	, lng: 126.9139242},
    	  {lat: 37.4653993	, lng: 126.9438071},
    	  {lat: 37.5506753	, lng: 127.0409622},
    	  {lat: 37.5311008	, lng: 126.9810742}
      ]
      
      
    </script>

	<div id="jb-sidebar" style="width: 30%">
		<form class="form-inline" action="" method="post">
			<div class="form-group">
				<label class="sr-only" for="city"></label> <input type="text"
					id="city" name="city" class="form-control" size="10"
					list="listcity" />
				<datalist id="listcity">
					<option>서울시</option>
				</datalist>
			</div>

			<div class="form-group">
				<label class="sr-only" for="gu"></label> <input type="text" id="gu"
					name="gu" class="form-control" size="10" list="listgu" />
				<datalist id="listgu">
				<option>종로구</option>
				<option>중구</option>
				<option>용산구</option>
				<option>성동구</option>
				<option>광진구</option>
				<option>동대문구</option>
				<option>중랑구</option>
				<option>성북구</option>
				<option>강북구</option>
				<option>도봉구</option>
				<option>노원구</option>
				<option>은평구</option>
				<option>서대문구</option>
				<option>마포구</option>
				<option>양천구</option>
				<option>강서구</option>
				<option>구로구</option>
				<option>금천구</option>
				<option>영등포구</option>
				<option>동작구</option>
				<option>관악구</option>
				<option>서초구</option>
				<option>강남구</option>
				<option>송파구</option>
				<option>강동구</option>
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
				<button type="submit" id="btnAccuse" class="btn btn-default">해당매물
					신고하기</button>
			</div>
		</form>
	</div>

	<div id="news">
		<div 
			style="border: 1px solid black; float: left; width: 30%; height: 200px; 
	overflow: auto;">
			뉴스기사
			<hr>
			<table id="newsTable">
<%-- 			<c:forEach items="${ Newslist }" var="i"> --%>
<!-- 			<tr> -->
<!-- 				<td>1{i}</td> -->
<!-- 			</tr> -->
<%-- 			</c:forEach> --%>
			</table>
		</div>
	</div>

	<div style="clear: both;"></div>
	<div id="board">
		<div id="noticeboard"
			style="border: 1px solid black; width: 33%; height: 100px; display: inline-block;">
			<p>공지사항</p>
		</div>
		<div id="freeboard"
			style="border: 1px solid black; width: 33%; height: 100px; display: inline-block;">
			<p>자유게시판</p>
		</div>
		<div id="reviewboard"
			style="border: 1px solid black; width: 33%; height: 100px; display: inline-block;">
			<p>이용후기 게시판</p>
		</div>
	</div>

	<br>
	<br>

	<div id="servicecenter">
		<a href="/serviceCenterView">고객센터</a>
	</div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />