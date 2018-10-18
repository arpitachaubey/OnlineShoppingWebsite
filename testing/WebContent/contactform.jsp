<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Contact us</title>

<style type="text/css">
textarea {
   resize: none;
}

body{
margin: 0;
padding: 0;
}
.header{
background-color: #d3d3e9;
height: 70px;

}
.header a{
color: black;
text-decoration: none;
font-size: 4.5vw;
}
@media only screen and (max-width: 375px) {
.header a{
font-size: 14vw;
}
}

</style>
</head>
<body>

<div class="header" align="center">
<a href="home.jsp" >CLOTHING</a>
</div>

<form action="Contactform" method="post" onSubmit="return validate();">
<center>
				<h2>Contact us</h2>
				<p>Full name:</p>
				<input type="text" name="name" id="name"
					placeholder="Enter your name"> <br>
				 <br>
				<p>Email:</p>
				<input type="text" name="email" id="email"
					placeholder="Enter email"> <br>
				<br>
				<p>Subject:</p>
				<input type="text" name="sub" id="sub"
					placeholder="Enter subject"> <br>
				<br>
				<p>Message/Query:</p>
				<textarea rows="4" cols="30" name="m" id="m"
					placeholder="Enter message/query here..."></textarea> <br>
				<br>
				
					<input type="submit" value="Submit" class="s">
				</center>
			</form>
</body>
</html>