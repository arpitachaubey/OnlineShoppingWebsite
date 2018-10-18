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
<%@ page import="javax.servlet.http.HttpSession"%>



<%
	String cookieName = "email";
	Cookie cookies[] = request.getCookies();
	Cookie myCookie = null;
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals(cookieName)) {
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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<title>YOUR CART</title>
<style>
/* NEVIGATION BAR */
body {
	margin: 0;
	background-image: url("images/cart.jpg");
	background-size: cover;
	background-position: center center;
	
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

.cart{
background: rgba(0, 0, 0, 0.5);
color: white;
font-weight: bold;
padding-bottom: 70px;
}
</style>

<script type="text/javascript">
	function decrease() {
		//alert("Hello");
		//	location.href = "changeQty.jsp?qy=".concat(qy);
	}
</script>

</head>
<body>

	<a href="welcomecustomer.jsp" style="text-decoration: none">
		<div align="center"
			style="background-color: #baa7c8; font-size: 4vw; font-family: sans-serif;">
			CLOTHING</div>
	</a>




	<!--  NEVIGATION  -->

	<div class="topnav">
		
		<a href="yourorder.jsp"><i class="fa fa-first-order"></i> Orders</a> 
			<a class="active" href="yourCart.jsp"><i class="fa fa-shopping-cart"></i> Cart</a> 
			<a href="yourcard.jsp"><i class="fa fa-credit-card"></i> Cards</a>
			<a href="youraddress.jsp"><i class="fa fa-address-card"></i> Addresses</a>
			 <a  href="yourcustom.jsp"><i class="fa fa-male"></i> Customs</a>
			 <a href="yourprofile.jsp"><i class="fa fa-user"></i> Profile</a> <a
				href="home.jsp"><i class="fa fa-home"></i> Home</a>


		</div>
		
		
	<div class="container">
		<form class="form-inline" method="post" action="search2.jsp">
			<input type="text" name="p_name" class="form-control"
				placeholder="Search by product's name...">
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
		<div class="cart">
	<h2 align="center">
	
		<br> <br>

		<%
			if (myCookie == null) {
		%>

		You are not logged in<br /> <a href="login.jsp">Please Login</a>
		<%
			} else {
		%>
		<p>
			Welcome:
			<%=myCookie.getValue()%></p>
		<a href='logout.jsp'>Log out</a>
		<%
			}
		%>





	</h2>
	<br>
	<br>

	<%
		Connection Conn = null;
		PreparedStatement PrepareStat = null;
		PreparedStatement ps = null;
String email=myCookie.getValue();
		String price = " ", pname = " ", qty = "1";
		String  cartid = " ";
		String p_size=" ";
		String customsize=" ";
		Conn = JDBConn.CheckCon(Conn);
		int qntity = 0, pprice = 0;
		int incTotal[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
				0, 0, 0, 0 };
		int i = 0;
		int total = 0;

		if (Conn != null) {
			try {

				ps = Conn.prepareStatement("select * from cart where email='" + myCookie.getValue() + "'");

				ResultSet rs = ps.executeQuery();
				//session.setAttribute("p_id",rs.getString("p_id").toString());
				
				
	%>
	<table border="1" align="center">
		<tr>
			
			<td>Product name</td>
			<td>Product price</td>
			
			<td>Quantity</td>
			<td>Selected Size</td>
			<td>Selected Custom</td>
			<td>Action</td>
			

		</tr>

		<%
			while (rs.next()) {
				
				
		%>
		
		<tr>
			
			<td>
				<%
					out.print(rs.getString("pname"));
				%>
			</td>
			<td>
				<%
					out.print(rs.getString("price"));
				%>
			</td>
			
			<td>
				<button
					onclick="location.href='changeQty.jsp?qty=<%out.print(rs.getString("qty"));%>&pid=<%out.print(rs.getString("p_id"));%>&eml=<%out.print(rs.getString("email"));%>&fg=1'">-</button>
				<%
					out.print(rs.getString("qty"));
				%>
				<button
					onclick="location.href='changeQty.jsp?qty=<%out.print(rs.getString("qty"));%>&pid=<%out.print(rs.getString("p_id"));%>&eml=<%out.print(rs.getString("email"));%>&fg=2'">+</button>
			</td>
			<td>
			<%
					out.print(rs.getString("p_size"));
				%></td>
				
				
				<td><% out.print(rs.getString("customsize")); %></td>
			<td><a href="removecart.jsp?p_id=<%=rs.getString("p_id")%>">REMOVE</a></td>
			
			
			
		</tr>

		<%
			pprice = Integer.parseInt(rs.getString("price"));
						qntity = Integer.parseInt(rs.getString("qty"));
						incTotal[i] = pprice * qntity;
						//out.print(incTotal[i]);
						i++;

					}
					for (i = 0; i < incTotal.length; i++) {
						total = (total + incTotal[i]);
					}
		%></table>
		<center>
			<h2>Total price is: Rs.<%
					out.print(total);
			
				%><br><a class="at" href="chooseadrs.jsp?total=<%=total%>">Check out>>></a></h2>
			
		
			

			

		<%
			//out.print("</table>");
					
					

				} catch (SQLException e) {
					e.printStackTrace();
					out.println("SQL Error!" + e);

				}
			 
				Conn.close();
				
			
			} else {
				out.print("Something went wrong! ... please logout and login again after 1 minutes ");
			}
		%>
		
		
		
	</center>
	</div>
</body>
</html>