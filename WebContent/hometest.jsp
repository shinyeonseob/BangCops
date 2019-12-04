<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script>

function initMap() {
	
	
	map = new google.maps.Map(document.getElementById('map'), {
			center : {lat : 37.553226, lng : 126.980885 },
			zoom : 11,

		});
		var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
		

		<c:forEach items="${maplist}" var="maplist">

		var json = new Object();
		
		json.guname = "${maplist.guname}"
		json.coordinate = "$ {maplist.coordinate }";
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
// 						id : result[i].guname,
						name : result[i].guname,
						label : result[i].cate,
						position : result[i].coordinate,
						map : map

					});
			markers.push(marker);
			//	     console.log(result[i]);

			google.maps.event
					.addListener(
							marker,
							'click',
							(function(marker, i) {
								return function() {
									infowindow
											.setContent(result[i].guname
													+ "<br>"
													+ "<b>허위매물 신고 건수 : <b>"
													+ result[i].totalaccuse
													+ "<br>"
													+ "<b>피신고 중개인 수 : <b>"
													+ result[i].totalagent
													+ "<br>"
// 													+ "<br><button type='button' id = 'insertBtn"
// 													+ i
// 													+ "' onclick='addIndex("
// 													+ i
// 													+ ");'> 장소 추가 </button>"
													+ ' <a href="/main/accuse"><p>해당 지역 신고글 자세히 보러 가기</p></a> '

													);
									infowindow.open(map, marker);

								}
							})(marker, i));

			marker.addListener('click', function() {
				infowindow.open(map,marker);

			});

		};

	}; // map 종료
</script>


</body>
</html>