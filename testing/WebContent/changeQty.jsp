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
<%@page import="conn.JDBConn"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int qnty=Integer.parseInt(request.getParameter("qty"));
int pid=Integer.parseInt(request.getParameter("pid"));
int flag=Integer.parseInt(request.getParameter("fg"));
String email=request.getParameter("eml");

//out.print(qnty+pid);
//out.print(pid+"Hello"+qnty+flag+email);



Connection Conn=null;
PreparedStatement PrepareStat=null;
PreparedStatement ps=null;


Conn = JDBConn.CheckCon(Conn);

if (Conn != null) {
	
	if(flag==1){
		if(qnty==1){
			try {
		        String delete = "DELETE FROM `cart` WHERE p_id=? and email=?";
		        PrepareStat = Conn.prepareStatement(delete);
		        PrepareStat.setInt(1, pid);
		        PrepareStat.setString(2, email);
		        PrepareStat.executeUpdate();
		       //	out.println(" CART UPDATED product delete");
		       //out.println("<a href='yourCart.jsp'>GO TO YOUR CART</a>");
		        response.sendRedirect("yourCart.jsp");
				} catch (SQLException e) {
		        e.printStackTrace();
		        out.println("SQL Error!" + e);
		    }
		}else{qnty=qnty-1;
		try {
	        String insertS = "UPDATE cart SET qty='"+qnty+"' WHERE  p_id='"+pid+"' and email='"+email+"'";
	        PrepareStat = Conn.prepareStatement(insertS);
	        //PrepareStat.setString(1, email);
	        PrepareStat.executeUpdate();
	       	//out.println(" CART UPDATED");
	       //	out.println("<a href='yourCart.jsp'>GO TO YOUR CART</a>");
	       	response.sendRedirect("yourCart.jsp");
			} catch (SQLException e) {
	        e.printStackTrace();
	        out.println("SQL Error!" + e);
	    }
		}
	}else if(flag==2){
		int qnty1=(qnty+1);
		out.print(qnty1);
		try {
	        String insertS = "UPDATE cart SET qty='"+qnty1+"' WHERE  p_id='"+pid+"' and email='"+email+"'";
	        PrepareStat = Conn.prepareStatement(insertS);
	        PrepareStat.executeUpdate();
	       	//out.println("CART UPDATED, INCREASE");
	       //	out.println("<a href='yourCart.jsp'>GO TO YOUR CART</a>");
	       	response.sendRedirect("yourCart.jsp");
	       	
	       	
			} catch (SQLException e) {
	        e.printStackTrace();
	        out.println("SQL Error!" + e);
	    }
		}
	
	
	
	
	
} else {
    out.println("DATABASE CONNECTION ERROR!");
}





%>
</body>
</html>