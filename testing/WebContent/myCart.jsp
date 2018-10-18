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
<%@ page import= "javax.servlet.http.HttpSession"%>


<%
String cookieName = "email";
Cookie cookies [] = request.getCookies ();
Cookie myCookie = null;
if (cookies != null)
{
for (int i = 0; i < cookies.length; i++) 
{
if (cookies [i].getName().equals (cookieName))
{
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<title>mycart</title>
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
		
		
		<br> <br>
		<h2 align="center">
						<%
if (myCookie == null) {
%>

Sorry,Cannot add the product to the cart as You are not logged in <br/>
<a href="login.jsp">Please Login</a>
<%
} else {
%> 
<p>Welcome: <%=myCookie.getValue()%></p>
 
<a href='logout.jsp'>Log out</a><br>
<a href="welcomecustomer.jsp" >GO HOME</a>


	<%



	String p_id=request.getParameter("p_id").toString();
	String p_size=request.getParameter("p_size");
	String customsize = request.getParameter("customsize");
String email=myCookie.getValue().toString();
//out.print(p_id+email);



Connection Conn=null;
PreparedStatement PrepareStat=null;
PreparedStatement ps=null;


String price = " ", pname = " ", qty = "1";
String  cartid = " ",pid=null;
int qnty;
Conn = JDBConn.CheckCon(Conn);

if (Conn != null) {
    try {

        //-----------------------------------fetch data from user START HERE...

        ps = Conn.prepareStatement("select * from regs where email=?");
        ps.setString(1, email);
		ResultSet rt = ps.executeQuery();

        while (rt.next()) {
           
            cartid = rt.getString("cartid");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }


    //------------------------------------------fetch data from product table START HERE...
    try {
        ps = Conn.prepareStatement("select * from product where p_id=?");
        ps.setString(1, p_id);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            price = rs.getString("p_price");
            pname = rs.getString("p_name");
            pid=rs.getString("p_id");
            // qty = rs.getString("qty");
          session.setAttribute("pid",pid);
            }
      
    } catch (SQLException e) {
        e.printStackTrace();
    }

    //------------------------------------------------------------------- UPDATE TO CART START HERE.....

   
    
    try{
    	ps = Conn.prepareStatement("select * from cart where email='"+email+"' and p_id='"+pid+"'");
		ResultSet rx = ps.executeQuery();

    if (rx.next()) {
       qnty = Integer.parseInt(rx.getString("qty"));
       out.print(qnty+"<br>");
   
   	   qnty=qnty+1;
	out.println(qnty);
		try {
        String insertS = "UPDATE cart SET qty='"+qnty+"' WHERE  p_id='"+pid+"'";
        PrepareStat = Conn.prepareStatement(insertS);
        //PrepareStat.setString(1, email);
        PrepareStat.executeUpdate();
       	//out.println(" CART UPDATED");
       	//out.print("<a href='yourCart.jsp'>GO TO YOUR CART</a>");
        response.sendRedirect("yourCart.jsp");
		} catch (SQLException e) {
        e.printStackTrace();
        out.println("SQL Error!" + e);
    }
  
    
    }else{
    	qnty=0;
    	try {
    		if(p_size==null){
				p_size="None";  
	    	}
    		if(customsize==null){
				customsize="None";  
	    	}
    		
            String insertS = "INSERT  INTO  cart  VALUES  (?,?,?,?,?,?,?,?)";
            PrepareStat = Conn.prepareStatement(insertS);
            PrepareStat.setString(1, cartid);
            PrepareStat.setString(2, email);
            PrepareStat.setString(3, p_id);
            PrepareStat.setString(4, pname);
            PrepareStat.setString(5, price);
            PrepareStat.setString(6, "1");
            PrepareStat.setString(7, p_size);
            PrepareStat.setString(8, customsize);
            PrepareStat.executeUpdate();
           	//out.println("ADDED TO CART!");
           //	out.print("<a href='yourCart.jsp'>GO TO YOUR CART</a>");
           response.sendRedirect("yourCart.jsp");
          	//session.setAttribute("p_price",price);
            //session.setAttribute("p_name",pname);
           //session.setAttribute("qty",qty);
        
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("SQL Error!" + e);
        }
    
    
    
    }
   
    }catch (SQLException e) {
        e.printStackTrace();
        out.println("SQL Error!" + e);
    }
    
    
    ps.close();
   	Conn.close(); 
} else {
    out.println("DATABASE CONNECTION ERROR!");
}
%>

<%
}
%>
</h2>





</body>
</html>