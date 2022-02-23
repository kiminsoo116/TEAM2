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
	<div class="headerDetail">
		<c:set var="vo" value="${vo }"/>
		<img alt="" src="${fn:substring(vo.getM_poster(), 0, vo.getM_poster().lastIndexOf('?'))}" style="width:100%; height:100%">
	</div>
</body>
</html>