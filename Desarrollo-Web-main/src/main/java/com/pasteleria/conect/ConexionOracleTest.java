package com.pasteleria.conect;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionOracleTest {

    public static void main(String[] args) {

        String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
        String usuario = "system";
        String password = "Oracle192026$";

        try {
            Connection conexion = DriverManager.getConnection(url, usuario, password);
            System.out.println("Conexion exitosa");
            conexion.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}