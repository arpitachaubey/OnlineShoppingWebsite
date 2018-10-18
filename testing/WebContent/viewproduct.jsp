<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
textarea {
   resize: none;
   bgcolor:#DEB887;
}
</style>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<title>list of products</title>
</head>
<body>
<%@page import="conn.JDBConn"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>




<%


Connection Conn=null;
Statement statement = null;
ResultSet resultSet = null;

Conn = JDBConn.CheckCon(Conn);
%>
<h2 align="center"><font><strong>Product list</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">

<tr bgcolor="#baa7c8">
<td><b>p_id</b></td>
<td><b>Product's name</b></td>
<td><b>Product's price</b></td>
<td><b>Category</b></td>
<td><b>Product's details</b></td>
<td><b>Product's Image</b></td>
<td><b>Action</b></td>


</tr>

<%
if (Conn != null) {
try{ 

statement=Conn.createStatement();
String sql ="SELECT * FROM product";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("p_id") %></td>
<td><%=resultSet.getString("p_name") %></td>
<td><%=resultSet.getString("p_price") %></td>
<td><%=resultSet.getString("c_name") %></td>
<td align="center">
<textarea rows="4" cols="30" readonly style=" resize: none; background-color:#DEB887; border:none;"><%=resultSet.getString("p_details") %>
</textarea></td>
<td align="center">
<img src='getImage.jsp?id=<%out.print(resultSet.getString("p_name")); %>'  height=150px; width=100px; />
</td>

<td><a href="updateproduct.jsp?p_id=<%=resultSet.getString("p_id")%>">update</a>&nbsp;
<a href="delete-product.jsp?p_id=<%=resultSet.getString("p_id") %>">Delete</a></td>



</tr>

<%
}


} catch (Exception e) {
e.printStackTrace();
}
Conn.close();
} else {
    out.println("DATABASE CONNECTION ERROR!");
}
%>
</table>
</body>
</html>