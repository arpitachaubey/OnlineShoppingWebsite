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
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conn.JDBConn"%>


<%


String cu_id = request.getParameter("cu_id");

Connection Conn = null;
Statement statement = null;
ResultSet resultSet = null;
Conn = JDBConn.CheckCon(Conn);
%>
<%
if (Conn != null) {
try{

statement=Conn.createStatement();
String sql ="select * from custom where cu_id='" + cu_id + "' ";
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


<h2>Edit your custom</h2>
				<h1>Note :Enter measurements in only INCHES!</h1>
<form method="post" action="updatecustom-process.jsp">



<input type="hidden" name="cu_id" value="<%=resultSet.getString("cu_id") %>">
<br>
Custom type:<br>
<input type="text" name="customtype" value="<%=resultSet.getString("customtype") %>">
<br>
Collar length:<br>
<input type="text" name="collar" value="<%=resultSet.getString("collar") %>">


<br>
Body length:<br>
<input type="text" name="bodylength" value="<%=resultSet.getString("bodylength") %>">
<br>
Chest size:<br>
<input type="text" name=chest value="<%=resultSet.getString("chest") %>">
<br>

Shoulder size:<br>
<input type="text" name="shoulder" value="<%=resultSet.getString("shoulder") %>">
<br>
Arm length:<br>
<input type="text" name="armlength" value="<%=resultSet.getString("armlength") %>">
<br>
Bicep size:<br>
<input type="text" name="bicepsize" value="<%=resultSet.getString("bicepsize") %>">
<br>
Wrist size:<br>
<input type="text" name="wristsize" value="<%=resultSet.getString("wristsize") %>">
<br>
Waist size:<br>
<input type="text" name="waist" value="<%=resultSet.getString("waist") %>">
<br>
Hip size:<br>
<input type="text" name="hip" value="<%=resultSet.getString("hip") %>">
<br>
Rise size:<br>
<input type="text" name="rise" value="<%=resultSet.getString("rise") %>">
<br>
Thigh size:<br>
<input type="text" name="thigh" value="<%=resultSet.getString("thigh") %>">
<br>
Knee size:<br>
<input type="text" name="knee" value="<%=resultSet.getString("knee") %>">
<br>
Ankle size:<br>
<input type="text" name="ankle" value="<%=resultSet.getString("ankle") %>">
<br>

<br><br>
<input type="submit" value="Submit">
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="yourcustom.jsp" style="text-decoration:none"><input type="submit" value="Cancel"></a>
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