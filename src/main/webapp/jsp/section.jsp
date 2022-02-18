<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style2.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


</head>
<body>
<div class="boxofficeTitle">박스 오피스</div>
   
   <div class="boxofficerank">
   <img class="lefter" src="../image/화살표.png">
      
   <div class="makeOverflow">
   <c:forEach var="m" items="${list}" varStatus="st">
      <div class="oneRank">
      <a href="#">
         <div class="poster">
            <img alt="" src="${m.m_poster}" class="ranks">
            <p class="rankNum">${st.count}</p>      
         </div>
      <p class="rankTitle">${m.m_title}</p>
      <p class="rankRate">예매율 ${m.m_rate}% | ${m.m_director}</p>
      </a>
      </div>
   </c:forEach>
   </div>
   
   <img class="righter" src="../image/화살표2.png">
</div>   


<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script> $(document).ready(function(){ 
   $('.makeOverflow').slick({
      prevArrow: $(".lefter"),
        nextArrow: $(".righter"),
        infinite: true,
        speed: 300,
        slidesToShow: 4,
        slidesToScroll: 1
      }); 
   }); 
   
</script>

   <div class="banner"></div>
   <p>
   <p>
   <div class="moviearray">
			<div class="moviemenu">
				<span class="movies"><a href="#">현재 상영작</a></span>
				<span class="movies"><a href="#">상영 예정작</a></span>
				<div class="filter"><a href="#">보고싶어요</a></div>
				<div class="divider">|</div>
				<div class="filter"><a href="#">평점순</a></div>
				<div class="divider">|</div>
				<div class="filter"><a href="">예매율순</a></div>
			</div>
   <div class="row">
   <c:forEach var="m" items="${list2 }">
      <div class="col-md-3">
         <div class="column">
            <a href="#">
              <%--  <%String bigPoster = vo.getM_poster().substring(0, vo.getM_poster().lastIndexOf("?")); %> --%>
            <div class="MV_Array">
               <img src="${fn:substring(m.getM_poster(), 0, m.getM_poster().lastIndexOf('?'))}">
            </div>
               <p class="rankTitle1">${m.m_title}</p>
               <p class="rankRate1">예매율 ${m.m_rate}% | ${m.m_director}</p>
            </a>
         </div>
      </div>
   </c:forEach>
   </div>
   </div>
	
</body>
</html>