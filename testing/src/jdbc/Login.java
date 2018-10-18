package jdbc;

import java.io.IOException;
import javax.servlet.http.Cookie;


import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.JDBConn;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		try {
			String email=request.getParameter("email");
			
			String pass=request.getParameter("pass");
			
			Connection Conn=null;

			Conn = JDBConn.CheckCon(Conn);
			String sql="select * from regs where email=? and pass=?";
			String dbEmail = null;
			String dbPass = null;
			
			PreparedStatement ps = Conn.prepareStatement(sql);
			ps.setString(1, email);
			
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			Cookie cookie = new Cookie("email", email);
			cookie.setMaxAge(365 * 24 * 60 * 60);
			
			
			while(rs.next()){
				dbEmail = rs.getString(3);
				dbPass = rs.getString(6);
			}
			if((email.equals("sumit@gmail.com") && pass.equals("mistri")))
            {
				HttpSession session = request.getSession(true);
            session.setAttribute("email",email);  
            
            response.addCookie(cookie);
            response.sendRedirect("adminpanel.jsp");
            }
			else if(email.equals(dbEmail)&& pass.equals(dbPass)){
				HttpSession session=request.getSession(true);
	            session.setAttribute("email",email);
	            response.addCookie(cookie);

				 response.sendRedirect("home.jsp");
			}
			
			else
			{
				//response.sendRedirect("login.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
