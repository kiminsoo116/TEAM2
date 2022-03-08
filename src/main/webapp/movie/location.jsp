<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.location_tool1 {
	position: absolute;
	width: 1920px;
	height: 260px;
	left: 0px;
	top: 583px;
	background: #FFFFFF;
	box-shadow: 0px 4px 40px rgba(0, 0, 0, 0.1);
}

.location_tool2 {
	position: absolute;
	width: 1390px;
	height: 845px;
	left: 263px;
	top: 900px;
}

.location_tool3 {
	position: relative;
	width: 1368px;
	height: 439px;
	background: #FFFFFF;
	box-shadow: 0px 0px 100px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	padding-top: 40px;
	padding-left: 10px;
	margin-top: 30px;
}

.location_tool3 img {
	width: 280px;
	height: 350px;
	filter: 0px 0px 15px rgba(0, 0, 0, 0.35);
	border-radius: 10px;
}

.location_tool5 {
	position: absolute;
	width: 900px;
	height: 200px;
	background: #F1F1F1;
	border-radius: 5px;
	margin-top: 30px;
	padding-top: 10px;
}

.locationtit {
	text-align: left;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 30pt;
}

.locationsub {
	text-align: left;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15pt;
	line-height: 25px;
	padding-left: 40px;
}

.location_tool6 {
	position: absolute;
	width: 600px;
	height: 100px;
	left: 650px;
}

.locationbtn1 {
	width: 120px;
	height: 51px;
	border: 2px solid #573EF2;
	box-sizing: border-box;
	border-radius: 10px;
	background-color: rgba(0, 0, 0, 0);
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 25px;
	text-align: center;
	color: #573EF2;
}

.locationbtn2 {
	width: 120px;
	height: 51px;
	background: #573EF2;
	border-radius: 10px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 25px;
	text-align: center;
	color: white;
}
</style>
</head>
<body>
	<jsp:include page="../jsp/header.jsp"></jsp:include>
	<div class="location_tool1">
		<br> <br> <br>
		<h1 class="text-center">
			"${ss }" <br> 검색결과는 ${size }건 입니다.
		</h1>
	</div>
	<div class="location_tool2">
		<c:forEach var="m" items="${list }" varStatus="s">
			<div class="location_tool3">
				<div class="col-sm-3">
					<img
						src="${fn:substring(m.getM_poster(), 0, m.getM_poster().lastIndexOf('?'))}">
				</div>
				<div class="col-sm-9">
					<div class="location_tool4">
						<p class="locationtit">
							<strong>${m.m_title }</strong>
						</p>
					</div>
					<p class="locationsub">
						<label>장르 :</label>&nbsp;&nbsp;${m.m_genre }
					</p>
					<p class="locationsub">
						<label>감독 :</label>&nbsp;&nbsp;${m.m_director }
					</p>
					<p class="locationsub">

						<label>출연진 :</label>&nbsp;&nbsp;${m.m_cast }
					</p>
					<p class="locationsub">
						<label>개봉일 :</label>&nbsp;&nbsp;${m.m_rdate }
					</p>
					<p class="locationsub">
						<label>상영시간 :</label>&nbsp;&nbsp;${m.m_time }
					</p>
					<span class="location_tool6"> 
						<a href="../movie/movie_detail.do?no=${m.m_no }">
							<button class="locationbtn1">상세보기</button>
						</a>
						<c:if test="${sessionScope.u_id!=null }">
						<a href="../reservation/movie_reservation.do?no=${m.m_no }">
							<button class="locationbtn2">예매하기</button>
						</a>
						</c:if>
					</span>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>