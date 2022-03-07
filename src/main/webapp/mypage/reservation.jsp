<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/style4.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head>
<body>
	<jsp:include page="../jsp/header.jsp"></jsp:include>
	<div class="container">
		<div class="mypage_menu">
			<button class="menu_btn1" style="color: white">예매내역</button>
			<button class="menu_btn2">내가 쓴 리뷰</button>
			<button class="menu_btn3">찜한 목록</button>
			<button class="menu_btn4">개인정보 수정</button>
		</div>

		<div class="mypage_section">
			<div class="movie_reservation">


				<div>
					<c:forEach var="r" items="${list}">
						<div class="reservation_area">
							<div class="reservation_poster"><img src="${r.m_poster}"></div>
							<div class="reservation_details">
							<div class="reservation_number">예매번호 : ${r.mr_no}</div>
							<div class="reservation_content">영화제목 : ${r.m_title}</div>
							<div class="reservation_content">극장 : ${r.mr_room}</div>
							<div class="reservation_content">관람일시 : ${r.mr_date} ${r.mr_time}</div>
							<div class="reservation_content">인원 : ?명</div>
							<div class="reservation_content">좌석 : ${r.mr_seat}</div>
							</div>
							<button class="reservation_btn1">맛집 추천</button>
							<button class="reservation_btn2">예매 취소</button>
						</div>

					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<div>
		<img class="prev-btn" src="../image/화살표.png">
	</div>

	<div class="pager">
		<ul class="-list- center">
			<li><a class="-text- orange bold" href="?p=1&t=&q=">1</a></li>
			<li><a class="-text- orange bold" href="?p=1&t=&q=">2</a></li>
			<li><a class="-text- orange bold" href="?p=1&t=&q=">3</a></li>
		</ul>
	</div>

	<div>
		<img class="next-btn" src="../image/화살표2.png">
	</div>

	</div>
</body>
</html>