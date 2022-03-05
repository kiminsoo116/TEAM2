<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/style5.css" >

</head>
<body>
<div class="loginwindow-background">
	<div class="loginwindow-background-a"></div>
</div>
  <div class="loginwindow-container">
	       <div class="loginwindow-image">
	       
    	<form method="post" action="../log/login.do" class="loginwindow_form">
	     
	         <p class="loginwindow-login" width=30% >아이디</p>
	         <input type=text name=u_id size=15 class="loginwindow-input" width=70%>
	         
	         <p class="loginwindow-password" width=30%>비밀번호</p>
	         <input type=password name=u_pw size=15 class="loginwindow-input2" width=70%>
	         <input type=submit value="로그인" class="loginwindow-button2">
    	</form>
	        
	 <span class="loginwindow-findid"><a href="../find/findid.jsp">아이디찾기</a></span>
	 <span class="loginwindow-findpass"><a href="../find/findpass.jsp">비밀번호찾기</a></span>
	 
	         <p class="loginwindow-text">무빗을 처음 이용하시나요?</p>
	         
	 <form method="post" action="../join/joinwindow.jsp" class="loginwindow_form2">
	         <input type=submit value="회원가입하기" class="loginwindow-button" >
	 </form>     
    </div>
  
</body>
</html>






