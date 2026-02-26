package minierp.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class TestConnection {
    public static void main(String[] args) {
        try {
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/mini_erp",
                    "root",
                    "root123"
            );
            System.out.println("Connexion OK");
            conn.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}