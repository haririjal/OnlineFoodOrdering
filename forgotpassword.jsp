<%-- 
    Document   : forgotpassword
    Created on : Aug 24, 2019, 6:07:06 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="external.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/login.css">
	 <link rel="stylesheet" type="text/css" href="css/all.css">
        <link rel="stylesheet" type="text/css" href="webfonts/">
</head>
<body>
    <jsp:include page="header.jsp"/>
    <div class="container-fluid" style="background:linear-gradient(rgba(255,255,255,.7),rgba(255,255,255,.3)), url(images/login.jpg)">
        <div class="row">
            <div class="col-lg-4">
                
            </div>
             <div class="col-lg-4">
                <form action="" method="post" id="loginform">
                    <center><h3 class="justify-content-center" style="color: rgba(255,51,0,1);">Reset Password</h3></center>
        <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                </div>
            <input minlength="5" type="text" name="username" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" required>
        </div>
        <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
                </div>
            <input minlength="8"  type="password" name="password" class="form-control" placeholder="Password" aria-label="password" aria-describedby="basic-addon1" required>
        </div>
        <div class="input-group mb-3">
            <button>Reset Password</button></div>
                </form>
            </div>
             <div class="col-lg-4">
                
            </div>
        </div>
    
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
