<%-- 
    Document   : userprofile
    Created on : Jul 30, 2019, 9:05:14 PM
    Author     : User
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="external.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link rel="stylesheet" type="text/css" href="css/userprofile.css">
	 <link rel="stylesheet" type="text/css" href="css/all.css">
        <link rel="stylesheet" type="text/css" href="webfonts/">
</head>
<body>
    
                        <% PreparedStatement stmt,stmt1 = null;
       Connection con = null;
       ResultSet rs = null;
       StringBuffer sb = new StringBuffer("");
   %>
    <%String user=(String)session.getAttribute("user");
      if(user==null){
      response.sendRedirect("login.jsp");
      }else{
            request.setAttribute("username", user);
  }%>
    <jsp:include page="header.jsp"/>
   
    <div class="container-fluid">
         <div class="row">
             <div class="col-lg-12 " id="userinfo"><img src=""></div>
         </div>
        <center> <i> <%String msg =(String)request.getAttribute("msg");
                    if(msg==null){
            }else{out.println(msg);}%></i></center>
        <div class="row">
            
            <div class="col-lg-6 ">
                <center> <h3>Your Reservation</h3> </center>
                <table border="1px" class="w-100" style="overflow: scroll; text-align: center;" id="myreservation">
                    <tr>
                        <th>Username</th>
                        <th>Phone</th>
                        <th>Time</th>
                        <th>Date</th>
                        <th>Party</th>
                        <th>Message</th>
                        <th>status</th>
                        <th>Cancel</th>
                    </tr>
                    <c:forEach items="${reservelist}" var="x">
                        <tr>
                 <td>${x.username}</td>
                 <td>${x.phone}</td>
                 <td>${x.time}</td>
                 <td>${x.date}</td>
                 <td>${x.party}</td>
                 <td>${x.message}</td>
                 <td>${x.status}</td>
                 <td><form method="post" action="deletereserve?act=cancelreservation&id=${x.id}&username=<%out.println(user);%>"><button onclick="return confirm('Are you sure?')">cancel reservation</button></form></td>
                        </tr>
                    </c:forEach>
                   
                </table>
                
                
                    
                    
            
            </div>
                    <div class="col-lg-6">
                        <a href="" style="color: red;float: right;" onclick="fun2(event)">Change password</a><br>
                        
                        <div id="changepass" style="display: none;">
         <form action="changepassword" method="post">
             
             <center> <h3>Change password</h3>
                 <input type="text" name="username" style="display: none;" value="<%out.println(user);%>" required validate >
              <input type="password" name="oldpass" placeholder="Old Password" required validate ><br>
              <input type="password" name="newpass" placeholder="new Password" required validate ><br>
              <button>Change Password</button>
             </center>
            </form>
   </div>
                        
                        
                        
                        <center> <h3>Your Order</h3> </center>
                <table border="1px"class="w-100" style="text-align: center; margin-bottom: 20px;" id="myorder">
                    <tr>
                        <th>DishName</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Cancel/Edit Order</th>
                    </tr>
                    <c:forEach items="${list}" var="y">
                        <tr>
                        <td>${y.dishname}</td>
                        <td>${y.price}</td>
                        <td>${y.qty}</td>
                        <td>${y.total}</td>
                        <td><a href="orderlist?act=cancelitem&id=${y.id}&username=<%out.println(user);%>" onclick="return confirm('This item will be cancelled')">Cancel Item</a></td>
                        </tr>
                    </c:forEach>
                    
<!--                    </tr>
                    
                    
                  <%
            try{  

Class.forName("com.mysql.jdbc.Driver");  
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");  
String use=(String)request.getAttribute("username");

 stmt=con.prepareStatement("select * from orderlist where username=?");  
 stmt.setString(1, use);
 rs=stmt.executeQuery();  
while(rs.next())  
{%>
<tr>
<td><%out.println(rs.getString(3));%></td>
<td><%out.println(rs.getInt(4));%></td>
<td><%out.println(rs.getInt(5));%></td>
<td><%out.println(rs.getInt(6));%></td>
<td><a href="orderlist?act=cancelitem&id=<%out.println(rs.getInt(1));%>" onclick="return confirm('This item will be cancelled')">Cancel Item</a></td>
</tr>
<%
}
out.println(sb);  
} //try block ends
catch(Exception e)
{ System.out.println(e);} 
    %>
                    
                   
                    <tr>-->
                    <tr>
                        <td colspan="3" >
                            Total:
                        </td>
                        
                    <td>


    <%
            try{  

Class.forName("com.mysql.jdbc.Driver");  
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","");  
String use=(String)request.getAttribute("username");

 stmt=con.prepareStatement("select SUM(total) from orderlist where username=?");  
 stmt.setString(1, use);
 rs=stmt.executeQuery();  
while(rs.next())  
{
out.println(rs.getInt(1));
%>
</td>
                    <td>
                        <a type="button" style="width: 100%;background:rgba(255,51,0,1); " class="btn" data-toggle="modal" data-target="#exampleModal">
                                    Proceed to Checkout
                        </a>
                     </td>
<%
}
out.println(sb);  
} //try block ends
catch(Exception e)
{ System.out.println(e);} 
    %>
                    
                    </tr>
                    
                    
                </table>
            </div>
                 <div class="col-lg-4">
                     <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-top: 50px;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title" id="exampleModalCenterTitle" style="color: rgba(255,51,0,1);">Check Out</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form method="post" action="userlocation">
        <div class="input-group mb-3">
            <input style="display: none;" type="text" name="username" class="form-control" value="${user}" required>
</div>
              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-map-marker"></i></span>
  </div>
                  <input  type="text" class="form-control" placeholder="Address" name="address" validate required>
</div>
              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="far fa-clock"></i></span>
  </div>
                  <input type="time" class="form-control" placeholder="Time" value='now' name="time" required>
</div>
              <div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-calendar-day"></i></span>
  </div>
                  <input type="date" id="today" class="form-control" placeholder="date" aria-label="date" name="date" aria-describedby="basic-addon1" required>
</div>
              <div class="input-group mb-3">
  <div class="input-group-prepend">
      <span class="input-group-text" id="basic-addon1"><i class="fas fa-phone"></i></span>
  </div>
                  <input pattern="[9]{1}[0-9]{9}" type="text" oninvalid="setCustomValidity('Please enter a valid phone number')"
    onchange="try{setCustomValidity('')}catch(e){}" class="form-control" placeholder="phone number" name="phone" required>
</div>
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1"><i class="fas fa-phone"></i></span>
  </div>
                  <input pattern="[9]{1}[0-9]{9}" type="text" oninvalid="setCustomValidity('Please enter a valid phone number')"
    onchange="try{setCustomValidity('')}catch(e){}" class="form-control" placeholder="Optional phone number" name="optionalphone">
</div>
             <div class="mb-3">
                 <label for="validationTextarea"><i class="fas fa-map-marker" style="color: rgba(255,51,0,1);">  DETAIL ADDRESS DIRECTION</i></label>
                 <textarea class="form-control is-invalid" id="validationTextarea" placeholder="ENTER DETAIL ADDRESS DIRECTION" name="addressdetail" required></textarea>
    <div class="invalid-feedback">
      Please enter a message.
    </div>
  </div>
              <div class="input-group mb-3">
                  <button class="resbtn">Check Out</button><button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>
              
          </form>
      </div>
    </div>
  </div>
</div>

                 </div>
        </div>
    </div>
       
        <jsp:include page="footer.jsp"/>
        <script>
    let today = new Date().toISOString().substr(0, 10);
document.querySelector("#today").value = today;
document.querySelector("#today").min = today;
document.querySelector("#today").max = today;
</script>
        <script>
            function fun2(event){
                event.preventDefault();
  var x = document.getElementById("changepass");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
            }
            function fun(event){
                event.preventDefault();
  document.getElementById("myreservation").style.display = "block";
   document.getElementById("myorder").style.display = "none";
            }
            function fun1(event){
                event.preventDefault();
  document.getElementById("myorder").style.display = "block";
  document.getElementById("myreservation").style.display = "none";
            }
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
