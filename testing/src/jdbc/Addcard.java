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
 * Servlet implementation class Addcard
 */
@WebServlet("/Addcard")
public class Addcard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addcard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
		
String email= request.getParameter("email").toString();
String holdername= request.getParameter("holdername").toString();
String cardno= request.getParameter("cardno").toString();
String expdate= request.getParameter("expdate").toString();
String cvv= request.getParameter("cvv").toString();
Connection Conn=null;

Conn = JDBConn.CheckCon(Conn);
		String sql="insert into cards(email,holdername,cardno,expdate,cvv) values(?,?,?,?,?)";
		
		
		PreparedStatement ps = Conn.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, holdername);
		ps.setString(3, cardno);
		ps.setString(4, expdate);
		ps.setString(5, cvv);
		
		ps.executeUpdate();
	
		response.sendRedirect("yourcard.jsp");
		
		
	
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		 
		 
	}

}
