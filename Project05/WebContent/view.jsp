<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="Project04.userDAO"%>
<%@page import="Project04.userDTO"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
 	String user_title;
	user_title =  request.getParameter("user_title");
	
	userDTO dto;
	userDAO dao = new userDAO();
	ArrayList<userDTO> dtoL = dao.list04(request.getParameter("user_title"));
	dto = (userDTO)dtoL.get(0);
	String vTitle;
	
	if (request.getParameter("user_title") != null) {
		vTitle = request.getParameter("user_title");
	} else {
		out.print("실패");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 페이지</title>
</head>
<body>
	<!-- header -->
	
	<header>
		<%@ include file = "Top.jspf" %>
	</header>
	<!-- section -->
	
	<section>
		<article>
			<!-- 글 작성 양식 -->
			<div class="container">
				<div class="row">
					<form method="post" id="frm01" action="updateAction.jsp"></form>
					<form id="frm02" action="view.jsp"></form>
						<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="2" style="background-color: #eeeeee; text-align: center;">일정 등록하기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="form-control" value="<%= dto.getUser_name()%>" name="user_name" form="frm01" maxlength="50"></td>
									<td><input type="password" class="form-control" value="<%= dto.getUser_pwd()%>" name="user_pwd" form="frm01" maxlength="50"></td>
								</tr>
								<tr>
									<td><input type="text"  id="autocomplete" class="form-control" value="<%= dto.getUser_location()%>" form="frm02" maxlength="50"></td>
									<input type="hidden" name="user_location" id="location" form="frm01">
									<td colspan="2"><input type="text" value="<%= dto.getUser_date()%>" class="form-control" name="user_date" form="frm01" maxlength="50"></td>
								</tr>
								<tr>
									<td><input type="text" id="lat" class="form-control" value="<%= dto.getUser_lat()%>" form="frm02" maxlength="50"></td>
									<input type="hidden" name="user_lat" id="lat2" form="frm01">
									<td><input type="text" id="lng" class="form-control" value="<%= dto.getUser_lng()%>" form="frm02" maxlength="50"></td>
									<input type="hidden" name="user_lng" id="lng2" form="frm01">
								</tr>
								<tr>
									<td colspan="2"><input type="text" class="form-control" value="<%= dto.getUser_title()%>" name="user_title" form="frm01" maxlength="50"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="textarea" class="form-control" value="<%= dto.getUser_memo()%>" name="user_memo" form="frm01" maxlength="500" style="height: 150px;"></textarea></td>
								</tr>
							</tbody>
						</table>
						<input type="button" class="btn btn-primary pull-right" value="글쓰기" onClick="location.href='target.jsp'">
					</form>
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