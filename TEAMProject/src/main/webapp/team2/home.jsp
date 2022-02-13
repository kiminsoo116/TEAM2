<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<article class="articleback">
		<div class="boxofficerank">
		<img class="lefter" src="../image/화살표.png">
		<img class="righter" src="../image/화살표2.png">
		<div class="firstpage">
			<div class="ranks"></div>
			<div class="ranks"></div>
			<div class="ranks"></div>
			<div class="ranks"></div>
		</div>
		</div>
		<div class="banner"></div>
		<div class="moviearray">
			<div class="moviemenu">
				<div class="movies"><a href="#">현재 상영작</a></div>
				<div class="movies"><a href="#">상영 예정작</a></div>
				<div class="filter"><a href="#">보고싶어요</a></div>
				<div class="divider">|</div>
				<div class="filter"><a href="#">평점순</a></div>
				<div class="divider">|</div>
				<div class="filter"><a href="">예매율순</a></div>
			</div>
			<jsp:include page="movielist.jsp"></jsp:include>
		</div>
	</article>
</body>
</html>