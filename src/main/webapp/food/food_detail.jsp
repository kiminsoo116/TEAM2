<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript">

 /* $(document).on('click', '.location-box', function(){
	$(opener.document).find(".location-info").val($(this).val());
});  */
window.opener.document.getElementById(".location-box").value;



</script> 
<style type="text/css">
.container{
  margin-top: 50px;
}
.row {
   margin: 0px auto;
   width:380px;
}
h1{
    text-align: center;
}


</style>

</head>
<body>
  <div class="container">
   <div class="row">
    <table class="table">
     <tr>
     <c:set var="vo" value="${vo }"></c:set>
       <td class="text-center">
       <p>주소</p>${vo.f_title }
       <p>전화번호</p>${vo.f_tel }
       <p>음식종류</p>${vo.f_kind }
       <p>영업시간</p>${vo.f_time }
       <p>메뉴</p>${vo.f_menu }
       </td>
     </tr>
     
    </table>
   </div>
  </div>
</body>
</html>






