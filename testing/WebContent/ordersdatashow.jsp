<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>orders</title>
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
<h2 align="center"><font><strong>Ordered list</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">

<tr bgcolor="#baa7c8">

<td><b>Product name</b></td>
<td><b>Quantity</b></td>
<td><b>Product's price</b></td>
<td><b>Size</b></td>
<td><b>Custom Size</b></td>
<td><b>Total</b></td>
<td><b>Address</b></td>
<td><b>Payment</b></td>
<td><b>Email</b></td>
<td><b>Order Status</b></td>
<td><b>Change order status</b></td>
</tr>

<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM orders";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887";>


<td><%=resultSet.getString("pname") %></td>
<td><%=resultSet.getString("qty") %></td>
<td><%=resultSet.getString("price") %></td>
<td><%=resultSet.getString("p_size") %></td>
<td><%=resultSet.getString("customsize") %></td>
<td><%=resultSet.getString("total") %></td>
<td><%=resultSet.getString("adrstitle") %></td>
<td><%=resultSet.getString("cardno") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("orderstatus") %></td>

<td><a href="update-status.jsp?orderid=<%=resultSet.getString("orderid")%>">change</a></td>



</tr>

<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>