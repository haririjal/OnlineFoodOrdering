<%-- 
    Document   : list
    Created on : Jun 30, 2019, 3:29:05 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/dashboard.css">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/all.css">
        <link rel="stylesheet" type="text/css" href="css/webfonts">
        <style>
            element.style{
                display: none;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid"><div class="row">
    <div class="col-lg-8" id="menutable" >
                    
                           
                         <table border="1px" style="border-collapse: collapse;" >
                        <center><label style="padding-top: 20px;"><h2>Menu Table</h2></label></center>
                         <tr>
                            <th>category</th>
                            <th>dishname</th>
                            <th>dishprice</th>
                            <th>dishdetail</th>
                            <th>dishimage</th>
                            <th>Action</th>
                        </tr>
                        
                        

                        <c:forEach items="${list}" var="x">
                            <tr>
<!--                                <td>${x.id}</td>-->
                                <td>${x.category}</td>
                                <td>${x.dishname}</td>
                                <td>${x.dishprice}</td>
                                <td>${x.dishdetail}</td>
                                <td><img src="assests/images/${x.dishimage}" height="50px" width="50px"></td>
                                <td id="edit"><a href="menu?act=edit&id=${x.id}" ><i class="fas fa-edit"></i></a> | <a href="#"><i class="fas fa-trash-alt"></i></a></td>
                                <td id="delete"></td>
                            </tr>
                            
                            
                        </c:forEach>
                            
                         </table></div></div></div>
        <form action="loaction" name="form1" onsubmit="required()">
            <input value="" id="lat"  name="text1" disabled  required>
            <input  id="lon" name="lon" value="jhash">
            <button>loc</button></form>
      
         <div id="map" style="height: 100%; display: ;"></div>
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
			alert(pos.lat);
			alert(pos.lng);
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
</body></html>
                            
        
