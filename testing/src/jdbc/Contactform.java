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
 * Servlet implementation class Contactform
 */
@WebServlet("/Contactform")
public class Contactform extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Contactform() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {	
		String name= request.getParameter("name");
		String email= request.getParameter("email");
		String sub= request.getParameter("sub");
		String m= request.getParameter("m");
		Connection Conn=null;

		Conn = JDBConn.CheckCon(Conn);
		String sql="insert into contact(name,email,sub,m) values(?,?,?,?)";
		
		
		PreparedStatement ps = Conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, email);
		ps.setString(3, sub);
		ps.setString(4, m);
		
		ps.executeUpdate();
	
		response.sendRedirect("thankyou.jsp");
		
		
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
		
		
		
	}

}
