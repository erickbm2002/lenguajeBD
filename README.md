### Configuración para conectar por medio de JDBC
1. Tener instalado **ORACLE DATABASE EXPRESS EDITION**
2. Tener instaldo el SQL DEVELOPER o usar la conexión por VSC.
3. Tener instaldo el JAVA DEVELOPMENT KIT (JDK 17 o más).

> Notas
Verificar que oracle este corriendo: services.msc
Deben de existir y  estar en running los "OracleServiceXE" y el "OracleXETNSListener"

>Verificar tener Java Instalado
java -version y javac -version para el compilador

4. Probar la conexión desde SQL DEVELOPER o VSC con la siguiente configuración.
>Connection Name: PRUEBA
Username: system
Password: Oracle192026$
Hostname: localhost
Port: 1521
Service name: XEPDB1

Esto nos genera un link que es que vamos a usar para conectar en el properties en JAVA
Se ve algo así
>jdbc:oracle:thin:@localhost:1521/XEPDB1

5. Driver JDBC para Java
Acá lo que hacemos es poner la dependencia en el POM

```
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-jdbc</artifactId>
</dependency>

        
<dependency>
 <groupId>com.oracle.database.jdbc</groupId>
 <artifactId>ojdbc11</artifactId>
 <version>23.3.0.23.09</version>
</dependency>
              
```

6. Configurar el properties con el link de JDBC
```
spring.application.name=Pasteleria

server.port=8080

spring.datasource.url=jdbc:oracle:thin:@localhost:1521/XEPDB1
spring.datasource.username=system
spring.datasource.password=Oracle192026$
spring.datasource.driver-class-name=oracle.jdbc.OracleDriver

```

7. Codigo de prueba 
```
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
```

