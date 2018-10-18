<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
 
<%@page import="conn.JDBConn"%>
<%
String id = request.getParameter("p_id");
String p_name=request.getParameter("p_name");
String p_price=request.getParameter("p_price");
String c_name=request.getParameter("c_name");
String p_details=request.getParameter("p_details");

if(id != null)
{


Connection Conn = null;
PreparedStatement ps = null;
Conn = JDBConn.CheckCon(Conn);
int personID = Integer.parseInt(id);

if (Conn != null) {
try
{

String sql="Update product set p_id=?,p_name=?,p_price=?,c_name=?,p_details=? where p_id="+id;
ps = Conn.prepareStatement(sql);

ps.setString(1, id);
ps.setString(2, p_name);
ps.setString(3, p_price);
ps.setString(4, c_name);
ps.setString(5, p_details);

int i = ps.executeUpdate();
if(i > 0)
{
	response.sendRedirect("adminproductlist.jsp");
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