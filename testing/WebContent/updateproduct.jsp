<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<title>Insert title here</title>

<style type="text/css">
textarea {
   resize: none;
}
</style>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conn.JDBConn"%>
<%
String id = request.getParameter("p_id");

Connection Conn = null;
Statement statement = null;
ResultSet resultSet = null;

Conn = JDBConn.CheckCon(Conn);
%>


<%
if (Conn != null) {
try{

statement=Conn.createStatement();
String sql ="select * from product where p_id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<center>
<h1>Update product details</h1>
<form method="post" action="updateproduct-process.jsp">

<input type="hidden" name="p_id" value="<%=resultSet.getString("p_id") %>">

<br>

<br>
Product's name:<br>
<input type="text" name="p_name" value="<%=resultSet.getString("p_name") %>">
<br>
Product's price:<br>
<input type="text" name="p_price" value="<%=resultSet.getString("p_price") %>">
<br>

Category type in small letters:<br>
<input type="text" name="c_name" value="<%=resultSet.getString("c_name") %>">
<br>
Product's details:<br>
<textarea name="p_details"  rows="4" cols="30" ><%=resultSet.getString("p_details") %></textarea>
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