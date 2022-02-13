<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<style>
.navi {
	position: absolute;
	width: 100%;
	height: 82px;
	left: 0px;
	z-index: 2;
	background: rgba(39, 36, 58, 0.6);
}

.logo {
	background-image: url(../image/logo.png);
	width: 300px;
	height: 300px;
	position: absolute;
	left: 20px;
	top: 10px;
	background-repeat: no-repeat;
}

.navbar-header {
	background-image: url("../image/logo.png");
	width: 300px;
	height: 300px;
}

.navibar-brand {
	background-image: url("../image/logo.png");
	position: relative;
	width: 191px;
	height: 59px;
	left: 10%;
	top: 20%;
}

.entire {
	width: 100%;
	height: 4000px;
	margin: none;
	background-color: #eeeeee;
}

input {
	font-size: 20px;
	font-weight: 500;
	font-family: 'Noto Sans KR', sans-serif;
}

.login {
	position: absolute;
	width: 80px;
	height: 46px;
	left: 1605px;
	top: 17px;
	border: 1.45px solid rgba(0, 0, 0, 0);
	background-color: rgba(0, 0, 0, 0);
	box-sizing: 70px;
	border-radius: 10px;
	font-weight: 300;
	font-size: 15px;
	line-height: 23px;
}

.login a {
	color: white;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 400;
	text-decoration: none;
}

.signin {
	background-color: rgba(0, 0, 0, 0);
	position: absolute;
	width: 134px;
	height: 46px;
	left: 1713px;
	top: 17px;
	border: 1.45px solid #FDFEFE;
	box-sizing: border-box;
	border-radius: 10px;
	font-weight: 300;
	font-size: 20px;
	line-height: 23px;
}

.signin a {
	font-family: 'Noto Sans KR', sans-serif;
	color: white;
	font-weight: 400;
	text-decoration: none;
}

nav button {
	position: absolute;
	left: 30px;
	top: 15px;
	border: none;
	background-color: rgba(0, 0, 0, 0);
}

.graybox {
	position: relative;
	width: 100%;
	height: 580px;
	margin: 0px auto;
	background: rgba(40, 40, 40, 0.48);
}

.headerpic {
	position: relative;
	width: 100%;
	height: 580px;
	margin: 0px auto;
	background-image: url("../image/movie.jpg");
	z-index: 1;
}

.search {
	left: 500px;
}

.search-container {
	width: 490px;
	display: block;
	margin: 0 auto;
	color: #ffffff;
	background-color: rgba(0,0,0,0);
	position: absolute;
	width: 450px;
	height: 46px;
	left: 1059px;
	top: 17px;
	
}

input#search-bar {
	margin: 0 auto;
	width: 100%;
	height: 45px;
	padding: 0 20px;
	font-size: 1rem;
	border: 1px solid #D0CFCE;
	outline: none;
	background-color: rgba(0,0,0,0);
}

.search-icon {
	position: relative;
	float: right;
	width: 28px;
	height: 28px;
	top: -38px;
	right: -32px;
	
}
</style>
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
				<input type="text" id="search-bar" placeholder="검색할 내용을 입력해 주세요.">
				<a href="#"><img class="search-icon"
					src="../image/돋보기.png"></a>
			</form>
		</ul>

	</nav>
	<header class="headerpic">
		<div class="graybox"></div>
	</header>

</body>
</html>