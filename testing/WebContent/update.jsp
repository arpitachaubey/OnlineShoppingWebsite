<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<h1>Update customer information</h1>
<form method="post" action="update-process.jsp">




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

<br><br>
<input type="submit" value="submit">
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