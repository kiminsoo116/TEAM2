<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
<link rel="stylesheet" href="../css/style5.css" >

</head>
<body>
    <div class="findid-background">
    	<div class="findid-background-a"></div>
    </div>    
<div class="findid-container">
    
<p class="findid-title" width=30% >아이디를 찾을 방법을 선택해 주세요.</p>
	         
	        <form class="findid-form1" method=post action="../find/result.do">
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