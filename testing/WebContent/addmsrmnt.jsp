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
<title>Add address</title>
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

<form action="Addnewmsrmnt" method="post" >
<input type="hidden" name="email"  value="<%=myCookie.getValue()%>"> 
				<h2>Add a new custom</h2>
				<h1>Note :Enter measurements in only INCHES!</h1>
				<p>Enter your Custom type:</p>
				<input type="text" name="customtype" id="customtype"
					placeholder="Enter your custom type like slim loose"> <br>
				
				<p>Collar length:</p>
				<input type="text" name="collar" id="collar"
					placeholder="Enter your collar length"> <br>
				
				<p>Body length:</p>
				<input type="text" name="bodylength" id="bodylength"
					placeholder="Enter your bodylength"> <br>
				<p>Chest size:</p>
				<input type="text" name="chest" id="chest"
					placeholder="Enter your chest size"> <br>
					<p>Shoulder size:</p>
				<input type="text" name="shoulder" id="shoulder"
					placeholder="Enter shoulder size"> <br>
					<p>Arm length:</p>
				<input type="text" name="armlength" id="armlength"
					placeholder="Enter arm length"> <br>
					<p>Bicep size:</p>
				<input type="text" name="bicepsize" id="bicepsize"
					placeholder="Enter bicep size"> <br>
					<p>Wrist size:</p>
				<input type="text" name="wristsize" id="wristsize"
					placeholder="Enter wrist size"> <br>
					<p>Waist size:</p>
				<input type="text" name="waist" id="waist"
					placeholder="Enter waist size"> <br>
					<p>Hip size:</p>
				<input type="text" name="hip" id="hip"
					placeholder="Enter hip size"> <br>
					
					<p>Rise size:</p>
				<input type="text" name="rise" id="rise"
					placeholder="Enter rise size"> <br>
					<p>Thigh size:</p>
				<input type="text" name="thigh" id="thigh"
					placeholder="Enter thigh size"> <br>
					<p>Knee size:</p>
				<input type="text" name="knee" id="knee"
					placeholder="Enter knee size"> <br>
					<p>Ankle size:</p>
				<input type="text" name="ankle" id="ankle"
					placeholder="Enter ankle size"> <br>
				
					<input type="submit" value="Add" class="s">
					
   <input type="button" value="cancel" onclick="goBack()" />

				
			</form>
			</center>
			<script>
function goBack() {
    window.history.back();
}
</script>

<%
}
%>
</body>
</html>