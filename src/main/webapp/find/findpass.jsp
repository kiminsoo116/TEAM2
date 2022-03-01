<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.findpass-container{
position: absolute;
width: 1000px;
height: 650px;
left: 540px;
top: 222px;

background: #FFFFFF;
box-shadow: 0px 0px 50px rgba(0, 0, 0, 0.35);
border-radius: 10px;

}

.findpw-form1{
position: absolute;
width: 950px;
height: 400px;
left: 4px;
top: 0px;
}
.findpass-form2{
position: absolute;
width: 950px;
height: 300px;
left: 4px;
top: 410px;
}

.findpass-login_findpass{
position: absolute;
width: 600px;
height: 50px;
left: 50px;
top: 50px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 25px;
line-height: 117.69%;
/* or 29px */

display: flex;
align-items: flex-end;
text-align: center;

color: #27243A;

}

.findpass-phonenumber{
position: absolute;
width: 18px;
height: 18px;
left: 50px;
top: 150px;

background: #FFFFFF;
border: 2px solid #7D7C89;
box-sizing: border-box;
}

.findpass-email{
position: absolute;
width: 18px;
height: 18px;
left: 50px;
top: 40px;

background: #FFFFFF;
border: 2px solid #7D7C89;
box-sizing: border-box;
}

.findpass-phonenumber_text{
position: absolute;
width: 400px;
height: 24px;
left: 100px;
top: 150px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;

}

.findpass-phonenumber_text2{
position: absolute;
width: 800px;
height: 18px;
left: 100px;
top: 190px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 15px;
line-height: 117.69%;
/* identical to box height, or 18px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.findpass-email_text{
position: absolute;
width: 500px;
height: 24px;
left: 100px;
top: 40px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.findpass-email_text2{
position: absolute;
width: 800px;
height: 18px;
left: 100px;
top: 80px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 15px;
line-height: 117.69%;
/* identical to box height, or 18px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.findpass-name{
position: absolute;
width: 70px;
height: 24px;
left: 100px;
top: 250px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;

}

.findpass-input-pass1{
position: absolute;
width: 500px;
height: 40px;
left: 200px;
top: 242px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;
}

.findpass-phone{
position: absolute;
width: 100px;
height: 24px;
left: 100px;
top: 330px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.findpass-input-pass2{
position: absolute;
width: 500px;
height: 40px;
left: 200px;
top: 322px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;
}

.findpass-input-pass3{
position: absolute;
width: 600px;
height: 40px;
left: 100px;
top: 140px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;
}

.findpass-find-button{
position: absolute;
width: 183px;
height: 40px;
left: 735px;
top: 322px;

background: #573EF2;
border-radius: 10px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: center;
align-items: flex-end;

color: #FFFFFF;
}

.findpass-find-button2{
position: absolute;
width: 183px;
height: 40px;
left: 735px;
top: 140px;

background: #573EF2;
border-radius: 10px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: center;
align-items: flex-end;

color: #FFFFFF;
}

.findpass-line{
position: absolute;
width: 845px;
height: 0px;
left: 80px;
top: 405px;

border: 1px solid rgba(0, 0, 0, 0.15);
}

.findpass-background{
position: absolute;
width: 100%;
height: 100%;
background-image: url("../image/movie-theater.jpg");
}

.findpass-background-a{
position: absolute;
width: 100%;
height: 100%;


background: linear-gradient(180deg, rgba(47, 47, 47, 0.3) 8.85%, rgba(21, 20, 30, 0.681818) 43.23%, #27243A 81.25%);
}


</style>
</head>
<body>

    <div class="findpass-background">
    	<div class="findpass-background-a"></div>
    </div>
<div class="findpass-container">
    
	         <p class="findpass-login_findpass" width=30% >비밀번호를 찾을 방법을 선택해 주세요.</p>
	         
	        <form class="findpw-form1" method=post action=".jsp">
         				<input type=radio value="휴대전화" name=sex class="findpass-phonenumber">
         				<p class="findpass-phonenumber_text">회원정보에 등록한 휴대전화 번호로 찾기</p>
         				<p class="findpass-phonenumber_text2">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야 회원 정보를 찾을 수 있습니다.</p>
         				
         				<p class="findpass-name" width=30% >이름</p>
         				<input type=text name=name size=15 class="findpass-input-pass1" width=70%>
         				
         				<p class="findpass-phone" width=30% >휴대전화</p>
         				<input type=password name=pwd size=15 class="findpass-input-pass2" width=70%>
         				<input type=submit value="번호로 찾기" class="findpass-find-button" >
         				
         	</form>		
         	
         	<div class="findpass-line"></div>
         	
         	<form class="findpass-form2" method=post action=".jsp">
         				<input type=radio value="이메일" name=sex class="findpass-email">
         				<p class="findpass-email_text">회원정보에 등록한 이메일 주소로 찾기</p>
         				<p class="findpass-email_text2">회원정보에 등록한 이메일 주소와 입력한 이메일 주소가 같아야 회원 정보를 찾을 수 있습니다.</p>
         				
         				<input type=text name=email size=15 class="findpass-input-pass3" width=70%>
         				<input type=submit value="메일로 찾기" class="findpass-find-button2" >
         	</form>		
	        

</div>

</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.findpw-container {
    position: absolute;
    width: 1000px;
    height: 845px;
    left: 540px;
    top: 150px;
    background: #FFFFFF;
    box-shadow: 0px 0px 50px rgb(0 0 0 / 35%);
    border-radius: 10px;
}

.findpw-form1{
position: absolute;
width: 950px;
height: 420px;
left: 4px;
top: 0px;
}
.findpass-form2{
position: absolute;
width: 950px;
height: 370px;
left: 4px;
top: 445px;
}

.findpw-title{
position: absolute;
width: 600px;
height: 50px;
left: 50px;
top: 50px;

font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 25px;
line-height: 117.69%;
/* or 29px */

display: flex;
align-items: flex-end;
text-align: center;

color: #27243A;

}

.findid-phonenumber{
position: absolute;
width: 18px;
height: 18px;
left: 50px;
top: 150px;

background: #FFFFFF;
border: 2px solid #7D7C89;
box-sizing: border-box;

appearance: none;
border-radius: 50%;

}

.findid-email{
position: absolute;
width: 18px;
height: 18px;
left: 50px;
top: 40px;

background: #FFFFFF;
border: 2px solid #7D7C89;
box-sizing: border-box;

appearance: none;
border-radius: 50%
}

.findpw-text{
position: absolute;
width: 400px;
height: 24px;
left: 100px;
top: 142px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;

}

.findpw-text2{
position: absolute;
width: 800px;
height: 18px;
left: 100px;
top: 181px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 15px;
line-height: 117.69%;
/* identical to box height, or 18px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.findpw-text3{
position: absolute;
width: 500px;
height: 24px;
left: 100px;
top: 65px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.findpw-text4{
position: absolute;
width: 800px;
height: 18px;
left: 100px;
top: 105px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 15px;
line-height: 117.69%;
/* identical to box height, or 18px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.findpw-id{
position: absolute;
width: 70px;
height: 24px;
left: 100px;
top: 248px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.findpw-input{
position: absolute;
width: 500px;
height: 40px;
left: 200px;
top: 240px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;
}

.findpw-name{
position: absolute;
width: 70px;
height: 24px;
left: 100px;
top: 310px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;

}

.findpw-input2{
position: absolute;
width: 500px;
height: 40px;
left: 200px;
top: 304px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;
}

.findpw-phone{
position: absolute;
width: 100px;
height: 24px;
left: 100px;
top: 375px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: flex;
align-items: flex-end;

color: #27243A;
}

.findpw-input3{
position: absolute;
width: 500px;
height: 40px;
left: 200px;
top: 366px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;
}

.findpw-input6{
position: absolute;
width: 500px;
height: 40px;
left: 200px;
top: 304px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;
}

.findpw-button{
position: absolute;
width: 183px;
height: 40px;
left: 735px;
top: 366px;

background: #573EF2;
border-radius: 10px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: center;
align-items: flex-end;

color: #FFFFFF;
}

.findpw-button2{
position: absolute;
width: 183px;
height: 40px;
left: 735px;
top: 304px;

background: #573EF2;
border-radius: 10px;

font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 20px;
line-height: 117.69%;
/* identical to box height, or 24px */

display: center;
align-items: flex-end;

color: #FFFFFF;
}

.findpw-line{
position: absolute;
width: 845px;
height: 0px;
left: 80px;
top: 457px;

border: 1px solid rgba(0, 0, 0, 0.15);
}

.findpw-background{
position: absolute;
width: 100%;
height: 100%;
background-image: url("../image/movie-theater2.jpg");
}

.findpw-background-a{
position: absolute;
width: 100%;
height: 100%;


background: linear-gradient(180deg, rgba(47, 47, 47, 0.3) 8.85%, rgba(21, 20, 30, 0.681818) 43.23%, #27243A 81.25%);
}

.findpw-email{
position: absolute;
    width: 70px;
    height: 24px;
    left: 100px;
    top: 312px;
    font-family: Roboto;
    font-style: normal;
    font-weight: 500;
    font-size: 20px;
    line-height: 117.69%;
    display: flex;
    align-items: flex-end;
    color: #27243A;
}

.findpw-id2{
position: absolute;
    width: 70px;
    height: 24px;
    left: 100px;
    top: 180px;
    font-family: Roboto;
    font-style: normal;
    font-weight: 500;
    font-size: 20px;
    line-height: 117.69%;
    display: flex;
    align-items: flex-end;
    color: #27243A;
}

.findpw-input4{
position: absolute;
width: 500px;
height: 40px;
left: 200px;
top: 171px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;
}

.findpw-name2{
position: absolute;
    width: 70px;
    height: 24px;
    left: 100px;
    top: 245px;
    font-family: Roboto;
    font-style: normal;
    font-weight: 500;
    font-size: 20px;
    line-height: 117.69%;
    display: flex;
    align-items: flex-end;
    color: #27243A;
}

.findpw-input5{
position: absolute;
width: 500px;
height: 40px;
left: 200px;
top: 239px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;
}

</style>
</head>
<body>

    <div class="findpw-background">
    	<div class="findpw-background-a"></div>
    </div>
<div class="findpw-container">
    
<p class="findpw-title" width=30% >비밀번호를 찾을 방법을 선택해 주세요.</p>
	         
	        <form class="findpw-form1" method=post action="../find/result2.do">
         				<!-- <input type=radio value="휴대전화" name=sex class="findid-phonenumber"> -->
         				<p class="findpw-text">회원정보에 등록한 휴대전화 번호로 찾기</p>
         				<p class="findpw-text2">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야 회원 정보를 찾을 수 있습니다.</p>
         				
         				<p class="findpw-id" width=30% >아이디</p>
         				<input type=text name=u_id size=15 class="findpw-input" width=70%>
         				
         				<p class="findpw-name" width=30% >이름</p>
         				<input type=text name=u_name size=15 class="findpw-input2" width=70%>
         				
         				<p class="findpw-phone" width=30% >휴대전화</p>
         				<input type=text name=u_tel size=15 class="findpw-input3" width=70%>
         				<input type=submit value="번호로 찾기" class="findpw-button" >
         				
         	</form>		
         	
         	<div class="findpw-line"></div>
         	
         	<form class="findpass-form2" method=post action="../find/email2.do">
         				<!-- <input type=radio value="이메일" name=sex class="findid-email"> -->
         				<p class="findpw-text3">회원정보에 등록한 이메일 주소로 찾기</p>
         				<p class="findpw-text4">회원정보에 등록한 이메일 주소와 입력한 이메일 주소가 같아야 회원 정보를 찾을 수 있습니다.</p>
         				
         				<p class="findpw-id2" width=30% >아이디</p>
         				<input type=text name=u_id size=15 class="findpw-input4" width=70%>
         				
         				<p class="findpw-name2" width=30% >이름</p>
         				<input type=text name=u_name size=15 class="findpw-input5" width=70%>
         				
         				<p class="findpw-email" width=30% >이메일</p>
         				<input type=text name=u_email size=15 class="findpw-input6" width=70%>
         				<input type=submit value="메일로 찾기" class="findpw-button2" >
         	</form>
         	
</div>

</body>
</html>