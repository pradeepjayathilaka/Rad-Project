
package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DbConnector {
    
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/my-quiz-db";
    private static final String DBUSER = "root";
    private static final String DBPW = "";
    private static final Logger LOGGER = Logger.getLogger(DbConnector.class.getName());

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection con = null;
        try {
            java.lang.Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, DBUSER, DBPW);
        } catch (SQLException ex) {
            LOGGER.log(Level.SEVERE, "Error connecting to the database", ex);
            throw ex;
        }
        return con;
    }
}