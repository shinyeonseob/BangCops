<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />




<style type="text/css">
div {
	
}

.container {
	text-align: center;
}

able, td {
	/*   border: 1px solid black; */
	/*   border-collapse: collapse; */
	
}

.tdleft {
	width: 30px;
}

.tdupper {
	width: 500px;

}

.accuseop {
	display: inline-block;
/* 	background-color : #FDB813; */
	width: 800px;
	height: 600px;
	text-align: center;
	margin: 10px;
	border: 0.1px solid black;
	padding: 10px
}
.accuseop2 {
	display: inline-block;
/* 	background-color : #FDB813; */
	width: 800px;
	height: 1000px;
	text-align: center;
	margin: 10px;
	border: 0.1px solid black;
	padding: 10px
}
.accuseop3 {
	display: inline-block;
/* 	background-color : #FDB813; */
	width: 800px;
	height: 500px;
	text-align: left;
	margin: 10px;
	border: 0.1px solid black;
	padding: 10px
}
.zidex {
	text-alig: center;

}

</style>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#btnWrite").click(function() {

			// 		console.log(111);

			//스마트에디터의 내용을 <textarea>에 적용
			submitContents($("#btnWrite"));

			//form submit
			$("#write").submit();
		})

	});
</script>


<div class="container">
	<form action="/accuse/write" method="post"
		enctype="multipart/form-data">

		<hr>

		<h3>
			<Strong>신고 사항</Strong><hr>
		</h3>
		<br> 
		<h4>${accuseType}</h4>
		<hr>
		
		
		<div class="accuseop">
		
		<hr>
		<strong><small>1단계 : 신고매물 기본정보</small></strong> <br> <input type="hidden"
			name="boardno" value="6" /> <input type="hidden" name="accuseType"
			value="${accuseType}" />
		<hr>

		<style type="text/css">
		#tblinfo {
			width: 80%;
		}
		#tblinfo td {
			padding: 5px;
			border: none;
			vertical-align: middle;
		}
		#tblinfo tr td:first-child {
			text-align: right;
		}
		#tblinfo select {
			width: 100%;
		}
		</style>
		<table class="table" id="tblinfo" style="margin: 0 auto;">
			<tr class="form-group">
				<td>신고 게시물 URL</td>
				<td colspan="2"><input class="form-control" type="url" name="URL"
					placeholder=" URL을 입력해주세요" /></td>
			</tr>

			<tr>
				<td>신고 사이트</td>
				<td colspan="2"><input class="form-control" type="text" name="sitename"
					placeholder="ex)직방,다방,네이버부동산 등" /></td>
			</tr>

			<tr>
				<td>부동산 이름</td>
				<td colspan="2"><input class="form-control" type="text" name="Property"
					placeholder="신고할 부동산의 상호" /></td>
			</tr>
			<br>

			<tr>
				<td>중개인 이름</td>
				<td colspan="2"><input class="form-control" type="text" name="Agent"
					placeholder="신고게시물에 기재된 중개인의 이름" required="required" /></td>
			</tr>
			<br>

			<tr>
				<td>전화번호</td>
				<td colspan="2"><input class="form-control" type="text" name="PhoneNo"
					placeholder="신고게시물에 기재된 휴대폰 번호" required="required" /></td>
			<tr>
				<td>매물타입</td>
				<td><select class="form-control" name="DealType2"
					required="required"">
						<option value="전세">전세</option>
						<option value="월세">월세</option>
				</select></td>
				<td></td>
			<tr>
				<td>보증금</td>
				<td colspan="2"><input class="form-control" type="number" name="Deposit"
					placeholder="해당매물의 보증금금액" required="required" /></td>
			<tr>
				<td>월세</td>
				<td colspan="2"><input class="form-control" type="number" name="Price"
					placeholder="해당매물의 월세금액" required="required" /></td>
			<tr>
				<td>지역</td>
				<td><select class="form-control" name="City" required="required">
						<option value="서울">서울</option>
				</select></td>
				<td><select class="form-control" name="Gu" required="required"/>
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
				</select></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td colspan="2" class="tdupper">신고 게시물 URL</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="tdleft"></td> -->
<!-- 				<td class="tdright"><input type="url" name="URL" -->
<!-- 					placeholder=" URL을 입력해주세요" /></td> -->
<!-- 			</tr> -->

<!-- 			<tr> -->
<!-- 				<td colspan="2" class="tdupper">신고 사이트</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="tdleft"></td> -->
<!-- 				<td class="tdright"><input type="text" name="sitename" -->
<!-- 					placeholder="ex)직방,다방,네이버부동산 등" /></td> -->
<!-- 			</tr> -->

<!-- 			<tr> -->
<!-- 				<td colspan="2" class="tdupper">부동산 이름</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="tdleft"></td> -->
<!-- 				<td class="tdright"><input type="text" name="Property" -->
<!-- 					placeholder="신고할 부동산의 상호" /></td> -->
<!-- 			</tr> -->
<!-- 			<br> -->

<!-- 			<tr> -->
<!-- 				<td colspan="2" class="tdupper">중개인 이름</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="tdleft"></td> -->
<!-- 				<td class="tdright"><input type="text" name="Agent" -->
<!-- 					placeholder="신고게시물에 기재된 중개인의 이름" required="required" /></td> -->
<!-- 			</tr> -->
<!-- 			<br> -->

<!-- 			<tr> -->
<!-- 				<td colspan="2" class="tdupper">전화번호</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="tdleft"></td> -->
<!-- 				<td class="tdright"><input type="text" name="PhoneNo" -->
<!-- 					placeholder="신고게시물에 기재된 휴대폰 번호" required="required" /></td> -->
<!-- 			<tr> -->
<!-- 				<td colspan="2" class="tdupper">매물타입</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="tdleft"></td> -->
<!-- 				<td class="tdright"><select name="DealType2" -->
<!-- 					required="required""> -->
<!-- 						<option value="전세">전세</option> -->
<!-- 						<option value="월세">월세</option> -->
<!-- 				</select></td> -->
<!-- 			<tr> -->
<!-- 				<td colspan="2" class="tdupper">보증금</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="tdleft"></td> -->
<!-- 				<td class="tdright"><input type="number" name="Deposit" -->
<!-- 					placeholder="해당매물의 보증금금액" required="required" /></td> -->
<!-- 			<tr> -->
<!-- 				<td colspan="2" class="tdupper">월세</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="tdleft"></td> -->
<!-- 				<td class="tdright"><input type="number" name="Price" -->
<!-- 					placeholder="해당매물의 월세금액" required="required" /></td> -->
<!-- 			<tr> -->
<!-- 				<td colspan="2" class="tdupper">지역</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td class="tdleft"></td> -->
<!-- 				<td class="tdright"><select name="City" required="required"> -->
<!-- 						<option value="서울">서울</option> -->
<!-- 				</select></td> -->
<!-- 			<tr> -->
<!-- 				<td class="tdleft"></td> -->
<!-- 				<td class="tdright"><select name="Gu" required="required"/> -->
<!-- 						<option value="강남">강남구</option> -->
<!-- 						<option value="강동">강동구</option> -->
<!-- 						<option value="강북">강북구</option> -->
<!-- 						<option value="강서">강서구</option> -->
<!-- 						<option value="관악">관악구</option> -->
<!-- 						<option value="광진">광진구</option> -->
<!-- 						<option value="구로">구로구</option> -->
<!-- 						<option value="금천">금천구</option> -->
<!-- 						<option value="노원">노원구</option> -->
<!-- 						<option value="도봉">도봉구</option> -->
<!-- 						<option value="동대문">동대문구</option> -->
<!-- 						<option value="동작">동작구</option> -->
<!-- 						<option value="마포">마포구</option> -->
<!-- 						<option value="서대문">서대문구</option> -->
<!-- 						<option value="서초">서초구</option> -->
<!-- 						<option value="성동">성동구</option> -->
<!-- 						<option value="성북">성북구</option> -->
<!-- 						<option value="송파">송파구</option> -->
<!-- 						<option value="양천">양천구</option> -->
<!-- 						<option value="영등포">영등포구</option> -->
<!-- 						<option value="용산">용산구</option> -->
<!-- 						<option value="은평">은평구</option> -->
<!-- 						<option value="종로">종로구</option> -->
<!-- 						<option value="중">중구</option> -->
<!-- 						<option value="중랑">중랑구</option> -->
<!-- 				</select></td> -->


			
<!-- 			</tr> -->
			<br>
		</table>
		<br>
		</div>
		<br> <br> <br>

		<div class="accuseop2">
		<hr>
		
		<strong><small>2단계 : 신고매물 상세정보</small></strong>




		<hr><br><br>
		<small> ${accuseType}임을 입증할 수 있는 파일을 첨부해주세요<br> ex)문자 내용
			스크린샷(휴대폰 번호 보일 수 있도록)
		<br>
		</small> <br> <br> <label>상세내용</label><br>
		<textarea placeholder="신고할 내용을 상세하게 입력해주세요" id="contents"
			name="contents"><br><br></textarea>
		<script type="text/javascript">
			CKEDITOR.replace('contents', {
				height : 400
			});
		</script>
		</td> <br><br> <small>파일첨부</small> <small>허위매물로 예상되는 이미지를
			넣어주세요<br> 신고하신 이미지는 허위매물 이미지로 노출됩니다.
		</small> <br><br>
		<div class= "zidx">
		<br><input type="file" name="upfile" required="required"/> <br> <br>
		</div>
		
		</div>
		<br><hr><br>
		
		<div class="accuseop3">
		<br>
		<hr><strong><small>허위매물 등록 약관</small></strong> <br><small> <hr>1. 본인이
			등록한 허위매물사례 정보는 추가 피해를 방지하기 위한 목적으로 개인, 기업, 수사기관 등 제3자에게 제공됨을 동의합니다. <br>
			2. 허위사실 유포, 명예훼손 등 법적분쟁 발생 시 모든 책임은 피해사례 등록자에게 있으며, 피해사례의 사실확인을 위해
			검증과정에 참여할 것임을 확인합니다. <br> 3. 피해사례 등록자와 용의자의 식별정보 및 개인정보(이름,
			전화번호, 계좌번호, 아이디 등)를 피해회복과 추가 피해예방을 위해 <방캅스>가 취급 및 처리함에 동의합니다. <br>
			<br>
			※ 약관을 위배하는 경우, 다음과 같은 처벌을 받을 수 있습니다. <br>
			① 사람을 비방할 목적으로 정보통신망을 통하여 공연히 사실을 적시하여 타인의 명예를 훼손하는 경우 3년 이하의 징역이나 금고
			또는 2천만원 이하의 벌금에 처하고 사람을 비방할 목적으로 정보통신망을 통하여 공연히 허위의 사실을 적시하여 타인의 명예를
			훼손하는 경우에는 7년 이하의 징역, 10년 이하의 자격정지 또는 5천만원 이하의 벌금에 처할 수 있습니다.<br>
			② 개인적인 앙심 또는 괘씸함 등 허위매물 외의 사유로 등록하시는 경우, 명예훼손에 해당될 수 있으며 이는 민·형사상의
			불이익을 받을 수 있습니다. <br>
		</small> <br><br>

		<input type="checkbox" id="checkBox_01" required="required" style="width:10px">
		<small>허위매물 등록 약관에 동의합니다.</small>

		<br>
		</div>
			<hr><br><br>
		<button id="btnAWrite" class="btn btn-primary">등록완료</button>



	</form>

</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />