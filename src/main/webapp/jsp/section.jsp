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
.myInfo_bu_1{
position:absolute;
width: 150px;
height: 40px;
left: 1450px;
top: 11050px;
font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
background: #573EF2;
border-radius:5px;	
color:white;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="boxofficeTitle">박스 오피스</div>
	<div class="boxofficerank">
		<img class="lefter" src="../image/화살표.png">
		<div class="makeOverflow">
			<c:forEach var="m" items="${list}" varStatus="st">
				<div class="oneRank">
					<a href="../movie/movie_detail_before.do?no=${m.m_no }">
						<div class="poster">
							<img alt="" src="${m.m_poster}" class="ranks">
							<p class="rankNum">${st.count}</p>
						</div>
						<p class="rankTitle">${m.m_title}</p>
						<p class="rankRate">예매율 ${m.m_rate}% | ${m.m_director}</p>
					</a>
				</div>
			</c:forEach>
		</div>

		<img class="righter" src="../image/화살표2.png">
	</div>

	<script type="text/javascript"
		src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.makeOverflow').slick({
				prevArrow : $(".lefter"),
				nextArrow : $(".righter"),
				infinite : true,
				speed : 300,
				slidesToShow : 4,
				slidesToScroll : 1
			});
		});
	</script>

	<div class="banner"></div>
	<p>
	<p>
	<div class="moviearray">
		<div class="moviemenu">
			<span class="movies"> 
				<input type="button" value="현재 상영작" class="moviessort" id="premovie"> 
				<input type="button" value="상영 예정작" class="moviessort" id="willmovie"> 
				<input type="button" value="보고싶어요" class="filtersort" id="likeBtn">
				<span class="divider">|</span> 
				<input type="button" value="평점순" class="filtersort" id="gradeBtn">
			</span>
		</div>
		<div class="row">
			<c:forEach var="m" items="${list2 }">
			<div class="col-sm-3">
				<div class="column">
					<a href="../movie/movie_detail_before.do?no=${m.m_no }">
						<div class="MV_Array">
							<img
							src="${fn:substring(m.getM_poster(), 0, m.getM_poster().lastIndexOf('?'))}">
					</div>
					<p class="rankTitle1">${m.m_title}</p>
					<p class="rankRate1">예매율 ${m.m_rate}% | ${m.m_director}</p>
				</a>
			</div>
		</div>
	</c:forEach>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {
			$('.moviessort').mouseover(function(){
				$(this).css('color','black');
				$(this).css('text-decoration', 'underline');
			})
			$('.moviessort').mouseout(function() {
				$(this).css('color','rgb(129,126,126)');
				$(this).css('text-decoration', 'none');
			})
			$('.filtersort').mouseover(function(){
				$(this).css('color','black');
				$(this).css('text-decoration', 'underline');
			})
			$('.filtersort').mouseout(function() {
				$(this).css('color','rgb(39,36,58)');
				$(this).css('text-decoration', 'none');
			})
			$('#premovie').click(function() {
				$.ajax({
					type:'post',
					url:'../jsp/movie_sort1.do',
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
					url:'../jsp/movie_sort4.do',
					success:function(res) {
						$('.row').html(res);
					}
				})
			})
			$('#gradeBtn').click(function() {
				$.ajax({
					type:'post',
					url:'../jsp/movie_sort3.do',
					success:function(res) {
						$('.row').html(res);
					}
				})
			})
		})
	</script>
	
	<div class="banner1"></div>
	<div class="row1">
		<h2>최근 검색 영화</h2>
		<c:forEach var="m" items="${cList }" varStatus="s">
			<div class="col-sm-3">
				<div class="column">
					<c:if test="${s.index<4 }">
						<a href="../movie/movie_detail.do?no=${m.m_no }">
							<div class="MV_Array">
								<img
									src="${fn:substring(m.getM_poster(), 0, m.getM_poster().lastIndexOf('?'))}">
							</div>
							<p class="rankTitle1">${m.m_title}</p>
							<p class="rankRate1">예매율 ${m.m_rate}% | ${m.m_director}</p>
						</a>
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
	 <a href="../jsp/cookie_delete.do"><input type=submit class="myInfo_bu_1" value="쿠키삭제"></a>
</body>
</html>