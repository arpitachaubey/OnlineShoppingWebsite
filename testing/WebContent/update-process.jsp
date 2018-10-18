<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="conn.JDBConn"%>
<%

String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String gender=request.getParameter("gender");
String phone=request.getParameter("phone");
if(email != null)
{
Connection Conn = null;
PreparedStatement ps = null;
Conn = JDBConn.CheckCon(Conn);
if (Conn != null) {
try
{
	String sql="Update regs set fname=?,lname=?,email=?,gender=?,phone=? where email='"+email+"' ";
	ps = Conn.prepareStatement(sql);

	
	ps.setString(1, fname);
	ps.setString(2, lname);
	ps.setString(3, email);
	ps.setString(4, gender);
	ps.setString(5, phone);
int i = ps.executeUpdate();
if(i > 0)
{
	response.sendRedirect("adminpanel.jsp");
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