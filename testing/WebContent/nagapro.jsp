<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@ page import ="java.sql.*" %>
<%@page import ="java.io.IOException" %>
<%@page import ="java.io.PrintWriter" %> 
<%@page import="conn.JDBConn"%>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Nagaland products</title>
<style>
<!-- image caption -->
body {
	margin: 0;
	padding: 0;
}

figure {
     display: inline-block;
    margin-top: 1em;
    margin-bottom: 1em;
    margin-left: 80px;
    margin-right: 40px;
}
figcaption {
    margin: 10px 0 0 0;
    font-variant: small-caps;
    font-family: Arial;
    font-weight: bold;
    color: #bb3333;
}
figure {
    padding: 5px;
}
img:hover {
    transform: scale(1.1);
    -ms-transform: scale(1.1);
    -webkit-transform: scale(1.1);
    -moz-transform: scale(1.1);
    -o-transform: scale(1.1);
}
img {
    transition: transform 0.2s;
    -webkit-transition: -webkit-transform 0.2s;
    -moz-transition: -moz-transform 0.2s;
    -o-transition: -o-transform 0.2s;
}
h2{
font-size: 2rem;}
h2{
font-family: sans-serif;
font-weight: 300;
line-height: 1.2;
color: inherit;
}

a{
touch-action: manipulation;
color: #007bff;
text-decoration: none;
background-color: transparent;
font-family: sans-serif;
}
a:hover{
text-decoration: underline;
}

@media only screen and (max-width: 991px) {
figure{
margin-left: 70px;
}
}
@media only screen and (max-width: 767px) {
figure{
margin-left: 60px;
}
.head{
font-size: 6vw;
}
}
@media only screen and (max-width: 479px) {
figure{
margin-left: 40px;
}
.head{
font-size: 8vw;
}

}
</style>

</head>
<body>
<div align="center" class="head" style="background-color: #baa7c8; font-size:4vw; font-family: sans-serif;">
CLOTHING
</div>
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
<a href="welcomecustomer.jsp" ">GO HOME</a> 
<%
}
%>
 </h2>
 
 
 <br>
<br>

<%


Connection Conn=null;
Statement statement = null;
ResultSet resultSet = null;

Conn = JDBConn.CheckCon(Conn);
%>
 <h1 align="center">Nagaland Products</h1>

<%
if (Conn != null) {
try{

statement=Conn.createStatement();
String sql ="(select * from product where c_name ='nagaland') ";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


        <figure>
             <a href='product.jsp?p_id=<%=resultSet.getString("p_id")%>'><img src='getImage.jsp?id=<%out.print(resultSet.getString("p_name")); %>' height=250px; width=160px;/></a>
            <figcaption align="center"><a href='product.jsp?p_id=<%=resultSet.getString("p_id")%>'><%=resultSet.getString("p_name") %></a><br>
            Rs. <%=resultSet.getString("p_price") %>/-
            </figcaption>
        </figure>
  


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