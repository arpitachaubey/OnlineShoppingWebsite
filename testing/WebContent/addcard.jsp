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

<title>Add your card details</title>
</head>
<body>

<div align="center"
			style="background-color: #baa7c8; font-size: 4vw; font-family: sans-serif;">
			CLOTHING</div>
	<center>		
			
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
 
<a href='logout.jsp'>Log out</a><br>
<a href="welcomecustomer.jsp" >GO HOME</a>



			<br> <br>

		</h2>

<form action="Addcard" method="post" >
<input type="hidden" name="email"  value="<%=myCookie.getValue()%>"> 

				<h2>Enter your new card details</h2>
				<p>Card holder's name:</p>
				<input type="text" name="holdername" id="holdername"
					placeholder="Enter card holder's name"> <br>
				
				<p>Card number:</p>
				<input type="text" name="cardno" id="cardno"
					placeholder="Enter card number"> <br>
				
				<p>Expiry date of card:</p>
				<input type="text" name="expdate" id="expdate"
					placeholder="Enter the expiry date"> <br>
				<p>Enter CVV:</p>
				<input type="password" name="cvv" id="cvv"
					placeholder="Enter CVV number"> <br>
					
				
					<input type="submit" value="Add" class="s">
					<a href="yourcard.jsp">
   <input type="button" value="cancel" />
</a>
				
			</form>
			</center>
<%
}
%>
</body>
</html>