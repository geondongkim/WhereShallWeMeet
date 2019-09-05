<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Project04.userDTO"%>
<%@page import="Project04.userDAO"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String vName, vPwd, vDate, vTitle, vMemo, vLocation, vLat, vLng;
	int su=0;
	
	vName = request.getParameter("user_name");
	vPwd = request.getParameter("user_pwd");
	vDate =  request.getParameter("user_date");
	vTitle = request.getParameter("user_title");
	vMemo = request.getParameter("user_memo");
	vLocation = request.getParameter("user_location");
	vLat = request.getParameter("user_lat");
	vLng = request.getParameter("user_lng");
	
	userDTO dto;
	userDAO dao = new userDAO();
	out.print("<br>"+vLocation+" , "+vLat+" , "+vLng);
	dto = new userDTO (vName, vPwd, vDate, vTitle, vMemo, vLocation, vLat, vLng);
	su = dao.planner(dto);
	out.print("controller Chk 01 ==>>"+ su);	
%>
<script>location.href = 'board.jsp'</script>