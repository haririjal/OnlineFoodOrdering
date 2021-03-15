<%-- 
    Document   : reservation
    Created on : Jun 26, 2019, 1:33:03 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/admin.png">
        <link rel="stylesheet" type="text/css" href="css/reservation.css">
        <link rel="stylesheet" type="text/css" href="external.css">
<link rel="stylesheet" type="text/css" href="css/contactus.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/all.css">
        <link rel="stylesheet" type="text/css" href="css/webfonts">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
    <div class="container-fluid">
        <div class="row" style="background: linear-gradient(rgba(255,255,255,.6),rgba(255,255,255,.4)),url(images/reserve.jpg)">
        <div class="col-lg-4">
    
</div>
        <div class="col-lg-4" id="resvform">
            <%String user=(String)session.getAttribute("user");
            String msg =(String)request.getAttribute("msg");
      if(user!=null){%>
            <form method="post" action="reservation?act=add" id="resevform">
                <center> <h5 style="color: rgba(255,51,0,1);">Table Reservation</h5></center>
        <div class="input-group mb-3">
<!--  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
  </div>-->
            <input type="text" class="form-control" placeholder="Username" name="username" value="<%out.println(user);%>" style="display: none;" required>
</div>
<!--              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-envelope"></i></span>
  </div>
                  <input type="text" class="form-control" placeholder="Email" name="email" aria-label="email" aria-describedby="basic-addon1" required validate>
</div>-->
              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-phone"></i></span>
  </div>
                  <input pattern="[9]{1}[0-9]{9}" type="text" oninvalid="setCustomValidity('Please enter a valid phone number')"
    onchange="try{setCustomValidity('')}catch(e){}" autofocus class="form-control" placeholder="Phone" aria-label="Phone" name="phone" aria-describedby="basic-addon1" required>
</div>
              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="far fa-clock"></i></span>
  </div>
                  <input type="time" class="form-control" placeholder="Time" aria-label="time" name="time" aria-describedby="basic-addon1" value='now' required>
</div>
              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-calendar-day"></i></span>
  </div>
                  <input type="date" id="today" class="form-control" placeholder="date" aria-label="date" name="date" aria-describedby="basic-addon1" required>
</div>
              
              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01"><i class="fas fa-users"></i></label>
  </div>
                  <select class="custom-select" id="inputGroupSelect01" name="party" required validate>
    <option value="">Choose...</option>
    <option value="1">One</option>
    <option value="2">Two</option>
    <option value="3">Three</option>
    <option value="more than 3">More</option>
  </select>
</div>
             <div class="mb-3">
<!--                 <label for="validationTextarea"><i class="fas fa-envelope" style="color: rgba(255,51,0,1);">  Any Request</i></label>-->
                 <textarea class="form-control is-invalid" id="validationTextarea" placeholder="Special request" name="message"></textarea>
<!--    <div class="invalid-feedback">
      Please enter a message.
    </div>-->
  </div>
              <div class="input-group mb-3">
                  <button class="resbtn">Submit</button>
</div>          <%if(msg==null){}else{%>  
<p style="" id="resmsg"> <% out.println(msg);}%></p>
            </form><%}
else{%>
<i style="color: white;">please login first<a href="login.jsp">login</a></i>
            <%
            }
            %>
        </div>
<div class="col-lg-4">
    
</div>
    </div>
    </div>
<jsp:include page="footer.jsp"></jsp:include>	
<script>
    let today = new Date().toISOString().substr(0, 10);
document.querySelector("#today").value = today;
document.querySelector("#today").min = today;
</script>
<script>
    function fun(event){
        event.preventDefault();
  document.getElementById("resmsg").style.display = "block";
    }
$(function(){     
  var d = new Date(),        
      h = d.getHours(),
      m = d.getMinutes();
  if(h < 10) h = '0' + h; 
  if(m < 10) m = '0' + m; 
  $('input[type="time"][value="now"]').each(function(){ 
    $(this).attr({'value': h + ':' + m});
  });
});
</script>
		 <script src="js/myjs.js"></script>
    <script src="js/myjs2.js"></script>
    <script src="js/bootstrap.min.js"></script>
       
    </body>
</html>
