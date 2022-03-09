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
			<button id="btn1-menu" class="menu_btn"><a href="../mypage/reservation.do">예매내역</a></button>
			<button id="btn2-menu" class="menu_btn"><a href="../mypage/myreview.do">내가 쓴 리뷰</a></button>
			<button id="btn3-menu" class="menu_btn"><a href="../mypage/wish.do">찜한 목록</a></button>
			<button id="btn4-menu" class="menu_btn"><a href="../mypage/myinfo.do">개인정보 수정</a></button>
		</div>

		<div class="mypage_section">
			<div class="zzims">
			<c:forEach var="m" items="${list}"> 
				<div class="zzim">
					<div><img class="zzim_poster" src="${fn:substring(m.getM_poster(), 0, m.getM_poster().lastIndexOf('?'))}"/></div>
					<div class="zzim_detail">
						<div>${m.m_title}</div>
						<div>${m.m_rdate }</div>
					</div>
				</div>
			</c:forEach>
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



	<script type="text/javascript">
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
	</script>
	
</body>
</html>