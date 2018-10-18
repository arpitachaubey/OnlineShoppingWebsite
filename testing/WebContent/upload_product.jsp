<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="conn.JDBConn"%>
<%
    String p_name = request.getParameter("p_name");    
	String p_price = request.getParameter("p_price");
	String c_name = request.getParameter("c_name");
	String p_details = request.getParameter("p_details");
	String small =request.getParameter("small");
	String medium =request.getParameter("medium");
	String large =request.getParameter("large");
	String free =request.getParameter("free");
	String custom =request.getParameter("custom");
	
	
	Connection Conn=null;
	Statement statement = null;
	
	
	Conn = JDBConn.CheckCon(Conn);
	if (Conn != null) {
		try{
	
	Statement st= Conn.createStatement();
    ResultSet rs;
    int i = st.executeUpdate("INSERT  INTO  product(p_name, p_price, c_name, p_details, small, medium, large, free, custom)  VALUES ('" + p_name + "','" + p_price + "','" + c_name + "','" + p_details + "','" + small + "','" + medium + "','" + large + "','" + free + "','" + custom + "')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("adminproductlist.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("adminupload.jsp");
    }
    
		
		Conn.close();
		
		
		} catch (Exception e) {
		e.printStackTrace();
		}

} else {
		    out.println("DATABASE CONNECTION ERROR!");
		}
%>