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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<title>Custom - the product</title>
<style type="text/css">

/* img:hover {
    transform: scale(3.0);
    -ms-transform: scale(3.0);
    -webkit-transform: scale(3.0);
    -moz-transform: scale(3.0);
    -o-transform: scale(3.0);
}
img {
    transition: transform 0.2s;
    -webkit-transition: -webkit-transform 0.2s;
    -moz-transition: -moz-transform 0.2s;
    -o-transition: -o-transform 0.2s;
   
}  */
.add2cart{

background-color: #57afe7;
padding: 2px;
border: 2px solid grey;
border-radius: 5px;
}

.buy{

background-color: #e7b857;
padding: 2px;
border: 2px solid grey;
border-radius: 5px;
}
.le, .ri{
display: inline-block;
}

</style>
<style>
		

		/* these styles are for the demo, but are not required for the plugin */
		.zoom {
			display:inline-block;
			position: relative;
		}
		
		/* magnifying glass icon */
		.zoom:after {
			content:'';
			display:block; 
			width:64px; 
			height:64px; 
			position:absolute; 
			top:0;
			right:0;
			
		}

		.zoom img {
			display: block;
		}

		.zoom img::selection { background-color: transparent; }

		
	</style>
</head>
<body>
	<div align="center"
		style="background-color: #baa7c8; font-size: 4vw; font-family: sans-serif;">
		CLOTHING</div>
	

	<h2 align="center">
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

You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%
} else {
%> 
<a href="welcomecustomer.jsp" >GO HOME</a> 
<p><%=myCookie.getValue()%></p>
<a href='logout.jsp'>Log out</a>




		</h2>

	

	<%
		String p_id = request.getParameter("p_id");
	String email = myCookie.getValue().toString();
		Connection Conn = null;
		PreparedStatement PrepareStat = null;
		PreparedStatement ps = null;
		 

		
		
		int qnty;
		Conn = JDBConn.CheckCon(Conn);
		
		if (Conn != null) {
			try {
				ps = Conn.prepareStatement("select * from product where p_id=?");
				ps.setString(1, p_id);
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					
					%>
	<h3 align="center">
		<hr width=80% style="border-width: 4px;">
<div class="le">
<span class='zoom' id='ex1'>
<img src='getImage.jsp?id=<%out.print(rs.getString("p_name")); %>'  height=470px; width=320px; />
</span>
</div>
<input type="hidden" name="p_id" value="<%=rs.getString("p_id")%>">
<div class="ri">
		<%out.print("Product's Name: " + "&nbsp;&nbsp;" +rs.getString("p_name").toString()+"<br>");
					out.print("Product's Price: Rs." + "&nbsp;&nbsp;" +rs.getString("p_price").toString()+"<br>");
					//out.print("Product's Details: " + "&nbsp;&nbsp;" +rs.getString("p_details").toString()+"<br><br>");
			%>
			<br>Product's Details:
<br> 
<textarea  readonly style=" resize: none; "><%=rs.getString("p_details") %>
</textarea><br>
					<input type="hidden" name="p_id" value="<%=rs.getString("p_id")%>">
					
		

		
	 <%-- <a href="myCart.jsp?p_id=<%=rs.getString("p_id")%>">Add to cart</a> --%>
	

	Select your customs: 
	<% 
				}
				
			
			
			
			 try {
				 
			        ps = Conn.prepareStatement("select * from custom where email=?");
			        ps.setString(1, email);
			        ResultSet rt = ps.executeQuery();

			        while (rt.next()) {
						//out.println("<input type='radio' class='c'>"+rt.getString("customtype").toString()+"&nbsp;&nbsp;");
%>


<form action="myCart.jsp" method="post">
<input type="hidden" name="p_id" value="<%=p_id%>">

<input type="radio" name="customsize" class="c" value="<%=rt.getString("customtype") %>"><%=rt.getString("customtype") %><br>

<%     }
			  %><b>or</b>
	<a href="addmsrmnt.jsp">Add new custom</a>
	<br>
	<button class='buy' type="submit" formaction="mywish.jsp">Buy now</button>
	&nbsp;&nbsp;<input class='add2cart' type="submit" value="Add to Cart" >
	
	
	
	</form>
	<br>
		<input type="button" value="Go back" onclick="goBack()" />	
	</h3>
	</div>		  
			  <%      
			       
			    } catch (SQLException e) {
			        e.printStackTrace();
			    }
			} catch (SQLException e) {
				e.printStackTrace();
			}

			
			
			ps.close();
	    	Conn.close();
		} else {
			out.println("Something went wrong! ...please logout and login again after 1 minutes ");
		}
	%>
	
	
	<br>
	
	
	<script>
function goBack() {
    window.history.back();
}
</script>

<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
	<script src='jquery.zoom.js'></script>
	<script>
		$(document).ready(function(){
			$('#ex1').zoom();
			
		});
	</script>
	<%
}
%>
</body>
</html>