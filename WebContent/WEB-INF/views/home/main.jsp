<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />


<style type="text/css">
.container {
	text-align: center;
	justify-content: center;
	align-items: center;
}
</style>




<div class="container">
	<h1>MAIN</h1>
	<hr>
	<div style="margin-top: 150px; margin-bottom: 50px">
		<h2>
			<strong>부동산 허위매물 검색</strong>
		</h2>
	</div>
	<form class="form-inline" action="" method="post">
		<div class="form-group">
			<label class="sr-only" for="city"></label> <input type="text"
				id="city" name="city" class="form-control" size="10" list="listcity" />
			<datalist id="listcity">
				<option value="Seoul">서울</option>
				<option value="_"></option>
			</datalist>
		</div>

		<div class="form-group">
			<label class="sr-only" for="gu"></label> <input type="text" id="gu"
				name="gu" class="form-control" size="10" list="listgu" />
			<select name="Gu" required="required">
				<option value="Jongno">종로구</option>
				<option value="Jung">중구</option>
				<option value="Yongsan">용산구</option>
				<option value="Seongdong">성동구</option>
				<option value="Gwangjin">광진구</option>
				<option value="Dongdaemun">동대문구</option>
				<option value="Jungnang">중랑구</option>
				<option value="Seongbuk">성북구</option>
				<option value="Gangbuk">강북구</option>
				<option value="Dobong">도봉구</option>
				<option value="Nowon">노원구</option>
				<option value="Eunpyeong">은평구</option>
				<option value="Seodaemun">서대문구</option>
				<option value="Mapo">마포구</option>
				<option value="Yangcheon">양천구</option>
				<option value="Gangseo">강서구</option>
				<option value="Guro">구로구</option>
				<option value="Geumcheon">금천구</option>
				<option value="Yeongdeungpo">영등포구</option>
				<option value="Dongjak">동작구</option>
				<option value="Gwanak">관악구</option>
				<option value="Seocho">서초구</option>
				<option value="Gangnam">강남구</option>
				<option value="Songpa">송파구</option>
				<option value="Gangdong">강동구</option>
			</select>
		</div>

		<div class="form-group">
			<label class="sr-only" for="search"></label> <input type="text"
				id="search" class="form-control" name="search" size="70"
				placeholder="상세 정보" />
		</div>
		<div class="form-group">
			<button type="submit" id="btnSearchclass" class="btn btn-default">Search</button>
		</div>
	</form>

</div>






















<jsp:include page="/WEB-INF/views/layout/footer.jsp" />