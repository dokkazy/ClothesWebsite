/*
 * 
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class DBContext {

    private static final org.apache.log4j.Logger LOGGER = org.apache.log4j.Logger.getLogger(DBContext.class);

    private final String serverName = "localhost";
    private final String dbName = "CMDB";
    private final String portNumber = "1433";
    private final String instance = "";
    private final String userID = "sa";
    private final String password = "123";

    public Connection getConnection() {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
        if (instance == null || instance.trim().isEmpty()) {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
            
        }
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            LOGGER.error("Error at DBContext: " + ex.getMessage());
        }
        try {
            return DriverManager.getConnection(url, userID, password);
        } catch (SQLException ex) {
            LOGGER.error("Error at DBContext: " + ex.getMessage());
        }
        return null;
    }

//        protected Connection connection;
//
//        public DBContext() {
//            try {
//// Edit URL , username, password to authenticate with your MS SQL Server
//                String url = "jdbc:sqlserver://localhost:1433;databaseName= ClothesManagementDB";
//                String username = "sa";
//                String password = "123";
//                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//                connection = DriverManager.getConnection(url, username, password);
//            } catch (ClassNotFoundException | SQLException ex) {
//                System.out.println(ex);
//            }
//        }
//        public static void main(String[] args) {
//        try {
//            System.out.println(new DBContext().getConnection());
//        } catch (Exception ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
}
