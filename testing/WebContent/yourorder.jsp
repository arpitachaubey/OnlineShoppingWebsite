<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your orders</title>
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
</head>
<body>




	<a href="welcomecustomer.jsp" style="text-decoration: none">
		<div align="center"
			style="background-color: #baa7c8; font-size: 4vw; font-family: sans-serif;">
			CLOTHING</div>
	</a>
	<center>



		<!--  NEVIGATION  -->

		<div class="topnav">
		
		<a class="active" href="yourorder.jsp"><i class="fa fa-first-order"></i> Orders</a> 
			<a href="yourCart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a> 
			<a href="yourcard.jsp"><i class="fa fa-credit-card"></i> Cards</a>
			<a href="youraddress.jsp"><i class="fa fa-address-card"></i> Addresses</a>
			 <a href="yourcustom.jsp"><i class="fa fa-male"></i> Customs</a>
			 <a href="yourprofile.jsp"><i class="fa fa-user"></i> Profile</a> <a
				href="home.jsp"><i class="fa fa-home"></i> Home</a>


		</div>
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
%>	</h2>
			<br> 
			<h2 align="center"><font><strong>Orders list</strong></font></h2><br>
			
			<table align="center" cellpadding="5" cellspacing="5" border="1">

<tr bgcolor="#baa7c8">
<td><b>Product name</b></td>
<td><b>Quantity</b></td>
<td><b>Selected Size</b></td>
<td><b>Custom Size</b></td>
<td><b>Total</b></td>
<td><b>Address</b></td>
<td><b>Payment</b></td>
<td><b>Order Status</b></td>
<td><b>Action</b></td>

</tr>
			<%
			String email=myCookie.getValue().toString();

				Connection Conn = null;
				PreparedStatement PrepareStat = null;
				PreparedStatement ps = null;

				Conn = JDBConn.CheckCon(Conn);

				if (Conn != null) {
					try {
						ps = Conn.prepareStatement("select * from orders where email='" + email + "'");
						ResultSet rs = ps.executeQuery();

						while (rs.next()) {
							%>
							<tr bgcolor="#DEB887";>
			<input type="hidden" vlaue="<%=rs.getString("orderid")%>">
							<td><%=rs.getString("pname") %></td>
							<td><%=rs.getString("qty") %></td>
							<td><%=rs.getString("p_size") %></td>
							<td><%=rs.getString("customsize") %></td>
							<td><%=rs.getString("total") %></td>
							<td><%=rs.getString("adrstitle") %></td>
							<td><%=rs.getString("cardno") %></td>
							<td><%=rs.getString("orderstatus") %></td>
							<td>
							<a href="cancelorder.jsp?orderid=<%=rs.getString("orderid") %>">Cancel</a></td>
							</tr>
			

		

			<%
				}

					} catch (SQLException e) {
						e.printStackTrace();
					}
					%></table><%
				
				
				
					 
					Conn.close();
					
				
				} else {
					out.println("Something went wrong! ... please logout and login again after 1 minutes ");
				}
			%>

	


		<br />








	</center>
</body>
</html>