<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="external.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/all.css">
        <link rel="stylesheet" type="text/css" href="css/webfonts">
	

</head>
<body>
    <script>
            
            var x ='<%=request.getAttribute("error")%>';
            if(x=="error"){
                alert(x);
            }else{
            
        }
        </script>
    <%String user=(String)session.getAttribute("user");%>
	<div class="bd-example">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel" data-interval="3000">
      <jsp:include page="header.jsp"></jsp:include>
<!--   <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol> -->
    <div class="carousel-inner" id="car">
      <div class="carousel-item active">
          <a href="ordermenu" class="btn btn-primary" id="slider-btn">Order Now</a>
        <img src="images/burgerb.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption">
          <h1>Special Burger</h1>
         
          <p>Special burger served with finger chips.</p>
        </div>
      </div>
      <div class="carousel-item">
          <a href="ordermenu" class="btn btn-primary" id="slider-btn">Order Now</a>
        <img src="images/momo.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption">
          <h1>MOMO</h1>
          <p>Serve with cocacola.</p>
        </div>
      </div>
      <div class="carousel-item">
          <a href="ordermenu" class="btn btn-primary" id="slider-btn">Order Now</a>
        <img src="images/fish.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption">
          <h1>Local Fish Fry</h1>
          <p>Served with cocacola.</p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>



<div class="container" style="margin-top: -100px;margin-bottom: 50px;">
      <div class="row justify-content-center"  id="feature">
     <div class="card col-lg-4">
  <img src="images/momo.jpg" class="card-img-top" alt="...">
  <div class="card-body d-none d-md-block">
    <h5 class="card-title">MOMO</h5>
    <p class="card-text">Momo is a type of South Asian dumpling, popular across the Indian subcontinent and the Himalayan regions of broader South Asia.</p>
   <center> <a href="gallery.jsp" class="btn btn-primary">Gallery</a></center>
  </div>
  </div>
  <div class="card col-lg-4">
  <img src="images/burger.jpg" class="card-img-top" alt="...">
  <div class="card-body d-none d-md-block ">
    <h5 class="card-title">Burger</h5>
    <p class="card-text">Bulldog Burger was created with the goal of bringing the world's best burger to Starkville.</p>
    <center> <a href="gallery.jsp" class="btn btn-primary">Gallery</a></center>
  </div>
  </div>
  <div class="card col-lg-4">
  <img src="images/fish.jpg" class="card-img-top" alt="...">
  <div class="card-body d-none d-md-block">
    <h5 class="card-title">Fish Fry</h5>
    <p class="card-text">A fish fry is a meal containing battered or breaded fried fish.</p>
    <center> <a href="gallery.jsp" class="btn btn-primary">Gallery</a></center>
  </div>
</div>
</div>
</div>



<div class="container-fluid d-none d-md-block" id="description">
  <div class="row" >
    <div id="carouselExampleInterval" class="carousel slide col-12" data-ride="carousel" data-pause="false"  data-interval="3000">
  <div class="carousel-inner">
    <div class="carousel-item active">
         <img src="images/burgerb.jpg" class="d-block w-100" alt="...">

      <hr>

      <div id="slidercap" class="d-none d-md-block ">
          <h2>Special Burger</h2>
          <center> <a class="btn text-blue btn-white" href="ordermenu">Order Now</a></center>
      </div>

    </div>
    <div class="carousel-item" >
      <img src="images/momo.jpg" class="d-block w-100" alt="...">
         <hr>
       <div id="slidercap" class="d-none d-md-block ">
          <h2>Special MOMO</h2>
          <center> <a class="btn text-blue btn-white" href="ordermenu">Order Now</a></center>
         </div>
    </div>
    <div class="carousel-item">
      <img src="images/fish.jpg" class="d-block w-100" alt="...">
         <hr>
       <div id="slidercap" class="d-none d-md-block ">
          <h2>Special Fish</h2>
           <center>  <a class="btn text-blue btn-white" href="ordermenu">Order Now</a></center>
        </div>
    </div>
  </div>
</div>
</div>
  </div>

  <div class="container-fluid" id="rating">
    <div class="row">
        <div class="col-lg-8" id="ratinga">
            <h2 class="text-center">Meet your hunger.<small>Join Today</small> </h2>
            <center>
              <form action="" method="post">
              <input type="text" name="" class="col-5 offset-1">
              <button value="" >SUBSCRIBE</button>
            </form></center>
        </div>

        <div class="col-lg-4" id="ratingb">
            <center><h2 class="text-center w-75" >FEEDBACK</h2></center><br>
<!--       <i class="fas fa-star-half-alt" id="star"></i><span>4.5</span><br>-->
       <a style="text-decoration: none;" href="lcd?act=like&username=<%
           if(user==null){%>
              
          <% }
           else{
           out.println(user);
              }%>"> <%String liked=(String)request.getAttribute("liked");
              if(liked=="liked"){%>
              <i class="fas fa-thumbs-up" id="like"></i>
        <%} else{%>
        <i class="far fa-thumbs-up" id="like"></i>
            <%}%>
       </a><span><%=request.getAttribute("like")%></span><br>
<!--       <i class="fas fa-share-square"></i><span>1500</span><br>-->
       <div class="row">
       <div class="col-lg-2"><i class="far fa-comments"></i></div>
       <div class="comment col-lg-10">this is very fine resturant.<small>>> Bibek Paudel</small></div>
       <form method="get" action="lcd?act=comment">
                     <input type="text" name="comment"  style="width:300px;height: 40px; font-size: 18px;padding-left: 10px;"><button style="width:100px;margin-top:0;margin-left: 5px;height: 40px;font-size: 18px;">Comment</button>
                </form>
       </div>
<br>
        </div>
    </div>
  </div>

    <div class="container-fluid d-none d-md-block" id="segment">
    <div class="row" id="seg">
        <div class="col-lg-3 col-sm-3" id="sega"><span>Special</span></div>
        <div class="col-lg-6 col-sm-6" id="segb">
          <h2 class="text-center text-light" style="margin: 200px 0 30px 0;">Today's Special</h2>
          <center>
             <a class="btn-primary" href="ordermenu">Order Now</a>
          </center>
        </div>
        <div class="col-lg-3 col-sml-3" id="segc">
               
        </div>
       </div>
</div>

	<jsp:include page="footer.jsp"></jsp:include>	
        
    <script src="js/myjs.js"></script>
    <script src="js/myjs2.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>