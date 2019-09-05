<%@page import="Project04.planDAO"%>
<%@page import="Project04.planDTO"%>
<%@page import="Project04.GPSDTO"%>
<%@page import="Project04.GPSCal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String vTName, vTDate, vTTitle, vTLat, vTLng; 
	vTName = (String)session.getAttribute("vName");
	vTDate = (String)session.getAttribute("vDate");
	vTTitle = (String)session.getAttribute("vTitle");
	vTLat = (String)session.getAttribute("vLat");
	vTLng = (String)session.getAttribute("vLng");
	
	request.setCharacterEncoding("UTF-8");
	String vName, vPwd, vLat, vLng;
	
	vName = request.getParameter("user_name");
	vPwd = request.getParameter("user_pwd");
	vLat = request.getParameter("user_lat");
	vLng = request.getParameter("user_lng");
	
	GPSCal gps = new GPSCal();
	double lat1, lat2, lng1, lng2;
	lat1 = Double.parseDouble(vTLat);
	lng1 = Double.parseDouble(vTLng);
	lat2 = Double.parseDouble(vLat);
	lng2 = Double.parseDouble(vLng);
	
	GPSDTO gpsDto = new GPSDTO();
	gpsDto = gps.getMidpoint2(lat1, lng1, lat2, lng2);
	
	String resultLat = gpsDto.getLat();
	String resultLng = gpsDto.getLng();
	out.print("<br>"+Double.toString(lat1)+", "+Double.toString(lng1)+", "+Double.toString(lat2)+", "+Double.toString(lng2));
	out.print("<br>"+resultLat);
	out.print("<br>"+resultLng);
	out.print("<br>"+vTLat +", " + vTLng);
	
	planDTO pto;
	pto = new planDTO (vTName, vName, vPwd, vTDate, vTTitle, resultLat, resultLng);
	planDAO pao = new planDAO();
	int su = pao.schedule(pto);
	out.print("controller Chk 01 ==>>"+ su);	
%>
<script>location.href = 'schedule.jsp'</script>
</body>
</html>