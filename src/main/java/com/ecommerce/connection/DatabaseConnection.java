package com.ecommerce.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

    //    private static String DB_URL = "jdbc:mysql://localhost:3306/fit_shop?useSSL=false&allowPublicKeyRetrieval=true";
    private static String DB_URL = "jdbc:mysql://localhost:3306/lapeki_dbs?useSSL=false";
    private static String USER_NAME = "root";
    private static String PASSWORD = "";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void main(String[] args) {
        Connection con = getConnection();
        if (con != null) {
            System.out.println("Success");
        }
    }

}
