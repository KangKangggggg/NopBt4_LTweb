package vn.iotstar.configs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String SERVER_NAME = "localhost";
    private static final String DATABASE_NAME = "DecoratorBootstrap";
    private static final String USERNAME = "sa";
    private static final String PASSWORD = "12345678"; // Thay bằng password của bạn

    private static final String CONNECTION_URL =
        "jdbc:sqlserver://" + SERVER_NAME + ";databaseName=" + DATABASE_NAME +
        ";encrypt=true;trustServerCertificate=true;";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            return DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("SQL Server JDBC Driver not found", e);
        }
    }

    public static void main(String[] args) {
        try (Connection conn = getConnection()) {
            if (conn != null) {
                System.out.println("Kết nối database thành công!");
            }
        } catch (SQLException e) {
            System.err.println("Lỗi kết nối database: " + e.getMessage());
            e.printStackTrace();
        }
    }
}