<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query/messaged</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>




<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://tommy.heliohost.org:3306/";
String dbName = "mistrisu_susmit";
String userId = "mistrisu";
String password = "sumitmistri456";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Message/Query list</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">

<tr bgcolor="#baa7c8">

<td><b>Name</b></td>
<td><b>Email</b></td>
<td><b>Subject</b></td>
<td><b>Message</b></td>


</tr>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM contact";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887";>


<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("sub") %></td>
<td align="center">
<textarea rows="4" cols="30" readonly style=" resize: none; background-color:#DEB887; border:none;"><%=resultSet.getString("m") %>
</textarea></td>




</tr>

<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>



</table>
<a href="adminpanel.jsp" align="center">Go home</a>


</body>
</html>