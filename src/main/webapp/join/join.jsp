<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
   <c:when test="${result='ALL' }">
   <script>
    alert("모든 내용을 입력하세요!!");
    history.back();
   </script>
  </c:when>
  <c:when test="${result='NOPW' }">
   <script>
    alert("비밀번호가 일치하지 않습니다!!");
    history.back();
   </script>
  </c:when>
  <c:when test="${result='YESPW' }">
   <script>
    alert("비밀번호가 일치합니다!!");
    history.back();
   </script>
  </c:when>
  
  
  <c:otherwise>
    <c:redirect url="../jsp/main.do"/>
  </c:otherwise> 
  
</c:choose>
