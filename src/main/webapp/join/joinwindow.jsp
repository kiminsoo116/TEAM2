<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/style5.css" >
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
	$('#checkBtn').click(function(){
		// 아이디 중복체크 처리 
		Shadowbox.open({
			content:'../join/idcheck.do',
			player:'iframe',
			title:'아이디 중복체크',
			width:420,
			height:250
		})
	})
	$('#checkemailBtn').click(function(){
		// 아이디 중복체크 처리 
		Shadowbox.open({
			content:'../join/emailcheck.do',
			player:'iframe',
			title:'이메일 중복체크',
			width:500,
			height:250
		})
	})
	$('#checktelBtn').click(function(){
		// 아이디 중복체크 처리 
		Shadowbox.open({
			content:'../join/telcheck.do',
			player:'iframe',
			title:'전화번호 중복체크',
			width:500,
			height:250
		})
	})
	
	
	
	$('#joinBtn').click(function(){
		// 회원 가입 처리 (유효성 검사) => NOT NULL , PRIMARY KEY , UNIQUE
		// id 
		let u_id=$('#join_id').val();
		if(u_id.trim()=="")
		{
			alert("중복체크 버튼을 클릭하세요!!")
			return;
		}
		// pwd
		let u_pw=$('#join_pwd').val()
		if(u_pw.trim()=="")
		{
			$('#join_pwd').focus();
			return;
		}
		let u_pw2=$('#u_pw2').val()
		if(u_pw2!=u_pw) // 확인용
		{
		    $('#u_pw2').focus();
		    alert("비밀번호가 일치하지 않습니다!!")
		    return;
		}
		
		// name
		let u_name=$('#u_name').val()
		if(u_name.trim()=="")
		{
			$('#u_name').focus();
			return;
		}
		// birthday
		let u_birth1=$('#u_birth1').val()
		if(u_birth1.trim()=="")
		{
			alert("생년월일을 입력하세요!!") //
			return;
		}
		
		// tel
		let u_tel=$('#join_tel').val()
		if(u_tel.trim()=="")
		{
			$('#u_tel').focus()
			return;
		}
		
		$('#join_frm').submit()
		alert("회원가입이 완료되었습니다!!") 
		return;
	})
})
</script>
</head>
<body>

<div class="join-background">
 <div class="join-background-a"></div>
</div>
    <div class="join-container">
     	<div class="join-image"></div>
     	
    
     <form method=post action="../join/join.do" class="join-form" name="join_frm" id="join_frm"> 
     
	         <p class="join-id" width=30% >아이디</p>
	         <input type=text name=u_id id="join_id" size=15 class="join-input" width=70% 
	         placeholder="중복체크를 실행해주세요" readonly>
	         <input type=button value="중복체크" class="join-id-confirm" id="checkBtn">
	         
	         <p class="join-pw" width=30%>비밀번호</p>
	         <input type=password name=u_pw id="join_pwd" size=15 class="join-input2" width=70%>
	         
	         <p class="join-pw2" width=30%>비밀번호 재확인</p>
	         <input type=password name=u_pw2 id="u_pw2" size=15 class="join-input3" width=70%>
	         
	         <p class="join-name" width=30%>이름</p>
	         <input type=text name=u_name id=u_name size=15 class="join-input4" width=70%>
	         
	         <p class="join-birth" width=30%>생년월일</p>
	         <input type=date name=u_birth1 id=u_birth1 size=15 class="join-input6-1" width=70%>
	         
	         <p class="join-sex" width=30%>성별</p>
	         <div class="join-sex-select">
         			<input type=radio name=u_sex value="남" checked name=sex >남자
         			<input type=radio name=u_sex value="여" name=sex>여자
         	 </div>
        	 
       		 <p class="join-email" width=30%>본인 확인 이메일 주소</p>
	         <input type=email name=u_email id="join_email" size=15 class="join-input7" width=70%
	         placeholder="중복체크를 실행해주세요" readonly>
	         <input type=button value="중복체크" class="join-email-confirm" id="checkemailBtn">
	         
	         <p class="join-phone" width=30%>휴대전화 번호</p>
	         <input type=text name=u_tel id="join_tel" size=15 class="join-input8" width=70%
	         placeholder=" ' - '금지      ex)01012341234" readonly>
	         <input type=button value="중복체크" class="join-tel-confirm" id="checktelBtn">
	         
	         <input type=button value=가입하기 class="join" id="joinBtn">
	         
      </form> 
	         <form method=post action="../log/loginwindow.jsp" class="join-form2">
	         	<input type=submit value="취소하기" class="join-delete">
	         </form>
    </div>
</body>
</html>







