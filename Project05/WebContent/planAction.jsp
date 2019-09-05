<%@ page language="java" contentType="text/html; charset=UTF-8"
	session="true"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@page import="Project04.userDAO"%>
<%@page import="Project04.userDTO"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String vName, vDate, vTitle, vLat, vLng, user_title;
	
	user_title =  request.getParameter("user_title");
	
	userDTO dto;
	userDAO dao = new userDAO();
	ArrayList<userDTO> dtoL = dao.list04(request.getParameter("user_title"));
	dto = (userDTO)dtoL.get(0);

	vName = dto.getUser_name();
	vDate = dto.getUser_date();
	vTitle = dto.getUser_title();
	vLat = dto.getUser_lat();
	vLng = dto.getUser_lng();
	
	session.setAttribute("vName", vName);
	session.setAttribute("vDate", vDate);
	session.setAttribute("vTitle", vTitle);
	session.setAttribute("vLat", vLat);
	session.setAttribute("vLng", vLng);
	//vLng = (String)session.getAttribute("vLng");
	
%>
<!DOCTYPE html>
<html>
<head>
<title><%= vName%> 님과의 약속 잡기</title>
<link rel="stylesheet" href="css/bootstrap.css">
<script>
var placeSearch, autocomplete;
function initAutocomplete() {
  autocomplete = new google.maps.places.Autocomplete(
		  (document.getElementById('autocomplete')),
		  {types: ['geocode']});
  autocomplete.addListener('place_changed', fillInAddress);
}
function fillInAddress() {
  var place = autocomplete.getPlace();
    document.getElementById("lat").value=place.geometry.location.lat();
    document.getElementById("lng").value=place.geometry.location.lng();
}
function fillInAddress2() {
    document.getElementById("location").value=document.getElementById("autocomplete").value;
    document.getElementById("lat2").value=document.getElementById("lat").value;
    document.getElementById("lng2").value=document.getElementById("lng").value;
}
</script>
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
					<form method="post" id="frm01" action="plan.jsp"></form>
					<form id="frm02" action="planAction.jsp"></form>
						<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
							<thead>
								<tr>
									<th colspan="2" style="background-color: #eeeeee; text-align: center;">일정 등록하기</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="form-control" placeholder="이름" name="user_name" form="frm01" maxlength="50"></td>
									<td><input type="password" class="form-control" placeholder="비밀번호" name="user_pwd" form="frm01" maxlength="50"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="text"  id="autocomplete" class="form-control" placeholder="주소 검색창" form="frm02" maxlength="50"></td>
									<input type="hidden" name="user_location" id="location" form="frm01">
								</tr>
								<tr>
									<td><input type="text" id="lat" class="form-control" placeholder="위도" form="frm02" maxlength="50"></td>
									<input type="hidden" name="user_lat" id="lat2" form="frm01">
									<td><input type="text" id="lng" class="form-control" placeholder="경도" form="frm02" maxlength="50"></td>
									<input type="hidden" name="user_lng" id="lng2" form="frm01">
								</tr>
								<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB22EoQTqDWJNDXeF6KFpRCT6A3kVgFhAs&libraries=places&callback=initAutocomplete"></script>
							</tbody>
						</table>
				</div>
			</div>
			<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
			<script src="js/bootstrap.js"></script>
		</article>
	</section>
	
	<!-- aside -->
	
	<aside>
		<div class="container">
			<div class="row">
				<input type="submit" class="btn btn-primary pull-right" value="약속잡기" onClick="fillInAddress2()" form="frm01">
			</div>
		</div>
	</aside>

	<!-- footer -->
	
	<footer>
		<%@ include file = "Bottom.jspf" %>
	</footer>
</body>
</html>