<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*"%>

<%
MovieDAO dao = new MovieDAO();
List<MovieVO> list = dao.movieListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container{
	width:1378px;
	height:1800px;
}
div.movieArray img{
	width: 290px;
	height: 415px;
	filter: drop-shadow(0px 0px 30px rgba(0, 0, 0, 0.15));
	border-radius: 10px;

}
</style>
</head>
<body>
	<div class="container">
		<div class="col-lg=3">
		<%for(MovieVO vo:list){ %>
		<div class="movieArray">
			<%String bigPoster = vo.getM_poster().substring(0, vo.getM_poster().lastIndexOf("?")); %>
			<img alt="" src="<%=bigPoster%>">
			<%if(vo.getM_title().length()>=14){ %>
			<p class="MA_Title"><%=vo.getM_title().substring(0, 14) %>...</p>
			<%}else{ %>
			<p class="MA_Title"><%=vo.getM_title() %></p>
			<%} %>
			<p class="MA_Rate">예매율 <%=vo.getM_rate() %>% | <%=vo.getM_director() %></p>
		</div>
		</div>
		<%} %>
	</div>

</body>
</html>