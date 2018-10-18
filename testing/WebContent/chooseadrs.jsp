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
<%@ page import="javax.servlet.http.HttpSession"%>

<%
	String cookieName = "email";
	Cookie cookies[] = request.getCookies();
	Cookie myCookie = null;
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals(cookieName)) {
				myCookie = cookies[i];
				break;
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>choose address</title>
</head>
<body>
<%
				if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
			%>
			
			<%
				} else {
			%>
			
			<%
				}
			%>
		
	<h2 align="center">
	
		<br> <br>

		<%
			if (myCookie == null) {
		%>

		You are not logged in<br /> <a href="login.jsp">Please Login</a>
		<%
			} else {
		%>
		<p>
			Welcome:
			<%=myCookie.getValue()%></p>
		<a href='logout.jsp'>Log out</a>
		<a href="yourCart.jsp">GO HOME</a> 
		<%
			}
		%>





	</h2>
<%
String email=myCookie.getValue();
String total=request.getParameter("total");
//out.print(email+total);


Connection Conn=null;
PreparedStatement PrepareStat=null;
PreparedStatement ps=null;


String price = " ", pname = " ", qty = " ", cardno=" "; 
String orderstatus="processing";
String  cartid = " ",p_id=" ", p_size=" ",customsize=" ",adrstitle=" ";

Conn = JDBConn.CheckCon(Conn);
if (Conn != null) {
	
	 //------------------------------------------fetch data from cart table START HERE...
    try {
        ps = Conn.prepareStatement("select * from cart where email=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
        	cartid = rs.getString("cartid");
        	 p_id=rs.getString("p_id");
        	 pname = rs.getString("pname");
            price = rs.getString("price");
            qty = rs.getString("qty");
            p_size = rs.getString("p_size");
            customsize = rs.getString("customsize");
           
            }
      
    } catch (SQLException e) {
        e.printStackTrace();
    }
	 
    
    	try {
    		if(cartid==null){
    			cartid="None";  
	    	}
            String insertS = "INSERT  INTO  orders (cartid,email,p_id,pname,price,qty,p_size,customsize,total,adrstitle,cardno,orderstatus) VALUES  (?,?,?,?,?,?,?,?,?,?,?,?)";
            PrepareStat = Conn.prepareStatement(insertS);
            PrepareStat.setString(1, cartid);
            PrepareStat.setString(2, email);
            PrepareStat.setString(3, p_id);
            PrepareStat.setString(4, pname);
            PrepareStat.setString(5, price);
            PrepareStat.setString(6, qty);
            PrepareStat.setString(7, p_size);
            PrepareStat.setString(8, customsize);
            PrepareStat.setString(9, total);
            PrepareStat.setString(10, adrstitle);
            PrepareStat.setString(11, cardno);
            PrepareStat.setString(12, orderstatus);
            PrepareStat.executeUpdate();
           	//out.println("ADDED TO order!");
           //	out.print("<a href='yourCart.jsp'>GO TO YOUR CART</a>");
          // response.sendRedirect("adrschoosing.jsp");
          	//session.setAttribute("p_price",price);
            //session.setAttribute("p_name",pname);
           //session.setAttribute("qty",qty);
        
           
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("SQL Error!" + e);
        }
    
    	try{
    		Statement st=Conn.createStatement();
    		int i=st.executeUpdate("DELETE FROM cart WHERE email='" + myCookie.getValue() + "'and cartid='"+cartid+"'");
    		response.sendRedirect("adrschoosing.jsp");
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



</body>
</html>