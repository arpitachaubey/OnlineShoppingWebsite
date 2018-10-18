<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="conn.JDBConn"%>
<%
String id=request.getParameter("addressid");
Connection Conn=null;

Conn = JDBConn.CheckCon(Conn);
if (Conn != null) {
try
{
Statement st=Conn.createStatement();
int i=st.executeUpdate("DELETE FROM address WHERE addressid="+id);
response.sendRedirect("youraddress.jsp");
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