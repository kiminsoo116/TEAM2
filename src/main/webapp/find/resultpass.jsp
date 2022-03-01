<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 결과</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.resultid-container{
 position: absolute;
width: 770px;
height: 507px;
left: 580px;
top: 285px;

background: #FFFFFF;
box-shadow: 0px 0px 50px rgba(0, 0, 0, 0.35);
border-radius: 10px;

}

.resultid-form2{
position: absolute;
width: 270px;
height: 50px;
left: 410px;
top: 369px;
}

.resultid-title{
position: absolute;
width: 600px;
height: 100px;
left: 154px;
top: 20px;

font-family: Roboto;
font-style: normal;
font-weight: 800;
font-size: 25px;
line-height: 117.69%;
/* or 29px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.resultid-find-input-sm{
position: absolute;
width: 630px;
height: 47px;
left: 10px;
top: 150px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;
}

.resultid-find-button{
position: absolute;
width: 149px;
height: 60px;
left: 250px;
top: 300px;

background: #573EF2;
border-radius: 10px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 25px;
line-height: 117.69%;
/* or 29px */

display: center;
align-items: flex-end;
letter-spacing: 0.1em;

color: #FFFFFF;
}

.resultid-background{
position: absolute;
width: 100%;
height: 100%;
background-image: url("../image/popcorn.jpg");
}

.resultid-login{
position: absolute;
width: 265px;
height: 47px;
left: 0px;
top: 0px;

background: #573EF2;
border-radius: 10px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: center;
align-items: flex-end;

color: #FFFFFF;
}

.resultid-form1{
position: absolute;
width: 265px;
height: 47px;
left: 90px;
top: 370px;
}

.resultid-pw{
position: absolute;
width: 265px;
height: 47px;
left: 0px;
top: 0px;

border: 1.45px solid #573EF2;
box-sizing: border-box;
border-radius: 10px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: center;
align-items: flex-end;

color: #573EF2;

}

.resultid-radio{
position: absolute;
width: 25px;
height: 25px;
left: 140px;
top: 200px;

background: #FFFFFF;
border: 2px solid #7D7C89;
box-sizing: border-box;
}
.resultid-background-a{
position: absolute;
width: 100%;
height: 100%;


background: linear-gradient(180deg, rgba(47, 47, 47, 0.3) 8.85%, rgba(21, 20, 30, 0.681818) 43.23%, #27243A 81.25%);
}

.resultid{
position: absolute;
width: 400px;
height: 80px;
left: 250px;
top: 194px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 30px;
line-height: 117.69%;

display: center;
align-items: flex-end;

color: #27243A;
}

</style>
</head>
<body>

<div class="resultid-background">
	<div class="resultid-background-a"></div>
</div>
<div class="resultid-container">

	 <p class="resultid-title" width=30% >고객님의 정보와 일치하는 비밀번호입니다.</p>
	 <input type=radio value="아이디" name=id class="resultid-radio">
	 <p class="resultid" width=30%>${sessionScope.u_pw }</p>
	         
     <form method="post" action="../log/loginwindow.jsp" class="resultid-form1">
	         <input type=submit value="로그인 하기" class="resultid-login" >
	 </form>
	 
	 <form method="post" action="../find/findpass.jsp" class="resultid-form2">
	         <input type=submit value="비밀번호 찾기" class="resultid-pw">
	 </form>        
	        
</div>
  
</body>
</html>