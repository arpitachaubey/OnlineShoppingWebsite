<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>change the order status</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conn.JDBConn"%>

<%


String orderid = request.getParameter("orderid");

Connection Conn = null;
Statement statement = null;
ResultSet resultSet = null;
Conn = JDBConn.CheckCon(Conn);
%>
<%
if (Conn != null) {
try{
statement=Conn.createStatement();
String sql ="select * from orders where orderid='" + orderid + "' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>

<center>
<h1>Update order status</h1>

<form method="post" action="update-statusprocess.jsp">


<input type="hidden" name="orderid" value="<%=resultSet.getString("orderid") %>">
<input type="radio" name="orderstatus" value="Approved">Approved<br>
<input type="radio" name="orderstatus" value="Packed">Packed<br>
<input type="radio" name="orderstatus" value="Shipped">Shipped<br>
<input type="radio" name="orderstatus" value="Delivered">Delivered<br>
<input type="radio" name="orderstatus" value="Rejected">Rejected<br>




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