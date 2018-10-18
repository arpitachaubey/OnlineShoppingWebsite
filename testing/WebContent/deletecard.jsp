<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="conn.JDBConn"%>
<%
String id=request.getParameter("cardid");
Connection Conn=null;

Conn = JDBConn.CheckCon(Conn);
if (Conn != null) {
try
{
Statement st=Conn.createStatement();
int i=st.executeUpdate("DELETE FROM cards WHERE cardid="+id);
response.sendRedirect("yourcard.jsp");
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