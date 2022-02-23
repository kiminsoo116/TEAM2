<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:set var="vo" value="${vo }"/>
	<img class="poster_detail" alt="" src="${fn:substring(vo.getM_poster(), 0, vo.getM_poster().lastIndexOf('?'))}">
	
	<div class="backDetail">
	</div>
	<div class="graybox"></div>
 	<div class="posterDisc">
		<p class="titleDisc">${vo.getM_title() }</p>
		<p class="subDisc">${vo.getM_rdate() } | ${vo.getM_genre() }</p>
		<p class="subDisc">누적 ${vo.getM_cnt() } 관람</p>
	</div>
	
	<span class="detailDisc">
		<h3>기본 정보</h3>
		<div class="dDfirst">
			<p>${vo.getM_title() }</p>
			<p>${vo.getM_rdate() }    |    ${vo.getM_genre() }</p>
			<p>${vo.getM_time() }    |    예매율 ${vo.getM_rate() }%</p>
		</div>
		<div class="dDsecond">
			<p>${vo.getM_content() }</p>
		</div>
		<div class="dDthird">
			<p>감독 : ${vo.getM_director() }</p>
			<p>배우 : ${vo.getM_cast() }</p>
		</div>
		<div class="crossline1"></div>
	</span> 
	<span class="buttons">
		<img alt="" src="../image/광고.png">
		 <button class="reviewWrite" href="#">
            리뷰 작성하기
         </button>
		 <button class="JJim" href="#">
            찜
         </button>
		 <button class="reserve" href="#">
            예매하기
         </button>
	</span>
	<div class="medias">
		<h3 class="gallery">갤러리</h3>
		<div class="G_makeOverflow">
			<c:forTokens var="photo" items="${vo.getM_photo() }" delims="|">
				<a href="${photo }"><img class="photos" src="${photo }" ></a>
			</c:forTokens>
		</div>
		<h3 class="video">동영상</h3>
		<div class="V_position">
		<a href="${vo.getM_preview() }">
			<video autoplay controls loop style="height: 200px;width:300px;">
                  <img src="${vo.getM_preview() }">
            </video>
        </a>
		</div>
	</div>
</body>
</html>