package jdbc;

import java.io.IOException;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.JDBConn;

/**
 * Servlet implementation class Addnewaddress
 */
@WebServlet("/Addnewaddress")
public class Addnewaddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addnewaddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
			
	String email= request.getParameter("email").toString();
	String adrstitle= request.getParameter("adrstitle").toString();
	String adrs= request.getParameter("adrs").toString();
	String state= request.getParameter("state").toString();
	String city= request.getParameter("city").toString();
	String pin= request.getParameter("pin").toString();
	Connection Conn=null;

	Conn = JDBConn.CheckCon(Conn);
			String sql="insert into address(email,adrstitle,adrs,state,city,pin) values(?,?,?,?,?,?)";
			
			
			PreparedStatement ps = Conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, adrstitle);
			ps.setString(3, adrs);
			ps.setString(4, state);
			ps.setString(5, city);
			ps.setString(6, pin);
			ps.executeUpdate();
		
			response.sendRedirect("youraddress.jsp");
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
