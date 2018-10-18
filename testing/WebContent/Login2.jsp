<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@ page import="java.sql.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>

<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.SQLException"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import= "javax.servlet.http.HttpSession"%>
<%@ page language="java" import="java.util.*"%>

<%
	String email = request.getParameter("email");
	if (email == null)
		email = "";

	String pass = request.getParameter("pass");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://tommy.heliohost.org:3306/mistrisu_susmit",
			"mistrisu", "sumitmistri456");
	Statement st = con.createStatement();

	ResultSet rs;

	rs = st.executeQuery("select * from regs where email='" + email + "' and pass='" + pass + "'");
	
	Cookie cookie = new Cookie("email", email);
	cookie.setMaxAge(365 * 24 * 60 * 60);
	
	if (rs.next()) {
		
        session.setAttribute("email",email);
		response.addCookie(cookie);
		response.sendRedirect("welcomecustomer.jsp");
		return;

	} else if (email.equals("sumit@gmail.com") && pass.equals("mistri")) {
		 session.setAttribute("email",email);
		response.addCookie(cookie);

		response.sendRedirect("adminpanel.jsp");
		return;
	}

	else {
		out.println("Invalid password <a href='index.jsp'>try again</a>");
	}
%>