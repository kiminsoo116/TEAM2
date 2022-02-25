<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.join-container{
   position: absolute;
width: 854px;
height: 1330px;
left: 520px;
top: 240px;

background: #FFFFFF;
box-shadow: 0px 0px 50px rgba(0, 0, 0, 0.35);
border-radius: 10px;
}

.join-form{
position: absolute;
width: 696px;
height: 1084px;
left: 77px;
top: 330px;
}

.join-image{
position: absolute;
width: 334px;
height: 112px;
left: 270px;
top: 120px;

background: url(../image/logo_resize.png);
}

.join-login{
position: absolute;
width: 100px;
height: 24px;
left: 3px;
top: 0px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input-sm{
position: absolute;
width: 696px;
height: 40px;
left: 3px;
top: 25px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-password{
position: absolute;
width: 100px;
height: 24px;
left: 3px;
top: 90px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input-sm2{
position: absolute;
width: 696px;
height: 40px;
left: 3px;
top: 119px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-password2{
position: absolute;
width: 200px;
height: 24px;
left: 3px;
top: 180px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input-sm3{
position: absolute;
width: 696px;
height: 40px;
left: 3px;
top: 210px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-name{
position: absolute;
width: 200px;
height: 24px;
left: 3px;
top: 270px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input-sm4{
position: absolute;
width: 696px;
height: 40px;
left: 3px;
top: 300px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-nick{
position: absolute;
width: 200px;
height: 24px;
left: 3px;
top: 365px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input-sm5{
position: absolute;
width: 465px;
height: 40px;
left: 3px;
top: 396px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-nick-confirm{
position: absolute;
width: 222px;
height: 40px;
left: 476px;
top: 396px;

background: #573EF2;
border-radius: 5px;

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

.join-birth{
position: absolute;
width: 200px;
height: 24px;
left: 3px;
top: 460px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input-sm6-1{
position: absolute;
width: 226px;
height: 40px;
left: 3px;
top: 493px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-input-sm6-2{
position: absolute;
width: 226px;
height: 40px;
left: 240px;
top: 493px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-input-sm6-3{
position: absolute;
width: 226px;
height: 40px;
left: 476px;
top: 493px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-sex{
position: absolute;
width: 200px;
height: 24px;
left: 3px;
top: 570px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-sex-select{
position: absolute;
width: 390px;
height: 50px;
left: 140px;
top: 568px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 24px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: center;
align-items: flex-end;

color: #27243A;
}

.join-email{
position: absolute;
width: 465px;
height: 40px;
left: 3px;
top: 620px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input-sm7{
position: absolute;
width: 465px;
height: 40px;
left: 3px;
top: 680px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-nick-confirm2{
position: absolute;
width: 222px;
height: 40px;
left: 476px;
top: 680px;

background: #573EF2;
border-radius: 5px;

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

.join-phone{
position: absolute;
width: 465px;
height: 40px;
left: 3px;
top: 740px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.join-input-sm8{
position: absolute;
width: 465px;
height: 40px;
left: 3px;
top: 800px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-nick-confirm3{
position: absolute;
width: 222px;
height: 40px;
left: 476px;
top: 800px;

background: #573EF2;
border-radius: 5px;

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

.join{
position: absolute;
width: 335px;
height: 40px;
left: 4px;
top: 900px;

background: #573EF2;
border-radius: 5px;

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

.join-delete{
position: absolute;
width: 335px;
height: 40px;
left: 365px;
top: 900px;

border: 1.45px solid #573EF2;
box-sizing: border-box;
border-radius: 5px;

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

.join-background{
position: absolute;
width: 100%;
height: 2200px;
background-image: url("../image/movie-theater2.jpg");
}

.join-background-a{
position: absolute;
width: 100%;
height: 100%;


background: linear-gradient(180deg, rgba(47, 47, 47, 0.3) 8.85%, rgba(21, 20, 30, 0.681818) 43.23%, #27243A 81.25%);
}


</style>
</head>
<body>


<div class="join-background">
 <div class="join-background-a"></div>
</div>
    <div class="join-container">
     	<div class="join-image"></div>
    
     <form method=post action="join_ok.jsp" class="join-form">
     
	     
	         <p class="join-login" width=30% >아이디</p>
	         <input type=text name=id size=15 class="join-input-sm" width=70%>
	         
	         <p class="join-password" width=30%>비밀번호</p>
	         <input type=password name=pwd size=15 class="join-input-sm2" width=70%>
	         
	         <p class="join-password2" width=30%>비밀번호 재확인</p>
	         <input type=password name=pwd size=15 class="join-input-sm3" width=70%>
	         
	         <p class="join-name" width=30%>이름</p>
	         <input type=password name=pwd size=15 class="join-input-sm4" width=70%>
	         
	         <p class="join-nick" width=30%>닉네임</p>
	         <input type=password name=pwd size=15 class="join-input-sm5" width=70%>
	         <input type=submit value="중복 확인" class="join-nick-confirm" >
	         
	         <p class="join-birth" width=30%>생년월일</p>
	         <input type=password name=pwd size=15 class="join-input-sm6-1" width=70%>
	         <input type=password name=pwd size=15 class="join-input-sm6-2" width=70%>
	         <input type=password name=pwd size=15 class="join-input-sm6-3" width=70%>
	         
	         <p class="join-sex" width=30%>성별</p>
	         <div class="join-sex-select">
         			<input type=radio value="남자" checked name=sex >남자
         			<input type=radio value="여자" name=sex>여자
         	 </div>
        	 
       		 <p class="join-email" width=30%>본인 확인 이메일 주소</p>
	         <input type=password name=pwd size=15 class="join-input-sm7" width=70%>
	         <input type=submit value="중복 확인" class="join-nick-confirm2" >
	         
	         <p class="join-phone" width=30%>휴대전화 번호</p>
	         <input type=password name=pwd size=15 class="join-input-sm8" width=70%>
	         <input type=submit value="중복 확인" class="join-nick-confirm3" >
	         
	         <input type=submit value="가입하기" class="join" >
	         <input type=submit value="취소하기" class="join-delete">
	         
	        
	       
	      
     </form>
    </div>
</body>
</html>







