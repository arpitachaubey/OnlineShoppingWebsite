<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="conn.JDBConn"%>
<%

String orderstatus=request.getParameter("orderstatus");

String orderid=request.getParameter("orderid");

if(orderid != null)
{
Connection Conn = null;
PreparedStatement ps = null;
Conn = JDBConn.CheckCon(Conn);

if (Conn != null) {
try
{
	String sql="Update orders set orderstatus=? where orderid='"+orderid+"' ";
	ps = Conn.prepareStatement(sql);

	
	ps.setString(1, orderstatus);
	
int i = ps.executeUpdate();
if(i > 0)
{
	response.sendRedirect("adminordercontrol.jsp");
}
else
{
out.print("There is a problem in updating Record.");
} 
Conn.close();
ps.close();

} catch (Exception e) {
e.printStackTrace();
}
} else {
    out.println("DATABASE CONNECTION ERROR!");
}
}
%>