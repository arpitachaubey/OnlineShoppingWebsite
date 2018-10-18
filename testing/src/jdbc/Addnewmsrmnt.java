package jdbc;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.JDBConn;


/**
 * Servlet implementation class Addnewmsrmnt
 */
@WebServlet("/Addnewmsrmnt")
public class Addnewmsrmnt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addnewmsrmnt() {
        super();
        
        // TODO Auto-generated constructor stub
    }
    PrintWriter out;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        out = response.getWriter();
			int result = 0;
			String email=request.getParameter("email");
			String customtype=request.getParameter("customtype");
			String collar=request.getParameter("collar");
			String bodylength=request.getParameter("bodylength");
			String chest=request.getParameter("chest");
			String shoulder=request.getParameter("shoulder");
			String armlength=request.getParameter("armlength");
			String bicepsize=request.getParameter("bicepsize");
			String wristsize=request.getParameter("wristsize");
			String waist=request.getParameter("waist");
			String hip=request.getParameter("hip");
			String rise=request.getParameter("rise");
			String thigh=request.getParameter("thigh");
			String knee=request.getParameter("knee");
			String ankle=request.getParameter("ankle");
			Connection Conn=null;

			Conn = JDBConn.CheckCon(Conn);
	    	
			
	    	if (customtype != null) {
	    	try {
				
					
					if(collar==null){
						collar="0";  
			    	}
			    	
			    	if(bodylength==null){
			    		bodylength="0";
			    	}
			    	if(chest==null){
			    		chest="0";
			    	}
			  
				    //out.print(collar+bodylength+chest);
			    	if(shoulder==null){
			    		shoulder="0";
			    	}
			    	if(armlength==null){
			    		armlength="0";
			    	}
			    	if(bicepsize==null){
			    		bicepsize="0";  
			    	}
			    	if(wristsize==null){
			    		wristsize="0";
			    	}
			    	if(waist==null){
			    		waist="0";
			    	}
			
				    
			    	if(hip==null){
			    		hip="0";
			    	}
			    	if(rise==null){
			    		rise="0";
			    	}
			    	if(thigh==null){
			    		thigh="0";
			    	}
			    	if(knee==null){
			    		knee="0";
			    	}
			    	if(ankle==null){
			    		ankle="0";
			    	}
					PreparedStatement ps = Conn.prepareStatement("insert into custom(email,customtype,collar,bodylength,chest,shoulder,armlength,bicepsize,wristsize,waist,hip,rise,thigh,knee,ankle) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
					ps.setString(1, email);
					ps.setString(2, customtype);
					ps.setString(3, collar);
					ps.setString(4, bodylength);
					ps.setString(5, chest);
					ps.setString(6, shoulder);
					ps.setString(7, armlength);
					ps.setString(8, bicepsize);
					ps.setString(9, wristsize);
					ps.setString(10, waist);
					ps.setString(11, hip);
					ps.setString(12, rise);
					ps.setString(13, thigh);
					ps.setString(14, knee);
					ps.setString(15, ankle);
					
					 result = ps.executeUpdate();
				if(result > 0){
		                    
			    	response.sendRedirect("yourcustom.jsp");
			    }
				else{
		                    //out.println("Something Went Wrong..");
					response.sendRedirect("addmsrmnt.jsp");
				}
					
					
				} catch (Exception e) {
					out.println(e);
	            }
	         
	    	}
	    	
	    	
	    	
	    	
			}
	
		}
