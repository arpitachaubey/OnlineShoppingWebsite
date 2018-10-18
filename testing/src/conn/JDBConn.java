
package conn;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;


public class JDBConn {

    public static Connection CheckCon(Connection Conn) {

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        }

        try {

            Conn = DriverManager.getConnection("jdbc:mysql://localhost/mistrisu_susmit", "root", "");
            if (Conn != null) {
                System.out.print("Connection Successful!");
                /*-------Connection Successful*/
            } else {
                System.out.print("Connection=null! [IN TRY]");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print("ERROR! [IN CATCH]");

        }
        return Conn;

    }

}
