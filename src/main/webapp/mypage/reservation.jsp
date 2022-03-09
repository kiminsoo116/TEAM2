<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/style4.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
a:link{color: black; text-decoration: none;}
a:visited{color: black; text-decoration: none;}
a:hover{color: white; text-decoration: none;}
</style>
</head>
<body>
	<jsp:include page="../jsp/header.jsp"></jsp:include>
	<div class="container">
		<div class="mypage_menu">

			<a href="../mypage/reservation.do"><button id="btn1-menu" class="menu_btn" style="background:#573EF2; color:white">예매내역</button></a>
			<a href="../mypage/myreview.do"><button id="btn2-menu" class="menu_btn">내가 쓴 리뷰</button></a>
			<a href="../mypage/wish.do"><button id="btn3-menu" class="menu_btn">찜한 목록</button></a>
			<a href="../mypage/myinfo.do"><button id="btn4-menu" class="menu_btn">개인정보 수정</button></a>
		</div>
		
	<script type="text/javascript">
		$(function() {
			$('.menu_btn').mouseover(function(){
				$(this).css('background','#573EF2');
				$(this).css('color','white');
			})
			$('.menu_btn').mouseout(function() {
				$(this).css('background','white');
				$(this).css('color', 'black');
				$('#btn1-menu').css('background','#573EF2')
				$('#btn1-menu').css('color','white')
			})			
		}) 
	</script>
		<div class="mypage_section">
			<div class="movie_reservation">


				<div>
					<c:forEach var="r" items="${list}">
						<div class="reservation_area">
							<div><img class="reservation_poster" src="${fn:substring(r.getM_poster(), 0, r.getM_poster().lastIndexOf('?'))}"></div>
							<div class="reservation_details">
							<div class="reservation_number">예매번호 &nbsp: &nbsp ${r.mr_no}</div><br>
							<div class="reservation_content">영화제목 &nbsp: &nbsp ${r.m_title}</div>
							<div class="reservation_content">극장 &nbsp: &nbsp ${r.mr_location} &nbsp || &nbsp&nbsp  ${r.mr_room}관</div>
							<div class="reservation_content">관람일시 &nbsp: &nbsp ${r.mr_date} ${r.mr_time}</div>
							<div class="reservation_content">좌석 &nbsp : &nbsp ${r.mr_seat}</div>
							</div>
							<button class="reservation_btn1">맛집 추천</button>
							<a href="../mypage/cancelreservation.do?mr_no=${r.mr_no}"><button class="reservation_btn2">예매 취소</button></a>
						</div>

					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<c:set var="page" value="${(empty param.p)?1:param.p}"/>
	<c:set var="count" value="${count}"/>
	<c:set var="startNum" value="${page-(page-1)%5}"/>
	<c:set var="lastNum" value="${Math.ceil(count/5)}"/>
	<c:if test="${startNum <= 1}">
	<div>
	 	<a href="">
		<img class="prev-btn" src="../image/화살표.png" onclick="alert('이전페이지가 없습니다.')">
		</a>
	</div>
	</c:if>
	<c:if test="${startNum > 1}">
	<div>
		<a href="?p=${startNum-1}">
		<img class="prev-btn" src="../image/화살표.png"">
		</a>
	</div>
	</c:if>

	<div class="pager">
		<ul class="-list- center">
		<c:forEach var="i" begin="0" end="4">
		<c:if test="${startNum+i <= lastNum}">
		
			<li><a href="?p=${startNum+i}">${startNum+i}</a></li>
		</c:if>
		</c:forEach>
		</ul>
	</div>
	<c:if test="${lastNum < startNum+5 }">
	<div>
		<a href="">
		<img class="next-btn" src="../image/화살표2.png" onclick="alert('다음페이지가 없습니다.')">
		</a>
	</div>
	</c:if>
	<c:if test="${lastNum >= startNum+5}">
	<div>
	<a href="?p=${startNum+5}">
		<img class="next-btn" src="../image/화살표2.png">
	</a>
	</div>
	</c:if>




	<!-- <script type="text/javascript">
		$(function() {
			$('#premovie').click(function() {
				$.ajax({
					type:'post',
					url:'../mypage/reservation.do',
					success:function(res) {
						$('.row').html(res);
					}
				})
			})
			$('#willmovie').click(function() {
				$.ajax({
					type:'post',
					url:'../jsp/movie_sort2.do',
					success:function(res) {
						$('.row').html(res);
					}
				})
			})
			$('#likeBtn').click(function() {
				$.ajax({
					type:'post',
					url:'../jsp/movie_sort3.do',
					success:function(res) {
						$('.row').html(res);
					}
				})
			})
			$('#gradeBtn').click(function() {
				$.ajax({
					type:'post',
					url:'../jsp/movie_sort4.do',
					success:function(res) {
						$('.row').html(res);
					}
				})
			})
		})
	</script> -->
	
</body>
</html>