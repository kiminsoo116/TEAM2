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
#mr_roomBtn1, #mr_roomBtn2 {
	width: 300px;
	height: 100px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 30px;
}

.mr_time_select1, .mr_time_select2 {
	width: 140px;
	height: 50px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	background: #FFFFFF;
	border: 1px solid #573EF2;
	border-radius: 10px;
	color: #573EF2;
}

.mr_board3 {
	width: 450px;
	height: 1px;
	border: 1px solid #B0B0B0;
}
</style>
</head>
<body>
	<div class="mr_board3"></div>
	<span id="mr_roomBtn1">1</span>
	<span>영화관</span>
	<div class="mr_board3"></div>
	<c:forEach var="time" items="${time }">
		<span class="mr_time_select1 btn btn-sm btn-info">${time }</span>
	</c:forEach>
	<div class="mr_board3"></div>
	<span id="mr_roomBtn2">2</span>
	<span>영화관</span>
	<div class="mr_board3"></div>
	<div></div>
	<c:forEach var="time" items="${time }">
		<span class="mr_time_select2 btn btn-sm btn-info">${time }</span>
	</c:forEach>

	<script type="text/javascript">
		$(function() {
			$('.mr_time_select1').hover(function() {
				$(this).css("cursor", "pointer");
				$(this).css("color", "white");
			}, function() {
				$(this).css("cursor", "none");
				$(this).css("color", "blue");
			})
			$('.mr_time_select2').hover(function() {
				$(this).css("cursor", "pointer");
				$(this).css("color", "white");
			}, function() {
				$(this).css("cursor", "none");
				$(this).css("color", "blue");
			})

			$('.mr_time_select1').click(function() {
				let room = $("#mr_roomBtn1").text();
				let time = $(this).text();
				$('#mr_room').val(room);
				$('#mr_time').val(time);
				$('#mr_room').attr("type", "text");
				$('#mr_time').attr("type", "text");
				$.ajax({
					type : 'post',
					url : '../reservation/movie_seat.do',
					success : function(res) {
						$('#mr_movie_seat').html(res);
					}
				})
			})
			$('.mr_time_select2').click(function() {
				let room = $("#mr_roomBtn2").text();
				let time = $(this).text();
				$('#mr_room').val(room);
				$('#mr_time').val(time);
				$('#mr_room').attr("type", "text");
				$('#mr_time').attr("type", "text");
				$.ajax({
					type : 'post',
					url : '../reservation/movie_seat.do',
					success : function(res) {
						$('#mr_movie_seat').html(res);
					}
				})
			})

		})
	</script>
</body>
</html>