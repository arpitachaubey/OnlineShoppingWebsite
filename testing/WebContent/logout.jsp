<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.servlet.http.Cookie"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<%
session.setAttribute("email", null);
session.invalidate();

%>
 <%
 Cookie cookie=new Cookie("email","email");  
 cookie.setMaxAge(0);
    response.addCookie(cookie); 
    response.sendRedirect("home.jsp");
%>
 
 <h1>Logout was done successfully.</h1> 

<a href="login.jsp" style="text-decoration: none">LOGIN</a>
</center>
</body>
</html>