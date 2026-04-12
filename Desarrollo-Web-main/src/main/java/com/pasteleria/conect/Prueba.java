package com.pasteleria.conect;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class Prueba {

    public static void main(String[] args) {
        String contrasena = "12345";

        // Si tu método hashPassword está en esta misma clase:
        String resultado = hashPassword(contrasena);

        System.out.println("El hash generado es: " + resultado);

    }
    public void probarHash() {
        String contraseña = "12345";
        String resultado = hashPassword(contraseña);
        System.out.println(resultado);
    }
    /* System.out.println("Tu mensaje aquí"); */

    public static String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));

            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException("No se pudo inicializar SHA-256", e);
        }
    }
}
