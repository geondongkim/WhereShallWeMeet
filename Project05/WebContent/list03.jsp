<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Project04.userDAO"%>
<%@page import="Project04.userDTO"%>
<%@ page import="java.util.*"%>
<%
	String vName, vDate, vTitle, vLocation;
	String user_name, user_date, user_title, user_location;
	
	user_name = request.getParameter("user_name");
	user_date =  request.getParameter("user_date");
	user_location = request.getParameter("user_location");
	
	userDAO dao = new userDAO();
	userDTO dto;
	ArrayList<userDTO> dtoL = dao.list03(request.getParameter("user_location"));
%>
<!DOCTYPE html>
<html>
<head>
<title>board</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>

	<!-- header -->
	
	<header>
		<%@ include file = "Top.jspf" %>
	</header>
	
	<!-- section -->
	
	<section>
		<article>
			<div class="container">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th style="background-color: #eeeeee; text-align: center;">num</th>
								<th style="background-color: #eeeeee; text-align: center;">name</th>
								<th style="background-color: #eeeeee; text-align: center;">title</th>
								<th style="background-color: #eeeeee; text-align: center;">date</th>
								<th style="background-color: #eeeeee; text-align: center;">location</th>
							</tr>
						</thead>
						<tbody>
						<% 
							for(int idx=0; idx<dtoL.size(); idx++) {
								//dto = (userDTO)dtoL.get(idx);
								//list.get(i).getBbsID()
								//dtoL.get(idx).getUser_name()
						%>
							<tr>
							<td><%= idx+1%></td>
							<td><a href="list01.jsp?user_name=<%=dtoL.get(idx).getUser_name()%>"><%= dtoL.get(idx).getUser_name()%></td>
							<td><a href="view.jsp?title=<%=dtoL.get(idx).getUser_title()%>"><%= dtoL.get(idx).getUser_title()%></td>
							<td><a href="list02.jsp?user_date=<%=dtoL.get(idx).getUser_date()%>"><%= dtoL.get(idx).getUser_date()%></td>
							<td><a href="list03.jsp?user_location=<%=dtoL.get(idx).getUser_location()%>"><%= dtoL.get(idx).getUser_location()%></td></tr>
							</tr>
							<% } %>			
						</tbody>
					</table>
				</div>
			</div>
			<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
			<script src="js/bootstrap.js"></script>
		</article>
	</section>
	<aside>
		<div class="container">
			<div class="row">
				<a href="board.jsp?pageNumber=" class="btn btn-success btn-arraw-left">◀</a>
				<a href="board.jsp?pageNumber=" class="btn btn-success btn-arraw-left">▶</a>
				<a href="target.jsp" class="btn btn-primary pull-right">일정등록</a>
			</div>
		</div>
	</aside>

	<!-- footer -->
	
	<footer>
		<%@ include file = "Bottom.jspf" %>
	</footer>
</body>
</html>