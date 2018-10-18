<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Blob"%>
<%@page import= "java.io.*"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="conn.JDBConn"%>
<%
String id = request.getParameter("id");
 
Connection Conn=null;

Conn = JDBConn.CheckCon(Conn);
 
if (Conn != null) {
try{
   PreparedStatement ps = Conn.prepareStatement("select image from product where p_name=?");
    ps.setString(1, id);
    ResultSet rs = ps.executeQuery();
 
    if(rs.next())
    {
    	
       Blob blob = rs.getBlob("image");
        byte byteArray[] = blob.getBytes(1, (int)blob.length());
        response.setContentType("image/gif");
        OutputStream os = response.getOutputStream();
        os.write(byteArray);
        os.flush();
        os.close();
    }
}
catch(Exception e){
	e.printStackTrace();
}    
Conn.close();

} else {
    out.println("DATABASE CONNECTION ERROR!");
}
%>
