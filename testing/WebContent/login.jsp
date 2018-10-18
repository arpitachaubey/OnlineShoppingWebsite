<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<title>Sign in- CLOTHING</title>


</head>
<body>
	<div class="loginbody">
		<div class="midd">
			<a href="index.jsp">CLOTHING</a>
		</div>
		<div class="loginbox">


			<form action="Login" method="post" onSubmit="return validate();">

				<h2>Sign In Here</h2>
				<p>Enter your email:</p>
				<input type="text" name="email" id="email"
					placeholder="Enter your email"> <br>
				<span style="color: yellow" id="error1"></span> <br>
				<p>Enter password:</p>
				<input type="password" name="pass" id="password"
					placeholder="Enter password"> <br>
				<span style="color: yellow" id="error2"></span><br>
				<center>
					<input type="submit" value="SIGN IN" class="s">
				</center>
			</form>
			<center>New User?<a href="registration.jsp" style="color: white;"> Sign up</a></center>
		</div>

		<div class="loginline">
			<hr width=90% style="border-width: 1px;">
		</div>
		<div class="loginfooter" align="right">

			<a href="https://www.facebook.com/speedycarttk/"><i
				class="fa fa-facebook-f"></i></a> &nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="about.jsp"><b>About us</b></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="contactform.jsp"><b>Contact us</b> </a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<b>&copy; SPEEDYCART.TK</b>&nbsp;&trade;



		</div>

	</div>









	<script type="text/javascript">
		function validate() {
			var email = document.getElementById('email').value;
			var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			var password = document.getElementById('password').value;
			if (email === "") {
				document.getElementById('error1').innerHTML = "*Enter email-id";
				return false;
			}
			if (!filter.test(email)) {
				document.getElementById('error1').innerHTML = "*Enter valid email-id";
				return false;

			}
			if (password === "") {
				document.getElementById('error2').innerHTML = "Enter password";
				return false;
			}
		}
	</script>


</body>
</html>