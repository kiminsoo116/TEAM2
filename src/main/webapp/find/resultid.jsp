<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 결과</title>
<link rel="stylesheet" href="../css/style5.css" >

</head>
<body>

<div class="resultid-background">
	<div class="resultid-background-a"></div>
</div>
<div class="resultid-container">
    
	         <p class="resultid-title" width=30% >고객님의 정보와 일치하는 아이디입니다.</p>
	         <p class="resultid" width=30%>${sessionScope.u_id }</p>
	         
     <form method="post" action="../log/loginwindow.jsp" class="resultid-form">
	         <input type=radio value="아이디" name=id class="resultid-radio">
	         <input type=submit value="로그인 하기" class="resultid-login" >
	 </form>
	 
	 <form method="post" action="../find/findpass.jsp" class="resultid-form2">
	         <input type=submit value="비밀번호 찾기" class="resultid-findpw">
	 </form>        
	      
</div>
  
</body>
</html>