<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
  <c:when test="${result=='NONAME' }">
   <script>
    alert("입력하신 정보와 이름이 일치하지 않습니다!");
    history.back();
   </script>
  </c:when>
  <c:when test="${result=='NOEMAIL' }">
    <script>
    alert("입력하신 정보와 맞지않은 이메일입니다!");
    history.back();
   </script>
  </c:when>
  <c:when test="${result=='NOID' }">
    <script>
    alert("입력하신 정보와 아이디가 일치하지 않습니다!");
    history.back();
   </script>
  </c:when>
  <c:otherwise>
    <c:redirect url="../find/resultpass.do"/>
  </c:otherwise>
</c:choose>