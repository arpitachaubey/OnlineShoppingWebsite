<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="conn.JDBConn"%>
<%

String cu_id=request.getParameter("cu_id").toString();
String customtype=request.getParameter("customtype").toString();
String collar=request.getParameter("collar").toString();
String bodylength=request.getParameter("bodylength").toString();
String chest=request.getParameter("chest").toString();
String shoulder=request.getParameter("shoulder").toString();
String armlength=request.getParameter("armlength").toString();
String bicepsize=request.getParameter("bicepsize").toString();
String wristsize=request.getParameter("wristsize").toString();
String waist=request.getParameter("waist").toString();
String hip=request.getParameter("hip").toString();
String rise=request.getParameter("rise").toString();
String thigh=request.getParameter("thigh").toString();
String knee=request.getParameter("knee").toString();
String ankle=request.getParameter("ankle").toString();
if(cu_id != null)
{
Connection Conn = null;
PreparedStatement ps = null;
Conn = JDBConn.CheckCon(Conn);


if (Conn != null) {
try
{
	String sql="Update custom set customtype=?,collar=?,bodylength=?,chest=?,shoulder=?,armlength=?,bicepsize=?,wristsize=?,waist=?,hip=?,rise=?,thigh=?,knee=?,ankle=? where cu_id='"+cu_id+"' ";
	ps = Conn.prepareStatement(sql);

	
	ps.setString(1, customtype);
	ps.setString(2, collar);
	ps.setString(3, bodylength);
	ps.setString(4, chest);
	ps.setString(5, shoulder);
	ps.setString(6, armlength);
	ps.setString(7, bicepsize);
	ps.setString(8, wristsize);
	ps.setString(9, waist);
	ps.setString(10, hip);
	ps.setString(11, rise);
	ps.setString(12, thigh);
	ps.setString(13, knee);
	ps.setString(14, ankle);
	

int i = ps.executeUpdate();
if(i > 0)
{
	response.sendRedirect("yourcustom.jsp");
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