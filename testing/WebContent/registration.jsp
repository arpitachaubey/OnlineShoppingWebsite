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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>



<title>Sign up- CLOTHING</title>


</head>
<body>

	<div class="signup">
		<div class="midl">
			<a href="index.jsp">CLOTHING</a>
		</div>
		<div class="signupbox">

			<form action="Registration" method="post" onSubmit = "return Validate();">
				<h2>Sign Up Here</h2>
				<p>Enter your first name:</p>
				<input type="text" name="fname" required="required"
					placeholder="Enter your first name"><br>
				<p>Enter your last name:</p>
				<input type="text" name="lname" required="required"
					placeholder="Enter your last name">
				<p>Enter your email:</p>
				<input type="text" name="email" required="required" id="email"
					placeholder="Enter your email">
				<p>Select Gender:</p>
				<input type="radio" name="gender" value="male">Male &nbsp; <input
					type="radio" name="gender" value="female">Female
					
				<p>Enter your phone no.:</p>
				<input type="text" name="phone" id="mobile" required="required"
				
					placeholder="Enter your phone no.">
				<p>Create a password:</p>
				<input type="password" name="pass" required="required" id="password"
					placeholder="Create a password"><br>
				<br>
				<center>
					<input type="submit" value="SIGN UP" class="s">
					
				</center>
			</form>
<center>Already have an account?<a href="login.jsp" style="color: white;"> Sign in</a></center>
		</div>

		<div class="signupline">
			<hr width=90% style="border-width: 1px;">
		</div>

		<div class="signupfooter" align="right">

			<a href="https://www.facebook.com/speedycarttk/"><i
				class="fa fa-facebook-f"></i></a> &nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="about.jsp"><b>About us</b></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="contactform.jsp"><b>Contact us</b> </a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<b>&copy; SPEEDYCART.TK</b>&nbsp;&trade;





		</div>
	</div>
<script type = "text/javascript">
    function Validate() {
    	 var email = document.getElementById("email").value;
 		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
 		var password = document.getElementById("password").value;
 		var mobile = document.getElementById("mobile").value;
        var pattern = /^\d{10}$/;
 		if (email === "") {
 			alert( "*Enter email-id");
 			return false;
 		}
 		if (!filter.test(email)) {
 			alert("*Enter valid email-id");
 			return false;

 		}
 		if (password === "") {
 			alert ( "Enter password");
 			return false;
 		}
    	
        
        if (pattern.test(mobile)) {
            alert("Your mobile number is : " + mobile +",  click OK to sign up ");
            return true;
        }
        alert(" Please input 10 digits number!");
        return false;
        
       
    }
</script>






</body>
</html>