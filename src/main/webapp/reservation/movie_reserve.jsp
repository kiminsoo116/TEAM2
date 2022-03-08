<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mr2_1 {
	width: 1900px;
	height: 900px;
}

.mr2_2 {
	width: 950px;
	height: 650px;
	margin: 0px auto;
	margin-top: 100px;
	background: #FFFFFF;
	box-shadow: 0px 0px 100px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	background: #FFFFFF;
}

.mr2_text {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 40px;
	text-align: center;
}

.mr2_3 {
	width: 800px;
	height: 400px;
	margin: 0px auto;
	margin-top: 70px;
	padding: 20px;
}

.mr2_4 {
	width: 200px;
	height: 300px;
	margin-left: 50px;
	margin-top: -40px;
}

.mr2_5 {
	position: absolute;
	width: 400px;
	height: 300px;
	left: 900px;
	margin-top: -280px;
}

.mr2_6 {
	position: absolute;
	width: 800px;
	height: 100px;
}

.mr2_Btn1 {
	width: 200px;
	height: 100px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size:30px;
	background: #FFFFFF;
	border: 2px solid #573EF2;
	border-radius: 10px;
	color: #573EF2;
	margin-left: 30px;
	margin-top: 40px;
}

.mr2_Btn2 {
	width: 200px;
	height: 100px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size:30px;
	background: #FFFFFF;
	border: 2px solid #573EF2;
	border-radius: 10px;
	color: #573EF2;
	margin-left: 20px;
}

.mr2_Btn3 {
	width: 300px;
	height: 100px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 30px;
	background: #573EF2;
	border-radius: 10px;
	color: white;
	margin-left: 20px;
}
.mr_label1 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 25px;
}
.mr_label2 {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
}

.mr2_4 img {
	width: 200px;
	height: 300px;
	filter: drop-shadow(0px 0px 15px rgba(0, 0, 0, 0.35));
	border-radius: 10px;
	margin-bottom: 15px;
}

</style>
</head>
<body>
	<div class="entire">
		<div class="mr2_1">
			<jsp:include page="../jsp/nav.jsp"></jsp:include>
			<jsp:include page="../jsp/header.jsp"></jsp:include>
			<div class="boxofficeTitle">영화 예매</div>
			<div class="mr2_2">
				<br><br>
				<h2 class="mr2_text"><strong>예매가 완료되었습니다!</strong></h2>
				<div class="mr2_3">
					<div class="mr2_4">
						<img src="${fn:substring(vo.getM_poster(), 0, vo.getM_poster().lastIndexOf('?'))}">
					</div>
					<div class="mr2_5">
						<p class="mr2_text2">
							<label class="mr_label1">영화제목 | ${vo.m_title }</label></p>
						<br>
						<p class="mr_text3">
							<label class="mr_label2">지역 | ${vo.mr_location }</label></p>
						<p class="mr_text3">
							<label class="mr_label2">날짜 | ${vo.mr_date }</label></p>
						<p class="mr_text3">
							<label class="mr_label2">좌석 | ${vo.mr_seat }</label></p>
						<p class="mr_text3">
							<label class="mr_label2">예매번호 | ${vo.mr_no }</label></p>
					</div>
						<span class="mr2_6"> <a href="../jsp/main.do"><button
									class="mr2_Btn1">홈</button></a> <a href="../mypage/reservation.do"><button
									class="mr2_Btn2">예매내역</button></a> <a href="#"><button
									class="mr2_Btn3">맛집 보러가기</button></a>
						</span>
					</div>
				</div>
			</div>
			<jsp:include page="../jsp/footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>