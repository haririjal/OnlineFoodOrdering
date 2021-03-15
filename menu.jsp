<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/external.css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/contactus.css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/all.css">
        <link rel="stylesheet" type="text/css" href="css/webfonts">
<title>Insert title here</title>
</head>
<body style="background:linear-gradient(rgba(255,255,255,0.5),rgba(255,255,255,0.5)),url('images/menubg.jpg') !important;
    background-size: contain;
    background-repeat: no-repeat;
    height:auto !important;
   max-width: 100%;
    overflow-x: hidden;
    background-attachment: fixed !important;">
    <% PreparedStatement stmt,stmt1 = null;
       Connection con = null;
       ResultSet rs = null;
       StringBuffer sb = new StringBuffer("");
   %>
    
    <jsp:include page="header.jsp"></jsp:include>
<div class="conatiner-fluid" style="z-index: 5!important;">
            <div class="row " >
                <div class="col-lg-12" id="menuimg"> 
                    <center> <p style="position: absolute;top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 70px;
  color:rgba(255,51,0,1);">Our Menu</p></center>
  <form style="position: absolute;top: 70%;
  left: 70%;
  
  color:rgba(255,51,0,1);" method="get" action="searchmenu">
      <div class="input-group mb-3">
          <input type="text" name="dishname" class="form-control" placeholder="Search Menu" style="font-size: 24px;
    height: 50px;
    border-color: rgba(255,51,0,1);
    outline: 0;
    border-bottom-left-radius: 5px;
    padding-left: 20px;">
  <div class="input-group-append">
      <button class="input-group-text" id="basic-addon2" style="border: rgba(255,51,0,1);"><i class="fas fa-search" style="color:rgba(255,51,0,1);"></i></button>
  </div>
</div>
     
  </form>
                    <img src="images/menu.jpg">
                    
                </div>
            </div>
        </div>
            

                            
                            
                        

    <div class="container bg-white"> 
  	<div class="row" id="menurowa" >
            <c:forEach items="${list}" var="x">
                <div class="col-lg-2" id="menucon">
                    
                        <img src="assests/images/${x.dishimage}" class="img img-fluid">
                </div>
                <div id="menucaption" class="col-lg-4">
                    <h5 class="text-center text-muted ">${x.dishname}........<span id="menuprice" style="color:  #D1A054;">Rs.${x.dishprice}</span></h5>
                        <p class="text-center">${x.dishdetail}</p>
                        <center>
                            <%String user=(String)session.getAttribute("user");
            String msg =(String)request.getAttribute("msg");
      if(user!=null){%>
<!--      <form  id="form1" action="userlocation" method="get" style="display: none;">
                            <input type="text" name="username" value="<%out.println(user);%>">
                        <input type="text" value="" id="lat"  name="lat" required>
                        <input type="text"  id="lon" name="lon" value="" required>
                        <button type="submit">loc</button></form>
    <div id="map" style="height: auto; display:none ;"></div>-->
      <form method="post" action="ordermenu" onclick="document.getElementById('form1').submit();"><button>Order Now</button></form></center>
                            <%}
else{%>
    <form action="login.jsp"><button>Order Now</button></form>
            <%
            }
            %>
                </div>
                </c:forEach>

        </div>
    </div>

        
    
    
    
    <script>
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.
      var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 6
        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            
            document.getElementById("lat").value = pos.lat;
            document.getElementById("lon").value = pos.lng;
			
            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
    </script>
    <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1BwRtZuIkRkxYSt2MSDlkGB0robW2BK8&callback=initMap">
    </script>
<jsp:include page="footer.jsp"></jsp:include>
<script src="js/myjs.js"></script>
    <script src="js/myjs2.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>