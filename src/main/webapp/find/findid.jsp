<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.findid-container{
position: absolute;
width: 1000px;
height: 766px;
left: 560px;
top: 205px;

background: #FFFFFF;
box-shadow: 0px 0px 50px rgba(0, 0, 0, 0.35);
border-radius: 10px;

}

.findid-form1{
position: absolute;
width: 950px;
height: 400px;
left: 4px;
top: 0px;
}
.findid-form2{
position: absolute;
width: 950px;
height: 300px;
left: 4px;
top: 410px;
}

.findid-title{
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

.findid-text{
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

.findid-text2{
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

.findid-text3{
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

.findid-text4{
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

.findid-name{
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

.findid-input1{
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

.findid-phone{
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

.findid-input2{
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

.findid-input4{
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

.findid-button{
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

.findid-button2{
position: absolute;
width: 183px;
height: 40px;
left: 735px;
top: 240px;

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

.findid-line{
position: absolute;
width: 845px;
height: 0px;
left: 80px;
top: 405px;

border: 1px solid rgba(0, 0, 0, 0.15);
}

.findid-background{
position: absolute;
width: 100%;
height: 100%;
background-image: url("../image/movie-theater2.jpg");
}

.findid-background-a{
position: absolute;
width: 100%;
height: 100%;


background: linear-gradient(180deg, rgba(47, 47, 47, 0.3) 8.85%, rgba(21, 20, 30, 0.681818) 43.23%, #27243A 81.25%);
}

.findid-email{
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
    display: flex;
    align-items: flex-end;
    color: #27243A;
}

.findid-name2{
position: absolute;
    width: 70px;
    height: 24px;
    left: 100px;
    top: 170px;
    font-family: Roboto;
    font-style: normal;
    font-weight: 500;
    font-size: 20px;
    line-height: 117.69%;
    display: flex;
    align-items: flex-end;
    color: #27243A;
}

.findid-input3{
position: absolute;
width: 500px;
height: 40px;
left: 200px;
top: 165px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 10px;
}

</style>
</head>
<body>
    <div class="findid-background">
    	<div class="findid-background-a"></div>
    </div>    
<div class="findid-container">
    
<p class="findid-title" width=30% >아이디를 찾을 방법을 선택해 주세요.</p>
	         
	        <form class="findid-form1" method=post action="../find/result.do">
         				<!-- <input type=radio value="휴대전화" name=sex class="findid-phonenumber"> -->
         				<p class="findid-text">회원정보에 등록한 휴대전화 번호로 찾기</p>
         				<p class="findid-text2">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야 회원 정보를 찾을 수 있습니다.</p>
         				
         				<p class="findid-name" width=30% >이름</p>
         				<input type=text name=u_name size=15 class="findid-input1" width=70%>
         				
         				<p class="findid-phone" width=30% >휴대전화</p>
         				<input type=text name=u_tel size=15 class="findid-input2" width=70%>
         				<input type=submit value="번호로 찾기" class="findid-button" >
         				
         	</form>		
         	
         	<div class="findid-line"></div>
         	
         	<form class="findid-form2" method=post action="../find/email.do">
         				<!-- <input type=radio value="이메일" name=sex class="findid-email"> -->
         				<p class="findid-text3">회원정보에 등록한 이메일 주소로 찾기</p>
         				<p class="findid-text4">회원정보에 등록한 이메일 주소와 입력한 이메일 주소가 같아야 회원 정보를 찾을 수 있습니다.</p>
         				
         				<p class="findid-name2" width=30% >이름</p>
         				<input type=text name=u_name size=15 class="findid-input3" width=70%>
         				
         				<p class="findid-email" width=30% >이메일</p>
         				<input type=text name=u_email size=15 class="findid-input4" width=70%>
         				<input type=submit value="메일로 찾기" class="findid-button2" >
         	</form>
         	
	
	        

</div>

</body>
</html>