<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.mr_1 {
	width: 1300px;
	margin: 0px auto;
}

.mr_2 {
	width: 1300px;
	height: 900px;
	margin-top: 150px;
	background: #FFFFFF;
	box-shadow: 0px 0px 100px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.mr_3 {
	width: 500px;
	height: 900px;
	padding: 20px;
	float: left;
}

.mr_4 {
	width: 500px;
	height: 900px;
	padding: 20px;
	float: left;
}

.mr_5 {
	width: 290px;
	height: 900px;
	padding: 20px;
	float: left;
}

.mr_board1 {
	width: 1px;
	height: 700px;
	margin-top: 110px;
	float: left;
	border: 1px solid #B0B0B0;
}

.mr_board2 {
	width: 450px;
	height: 1px;
	border: 1px solid #B0B0B0;
}

.mr_loc_cl {
	margin-top: 50px;
	width: 450px;
	height: 400px;
}

.mr_date_cl {
	width: 450px;
	height: 400px;
}

.mr_time_cl {
	margin-top: 50px;
	width: 450px;
	height: 400px;
}

.mr_seat_cl {
	width: 450px;
	height: 400px;
}

.mr_info_cl1 {
	margin-top: 50px;
	width: 250px;
	height: 350px;
}

.mr_movie_poster {
	width: 250px;
	height: 300px;
	filter: drop-shadow(0px 0px 15px rgba(0, 0, 0, 0.35));
	border-radius: 10px;
}

.mr_movie_title {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
}

.mr_info_cl2 {
	width: 250px;
	height: 300px;
	margin-top: 50px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
}

.mr_resBtn {
	width: 100px;
	height: 50px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	background: #573EF2;
	border-radius: 10px;
	color: white;
	margin-left: 20px;
	border: none;
}

.mr_canBtn {
	position: absolute;
	width: 100px;
	height: 50px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	background: #FFFFFF;
	border: 2px solid #573EF2;
	border-radius: 10px;
	color: #573EF2;
	margin-left: 140px;
	margin-top: -50px
}
</style>

</head>
<body>
	<div class="entire">
		<jsp:include page="../jsp/nav.jsp"></jsp:include>
		<jsp:include page="../jsp/header.jsp"></jsp:include>
		<div class="boxofficeTitle">영화 예매</div>
		<div class="mr_1">
			<div class="mr_2">
				<div class="mr_3">
					<div class="mr_loc_cl">
						<h2>
							<strong>지역 선택</strong>
						</h2>
						<div id="mr_movie_location"></div>
					</div>
					<div class="mr_board2"></div>
					<div class="mr_date_cl">
						<h2>
							<strong>날짜 선택</strong>
						</h2>
						<div id="mr_movie_date"></div>
					</div>
				</div>
				<div class="mr_board1"></div>
				<div class="mr_4">
					<div class="mr_time_cl">
						<h2>
							<strong>시간 선택</strong>
						</h2>
						<div id="mr_movie_movietime"></div>
					</div>
					<div class="mr_board2"></div>
					<div class="mr_seat_cl">
						<h2>
							<strong>좌석 선택</strong>
						</h2>
						<div id="mr_movie_seat"></div>
					</div>
				</div>
				<div class="mr_board1"></div>
				<div class="mr_5">
					<c:forEach var="vo" items="${list }">
						<div class="mr_info_cl1" id="mr_info">
							<img class="mr_movie_poster" src="${vo.m_poster }">
							<h1 class="mr_movie_title">
								<strong>영화제목:${vo.m_title }</strong>
							</h1>
						</div>
						<form method="post"
							action="../reservation/movie_reservation_ok.do">
							<div class="mr_info_cl2" id="mr_movie_info">
								<input type="hidden" value="${vo.m_no }" name="m_no" id="m_no">
								지역:<input type="hidden" value="" name="mr_loc" id="mr_location"
									size="5" readonly><br> 날짜:<input type="hidden"
									value="" name="mr_date" id="mr_date" size="10" readonly><br>
								영화관:<input type="hidden" value="" name="mr_room" id="mr_room"
									size="5" readonly><br> 시간:<input type="hidden"
									value="" name="mr_time" id="mr_time" size="5" readonly><br>
								좌석:<input type="hidden" value="" name="mr_seat" id="mr_seat"
									size="5" readonly>
							</div>
							<input type="submit" value="예매하기" class="mr_resBtn"
								id="mr_resBtn" style="display: none;">
						</form>
					</c:forEach>
					<span class="canBtn_size"> <input type="button" value="취소하기"
						class="mr_canBtn" onclick="javascrip:history.back()">
					</span>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$.ajax({
				type : 'post',
				url : '../reservation/movie_location.do',
				success : function(res) {
					$('#mr_movie_location').html(res);
				}
			})
		})
	</script>
	<jsp:include page="../jsp/footer.jsp"></jsp:include>
	</div>
</body>
</html>