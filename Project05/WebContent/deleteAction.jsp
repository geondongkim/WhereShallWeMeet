<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@page import="Project04.userDAO"%>
<%@page import="Project04.userDTO"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
	String user_name, user_date, user_title, user_location;
	
	user_name = request.getParameter("user_name");
	user_date =  request.getParameter("user_date");
	user_title =  request.getParameter("user_title");
	//user_location = request.getParameter("user_location");
	
	userDAO dao = new userDAO();
	
	//int su = dao.uDelete(request.getParameter("user_name"), request.getParameter("user_date"), request.getParameter("user_title"));
	int su = dao.uDelete(request.getParameter("user_title"));
	
	if (su == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글 삭제에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'board.jsp'");
		script.println("</script>");
	}
	
%>
</body>
</html>