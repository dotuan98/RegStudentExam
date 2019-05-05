package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author mysqltutorial.org
 */
public class DBConnect {

    /**
     * Get database connection
     *
     * @return a Connection object
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {
        Connection conn = null;

        try{

            // assign db parameters
            String url = "jdbc:mysql://localhost:3306/vgu1";
            String user = "root";
            String password = "123456";

            // create a connection to the database
            conn = DriverManager.getConnection(url, user, password);
        } catch (SQLException e ) {
            System.out.println(e.getMessage());
        }
        return conn;
    }

}


