 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@ page import ="java.sql.*" %>
<%@page import ="java.io.IOException" %>
<%@page import ="java.io.PrintWriter" %> 

<%@page import= "java.sql.PreparedStatement"%>

<%@page import ="java.sql.SQLException"%>
<%@page import ="javax.servlet.ServletException"%>
<%@page import ="javax.servlet.http.HttpServlet"%>
<%@page import ="javax.servlet.http.HttpServletRequest"%>
<%@page import ="javax.servlet.http.HttpServletResponse"%>
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


<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://tommy.heliohost.org:3306/";
String database = "mistrisu_susmit";
String userid = "mistrisu";
String password = "sumitmistri456";
String p_name=request.getParameter("p_name").trim();



try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
</head>
<body >
<a href="index.jsp"  style="text-decoration: none"><div align="center" style="background-color: #baa7c8; font-size:4vw; font-family: sans-serif;">
CLOTHING
</div></a>

<%
				if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
			%>
			
			<%
				} else {
			%>
			
			<%
				}
			%>



<h2 align="center">
	<%
if (myCookie == null) {
%>

You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%
} else {
%> 
<p>Welcome: <%=myCookie.getValue()%>
<a href='logout.jsp'>Log out</a><br>
<a href="welcomecustomer.jsp" style="text-decoration: none;">GO HOME</a> 
<%
}
%>
 </h2>




<br>
<br>


 <h1>Search Result</h1>
<table border="1">
<tr bgcolor="#baa7c8">

<td>Product's ID</td>
<td>Product's Name</td>
<td>Product's price</td>
<td>category</td>
<td>Product's details</td>
<td>Product's Image</td>
<td>Action</td>

</tr>

<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="(select * from product where p_name like '%" + p_name + "%') ";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<tr>

<td><%=resultSet.getString("p_id") %></td>
<td><a href='product.jsp?p_id=<%=resultSet.getString("p_id")%>'><%=resultSet.getString("p_name") %></a></td>
<td><%=resultSet.getString("p_price") %></td>
<td><%=resultSet.getString("c_name") %></td>
<td><%=resultSet.getString("p_details") %></td>
<td align="center">
<img src='getImage.jsp?id=<%out.print(resultSet.getString("p_name")); %>'  width=160px; />
</td>
<td><a href="myCart.jsp?p_id=<%=resultSet.getString("p_id")%>">Add to cart</a></td>

</tr>

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
        
            
<br>




</body>
</html>