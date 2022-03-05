<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="../css/style5.css" >

</head>
<body>

    <div class="findpw-background">
    	<div class="findpw-background-a"></div>
    </div>
<div class="findpw-container">
    
<p class="findpw-title" width=30% >비밀번호를 찾을 방법을 선택해 주세요.</p>
	         
	        <form class="findpw-form1" method=post action="../find/result2.do">
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