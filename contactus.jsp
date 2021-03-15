<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="external.css">
<link rel="stylesheet" type="text/css" href="css/contactus.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/all.css">
        <link rel="stylesheet" type="text/css" href="css/webfonts">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="conatiner-fluid">
<div class="row" id="contactusform">
<div class="col-lg-6" id="form">
    <i>${param.msg}</i>
    
		<form action="contact?act=add" method="post"><center>
							<h1 style="color: rgba(255,51,0,1);">Be Our Regular Customer!</h1>
                                                        <br><input type="text" name="name" placeholder="Enter your name." required><br>
                                                        <br><input type="email" name="email" placeholder="Enter your email." required validate><br>
                                                        <br><input type="text" name="phone" placeholder="Enter your phonenumber." required><br>
				<br><textarea name="message" placeholder="Enter Your Text........"></textarea><br>
				<input type="submit" value="Add Contact" name="btn">
				</center>
		</form>
		</div>
		
<div class="col-lg-6" id="contactdetail"><center>
				<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d781.1077044972043!2d85.32188884677363!3d27.70280981046673!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2snp!4v1559368614536!5m2!1sen!2snp" width="800" height="430" frameborder="0" style="border:0" allowfullscreen></iframe>
				<h2>EAT TOGETHER CAFE & BAR</h2>
                                <p style="font-size: 24px;"> Putalisadak , Kathmandu<br>
              01-4168259<br>
              9869068059,9818596446<br>
              eattogetherrestro@gmail.com
         </p>
              </center>
</div>
		</div></div>
		
<jsp:include page="footer.jsp"></jsp:include>		
		 <script src="js/myjs.js"></script>
    <script src="js/myjs2.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>