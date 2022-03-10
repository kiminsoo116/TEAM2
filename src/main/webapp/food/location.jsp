<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 추천</title>
<link rel="stylesheet" href="../css/style5.css" >

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
      <a href="" class="fd_list1" data-fno1="${vo.f_no}">
      <img src="${vo.f_poster }" title="${vo.f_title }">
                  <div class="location-info">
                     <p class="location-name">${vo.f_title}</p>
                     <p class="location-address">${vo.f_address}</p>
                     <p class="location-address">${vo.f_kind}</p>
                  </div>
      </a>
               </li>
              </c:when>
              <c:otherwise>
               <li class="location-boxs">
      <a href="" class="fd_list2" data-fno2="${vo.f_no}">
      <img src="${vo.f_poster }" title="${vo.f_title }">
               <div class="location-info">
                     <p class="location-name">${vo.f_title}</p>
                     <p class="location-address">${vo.f_address}</p>
                     <p class="location-address">${vo.f_kind}</p>
               </div>
      </a>
               </li>
              </c:otherwise>
             </c:choose>
            </c:forEach>
          </div>
      </div>
      <script type="text/javascript">
   var fno1=$('.fd_list1').attr("data-fno1");
   var fno2=$('.fd_list2').attr("data-fno2");
   $('.fd_list1').click(function() {
      window.open("../food/food_detail.do?f_no=${fno1}",'상세보기', "width=500", "height=500");
   })
   $('.fd_list2').click(function() {
      window.open("../food/food_detail.do?f_no=${fno2}",'상세보기', "width=500", "height=500");
   })
      </script>
       

      
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