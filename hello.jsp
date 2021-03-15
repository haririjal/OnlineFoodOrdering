<%-- 
    Document   : hello
    Created on : Jul 11, 2019, 5:25:24 PM
    Author     : User
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.Month"%>
<%@page import="java.time.Year"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <body>
Your HTML here with the <input type="submit" id="submitbutton">

<script>
// self executing function
(function() {
     setTimeout(function(){ 
         //disable the button with id="submitbutton"
         document.getElementById('submitbutton').disabled = true;
      }, 1000);

})();
</script>
        <%DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
   LocalDateTime now = LocalDateTime.now();  
   out.println(dtf.format(now));  %>
        <% PreparedStatement stmt,stmt1 = null;
       Connection con = null;
       ResultSet rs = null;
       StringBuffer sb = new StringBuffer("");
   %>
   <h1>Hello world</h1>
  
   
   <form action="" method="get" >
       <input type="text" name="dishname">
       <button>search</button>
   </form>
   <c:forEach items="${list}" var="x">
       ${x.id}
   </c:forEach>
        
    </body>
</html>
