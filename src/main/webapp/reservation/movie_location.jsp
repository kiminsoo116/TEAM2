<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.mr_select_Btn {
	width: 400px;
	padding: 5px;
	border: 1px solid #573EF2;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
}

.mr_select_Btn::-webkit-scrollbar {
	width: 20px;
}

.mr_select_Btn::-webkit-scrollbar-thumb {
	height: 50%;
	background: #217af4;
	border-radius: 10px;
}

.mr_select_Btn::-webkit-scrollbar-track {
	background: rgba(33, 122, 244, .1);
}
</style>
</head>
<body>
	<select class="mr_select_Btn">
		<c:forEach var="deong" items="${deongList }">
			<option class="mr_deong" value="${deong }">${deong }</option>
		</c:forEach>
	</select>

	<script type="text/javascript">
		$(function() {
			$('.mr_deong').hover(function() {
				$(this).css("cursor", "pointer");
				$(this).css("color", "blue");
			}, function() {
				$(this).css("cursor", "none");
				$(this).css("color", "black");
			})

			$('.mr_select_Btn').click(function() {
				let loc = $('.mr_select_Btn option:selected').text();
				$('#mr_location').val(loc);
				$('#mr_location').attr("type", "text");
				$.ajax({
					type : 'post',
					url : '../reservation/movie_date.do',
					success : function(res) {
						$('#mr_movie_date').html(res);
					}
				})
			})
		})
	</script>
</body>
</html>