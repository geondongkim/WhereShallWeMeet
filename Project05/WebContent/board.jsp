<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Project04.userDAO"%>
<%@page import="Project04.userDTO"%>
<%@ page import="java.util.*"%>
<% 
	response.setHeader("Pragma", "no-cache");
	if(request.getProtocol().equals("HTTP/1.1")) {
		response.setHeader("Cache-Control", "no-cache");
	}
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
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">버튼</th>
							</tr>
						</thead>
						<tbody>
						<% 
							userDAO dao = new userDAO();
							userDTO dto;
							ArrayList<userDTO> dtoL = dao.planList();
							for(int idx=0; idx<dtoL.size(); idx++) {
								//dto = (userDTO)dtoL.get(idx);
								//list.get(i).getBbsID()
								//dtoL.get(idx).getUser_name()
						%>
							<tr>
							<td><%= idx+1%></td>
							<td><a href="list01.jsp?user_name=<%=dtoL.get(idx).getUser_name()%>"><%= dtoL.get(idx).getUser_name()%></td>
							<td><a href="view.jsp?user_title=<%=dtoL.get(idx).getUser_title()%>"><%= dtoL.get(idx).getUser_title()%></td>
							<td><a href="list02.jsp?user_date=<%=dtoL.get(idx).getUser_date()%>"><%= dtoL.get(idx).getUser_date()%></td>
							<td><a href="list03.jsp?user_location=<%=dtoL.get(idx).getUser_location()%>"><%= dtoL.get(idx).getUser_location()%></td>
							<td><input type="button" class="btn btn-primary pull-right" value="약속잡기" onclick="location.href='planAction.jsp?user_title=<%=dtoL.get(idx).getUser_title()%>'"></td>
							<td><input type="button" class="btn btn-primary pull-left" value="삭제" onclick="location.href='deleteAction.jsp?user_title=<%=dtoL.get(idx).getUser_title()%>'"></td>
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