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
  <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ad79c028d7bb2ec26f934bb7e944edbf"></script> -->
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
      	
              	
            		<div id="dialog" title="상세정보" style="display:none" >
			  			
			  			<h4>이름:</h4><p><span id="a" class="location-span"></span></p>
			  			<h4>주소:</h4><p><span id="b" class="location-span"></span></p>
			  			<h4>음식 종류:</h4><p><span id="c" class="location-span"></span></p>
			  			<h4>전화번호:</h4><p><span id="d" class="location-span"></span></p>
			  			<h4>운영 시간:</h4><p><span id="e" class="location-span"></span></p>
			  			<h4>메뉴:</h4><p><span id="f" class="location-span"></span></p>
			  			
			  			<!-- <div id="map" style="width:100%;height:250px;"></div>

						
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   								 mapOption = { 
        						center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        						level: 3 // 지도의 확대 레벨
    							};

							var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


							var geocoder = new kakao.maps.services.Geocoder();
		
		
							geocoder.addressSearch('${vo.f_address}', function(result, status) {
		
		    
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		       
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.f_title}</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
						</script> -->
					</div>
       			 
       			
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