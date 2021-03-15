<%-- 
    Document   : login
    Created on : Jul 28, 2019, 3:20:05 PM
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
                <i style="color: white;"><%String msg =(String) request.getAttribute("msg");
                        if(msg==null){
                        }else{
                        out.println(msg);
                        }
                        
                    %></i>
                    <%String user=(String)session.getAttribute("user");
      if(user==null){%>
   
                <form action="signupcontroller?act=login" method="post" id="loginform">
                    <center><h3 class="justify-content-center" style="color: rgba(255,51,0,1);">Please Login First</h3></center>
        <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                </div>
            <input oninvalid="setCustomValidity('Please enter a valid username. ')"
    onchange="try{setCustomValidity('')}catch(e){}" minlength="5" max="32" type="text" name="username" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" required>
        </div>
        <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
                </div>
            <input  minlength="8" max="32"  type="password" name="password" class="form-control" placeholder="Password" aria-label="password" aria-describedby="basic-addon1" validate required>
        </div>
        <div class="input-group mb-3">
            <button>log In</button><center><a onclick="myFunction3(event)" href="forgotpassword" style="text-decoration: none;color: white;">Forgot Password?</a></center><button onclick="myFunction(event)">Sign Up</button>
        </div>
                   
                </form>
     
      
     <%  }
      else{%>
                <i style="color: white;">
                      <%
      out.println("You are online");%>
           </i>
      <%}%>
                    
                    
                  
      <div id="signupform" style="display: none;">
      <form action="signupcontroller?act=signup" method="post" >
          <center><h3 class="justify-content-center" style="color: rgba(255,51,0,1);">Signup Form</h3></center>
          <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                </div>
              <input minlength="5" maxlength="25" type="text" name="name" class="form-control" placeholder="name" aria-label="name" aria-describedby="basic-addon1" required>
        </div>
        <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
                </div>
            <input minlength="5" maxlength="25" type="text" name="username" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" required>
        </div>
        <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></span>
                </div>
            <input minlength="8" maxlength="32" type="password" name="password" class="form-control" placeholder="Password" aria-label="password" aria-describedby="basic-addon1" required validate>
        </div>
        <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="fas fa-envelope"></i></span>
                </div>
            <input maxlength="32" type="email" name="email" class="form-control" placeholder="email" aria-label="email" aria-describedby="basic-addon1" required validate>
        </div>
        <div class="input-group mb-3">
                <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="fas fa-phone"></i></span>
                </div>
            <input pattern="[9]{1}[0-9]{9}" type="text" oninvalid="setCustomValidity('Please enter a valid phone number')"
    onchange="try{setCustomValidity('')}catch(e){}" name="phone" class="form-control" placeholder="Phone" aria-label="phone" aria-describedby="basic-addon1" required validate>
        </div>
        <div class="input-group mb-3">
            <button>Sign Up</button><button onclick="myFunction2(event)">Log In</button>
        </div>
      </form>
          
      </div>
      <div id="forgotpass" style="display: none;">
         <form action="forgotpassword" method="get">
             
             <center> <h3>Request for a new password</h3>
                 Enter Your Email Address<br> <input type="email" name="email" placeholder="Email" required validate ><br>
              <button>Search</button>
             </center>
            </form>
      </div>
                </div>
      <div class="col-lg-4"></div> </div>
        </div>
            
        </div>
      
    <jsp:include page="footer.jsp"/> 
    <script>
function myFunction(event) {
  event.preventDefault();
  document.getElementById("signupform").style.display = "block";
  document.getElementById("loginform").style.display="none";
}
function myFunction2(event) {
  event.preventDefault();
  document.getElementById("signupform").style.display = "none";
  document.getElementById("loginform").style.display="block";
}
function myFunction3(event) {
  event.preventDefault();
  document.getElementById("signupform").style.display = "none";
  document.getElementById("loginform").style.display="none";
  document.getElementById("forgotpass").style.display="block";
}
    </script>
    
          <script src="js/myjs.js"></script>
    <script src="js/myjs2.js"></script>
    <script src="js/bootstrap.min.js"></script>
    </body>
</html>
