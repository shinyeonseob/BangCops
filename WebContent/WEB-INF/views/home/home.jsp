<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ded91526502242a20e39192a5ada1140"></script>

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
	float: right;
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
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>

	<div id="jb-sidebar" style="width: 30%">
		<form class="form-inline" action="" method="post">
			<div class="form-group">
				<label class="sr-only" for="city"></label> <input type="text"
					id="city" name="city" class="form-control" size="10"
					list="listcity" />
				<datalist id="listcity">
					<option value="Seoul">서울</option>
					<option value="_"></option>
				</datalist>
			</div>

			<div class="form-group">
				<label class="sr-only" for="gu"></label> <input type="text" id="gu"
					name="gu" class="form-control" size="10" list="listgu" />
				<datalist id="listgu">
					<option value="Gangdong">강동구</option>
					<option value="Gangseo">강서구</option>
					<option value="Gangnam">강남구</option>
					<option value="Gangbuk">강북구</option>
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
		<div style="border: 1px solid black; float: left; width: 30%; height: 200px; ">
				뉴스기사<hr>
		</div>
	</div>
	
	<div style="clear: both;"></div>
	<div id="board">
		<div id="noticeboard" style="border: 1px solid black; width: 33%; height: 100px; display: inline-block;">
			<p>공지사항</p>
		</div>
		<div id="freeboard" style="border: 1px solid black; width: 33%; height: 100px; display: inline-block;">
			<p>자유게시판</p>
		</div>
		<div id="reviewboard" style="border: 1px solid black; width: 33%; height: 100px; display: inline-block;">
			<p>이용후기 게시판</p>
		</div>
	</div>
    
    <br><br>
      
	<div id="servicecenter">
		<img src="/resources/img/servicecenter.png">
	</div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />