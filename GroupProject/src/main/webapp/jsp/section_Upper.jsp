<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>
    <%
    UpperDAO dao = new UpperDAO();
    List<UpperVO> list = dao.movieRanking();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.boxofficerank{
/* background-color:black; */
position: relative;
width: 1464px;
height: 500px;
margin:0px auto;
top: 78px;
text-align:center;
}
.makeOverflow{
position:relative;
float:left;
width:1300px;
height:480px;
overflow: hidden;
text-align:center;
}
.oneRank{
display:inline-block; 
margin:30px auto;
width:250px;
height:450px;
text-align:center;
}
.ranks{
text-align:left;
margin:0px;
padding:10px;
width: 250px;
height: 376px;
filter: drop-shadow(0px 0px 17px rgba(0, 0, 0, 0.30));
border-radius: 10px;
padding:0px
}
.lefter{
	position:relative;
	float:left;
	top:40%;
	margin:10px;
}
.righter{
	position:relative;
	float:left;
	top:40%;
	margin:10px;
}
.rankTitle{
	position:relative;
	text-align:left;
	left:12%;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight:700;
	font-size: 17pt;
	line-height: 30pt;
	margin-bottom:0px;
}
.rankRate{
	position:relative;
	text-align:left;
	left:12%;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight:400;
	font-size:15pt;
	margin-top:-5px;
}

.rankNum{
color:white;
font-family:'Noto Sans', sans-serif;
position:relative;
text-align:left;
text-shadow: 0px 0px 4px rgba(0, 0, 0, 0.35);
left:15%;
font-style: italic;
font-weight: 800;
font-size: 50pt;
margin-top:-80px;
margin-bottom:0px;
}
.oneRank a{
	color:black;
}
.oneRank a:hover{
	text-decoration: none;
	color: #573EF2;
}

</style>
</head>
<body>

<div class="boxofficerank">
	<img class="lefter" src="../image/화살표.png">
		
	<div class="makeOverflow">
		<%int i=1; %>
		<%for(UpperVO vo:list){ %>
		<div class="oneRank">
		<a href="#">
			<%String bigPoster=vo.getM_poster().substring(0, vo.getM_poster().lastIndexOf("?")); %>
			<div class="poster">
				<img alt="" src="<%=bigPoster%>" class="ranks">
				<p class="rankNum"><%=i %></p>
				
			</div>
		<%if(vo.getM_title().length()>=14){ %>
		<p class="rankTitle"><%=vo.getM_title().substring(0, 14) %>...</p>
		<%}else{ %>
		<p class="rankTitle"><%=vo.getM_title() %></p>
		<%} %>
		<p class="rankRate">예매율 <%=vo.getM_rate() %>% | <%=vo.getM_director() %></p>
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

</body>
</html>