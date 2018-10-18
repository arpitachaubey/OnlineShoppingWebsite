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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<title>Insert title here</title>
</head>
<body>



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
		<h2 align="center">
						<%
if (myCookie == null) {
%>

Sorry,Cannot add the product to the cart as You are not logged in <br/>
<a href="login.jsp">Please Login</a>
<%
} else {
%> 
<p>Welcome: <%=myCookie.getValue()%></p>
 
<a href='logout.jsp'>Log out</a><br>
<a href="welcomecustomer.jsp" >GO HOME</a>


	<%


	String cardno=request.getParameter("cardno").toString();
	String orderid =request.getParameter("orderid").toString();
String email=myCookie.getValue().toString();
//out.print(p_id+email);



Connection Conn=null;
PreparedStatement PrepareStat=null;
PreparedStatement ps=null;





Conn = JDBConn.CheckCon(Conn);

if (Conn != null) {
    


   

    //------------------------------------------------------------------- UPDATE TO order START HERE.....

   
    
  
		try {
        String insertS = "UPDATE orders SET cardno='"+cardno+"' WHERE  orderid='"+orderid+"'";
        PrepareStat = Conn.prepareStatement(insertS);
        //PrepareStat.setString(1, email);
        PrepareStat.executeUpdate();
       	//out.println(" order UPDATED");
       	//out.print("<a href='yourCart.jsp'>GO TO YOUR CART</a>");
      response.sendRedirect("yourorder.jsp");
		} catch (SQLException e) {
        e.printStackTrace();
        out.println("SQL Error!" + e);
    }
  
    
    
		
    	Conn.close();
    
    
		
   
} else {
    out.println("DATABASE CONNECTION ERROR!");
}
%>

<%
}
%>
</h2>





</body>
</html>