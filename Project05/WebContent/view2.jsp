<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="Project04.planDAO"%>
<%@page import="Project04.planDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%
	request.setCharacterEncoding("UTF-8");
 	String user_title;
	user_title =  request.getParameter("user_title");
	
	planDTO pto;
	planDAO pao = new planDAO();
	ArrayList<planDTO> ptoL = pao.scheduleList(request.getParameter("user_title"));
	pto = (planDTO)ptoL.get(0);
	String vTitle;
	
	if (request.getParameter("user_title") != null) {
		vTitle = request.getParameter("user_title");
	} else {
		out.print("실패");
	}

%>
<%
/*
String lat = pto.getUser_lat();
String lng = pto.getUser_lng();
//double lat = Double.parseDouble(pto.getUser_lat());
//double lng = Double.parseDouble(pto.getUser_lng());
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("function myMap() {");
script.println("var myCenter = new google.maps.LatLng("+lat+","+lng+");");
script.println("var mapProp= {");
script.println("  center:myCenter,");
script.println("  zoom:12,");
script.println("};");
script.println("var map = new google.maps.Map(document.getElementById("+"googleMap"+"),mapProp);");
script.println("google.maps.event.addListener(map, 'click', function(event) {");
script.println("	  placeMarker(map, event.latLng);");
script.println("	});");
script.println("	function placeMarker(map, location) {");
script.println("		marker = new google.maps.Marker({");
script.println("		    position: location,");
script.println("		    map: map");
script.println("		  });");
script.println("	  var infowindow = new google.maps.InfoWindow({");
script.println("	    content: 'Latitude: ' + location.lat() +");
script.println("	    '<br>Longitude: ' + location.lng()");
script.println("	  });");
script.println("	  infowindow.open(map,marker);");
script.println("	}");
script.println("}");
script.println("wwwwwwwwwwwwwww");
script.println("history.back()");
script.println("</script>");
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/bootstrap.css">
<title><%= pto.getUser_name2()%> 님의 스케쥴</title>
<script>
function myMap() {
var myCenter = new google.maps.LatLng(<%= pto.getUser_lat()%>, <%= pto.getUser_lng()%>);
var mapProp= {
  center:myCenter,
  zoom:15,
};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
google.maps.event.addListener(map, 'click', function(event) {
	  placeMarker(map, event.latLng);
	});
var marker = new google.maps.Marker({position: myCenter});

marker.setMap(map);
var myCity = new google.maps.Circle({
	  center:myCenter,
	  radius:800,
	  strokeColor:"dodgerblue",
	  strokeOpacity:0.8,
	  strokeWeight:2,
	  fillColor:"aliceblue",
	  fillOpacity:0.4
	});
myCity.setMap(map);
var infowindow = new google.maps.InfoWindow({
	  content:"여기서 만나요!"
	});

	infowindow.open(map,marker);
	function placeMarker(map, location) {
		marker = new google.maps.Marker({
		    position: location,
		    map: map
		  });
	  var infowindow = new google.maps.InfoWindow({
	    content: "Latitude: " + <%= pto.getUser_lat()%> +
	    "<br>Longitude: " + <%= pto.getUser_lng()%>
	  });
	  infowindow.open(map,marker);
	}
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
									<td><input type="text" class="form-control" value="<%= pto.getUser_name2()%>" name="user_name" form="frm01" maxlength="50"></td>
									<td><input type="password" class="form-control" value="<%= pto.getUser_pwd()%>" name="user_pwd" form="frm01" maxlength="50"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="text" value="<%= pto.getUser_date()%>" class="form-control" name="user_date" form="frm01" maxlength="50"></td>
								</tr>
								<tr>
									<td colspan="2"><div id="googleMap" style="width:100%;height:400px;"></div> </td>
									<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB22EoQTqDWJNDXeF6KFpRCT6A3kVgFhAs&callback=myMap"></script>
								</tr>
								<tr>
									<td><input type="text" id="lat" class="form-control" value="<%= pto.getUser_lat()%>" form="frm02" maxlength="50"></td>
									<input type="hidden" name="user_lat" id="lat2" form="frm01">
									<td><input type="text" id="lng" class="form-control" value="<%= pto.getUser_lng()%>" form="frm02" maxlength="50"></td>
									<input type="hidden" name="user_lng" id="lng2" form="frm01">
								</tr>
								<tr>
									<td colspan="2"><input type="text" class="form-control" value="<%= pto.getUser_title()%>" name="user_title" form="frm01" maxlength="50"></td>
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