<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<% PreparedStatement stmt,stmt1 = null;
       Connection con = null;
       ResultSet rs = null;
       StringBuffer sb = new StringBuffer("");
   %>
<div class="conatiner-fluid">
    <div class="row justify-content-center w-100 m-0 p-0" id="header" style="z-index: 9999;">
<div class="col-lg-3 col-sm-6 col-sm-6 "  id="top" > 
    
    <a class="nav-link text-center" href="index.jsp"><span class="seafood">EAT TOGETHER</span> <span class="restaurant">Cafe & Bar</span></a>
      </div>
          
        <div class="col-2 d-block d-md-none" style="color:white;font-size: 20px; cursor: pointer;">
        <i class="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" role="button" id="menudropdown">
         <i class="fas fa-bars"></i>
        </i>
        <div class="dropdown-menu">
     <a class="dropdown-item" href="index.jsp">HOME</a>
    <a class="dropdown-item" href="displaymenu">MENU</a>
    <a class="dropdown-item" href="reservation.jsp">RESERVATION</a>
    <a class="dropdown-item" href="gallery.jsp">Gallery</a>
    <a class="dropdown-item" href="contactus.jsp">CONTACT US</a>
    
    <%String user=(String)session.getAttribute("user");
      if(user==null){%>
       <a class="dropdown-item"  href="login.jsp">LOGIN</a>
  </li>
 <%  }
else {%>
       <a class="dropdown-item"  href="${pageContext.servletContext.contextPath}/LogoutServlet?act=frontend">LOGOUT</a>
 <%} %>
<!--    <a class="dropdown-item" href="login.jsp">LOG IN</a>
    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/LogoutServlet?act=frontend">LOG OUT</a>-->
  </div>
      </div>



      <ul class="nav nav-pills justify-content-center col-lg-7 col-sm-6 col-md-9   d-none d-md-flex" id="menu">
  <li class="nav-item">
    <a class="nav-link" href="likecommentdisplay">HOME</a>
  </li>
    <li class="nav-item">
         <a class="nav-link " href="displaymenu" >MENU</a>
  </li>
   <li class="nav-item">
       <!--<a class="nav-link"  data-toggle="modal" data-target="#exampleModalCenter" style="cursor: pointer;">-->
      <a class="nav-link" href="reservation.jsp"> RESERVATION</a>
  </li>
<!--  <li class="nav-item">
    <a class="nav-link" href="#">EVENT</a>
  </li>-->
  <li class="nav-item">
    <a class="nav-link " href="gallery.jsp" >GALLERY</a>
  </li>
  <li class="nav-item">
    <a class="nav-link " href="contactus.jsp" >CONTACT US</a>
  </li>
  <%
      if(user==null){%>
   
   <li class="nav-item">
       <a class="nav-link"  href="login.jsp">LOGIN</a>
  </li>
 <%  }
else {%>
  <li class="nav-item">
       <a class="nav-link"  href="${pageContext.servletContext.contextPath}/LogoutServlet?act=frontend">LOGOUT</a>
  </li>
 <%} %>
</ul>

<%
      if(user==null){
    }
      else{%>
      
      <Span style="" class="col-lg-2" id="userstatus">
          <form method="post" action="${pageContext.servletContext.contextPath}/orderlist?act=list"> 
              <input name="username" value="<%out.println(user);%>" style="display: none;">
              <button style="background: none;border: none;"> <i class="fas fa-user" style="color: green; background: #fff;padding: 3px;" > <%out.println(user);}%>
                      <%
            try{  

Class.forName("com.mysql.jdbc.Driver");  
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");  
String use=(String)session.getAttribute("user");

 stmt=con.prepareStatement("select count(total) from orderlist where username=?");  
 stmt.setString(1, use);
 rs=stmt.executeQuery();  
while(rs.next())  
{%>
<%
      if(user==null){
    }
      else{%>
<i class="fas fa-cart-plus" class="" style="color: green; padding: 3px; "><%out.println(rs.getInt(1));%></i>
<%}%>
<%}
out.println(sb);  
} //try block ends
catch(Exception e)
{ System.out.println(e);} 
%></i></button>
          </form>
      </Span>
              
    </div>
    



<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-top: 50px;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title" id="exampleModalCenterTitle" style="color: rgba(255,51,0,1);">Table Reservation</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form method="post" action="reservation?act=add">
        <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
  </div>
            <input type="text" class="form-control" placeholder="Name" aria-label="name" name="name" aria-describedby="basic-addon1" required>
</div>
              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-envelope"></i></span>
  </div>
                  <input type="text" class="form-control" placeholder="Email" name="email" aria-label="email" aria-describedby="basic-addon1" validate>
</div>
              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-phone"></i></span>
  </div>
                  <input type="text" class="form-control" placeholder="Phone" aria-label="Phone" name="phone" aria-describedby="basic-addon1" required>
</div>
              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="far fa-clock"></i></span>
  </div>
                  <input type="time" class="form-control" placeholder="Time" aria-label="time" name="time" aria-describedby="basic-addon1" value="13:30" required>
</div>
              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-calendar-day"></i></span>
  </div>
                  <input type="date" class="form-control" placeholder="date" aria-label="date" name="date" aria-describedby="basic-addon1" required>
</div>
              
              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <label class="input-group-text" for="inputGroupSelect01"><i class="fas fa-users"></i></label>
  </div>
                  <select class="custom-select" id="inputGroupSelect01" name="party">
    <option selected>Choose...</option>
    <option value="1">One</option>
    <option value="2">Two</option>
    <option value="3">Three</option>
    <option value="more than 3">More</option>
  </select>
</div>
             <div class="mb-3">
                 <label for="validationTextarea"><i class="fas fa-envelope" style="color: rgba(255,51,0,1);">  Any Request</i></label>
                 <textarea class="form-control is-invalid" id="validationTextarea" placeholder="Special request" name="message" required></textarea>
    <div class="invalid-feedback">
      Please enter a message.
    </div>
  </div>
              <div class="input-group mb-3">
                  <button class="resbtn">Submit</button> <i>${param.msg}</i>
</div>
              
          </form>
      </div>
     <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>



<div class="modal fade" id="abc" tabindex="-1" role="dialog" aria-labelledby="abc" aria-hidden="true" style="margin-top: 50px;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title" id="abc" style="color: rgba(255,51,0,1);">Login</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form action="${pageContext.servletContext.contextPath}/reservation?act=login" method="post">
        <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></i></span>
  </div>
            <input type="text" name="email" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" required>
</div>
              <div class="input-group mb-3">
                  
                  <%
                  String email=(String)session.getAttribute("email");
                  if(email!=null){
                  response.sendRedirect("welcome.jsp");
                  }
                  
                  %>
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-key"></i></i></span>
  </div>
                  <input name="phone" type="text" class="form-control" placeholder="password" aria-label="password" aria-describedby="basic-addon1" validate>
</div>
               <div class="input-group mb-3">
                   <button class="loginbtn" type="submit" value="submit">Submit</button>
                   <i><input type="checkbox" class="" id="defaultCheck1" value="remember me">Remember me?</i></div>
                   <div class="input-group mb-3">
                       <a class="nav-link"  data-toggle="modal" data-target="#exampleModalCenter" style="cursor: pointer;">Sign up</a></div>
              
</div>
          </form>
      </div>
    </div>
  </div>
</div>     
<script src="js/myjs.js"></script>
    <script src="js/myjs2.js"></script>
    <script src="js/bootstrap.min.js"></script>