<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css" >
</head>
<body>
	<c:if test="${sessionScope.u_id==null }">
	<nav class="navi">
      <button type="button">
         <a href="../jsp/main.do"><img src="../image/logo.png"></a>
      </button>
         <form class="search-container">
            <input type="text" id="search-bar" placeholder="  검색할 내용을 입력해 주세요.">
            <img class="search-icon"
               src="../image/돋보기.png" href="#">
         </form>
      
         <button class="signin" style="color: white">
            <a href="../join/join.jsp">회원가입</a>
         </button>
         <button class="login" style="color: white" >
            <a href="../log/loginwindow.jsp">로그인</a>
         </button>
      
    </nav>
	</c:if>
	
	<c:if test="${sessionScope.u_id!=null }">
	
	<nav class="navi">
      <button type="button">
         <a href="../jsp/main.do"><img src="../image/logo.png"></a>
      </button>
         <form class="search-container">
            <input type="text" id="search-bar" placeholder="  검색할 내용을 입력해 주세요.">
            <img class="search-icon"
               src="../image/돋보기.png" href="#">
         </form>
      
      
         <button class="signin" style="color: white">
            <a href="../log/logout.do">로그아웃</a>
         </button>
      
         <button class="login" style="color: white" >
            <a href="#">마이페이지</a>
         </button>
      </nav>
      
     </c:if>
</body>
</html>