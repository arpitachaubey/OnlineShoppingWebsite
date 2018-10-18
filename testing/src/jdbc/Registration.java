package jdbc;

import java.io.IOException;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.JDBConn;


@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }
  
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			
			String email=request.getParameter("email");
			Connection Conn=null;
			
			Conn = JDBConn.CheckCon(Conn);
			 PreparedStatement st=Conn.prepareStatement("select * from regs where email=?");
			    st.setString(1, email);
			    ResultSet rs=st.executeQuery();
			        while(rs.next()){

			            if(email.equals(rs.getString("email"))){
			            	
			            	
			            	response.sendRedirect("1.jsp");
			                
			            }
			            else{
			            	response.sendRedirect("login.jsp");
			            }
			        }
			}
			catch(Exception e){
			    e.printStackTrace();
			
		}
		try {
			
			String fname=request.getParameter("fname");
			String lname=request.getParameter("lname");
			String email=request.getParameter("email");
			String gender=request.getParameter("gender");
			String phone=request.getParameter("phone");
			String pass=request.getParameter("pass");
			
			Connection Conn=null;

			Conn = JDBConn.CheckCon(Conn);
			String sql="insert into regs(fname,lname,email,gender,phone,pass) values(?,?,?,?,?,?)";
			
			
			PreparedStatement ps = Conn.prepareStatement(sql);
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, email);
			ps.setString(4, gender);
			ps.setString(5, phone);
			ps.setString(6, pass);
			ps.executeUpdate();
		
			response.sendRedirect("login.jsp");
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}


}
