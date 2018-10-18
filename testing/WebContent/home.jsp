<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
String cookieName = "email";
Cookie cookies [] = request.getCookies ();
Cookie myCookie = null;
if (cookies != null)
{
for (int i = 0; i < cookies.length; i++) 
{
if (cookies [i].getName().equals (cookieName))
{
myCookie = cookies[i];
break;
}
}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/stylehome.css">

<link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/particles.css">

<script src="js/aos.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Home</title>



</head>
<body onload="on()">


<div id="overlay" onclick="off()">
<div id="close"><i class="fa fa-close" style="font-size:48px; color:white"></i></div>
  <div id="text">
  <h3 style="text-decoration: underline; text-align: center">To buy fast</h3>
  <p>At first go to <a href="yourprofile.jsp">your profile</a>. Then add new <a href="addaddress.jsp">addresses</a> , The Big Brand Edition (<a href="addmsrmnt.jsp">CUSTOMS</a>)Get All Your favourties here & more and <a href="addcard.jsp">Card</a> details.</p>
  </div>
</div>


<div class="main">
	<div class="logo">  <a href="home.jsp"><img src="images/clothing.png" /></a>  </div>
	
	<div class="searchbar"> <form  method="post" action="search2.jsp">
				<input type="text" name="p_name" 
					placeholder="Search product's name...">
				<button type="submit" name="save" class="btn-primary"><i class="fa fa-search"></i></button>
			</form> </div>
			
<div class="log">
<%
				if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
			%>
			
			<%
				} else {
			%>
			
			<%
				}
			%>
		
		
		
		
						<%
if (myCookie == null) {
%>


<a href="login.jsp">Login</a>
<%
} else {
%> <a href="yourprofile.jsp" title="<%=myCookie.getValue()%>">
<i class="fa fa-user"></i></a>&nbsp;
<a href='logout.jsp'>Log out</a>
<%
}
%>
</div>
</div>
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="images/1.jpg" style="width:100%">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="images/2.jpg" style="width:100%">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext"></div>
  <img src="images/3.jpg" style="width:100%">
  <div class="text"></div>
</div>

</div>


<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
<div id="particles-js">
<div class="categorystart" data-aos="fade-down" data-aos-duration="3000" data-aos-once="true" align="center">
<i class="fa fa-arrow-circle-o-down" data-aos="fade-down" style="color:black;"></i>
Categories
<i class="fa fa-arrow-circle-o-down" data-aos="fade-down" style="color:black;"></i>
</div>
</div>


<div style="overflow: hidden;">
<div style="height:20px"></div>
<div class="wrap" >

<div class="left" data-aos="fade-right" data-aos-duration="2000"><a href="bengpro.jsp">Bengali</a></div>
<div class="right" data-aos="fade-left" data-aos-duration="2000"><a href="mahapro.jsp">Maharasthrian</a></div>
</div>


<div class="wrap1" >
<div class="left1"data-aos="flip-left"" data-aos-duration="3000"><a href="punpro.jsp">Punjabi</a></div>
<div class="right1" data-aos="flip-right" data-aos-duration="3000"><a href="nagapro.jsp">Nagaland</a></div>
</div>


<div class="wrap2" >
<div class="left2" data-aos="fade-right" data-aos-duration="3000"><a href="si.jsp">South Indian</a></div>
<div class="right2" data-aos="fade-left" data-aos-duration="3000"><a href="rajpro.jsp">Rajasthan</a></div>
</div>
</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
<script>
function on() {
    document.getElementById("overlay").style.display = "block";
}

function off() {
    document.getElementById("overlay").style.display = "none";
}
</script>

<div class="footer" align="right">
<a href="https://www.facebook.com/speedycarttk/"><i
				class="fa fa-facebook-f"></i></a> &nbsp;&nbsp;|&nbsp;&nbsp;
<button onclick="on()">How to use?</button>&nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="about.jsp"><b>About us</b></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="contactform.jsp"><b>Contact us</b> </a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<b>&copy; SPEEDYCART.TK</b>&nbsp;&trade;

</div>
<script>
    AOS.init();
</script>

<script src="js/particles.js"></script>
<script src="js/app.js"></script>
</body>
</html>