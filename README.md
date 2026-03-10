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
Username: prueba
Password: Prueba123
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
 <groupId>com.oracle.database.jdbc</groupId>
 <artifactId>ojdbc11</artifactId>
 <version>23.3.0.23.09</version>
</dependency>
```

6. Configurar el properties con el link de JDBC
```
spring.datasource.url=jdbc:oracle:thin:@localhost:1521/XEPDB1
spring.datasource.username=HR
spring.datasource.password=hr
spring.datasource.driver-class-name=oracle.jdbc.OracleDriver

spring.jpa.database-platform=org.hibernate.dialect.OracleDialect
spring.jpa.hibernate.ddl-auto=none
spring.jpa.show-sql=true
```

7. Codigo de prueba 
```
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConexionOracleTest {

    public static void main(String[] args) {

        String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1";
        String usuario = "prueba";
        String password = "Prueba123";

        try {

            Connection conexion = DriverManager.getConnection(url, usuario, password);
            System.out.println("Conexion exitosa");

            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM CUSTOMERS");

            while (rs.next()) {
                System.out.println(rs.getString("CUST_FIRST_NAME") + " " +
                                   rs.getString("CUST_LAST_NAME"));
            }

            rs.close();
            stmt.close();
            conexion.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

