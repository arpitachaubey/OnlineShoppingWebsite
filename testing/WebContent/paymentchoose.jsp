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
<title>Choose payment method</title>
</head>
<body>
<div align="center"
		style="background-color: #baa7c8; font-size: 4vw; font-family: sans-serif;">
		CLOTHING</div>
	<br>
	<br>

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
		
		
		<br> <br>
		
						<%
if (myCookie == null) {
%>

You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%
} else {
%> 
<a href="welcomecustomer.jsp" >GO HOME</a> 
<p>Welcome: <%=myCookie.getValue()%></p>
<a href='logout.jsp'>Log out</a>

<%
}
%>


			<br> <br>

		</h2>
<%

String email=myCookie.getValue().toString();




Connection Conn=null;
PreparedStatement PrepareStat=null;
PreparedStatement ps=null;


String cardno = " ", holdername=" ",orderid=" ";

Conn = JDBConn.CheckCon(Conn);


if (Conn != null) {
	
	
	
	  try {

	        //-----------------------------------fetch data from user START HERE...

	        ps = Conn.prepareStatement("select * from orders where email=?");
	        ps.setString(1, email);
			ResultSet rt = ps.executeQuery();

	        while (rt.next()) {
	           
	            orderid = rt.getString("orderid");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	  
	  
    try {

        //-----------------------------------fetch data from user START HERE...

        ps = Conn.prepareStatement("select * from cards where email=?");
        ps.setString(1, email);
		ResultSet rt = ps.executeQuery();
%><center>
<h1>Select payment method: </h1>
<h2>

           
           
           
	<form action="paymentupdate.jsp" method="post">
<input type="hidden" name="orderid" value="<%=orderid %>">
 
<input type="radio" name="cardno" value="cod" class="static_class">Cash on delivery <br><br>

<input type="radio"  name="cardno" value="Yes" class="static_class" />Credit/Debit card :
          <br>
<%
        while (rt.next()) {
           %>
           
          
           <div id="extra">
<input type="radio" name="cardno" value="<%=rt.getString("cardno") %>">
<%=rt.getString("holdername") %> | <%=rt.getString("cardno") %><br><br>
	</div>
	
	
           <%
            
        }
    
%>
<br>
or <a href="coadcard.jsp?orderid=<%=orderid %>">Add new card details</a>
<br>
<br>	 
	<input class='add2cart' type="submit" value="Place order" >
	
	</h2>
	</form>



<%

   
    
   
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    ps.close();
	Conn.close();  
} else {
    out.println("DATABASE CONNECTION ERROR!");
}

%>

	
	</center>
	<script src="http://code.jquery.com/jquery.js"></script>
    <script type="text/javascript">
      $(function(){
        $(".static_class").click(function(){
          if($(this).val() === "Yes")
            $("#extra").show("fast");
          else
            $("#extra").hide("fast");
        });
      });
    </script>
	
</body>
</html>