<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="conn.JDBConn"%>
<%
String id=request.getParameter("p_id");
Connection Conn=null;

Conn = JDBConn.CheckCon(Conn);
if (Conn != null) {
try
{
Statement st=Conn.createStatement();
int i=st.executeUpdate("DELETE FROM product WHERE p_id="+id);
response.sendRedirect("adminproductlist.jsp");
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