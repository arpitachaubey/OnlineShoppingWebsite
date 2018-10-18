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
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@ page import="java.sql.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="conn.JDBConn"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import= "javax.servlet.http.HttpSession"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Welcome</title>
<style>
/* NEVIGATION BAR */
body {
	margin: 0;
}

.topnav {
	overflow: hidden;
	background-color: #333;
}

.topnav a {
	float: right;
	display: block;
	color: #f2f2f2;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
	font-family: Verdana;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #8C5DBF;
	color: white;
}
</style>


</head>


<body>
	<a href="welcomecustomer.jsp" style="text-decoration: none">
		<div align="center" style="background-color: #baa7c8; font-size: 4vw; font-family: sans-serif;">
			CLOTHING</div>
	</a>


	<!--  NEVIGATION  -->

	<div class="topnav">
	
	<a href="yourorder.jsp"><i class="fa fa-first-order"></i> Orders</a> 
		<a href="yourCart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a>
		<a href="yourcard.jsp"><i class="fa fa-credit-card"></i> Cards</a>
		 <a href="youraddress.jsp"><i class="fa fa-address-card"></i> Addresses</a>
		 <a  href="yourcustom.jsp"><i class="fa fa-male"></i> Customs</a>
		  <a href="yourprofile.jsp"><i class="fa fa-user"></i> Profile</a>
		   <a class="active"
			href="welcomecustomer.jsp"><i class="fa fa-home"></i> Home</a>


	</div>


	<center>




		<div class="container">
			<form class="form-inline" method="post" action="search2.jsp">
				<input type="text" name="p_name" class="form-control"
					placeholder="Search product's name...">
				<button type="submit" name="save" class="btn btn-primary">Search</button>
			</form>
		</div>
		
		<%
				if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
			%>
			
			<%
				} else {
			%>
			
			<%
				}
			%>
		
		
		<br> <br>
		<h2>
						<%
if (myCookie == null) {
%>

You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%
} else {
%> 
<p>Welcome: <%=myCookie.getValue()%></p>
<a href='logout.jsp'>Log out</a>
<%
}
%>


			<br> <br>

		</h2>

		<br />








	</center>
</body>
</body>
</html>