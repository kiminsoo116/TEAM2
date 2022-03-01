<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<style type="text/css">
.join-container{
   position: absolute;
width: 854px;
height: 1330px;
left: 540px;
top: 175px;

background: #FFFFFF;
box-shadow: 0px 0px 50px rgba(0, 0, 0, 0.35);
border-radius: 10px;
}

.join-form{
position: absolute;
width: 696px;
height: 1084px;
left: 77px;
top: 260px;
}

.join-image{
position: absolute;
width: 334px;
height: 112px;
left: 270px;
top: 90px;

background: url(../image/logo_resize.png);
}

.join-id{
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

.join-input{
position: absolute;
width: 465px;
height: 40px;
left: 3px;
top: 45px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-id-confirm{
position: absolute;
width: 222px;
height: 40px;
left: 476px;
top: 45px;

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

.join-pw{
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

.join-input2{
position: absolute;
width: 696px;
height: 40px;
left: 3px;
top: 139px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-pw2{
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

.join-input3{
position: absolute;
width: 696px;
height: 40px;
left: 3px;
top: 230px;

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
top: 315px;

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

.join-input4{
position: absolute;
width: 696px;
height: 40px;
left: 3px;
top: 365px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-birth{
position: absolute;
width: 200px;
height: 24px;
left: 3px;
top: 420px;

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

.join-input6-1{
position: absolute;
width: 226px;
height: 40px;
left: 3px;
top: 475px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-input6-2{
position: absolute;
width: 226px;
height: 40px;
left: 240px;
top: 538px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-input6-3{
position: absolute;
width: 226px;
height: 40px;
left: 476px;
top: 538px;

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
top: 535px;

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
top: 550px;

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
top: 595px;

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

.join-input7{
position: absolute;
width: 465px;
height: 40px;
left: 3px;
top: 665px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-email-confirm{
position: absolute;
width: 222px;
height: 40px;
left: 476px;
top: 665px;

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
top: 705px;

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

.join-input8{
position: absolute;
width: 465px;
height: 40px;
left: 3px;
top: 775px;

background: #FFFFFF;
border: 1px solid #7D7C89;
box-sizing: border-box;
border-radius: 5px;
}

.join-tel-confirm{
position: absolute;
width: 222px;
height: 40px;
left: 476px;
top: 775px;

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
top: 905px;

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
left: 0px;
top: 0px;

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

.join-form2{
position: absolute;
width: 340px;
height: 50px;
left: 440px;
top:1165px;
}


</style>
<script type="text/javascript">

function CheckFunction()
{
	
	let id=document.querySelector("#id")
	if(id.value==${AA})
	{
		// 값이 입력이 없는 경우
		//alert("ID를 입력하세요!!");
		let div=document.querySelector(".id-script");
		div.innerHTML="<font color=red>이미 가입된 아이디입니다</font>"
		id.focus();
		return;
	}
	else
	{
		let div=document.querySelector(".id");
		div.innerHTML=""
	}
	let pw=document.querySelector("#pwd")
	if(pw.value=="")
	{
		// 값이 입력이 없는 경우
		//alert("비밀번호를 입력하세요!!");
		let div=document.querySelector(".pwd");
		div.innerHTML="<font color=red>비밀번호를 입력하세요</font>"
		pw.focus()
		return;
	}
	else
	{
		let div=document.querySelector(".pwd");
		div.innerHTML=""
	}
}
</script>
</head>
<body>

<div class="join-background">
 <div class="join-background-a"></div>
</div>
    <div class="join-container">
     	<div class="join-image"></div>
     	
    
     <form method=post action="../join/join.do" class="join-form"> 
     
	         <p class="join-id" width=30% >아이디</p>
	         <input type=text name=u_id id="id" size=15 class="join-input" width=70%>
	         <input type=button value="중복체크" class="join-id-confirm" onclick="CheckFunction()" >
	         <div class="id-script"></div>
	         
	         <p class="join-pw" width=30%>비밀번호</p>
	         <input type=password name=u_pw id="pwd" size=15 class="join-input2" width=70%>
	         
	         <p class="join-pw2" width=30%>비밀번호 재확인</p>
	         <input type=password name=u_pw2 size=15 class="join-input3" width=70%>
	         
	         <p class="join-name" width=30%>이름</p>
	         <input type=text name=u_name size=15 class="join-input4" width=70%>
	         
	         <p class="join-birth" width=30%>생년월일</p>
	         <input type=date name=u_birth1 size=15 class="join-input6-1" width=70%>
	         
	         <p class="join-sex" width=30%>성별</p>
	         <div class="join-sex-select">
         			<input type=radio name=u_sex value="남" checked name=sex >남자
         			<input type=radio name=u_sex value="여" name=sex>여자
         	 </div>
        	 
       		 <p class="join-email" width=30%>본인 확인 이메일 주소</p>
	         <input type=email name=u_email size=15 class="join-input7" width=70%>
	         <button type=submit class="join-email-confirm" onclick="CheckFunction()">중복 체크</button>
	         
	         <p class="join-phone" width=30%>휴대전화 번호</p>
	         <input type=text name=u_tel size=15 class="join-input8" width=70%>
	         <button type=submit class="join-tel-confirm" onclick="CheckFunction()">중복 체크</button>
	         
	         <button type=submit  class="join" >가입하기</button>
	         
      </form> 
	         <form method=post action="../log/loginwindow.jsp" class="join-form2">
	         	<input type=submit value="취소하기" class="join-delete">
	         </form>
    </div>
</body>
</html>







