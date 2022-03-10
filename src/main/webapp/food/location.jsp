<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 추천</title>
<link rel="stylesheet" href="../css/style5.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
  <script>
  $( function() {
	$('.fd_list1').click(function(){
		 let no=$(this).attr("data-fno1")
		 let title=$('#name'+no).text();
		 let address=$('#address'+no).text();
		 let kind=$('#kind'+no).text();
		 let tel=$('#tel'+no).text();
		 let time=$('#time'+no).text();
		 let menu=$('#menu'+no).text();
	
		 $('#a').text(title);
		 $('#b').text(address);
		 $('#c').text(kind);
		 $('#d').text(tel);
		 $('#e').text(time);
		 $('#f').text(menu);
		 $( "#dialog" ).dialog();
	})
	
	$('.fd_list2').click(function(){
		 let no=$(this).attr("data-fno2")
		 let title=$('#name'+no).text();
		 let address=$('#address'+no).text();
		 let kind=$('#kind'+no).text();
		 let tel=$('#tel'+no).text();
		 let time=$('#time'+no).text();
		 let menu=$('#menu'+no).text();
	
		 $('#a').text(title);
		 $('#b').text(address);
		 $('#c').text(kind);
		 $('#d').text(tel);
		 $('#e').text(time);
		 $('#f').text(menu);
		 $( "#dialog" ).dialog();
	})
	
  } );
  </script>

</head>

<body>
   <div class="boxofficeTitle">맛집 추천</div>
   <jsp:include page="../jsp/header.jsp"></jsp:include>
  
   <div class=location-container>
         
      <div class=location-container2>
      
            <c:forEach var="vo" items="${list }" varStatus="s">
             <c:choose>
              <c:when test="${s.index%3==0}">
               <li class="location-box" >
      <div class="fd_list1" data-fno1="${vo.f_no}">
      <img src="${vo.f_poster }" title="${vo.f_title }">
                  <div class="location-info">
                     <p class="location-name" id="name${vo.f_no }">${vo.f_title}</p>
                     <p class="location-address" id="address${vo.f_no }">${vo.f_address}</p>
                     <p class="location-kind" id="kind${vo.f_no }">${vo.f_kind}</p>
                     <p class="location-tel"  id="tel${vo.f_no }" style="display:none">${vo.f_tel}</p>
                     <p class="location-time"  id="time${vo.f_no }" style="display:none">${vo.f_time}</p>
                     <p class="location-menu"  id="menu${vo.f_no }" style="display:none">${vo.f_menu}</p>
                  </div>
      </div>
               </li>
              </c:when>
              <c:otherwise>
               <li class="location-boxs">
      <div class="fd_list2" data-fno2="${vo.f_no}">
      <img src="${vo.f_poster }" title="${vo.f_title }">
               <div class="location-info">
                     <p class="location-name" id="name${vo.f_no }">${vo.f_title}</p>
                     <p class="location-address" id="address${vo.f_no }">${vo.f_address}</p>
                     <p class="location-kind" id="kind${vo.f_no }">${vo.f_kind}</p>
                     <p class="location-tel"  id="tel${vo.f_no }" style="display:none">${vo.f_tel}</p>
                     <p class="location-time"  id="time${vo.f_no }" style="display:none">${vo.f_time}</p>
                     <p class="location-menu"  id="menu${vo.f_no }" style="display:none">${vo.f_menu}</p>
               </div>
      </div>
               </li>
              </c:otherwise>
             </c:choose>
            </c:forEach>
          </div>
      </div>
              	<td>
            		<div id="dialog" title="상세정보" style="display:none">
			  			
			  			<p>이름:<span id="a"></span></p>
			  			<p>주소:<span id="b"></span></p>
			  			<p>종류:<span id="c"></span></p>
			  			<p>전화번호:<span id="d"></span></p>
			  			<p>운영시간:<span id="e"></span></p>
			  			<p>메뉴:<span id="f"></span></p>
					</div>
       			 </td>
      <!-- <script type="text/javascript">
   var fno1=$('.fd_list1').attr("data-fno1");
   var fno2=$('.fd_list2').attr("data-fno2");
   $('.fd_list1').click(function() {
      window.open("../food/food_detail.do?f_no=${fno1}",'상세보기', "width=500", "height=500");
   })
   $('.fd_list2').click(function() {
      window.open("../food/food_detail.do?f_no=${fno2}",'상세보기', "width=500", "height=500");
   })
      </script> -->
       
      <nav class="pagination">
        
         <c:forEach var="i" begin="1" end="${totalpage }">
          <c:if test="${curpage==i }">
           <div class="current"><a href="../food/location.do?page=${i }&loc=${loc}동"><button class="location-button">${i }</button></a></div>
          </c:if>
          <c:if test="${curpage!=i }">
           <div><a href="../food/location.do?page=${i }&loc=${loc}동"><button class="location-button">${i }</button></a></div>
          </c:if>
         </c:forEach>
         
        
      </nav>
      

</body>
</html>