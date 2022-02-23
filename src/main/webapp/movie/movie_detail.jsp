<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sist.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header_detail.jsp"></jsp:include>
<jsp:include page="section_detail.jsp"></jsp:include>

<%-- 					src="${fn:substring(vo.getM_poster(), 0, vo.getM_poster().lastIndexOf('?')) }"
 				<td>${fn:substring(vo.m_rdate,0,12) }&nbsp;ㆍ&nbsp;${vo.m_time }&nbsp;ㆍ&nbsp;${fn:replace(vo.m_genre,",","/") }</td>
 		<td>${vo.m_rate }%<sub>예매율</sub>&nbsp;ㆍ&nbsp;${vo.m_cnt }<sub>누적관계수</sub></td>--%>		

</body>
</html>