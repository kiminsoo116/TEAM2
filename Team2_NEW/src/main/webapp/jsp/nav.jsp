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
         <a href="#"><img src="../image/logo.png">
      </button>
      <ul>
         <button class="signin" style="color: white">
            <a href="#">회원가입</a>
         </button>
         <button class="login" style="color: white">
            <a href="#">로그인</a>
         </button>
         <form class="search-container">
            <input type="text" id="search-bar" placeholder="  검색할 내용을 입력해 주세요.">
            <a href="#"><img class="search-icon"
               src="../image/돋보기.png"></a>
         </form>
      </ul>

   </nav>
</body>
</html>