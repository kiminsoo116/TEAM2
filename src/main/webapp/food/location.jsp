<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 추천</title>
<style type="text/css">

.location-container{
position: absolute;
width: 1382px;
height: 2295px;
left: 270px;
top: 651px;

background: #FFFFFF;
box-shadow: 0px 0px 50px rgba(0, 0, 0, 0.15);
border-radius: 10px;
}

.boxofficeTitle {
   z-index: 1;
   position: absolute;
   width: 300px;
   height: 100px;
   background-color: #FDFEFE;
   top: 500px;
   left: 42%;
   text-align: center;
   padding: 20px;
   font-family: 'Noto Sans KR', sans-serif;
   font-weight: 500;
   font-size: 25pt;
   color: black;
}


.location-container2{
position: absolute;
width: 1167px;
height: 2044px;
left: 110px;
top: 100px;

background: #ffffff;
}

.location-box{

width: 385px;
height: 400px;

display: inline-block;

}

.location-box img{
border-radius: 10px;

}

.location-boxs{

width: 385px;
height: 400px;

display: inline-block;

}
.location-boxs img{
border-radius: 10px;

}


.location-info{

width: 359px;
height: 120px;
border-radius: 10px;

/* background: #E9E9E9; */
}

.location-name{

width: 350px;
height: 30px;


font-family: Roboto;
font-style: normal;
font-weight: 600;
font-size: 20px;
line-height: 29px;

color: #27243A;
}


.location-address{

width: 350px;
height: 35px;


font-family: Roboto;
font-style: normal;
font-weight: 500;
font-size: 18px;
line-height: 23px;

color: #27243A;
}

.location-page{
position: absolute;
width: 700px;
height: 32px;
left: 522px;
top: 3062px;

display: inline-block;
}

.pagination{
position: absolute;
width: 1000px;
height: 32px;
left:450px;
top: 3062px; 
justify-content: center;

font-family: Roboto;
font-style: normal;
font-weight: 300;
font-size: 27px;
line-height: 32px;

color: #000000;
}

.location-button{

width: 50px;
height: 64px;


background: #FFFFFF;
box-shadow: 0px 0px 50px rgba(0, 0, 0, 0.15);
border-radius: 10px;
}

.fd_list1{
text-decoration: none;
}
.fd_list2{
text-decoration: none;
}




</style>
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