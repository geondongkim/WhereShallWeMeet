<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Project04.planDAO"%>
<%@page import="Project04.planDTO"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>my schedule</title>
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
								<th colspan="2" style="background-color: #eeeeee; text-align: center;">버튼</th>
							</tr>
						</thead>
						<tbody>
						<% 
							planDAO pao = new planDAO();
							planDTO pto;
							ArrayList<planDTO> ptoL = pao.scheduleList();
							for(int idx=0; idx<ptoL.size(); idx++) {
								//dto = (userDTO)dtoL.get(idx);
								//list.get(i).getBbsID()
								//dtoL.get(idx).getUser_name()
						%>
							<tr>
							<td><%= idx+1%></td>
							<td><%= ptoL.get(idx).getUser_name2()%></td>
							<td><a href="view2.jsp?user_title=<%=ptoL.get(idx).getUser_title()%>"><%= ptoL.get(idx).getUser_title()%></td>
							<td><%= ptoL.get(idx).getUser_date()%></td>
							<td><input type="button" class="btn btn-primary" value="삭제" onclick="location.href='deletePlanAction.jsp?user_title=<%=ptoL.get(idx).getUser_title()%>'"></td>
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

	<!-- footer -->
	
	<footer>
		<%@ include file = "Bottom.jspf" %>
	</footer>
</body>
</html>