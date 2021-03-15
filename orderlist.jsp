<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/external.css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/contactus.css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/orderlist.css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/menu.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/all.css">
        <link rel="stylesheet" type="text/css" href="css/webfonts">
<title>Insert title here</title>
</head>
<body style="">
     <%String user=(String)session.getAttribute("user");
                   if(user==null){
      response.sendRedirect("login.jsp");
                   }
                        %>
                        
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container bg-white"> 
        <center><i style="color:red;">Note:You can order upto 10 item each incase of more than 10 item you can visit <a href="contactus.jsp" style="text-decoration: none;color:red;">restaurant.</a></i></center>
  	<div class="row" id="menurowa">
            <c:forEach items="${list}" var="x">
                <div class="col-lg-2" id="menucon">
                    
                        <img src="assests/images/${x.dishimage}" class="img img-fluid">
                </div>
                <div id="menucaption" class="col-lg-4">
                    <h5 class="text-center text-muted " style="margin-top: 20px;">${x.dishname}........<span id="menuprice" style="color:  #D1A054;">Rs.${x.dishprice}</span></h5>
                    <center>
                        <form action="orderlist?act=add" method="post" id="cartform">
                            <input type="text" name="username" value="<%out.println(user);%>" style="display: none">
                            <input type="text" name="dishname" value="${x.dishname}" style="display: none">
                            <input type="number" name="price" value="${x.dishprice}" style="display: none">
                            Qty: <input type="number" name="qty" min="1" max="10" value="1">
                            <button>Add Item</button>
                        </form>
                       </center> 
                </div>
                </c:forEach>

        </div>
    </div>
        
<jsp:include page="footer.jsp"></jsp:include>
<script src="js/myjs.js"></script>
    <script src="js/myjs2.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    
    
    
</body>
</html>