<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css" >
</head>
<body>
<nav class="navi">
      <button type="button">
         <a href="../jsp/main.do"><img src="../image/logo.png"></a>
      </button>
      
         <form class="search-container">
            <input type="text" id="search-bar" placeholder="  검색할 내용을 입력해 주세요.">
            <img class="search-icon"
               src="../image/돋보기.png" href="#">
         </form>
      
         <button class="signin" style="color: white" href="#">
            회원가입
         </button>
         <button class="login" style="color: white" href="#">
            로그인
         </button>
      

   </nav>
</body>
</html>