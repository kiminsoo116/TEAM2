<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
	<div class="row">
		<table class="table">
			<tr>
				<%-- 포스터 --%>
				<td width=30% class="text-center" rowspan="3"><img
					src="${fn:substring(vo.getM_poster(), 0, vo.getM_poster().lastIndexOf('?')) }"
					width=100%></td>
				<%-- 제목 --%>
				<td><h2>${vo.m_title }</h2></td>
			</tr>
			<tr>
				<%-- 개봉일 , 장르 , 영화시간 --%>
				<td>${fn:substring(vo.m_rdate,0,12) }&nbsp;ㆍ&nbsp;${vo.m_time }&nbsp;ㆍ&nbsp;${fn:replace(vo.m_genre,",","/") }</td>
			</tr>
			<tr>
				<%-- 예매율 , 누적관계수 --%>
				<td>${vo.m_rate }%<sub>예매율</sub>&nbsp;ㆍ&nbsp;${vo.m_cnt }<sub>누적관계수</sub></td>
			</tr>
		</table>
	</div>
	<div class="row">
		<div class="col-sm-7">
			<table class="table">
				<tr>
					<%-- 감독 --%>
					<td width=20% style="color: gray;">감독</td>
					<td width=80%>${vo.m_director }</td>
				</tr>
				<tr>
					<%--출연진 --%>
					<td width=20% style="color: gray;">출연진</td>
					<td width=80%>${vo.m_cast }</td>
				</tr>
				<tr>
					<%-- 줄거리 --%>
					<td width=20% style="color: gray;">줄거리</td>
					<td width=80%>${vo.m_content }</td>
				</tr>
			</table>
		</div>
		<div class="col-sm-5">
			<table class="table">
				<tr>
					<td>
						<%-- 리뷰 별점 --%> <img src="12341.png"
						style="width: 200px;height=15px;">
					</td>
				</tr>
				<tr>
					<td>
						<%-- 리뷰 내용 --%> <textarea rows="10" cols="30" name=""></textarea>
					</td>
				</tr>
				<tr>
					<td class="text-right" colspan="4">
						<%-- 예매하기 , 찜하기 , 리뷰작성 버튼 --%> <a href="#"
						class="btn btn-xs btn-success">예매하기</a> <a href="#"
						class="btn btn-xs btn-danger">찜하기</a> <a href="#"
						class="btn btn-xs btn-info">리뷰작성</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="row">
		<table class="table">
			<tr>
				<td>갤러리</td>
			</tr>
			<tr>
				<td><c:forTokens var="photo" items="${vo.m_photo }" delims="|">
						<img class="rounded" src="${photo }"
							style="width: 100px; height: 100px">
					</c:forTokens></td>
			</tr>
			<tr>
				<td>동영상</td>
			</tr>
			<tr>
				<td><video autoplay controls loop
						style="height: 200px; width: 200px;">
						<source src="${vo.m_preview }.mp4" type="video/mp4">
					</video></td>
			</tr>
		</table>
	</div>
	<div class="row"></div>
</body>
</html>