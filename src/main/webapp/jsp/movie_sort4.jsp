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
	<c:forEach var="m" items="${list5 }">
		<div class="col-sm-3">
			<div class="column">
				<a href="../movie/movie_detail_before.do?no=${m.m_no }">
					<div class="MV_Array">
						<img
							src="${fn:substring(m.getM_poster(), 0, m.getM_poster().lastIndexOf('?'))}">
					</div>
					<p class="rankTitle1">${m.m_title}</p>
					<p class="rankRate1">찜갯수 ${m.getCoumoive()} 개 | ${m.m_director}</p>
				</a>
			</div>
		</div>
	</c:forEach>
</body>
</html>