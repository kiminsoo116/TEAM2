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
</head>
<body>
	<div class="row">
	<%
	for (MovieVO vo : list) {
	%>
		<div class="col-md-3">
			<div class="column">
				<a href="#">
					<img src="<%=vo.getM_poster()%>" style="width: 280px; height: 350px;">
				</a>
				<div>
					<p style="font-size: 15pt;"><%=vo.getM_title()%></p>
					<p style="font-size: 15pt;">예매율 <%=vo.getM_rate() %></p>
				</div>
			</div>
		</div>
		<%
		} 
		%>
	</div>
</body>
</html>