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
    <%@page import="javax.servlet.http.Cookie"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update customer details</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conn.JDBConn"%>
<%


String email = request.getParameter("email");

Connection Conn = null;
Statement statement = null;
ResultSet resultSet = null;

Conn = JDBConn.CheckCon(Conn);
%>
<%

if (Conn != null) {

try{

statement=Conn.createStatement();
String sql ="select * from regs where email='" + email + "' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<center>
<h2>
<%
if (myCookie == null) {
%>

You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%
} else {
%> 
<p>Welcome: <%=myCookie.getValue()%>
<a href='logout.jsp'>Log out</a>
<%
}
%>
</h2>


<h1>Edit your profile</h1>
<form method="post" action="updateuserown-process.jsp">




<br>
First name:<br>
<input type="text" name="fname" value="<%=resultSet.getString("fname") %>">
<br>
Last name:<br>
<input type="text" name="lname" value="<%=resultSet.getString("lname") %>">
<br>


<input type="hidden" name="email" value="<%=resultSet.getString("email") %>">
<br>
Type your Gender in small letters:<br>
<input type="text" name="gender" value="<%=resultSet.getString("gender") %>">
<br>
phone:<br>
<input type="text" name="phone" value="<%=resultSet.getString("phone") %>">
<br>

New Password:<br>
<input type="password" name="pass" value="<%=resultSet.getString("pass") %>">
<br>

<br><br>
<input type="submit" value="Save">
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="yourprofile.jsp" style="text-decoration:none"><input type="submit" value="Cancel"></a>

</form>
</center>
<%
}
Conn.close();
statement.close();
resultSet.close();
} catch (Exception e) {
e.printStackTrace();
}

} else {
    out.println("DATABASE CONNECTION ERROR!");
}
%>
</body>
</html>