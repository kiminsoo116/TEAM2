<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기-아이디입력</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.findpass_input-container{
 position: absolute;
width: 770px;
height: 507px;
left: 580px;
top: 285px;

background: #FFFFFF;
box-shadow: 0px 0px 50px rgba(0, 0, 0, 0.35);
border-radius: 10px;

}

.findpass_input-form{
position: absolute;
width: 660px;
height: 410px;
left: 57px;
top: 52px;
}

.findpass_input-login_find{
position: absolute;
width: 600px;
height: 100px;
left: 50px;
top: 10px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 25px;
line-height: 117.69%;
/* or 29px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.findpass_input-find-input-sm{
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

.findpass_input-find-button{
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

.findpass_input-background{
position: absolute;
width: 100%;
height: 100%;
background-image: url("../image/popcorn.jpg");
}

.findpass_input-background-a{
position: absolute;
width: 100%;
height: 100%;


background: linear-gradient(180deg, rgba(47, 47, 47, 0.3) 8.85%, rgba(21, 20, 30, 0.681818) 43.23%, #27243A 81.25%);
}

</style>
</head>
<body>

<div class="findpass_input-background">
	<div class="findpass_input-background-a"></div>
</div>
<div class="findpass_input-container">
    
     <form method=post action="findpass.jsp" class="findpass_input-form">
	     
	       
	         <p class="findpass_input-login_find" width=30% >비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
	         
	         <input type=text name=u_id size=15 class="findpass_input-find-input-sm" width=70%>
	         <input type=submit value="다음" class="findpass_input-find-button">
	         
	        
	       
	      
     </form>
    </div>
  

</body>
</html>