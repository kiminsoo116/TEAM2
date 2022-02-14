<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
       <%
    UpperDAO dao = new UpperDAO();
    List<UpperVO> list = dao.movieRanking();
    %>
    <%
MovieDAO ado = new MovieDAO();
List<MovieVO> listlist = ado.movieListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style2.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
</style>



</style>
</head>
<body>

   <nav class="navi">
      <button type="button">
         <a href="#"><img src="../image/logo.png">
      </button>
      <ul>
         <button class="signin" style="color: white">
            <a href="#">회원가입</a>
         </button>
         <button class="login" style="color: white">
            <a href="#">로그인</a>
         </button>
         <form class="search-container">
            <input type="text" id="search-bar" placeholder="  검색할 내용을 입력해 주세요.">
            <a href="#"><img class="search-icon"
               src="../image/돋보기.png"></a>
         </form>
      </ul>

   </nav>
   <header class="headerpic">
      <div class="graybox"></div>
   </header>
   <div class="boxofficeTitle">박스 오피스</div>
   <div class="boxofficerank">
   <img class="lefter" src="../image/화살표.png">
      
   <div class="makeOverflow">
      <%int i=1; %>
      <%for(UpperVO vo:list){ %>
      <div class="oneRank">
      <a href="#">
         <%String bigPoster = vo.getM_poster().substring(0, vo.getM_poster().lastIndexOf("?")); %>
         <div class="poster">
            <img alt="" src="<%=bigPoster%>" class="ranks">
            <p class="rankNum"><%=i %></p>      
         </div>
      <%if(vo.getM_title().length()>=14){ %>
      <p class="rankTitle"><%=vo.getM_title().substring(0, 14) %>...</p>
      <%}else{ %>
      <p class="rankTitle"><%=vo.getM_title() %></p>
      <%} %>
      <%if(vo.getM_director().length()>=5){ %>
      <p class="rankRate">예매율 <%=vo.getM_rate() %>% | <%=vo.getM_director().substring(0,5) %>...</p>
      <%} else{ %>
      <p class="rankRate">예매율 <%=vo.getM_rate() %>% | <%=vo.getM_director() %></p>
      <%} %>
      </a>
      </div>
      <%i++; 
      } %>
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
   <%
   for (MovieVO vo : listlist) {
   %>
      <div class="col-md-3">
         <div class="column">
            <a href="#">
              <%--  <%String bigPoster = vo.getM_poster().substring(0, vo.getM_poster().lastIndexOf("?")); %> --%>
            <div class="MV_Array">
               <img src="<%=vo.getM_poster()%>">
            </div>
               <%if(vo.getM_title().length()>=17){ %>
               <p class="rankTitle1"><%=vo.getM_title().substring(0, 15) %>…</p>
               <%}else{ %>
               <p class="rankTitle1"><%=vo.getM_title() %></p>
               <%} %>
               <%if(vo.getM_director().length()>=9) {%>
               <p class="rankRate1">예매율 <%=vo.getM_rate() %>% | <%=vo.getM_director().substring(0,9) %>...</p>
               <%}else{ %>
               <p class="rankRate1">예매율 <%=vo.getM_rate() %>% | <%=vo.getM_director() %></p>
               <%} %>
            </a>
         </div>
      </div>
      <%
      } 
      %>
   </div>
   </div>

</body>
</html>