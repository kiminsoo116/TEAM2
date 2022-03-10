<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/style4.css">
<link rel="stylesheet" href="../css/style1.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
a:link{color: black; text-decoration: none;}
a:visited{color: black; text-decoration: none;}
a:hover{color: white; text-decoration: none;}
.my_Review_title{
position:relative;
width: 400px;
height: 26px;
left: 45px;
top: -250px;

font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 22px;
line-height: 26px;
/* identical to box height */


color: #000000;
}

.my_Review_comend{
position:relative;
width: 741px;
height: 288px;
left: 260px;
top: -220px;
font-size: 15pt;
line-height: 25px;	
overflow: auto;
background:white;
	
}
.CrossLine1{
position: relative;
width: 966px;
height: 0px;
left: 38px;
top: -207px;

border: 0.75px solid #EAEAEA;
}
.CrossLine2{
position: relative;
width: 966px;
height: 0px;
left: 38px;
top: 95px;

border: 0.75px solid #EAEAEA;
}
.my_Review_Score{
position:relative;
width: 50px;
height: 40px;
font-family: 'Noto Sans KR', sans-serif;
font-size: 18pt;
font-weight: 700;
left: 910px;
top: -25px;
color: #573EF2;

}
.my_Review_Modify{
position:relative;
width: 70px;
height: 22px;
left: 760px;
top: -176px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 19px;
line-height: 22px;

color: #573EF2;	
}
.my_Review_Delete
{
position:relative;
width: 35px;
height: 22px;
left: 795px;
top: -176px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 19px;
line-height: 22px;

color: #573EF2;	
}

</style>

</head>
<body>
	<jsp:include page="../jsp/header.jsp"></jsp:include>
	<div class="container">
		<div class="mypage_menu">
			<a href="../mypage/reservation.do"><button id="btn1-menu" class="menu_btn">예매내역</button></a>
			<a href="../mypage/myreview.do"><button id="btn2-menu" class="menu_btn" style="background:#573EF2; color:white">내가 쓴 리뷰</button></a>
			<a href="../mypage/wish.do"><button id="btn3-menu" class="menu_btn">찜한 목록</button></a>
			<a href="../mypage/myinfo.do"><button id="btn4-menu" class="menu_btn">개인정보 수정</button></a>
		</div>
		<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	<script type="text/javascript">
	   let i=0;	
		$(function() {
			$('.menu_btn').mouseover(function(){
				$(this).css('background','#573EF2');
				$(this).css('color','white');			
			})
			$('.menu_btn').mouseout(function() {
				$(this).css('background','white');
				$(this).css('color', 'black');
				$('#btn2-menu').css('background','#573EF2')
				$('#btn2-menu').css('color','white')
			})			
		
	 	$('#updbtn1').click(function(){
	 		if(i==0){
	 			$('#update1').show();
	 			$('#r_score').hide();
	 			$('#crossline3').hide();
	 			$('#updbtn').hide();
	 			$('#delbtn').hide();
	 		}
	 	})	
	})

	</script>
		<div class="mypage_section">
			<div class="movie_reservation">


				<div>
					<c:forEach var="r" items="${list}" varStatus="m">
					<c:if test="${m.index<=3 }">
						<div class="my_Review_Area">
						<div><img class="my_Review_poster" src="${fn:substring(r.getM_poster(), 0, r.getM_poster().lastIndexOf('?'))}"></div>
						<div class="CrossLine1"></div>
						<div class="my_Review_title">${r.m_title}
						<p class="my_Review_Score">★ ${r.r_score }</p>
						</div>
						<div class="CrossLine2"></div>
						<div class="my_Review_comend">
						<p class="mrcomend">${r.r_comend}</p>
						</div>
						<a class="my_Review_like" href="../movie/likePlus.do">좋아요 개</a>						
						<a id="updbtn1"><span class="my_Review_Modify">수정하기</span></a>		
						<a href="../mypage/deletereview.do?r_no=${r.r_no}"><span class="my_Review_Delete">삭제</span></a>
						<div style="display:none" id="update1" class="reviewReInsert1">
						<form method="post" action="../mypage/updateReview.do" enctype="multi">
						<select name="r_score">
							<option>눌러서 별점을 입력해주세요!  </option>
							<option value="1.0">★점</option>
							<option value="2.0">★★점</option>
							<option value="3.0">★★★점</option>
							<option value="4.0">★★★★점</option>
							<option value="5.0">★★★★★점</option>	
							</select>
						<div class="com_area1">
						<textarea id="r_comend1" rows="5" cols="100" name="r_comend"></textarea>
						</div>
						<div class="CrossLine4"></div>
						<input type="hidden" name="no" value="${r.getM_no() }">
						<input type="hidden" name="r_no" value="${r.getR_no() }">
						<button class="resubmit" type="submit" onclick="javascript:history.go(0)" style="color:white">수정하기</button>		
						</form>		
						</div>
						</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
</div>
<c:set var="page" value="${(empty param.p)?1:param.p}"/>
	<c:set var="count" value="${count}"/>
	<c:set var="startNum" value="${page-(page-1)%5}"/>
	<c:set var="lastNum" value="${Math.ceil(count/4)}"/>
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
	
</body>
</html>