<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
  <c:when test="${result=='NOPWD' }">
    <script>
    alert("비밀번호를 다시 입력하세요!!");
    history.back();
   </script>
  </c:when>
  <c:otherwise>
    <c:redirect url="../jsp/main.do"/>
  </c:otherwise>
</c:choose>