<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="conn.JDBConn"%>
<%
String email=request.getParameter("email");
Connection Conn=null;

Conn = JDBConn.CheckCon(Conn);
if (Conn != null) {
try
{
Statement st=Conn.createStatement();
int i=st.executeUpdate("DELETE FROM regs WHERE email='" + email + "'");
response.sendRedirect("adminpanel.jsp");
}
catch(Exception e)
{

e.printStackTrace();
}
Conn.close();

} else {
    out.println("DATABASE CONNECTION ERROR!");
}
%>