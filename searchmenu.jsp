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
<body style="   background:linear-gradient(rgba(255,255,255,0.5),rgba(255,255,255,0.5)),url('images/menubg.jpg') !important;
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
     <%String user=(String)session.getAttribute("user");
            String msg =(String)request.getAttribute("msg");%>
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
      <!--action="searchmenu"-->
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
             <c:forEach items="${menusearch}" var="y">
            <c:forEach items="${list}" var="x">
               
                <c:choose>
                    <c:when test="${y.dishname == x.dishname}">
                    <div class="col-lg-2" id="menucon">
                    
                        <img src="assests/images/${y.dishimage}" class="img img-fluid">
                </div>
                <div id="menucaption" class="col-lg-4">
                    <h5 class="text-center text-muted "><mark>${y.dishname}........<span id="menuprice" style="color:  #D1A054;">Rs.${y.dishprice}</span></mark></h5>
                        <p class="text-center">${y.dishdetail}</p>
                        <center>
                           
     <% if(user!=null){%>
                            <form method="post" action="ordermenu"><button>Order Now</button></form></center>
                            <%}
else{%>
    <form action="login.jsp"><button>Order Now</button></form>
            <%
            }
            %>
                </div>
                    </c:when>
                </c:choose>
   
                </c:forEach>
                </c:forEach>

        </div>
    </div>
        
<jsp:include page="footer.jsp"></jsp:include>
<script src="js/myjs.js"></script>
    <script src="js/myjs2.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>