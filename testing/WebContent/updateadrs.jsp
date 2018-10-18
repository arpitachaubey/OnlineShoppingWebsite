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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>edit your address</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conn.JDBConn"%>

<%


String addressid = request.getParameter("addressid");

Connection Conn = null;
Statement statement = null;
ResultSet resultSet = null;

Conn = JDBConn.CheckCon(Conn);
%>
<%
if (Conn != null) {
try{

statement=Conn.createStatement();
String sql ="select * from address where addressid='" + addressid + "' ";
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


<h1>Edit your address</h1>
<form method="post" action="updateadrs-process.jsp">



<input type="hidden" name="addressid" value="<%=resultSet.getString("addressid") %>">
<br>
Address title:<br>
<input type="text" name="adrstitle" value="<%=resultSet.getString("adrstitle") %>">
<br>
Full address:<br>
<input type="text" name="adrs" value="<%=resultSet.getString("adrs") %>">


<br>
State:<br>
<input type="text" name="state" value="<%=resultSet.getString("state") %>">
<br>
City:<br>
<input type="text" name="city" value="<%=resultSet.getString("city") %>">
<br>

Pin code:<br>
<input type="text" name="pin" value="<%=resultSet.getString("pin") %>">
<br>

<br><br>
<input type="submit" value="Submit">
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="youraddress.jsp" style="text-decoration:none"><input type="submit" value="Cancel"></a>
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