<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/style4.css">
<link rel="stylesheet" href="../css/style1.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
 a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}
 
</style>
<script type="text/javascript">
$(function(){
	$('#joinBtn').click(function(){
		// 회원 가입 처리 (유효성 검사) => NOT NULL , PRIMARY KEY , UNIQUE
		// id 
		let id=$('#join_id').val();
		if(id.trim()=="")
		{
			alert("중복체크 버튼을 클릭하세요!!")
			return;
		}
		// pwd
		let pwd=$('#join_pwd').val()
		if(pwd.trim()=="")
		{
			$('#join_pwd').focus();
			return;
		}
	 	 let pwd1=$('#pwd1').val()
		if(pwd1.trim()=="")
		{
			$('#pwd1').focus();
			return;
		}  
		// name
		let name=$('#name').val()
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		// tel
		let tel2=$('#tel2').val() 
		if(tel2.trim()=="")
		{
			$('#tel2').focus()
			return;
		}
		let email=$('#email').val()
		if(email.trim()=="")
		{
			$('#email').focus();
			return;
		}
		$('#join_frm').submit()
		
	})
})	
</script>
</head>
<body>
<jsp:include page="../jsp/header.jsp"></jsp:include>
	<div class="container">
		<div class="mypage_menu">
			<button id="btn1-menu" class="menu_btn"><a href="../mypage/reservation.do">예매내역</a></button>
			<button id="btn2-menu" class="menu_btn"><a href="../mypage/myreview.do">내가 쓴 리뷰</a></button>
			<button id="btn3-menu" class="menu_btn"><a href="../mypage/wish.do">찜한 목록</a></button>
			<button id="btn4-menu" class="menu_btn"><a href="../mypage/myinfo.do">개인정보 수정</a></button>
		</div>
		
	<script type="text/javascript">
		$(function() {
			$('.menu_btn').mouseover(function(){
				$(this).css('background','#573EF2');
				$(this).css('color','white');			
			})
			$('.menu_btn').mouseout(function() {
				$(this).css('background','white');
				$(this).css('color', 'black');
			})			
		}) 
	</script>
	</div>
  <div class="myInfo_section_1">
  <form method="post" action="../mypage/join_update_ok.do" name="join_frm" id="join_frm">
  <div class="myInfo_id">아이디</div>
  <input type=text name=id id="join_id" size=15 class="myInfo_id_1"
  value="${vo.u_id }" readonly
  >
  <div class="myInfo_pwd">현재 비밀번호</div> 
   <input type=password name=pwd id="join_pwd" size=15 class="myInfo_pwd_1">
   <div class="myInfo_pwdchange">변경할 비밀번호</div>  
   <input type=password name=pwd1 id=pwd1 size=15 class="myInfo_pwd_2"> 
   
  <div class="myInfo_name">이름</div> 
   <input type=text name=name id=name size=15 class="myInfo_name_1"
          value="${vo.u_name }"
         >
    <div class="myInfo_sex">성별</div> 
    <span class="myInfo_sex_1" class="inline">
    <input type=radio value="남자" name=sex ${vo.u_sex=="남자"?"checked":"" }>남자
    <input type=radio value="여자" name=sex ${vo.u_sex=="여자"?"checked":"" }>여자
    </span>
    
     <div class="myInfo_email">이메일</div> 
       <input type=text name=email id=email size=50 class="myInfo_email_1"
          value="${vo.u_email }"
         >
      <div class="myInfo_tel">전화번호</div>   
      <input type=text name=tel1 id=tel1 size=7 class="myInfo_tel_1" value="010">
      <input type=text name=tel2 id=tel2 size=20 class="myInfo_tel_2"
       value="${fn:substring(vo.getU_tel(),3,13)}"
       >
       
       <input type=button class="myInfo_bu_1" value="회원수정"
           id="joinBtn"
         >
         <input type=button class="myInfo_bu_2" value="취소"
          onclick="javascript:history.back()"
         >
 
         </form>
      
  <%-- <main class="container clear"> 
   <form method="post" action="../mypage/join_update_ok.do" name="join_frm" id="join_frm">
    <table class="table">
      <tr>
       <td class="text-right" width=15%>아이디</td>
       <td width=85% class="inline">
         <input type=text name=id id="join_id" size=15 class="input-sm" readonly
           value="${vo.u_id}"
         >
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>비밀번호</td>
       <td width=85% class="inline">
         <input type=password name=pwd id=join_pwd size=15 class="input-sm">
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>이름</td>
       <td width=85%>
         <input type=text name=name id=name size=15 class="input-sm"
          value="${vo.u_name }"
         >
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>성별</td>
       <td width=85% class="inline">
         <input type=radio value="남자" name=sex ${vo.u_sex=="남자"?"checked":"" }>남자
         <input type=radio value="여자" name=sex ${vo.u_sex=="여자"?"checked":"" }>여자
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>이메일</td>
       <td width=85%>
         <input type=text name=email id=email size=50 class="input-sm"
          value="${vo.u_email }"
         >
       </td>
      </tr>
      <tr>
       <td class="text-right" width=15%>전화번호</td>
       <td width=85% class="inline">
         <input type=text name=tel1 id=tel1 size=7 class="input-sm" value="010">
         <input type=text name=tel2 id=tel2 size=20 class="input-sm"
          value="${fn:substring(vo.getU_tel(),4,13)}"
         >
       </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
         <input type=button class="btn btn-sm btn-primary" value="회원수정"
           id="joinBtn"
         >
         <input type=button class="btn btn-sm btn-danger" value="취소"
          onclick="javascript:history.back()"
         >
        </td>
      </tr>
    </table>
    </form>
</main> --%>
  </div>
</body>
</html>

