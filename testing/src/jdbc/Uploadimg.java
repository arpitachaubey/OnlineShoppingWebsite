package jdbc;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import conn.JDBConn;

/**
 * Servlet implementation class Uploadimg
 */
@WebServlet("/Uploadimg")
@MultipartConfig(maxFileSize = 16177216)
public class Uploadimg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Uploadimg() {
        super();
        // TODO Auto-generated constructor stub
    }
    PrintWriter out;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
	        out = response.getWriter();
	        int result = 0;
	    	String p_name = request.getParameter("p_name");
	    	String p_price = request.getParameter("p_price");
	    	String c_name = request.getParameter("c_name");
	    	String p_details = request.getParameter("p_details");
	    	Part part = request.getPart("image");
	    	String small = request.getParameter("small");
	    	String medium = request.getParameter("medium");
	    	String large = request.getParameter("large");
	    	String free = request.getParameter("free");
	    	String custom = request.getParameter("custom");
	    	
	    	
	    	Connection Conn=null;

	    	Conn = JDBConn.CheckCon(Conn);
	    	
	    	if(small==null){
	    		small="0";  
	    	}
	    	if(medium==null){
	    		medium="0";
	    	}
	    	if(large==null){
	     		large="0";
	    	}
	  //  	out.println(small+medium+large);
		    
	    	if(free==null){
	    		free="0";
	    	}if(custom==null){
	    		custom="0";
	    	}
	        
	        if (part != null) {
	            try {
	               PreparedStatement ps = Conn.prepareStatement("insert into product(p_name,p_price,c_name,p_details,image,small,medium,large,free,custom) values(?,?,?,?,?,?,?,?,?,?)");
	                InputStream is = part.getInputStream();
	                ps.setString(1, p_name);
	                ps.setString(2, p_price);
	                ps.setString(3, c_name);
	                ps.setString(4, p_details);
	                
	                ps.setBlob(5, is);
	                ps.setString(6, small);
	                ps.setString(7, medium);
	                ps.setString(8, large);
	                ps.setString(9, free);
	                ps.setString(10, custom);
	                result = ps.executeUpdate();
	        if(result > 0){
	                    //out.println("Image uploaded Successfully..");
	                    //out.println("<a href='getImage.jsp?id="+p_name+"'>view Image</a>");
		    	response.sendRedirect("adminproductlist.jsp");
		    }
			else{
	                    //out.println("Something Went Wrong..");
				response.sendRedirect("adminupload.jsp");
			}
	        
	        
	        
	            } catch (Exception e) {
	            	e.printStackTrace();
	            }
	        }
	    }


}
