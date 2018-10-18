<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="conn.JDBConn"%>
<%

String addressid=request.getParameter("addressid").toString();
String adrstitle=request.getParameter("adrstitle").toString();
String adrs=request.getParameter("adrs").toString();
String state=request.getParameter("state").toString();
String city=request.getParameter("city").toString();
String pin=request.getParameter("pin").toString();
if(addressid != null)
{
Connection Conn = null;
PreparedStatement ps = null;
Conn = JDBConn.CheckCon(Conn);

if (Conn != null) {
try
{
	String sql="Update address set adrstitle=?,adrs=?,state=?,city=?,pin=? where addressid='"+addressid+"' ";
	ps = Conn.prepareStatement(sql);

	
	ps.setString(1, adrstitle);
	ps.setString(2, adrs);
	ps.setString(3, state);
	ps.setString(4, city);
	ps.setString(5, pin);
	

int i = ps.executeUpdate();
if(i > 0)
{
	response.sendRedirect("youraddress.jsp");
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