<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 결과</title>
<link rel="stylesheet" href="../css/style5.css" >

</head>
<body>

<div class="resultpw-background">
	<div class="resultpw-background-a"></div>
</div>
<div class="resultpw-container">

	 <p class="resultpw-title" width=30% >고객님의 정보와 일치하는 비밀번호입니다.</p>
	 <input type=radio value="아이디" name=id class="resultpw-radio">
	 <p class="resultpw" width=30%>${sessionScope.u_pw }</p>
	         
     <form method="post" action="../log/loginwindow.jsp" class="resultpw-form1">
	         <input type=submit value="로그인 하기" class="resultpw-login" >
	 </form>
	 
	 <form method="post" action="../find/findpass.jsp" class="resultpw-form2">
	         <input type=submit value="비밀번호 찾기" class="resultpw-pw">
	 </form>        
	        
</div>
  
</body>
</html>