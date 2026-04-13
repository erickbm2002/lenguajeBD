-- QUERIES DE CONSULTAS AMPLIADAS DE LOS REPOSITORY

-- Del UsuarioRepository 

-- reemplaza boolean existsByCorreo(String correo); 
-- regresa 1 si existe el usuario por el correo enviado por parametro, sino envia 0 

CREATE OR REPLACE PROCEDURE SP_USUARIOS_EXISTE_CORREO(P_CORREO IN  VARCHAR2, P_EXISTS OUT NUMBER)
AS
BEGIN
    SELECT COUNT(*)
    INTO   P_EXISTS
    FROM   usuario
    WHERE  correo = P_CORREO;
    
EXCEPTION
    WHEN OTHERS THEN
        P_EXISTS := 0;
        RAISE;
END;


-- PRUEBA
CREATE OR REPLACE PROCEDURE SP_USUARIOS_EXISTE_CORREO_B(P1_CORREO IN  VARCHAR2)
AS
    V_EXISTE NUMBER;
BEGIN
    SP_USUARIOS_EXISTE_CORREO(P1_CORREO,V_EXISTE);
    IF V_EXISTE = 1 THEN
        DBMS_OUTPUT.PUT_LINE('SI EXISTE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NO EXISTE');
    END IF;    
END;

EXEC SP_USUARIOS_EXISTE_CORREO_B('vero@gmail.com');



------------------------   *******    --------------------------------


-- Reemplaza Optional<Usuario> findByCorreo(String correo);
-- trae los datos del usuario del correo que se envia 

CREATE OR REPLACE PROCEDURE SP_FIND_BY_CORREO(P_CORREO IN VARCHAR2,P_CURSOR OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN P_CURSOR FOR
        SELECT id_usuario, nombre, correo, password_hash, activo
        FROM   usuario
        WHERE  correo = P_CORREO;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;



-- PRUEBA
CREATE OR REPLACE PROCEDURE SP_FIND_BY_CORREO_B(P1_CORREO IN  VARCHAR2)
AS
    DATOS SYS_REFCURSOR;
    id_usuario NUMBER;
    nombre VARCHAR2(30);
    correo VARCHAR2(30);
    password_hash VARCHAR2(30);
    activo NUMBER;
BEGIN
    SP_FIND_BY_CORREO(P1_CORREO,DATOS);
    LOOP
        FETCH DATOS INTO id_usuario, nombre, correo, password_hash, activo;
        EXIT WHEN DATOS%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(id_usuario || ' ' || nombre ||  ' ' || correo || ' ' || password_hash || ' ' || activo);
    END LOOP;    
END;

EXEC SP_FIND_BY_CORREO_B('vero@gmail.com');


------------------------   *******    --------------------------------

-- Reemplaza boolean existsByCorreoAndIdUsuarioNot(String correo, Long idUsuario);
-- envia 1 si el usuaio del correo y el id enviado no esta en uso


CREATE OR REPLACE PROCEDURE SP_EXISTS_USUARIO_BY_CORREO_NOT_ID(P_CORREO IN  VARCHAR2,P_ID_USUARIO IN  NUMBER,P_EXISTS OUT NUMBER)
AS
BEGIN
    SELECT COUNT(*)
    INTO   P_EXISTS
    FROM   usuario
    WHERE  correo = P_Correo
    AND id_usuario != P_Id_Usuario;
EXCEPTION
    WHEN OTHERS THEN
        p_exists := 0;
        RAISE;
END;


CREATE OR REPLACE PROCEDURE SP_USUARIOS_EXISTE_CORREO_B(P1_CORREO IN  VARCHAR2,P1_ID_USUARIO IN  NUMBER)
AS
    V_EXISTE NUMBER;
BEGIN
    SP_EXISTS_USUARIO_BY_CORREO_NOT_ID(P1_CORREO,P1_ID_USUARIO,V_EXISTE);
    IF V_EXISTE = 1 THEN
        DBMS_OUTPUT.PUT_LINE('NO ESTA EN USO');
    ELSE
        DBMS_OUTPUT.PUT_LINE('YA ESTA EN USO');
    END IF;    
END;

EXEC SP_USUARIOS_EXISTE_CORREO_B('maria@gmail.com', 6);


------------------------   *******    --------------------------------

-- reemplaza la consulta ampliada del ExpiracionTokenContrasenaRepository de ExpiracionTokenContrasenaRepository
-- trae el token de recuperacion de contrasena mas reciente del usuario 

CREATE OR REPLACE PROCEDURE SP_TOKEN_FIND_TOP_BY_USUARIO_CODIGO_USADO_EXPIRA(P_ID_USUARIO IN NUMBER,P_CODIGO IN CHAR,
    P_USADO IN NUMBER,P_AHORA IN TIMESTAMP,P_CURSOR OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN P_CURSOR FOR
        SELECT ID_TOKEN,ID_USUARIO,CODIGO,EXPIRA_EN,USADO,FECHA_CREACION,FECHA_MODIFICACION
        FROM   EXPIRACION_TOKEN_CONTRASEÑA
        WHERE ID_USUARIO = P_ID_USUARIO
        AND CODIGO = P_CODIGO
        AND USADO = P_USADO
        AND EXPIRA_EN > P_AHORA
        ORDER BY EXPIRA_EN DESC
        FETCH FIRST 1 ROWS ONLY;
END;







------------------------   *******    --------------------------------
-- Consultas ampliadas de los reposytory de productos 
------------------------   *******    --------------------------------




-- Reemplaza List<ProductoTamano> findByProductoIdProducto(Long idProducto); de ProductoTamanoRepository
-- trae la lista de los tama�os del id del producto q se envia

CREATE OR REPLACE PROCEDURE SP_GET_TAMANOS_PRODUCTO (p_id_producto IN NUMBER,p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN p_cursor FOR SELECT id_tamano, id_producto, etiqueta
                      FROM producto_tamano
                      WHERE id_producto = p_id_producto;
END;

-- PRUEBA
CREATE OR REPLACE PROCEDURE SP_GET_TAMANOS_PRODUCTO_B (P_ID_PRODUCTO IN NUMBER)
AS
    id_tamano NUMBER;
    id_producto NUMBER;
    etiqueta VARCHAR2(60);
    DATOS SYS_REFCURSOR;
BEGIN
    SP_GET_TAMANOS_PRODUCTO(P_ID_PRODUCTO,DATOS);
     LOOP
        FETCH DATOS INTO id_tamano, id_producto, etiqueta;
        EXIT WHEN DATOS%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(id_tamano || ' ' || id_producto || ' ' || etiqueta);
        END LOOP;
    CLOSE DATOS;
END;

EXEC SP_GET_TAMANOS_PRODUCTO_B(7);


------------------------   *******    --------------------------------

-- Reemplaza List<ProductoSabor> findByProductoIdProducto(Long idProducto); de ProductoSaborRepository
-- Trae los sabores de producto que se envia por id
CREATE OR REPLACE PROCEDURE SP_GET_SABORES_PRODUCTO (P_ID_PRODUCTO IN NUMBER,P_CURSOR OUT SYS_REFCURSOR)

AS
BEGIN
    OPEN P_CURSOR FOR SELECT id_sabor, id_producto, etiqueta
                      FROM producto_sabor
                      WHERE id_producto = p_id_producto;
END;

-- PRUEBA
CREATE OR REPLACE PROCEDURE SP_GET_SABORES_PRODUCTO_B (P_ID_PRODUCTO IN NUMBER)
AS
    id_sabor NUMBER;
    id_producto NUMBER;
    etiqueta VARCHAR2(60);
    DATOS SYS_REFCURSOR;
BEGIN
    SP_GET_SABORES_PRODUCTO(P_ID_PRODUCTO,DATOS);
     LOOP
        FETCH DATOS INTO id_sabor, id_producto, etiqueta;
        EXIT WHEN DATOS%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(id_sabor || ' ' || id_producto || ' ' || etiqueta);
        END LOOP;
    CLOSE DATOS;
END;

EXEC SP_GET_SABORES_PRODUCTO_B(7);


------------------------   *******    --------------------------------


-- Reemplaza List<ProductoIngrediente> findByProductoIdProducto(Long idProducto); de ProductoIngredienteRepository
-- Trae los ingredientes de producto que se envia por id
CREATE OR REPLACE PROCEDURE SP_GET_INGREDIENTES_PRODUCTO (P_ID_PRODUCTO IN NUMBER,P_CURSOR OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN P_CURSOR FOR SELECT id_ingrediente, id_producto, nombre
                      FROM producto_ingrediente
                      WHERE id_producto = p_id_producto;
END;


-- PRUEBA
CREATE OR REPLACE PROCEDURE SP_GET_INGREDIENTES_PRODUCTO_B (P_ID_PRODUCTO IN NUMBER)
AS
    id_ingrediente NUMBER;
    id_producto NUMBER;
    etiqueta VARCHAR2(60);
    DATOS SYS_REFCURSOR;
BEGIN
    SP_GET_INGREDIENTES_PRODUCTO(P_ID_PRODUCTO,DATOS);
     LOOP
        FETCH DATOS INTO id_ingrediente, id_producto, etiqueta;
        EXIT WHEN DATOS%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(id_ingrediente || ' ' || id_producto || ' ' || etiqueta);
        END LOOP;
    CLOSE DATOS;
END;

EXEC SP_GET_INGREDIENTES_PRODUCTO_B(7);


------------------------   *******    --------------------------------

-- Reemplza List<Producto> findByActivoTrue(); de ProductoRepository
-- Trae todos los productos activos (para listado)

CREATE OR REPLACE PROCEDURE SP_GET_PRODUCTOS (p_cursor OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN p_cursor FOR SELECT id_producto, nombre, descripcion, conservacion,
                             precio, stock, activo
                      FROM producto
                      WHERE activo = 1
                      ORDER BY nombre;
END;

-- PRUEBA
CREATE OR REPLACE PROCEDURE SP_GET_PRODUCTOS_B 
AS
    id_producto NUMBER;
    nombre VARCHAR2(30);
    descripcion VARCHAR2(100);
    conservacion VARCHAR2(100);
    precio NUMBER;
    stock NUMBER;
    activo NUMBER;
    DATOS SYS_REFCURSOR;
BEGIN
     SP_GET_PRODUCTOS(DATOS);
     LOOP
        FETCH DATOS INTO id_producto, nombre, descripcion, conservacion,
                             precio, stock, activo;
        EXIT WHEN DATOS%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(id_producto || ' ' || nombre || ' ' || descripcion || ' ' || 
            conservacion || ' ' || precio || ' ' || stock || ' ' || activo);
        END LOOP;
    CLOSE DATOS;
END;

EXEC SP_GET_PRODUCTOS_B;


-- Consultas ampliadas de los repository OpcionPedidoRepository y PedidoPersonalizadoRepository


------------------------   *******    --------------------------------

-- Reemplaza List<OpcionPedido> findByCategoriaAndActivoTrue(String categoria); de OpcionPedidoRepository
-- Trae las opciones por categoria que se encuentran activos para los pedidos personalizados 

CREATE OR REPLACE PROCEDURE SP_OPCION_PEDIDO_CATEGORIA_ACTIVO(P_CATEGORIA IN VARCHAR2,P_CURSOR OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN P_CURSOR FOR
        SELECT id_opcion,categoria,valor,precio_adicional,activo
        FROM opcion_pedido
        WHERE categoria = P_CATEGORIA
        AND activo = 1;
EXCEPTION
    WHEN OTHERS THEN
        RAISE;
END;

--PRUEBA
CREATE OR REPLACE PROCEDURE SP_OPCION_PEDIDO_CATEGORIA_ACTIVO_B(P1_CATEGORIA IN VARCHAR2)
AS
    ID_OPCION NUMBER;
    CATEGORIA VARCHAR2(50);
    VALOR VARCHAR2(120);
    PRECIO_ADICIONAL NUMBER;
    ACTIVO NUMBER;
    DATOS SYS_REFCURSOR;
BEGIN
    SP_OPCION_PEDIDO_CATEGORIA_ACTIVO(P1_CATEGORIA,DATOS);
     LOOP
        FETCH DATOS INTO ID_OPCION,CATEGORIA,VALOR,PRECIO_ADICIONAL,ACTIVO;
        EXIT WHEN DATOS%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(ID_OPCION || ' ' || CATEGORIA || ' ' || VALOR || ' ' || PRECIO_ADICIONAL || ' ' || ACTIVO);
        END LOOP;
    CLOSE DATOS;
END;

EXEC SP_OPCION_PEDIDO_CATEGORIA_ACTIVO_B('producto');


------------------------   *******    --------------------------------


------------------------   *******    --------------------------------
/*    No se usan:

   - En PedidoPersonalizadoRepository:
     - List<PedidoPersonalizado> findByEstado(String estado); 
     - List<PedidoPersonalizado> findByUsuarioIdUsuario(Long idUsuario);
   
   
   - En OpcionPedidoRepository:
     - List<OpcionPedido> findByCategoria(String categoria); en OpcionPedidoRepository
     
   - En ResenaRepository:
     - List<Resena> findByProductoIdProducto(Long idProducto);
   
 
*/



------------------------   *******    --------------------------------

-- reemplaza List<Resena> findByProductoIdProductoAndAprobadaTrue(Long idProducto); de ResenaRepository
-- trae los datos de las resenas aprobadas por producto

CREATE OR REPLACE PROCEDURE SP_RESENA_APROBADA_PRODUCTO(P_ID_PRODUCTO IN  NUMBER,P_CURSOR OUT SYS_REFCURSOR)

AS
BEGIN
    OPEN P_CURSOR FOR
        SELECT ID_RESENA,ID_PRODUCTO,ID_USUARIO,ID_PEDIDO,CALIFICACION,
        COMENTARIO,APROBADA,FECHA_CREACION,FECHA_MODIFICACION
        FROM RESENA
        WHERE ID_PRODUCTO = P_ID_PRODUCTO
        AND APROBADA = 1;
END;

--PRUEBA
CREATE OR REPLACE PROCEDURE SP_RESENA_APROBADA_PRODUCTO_B(P1_ID_PRODUCTO IN  NUMBER)
AS
    ID_RESENA NUMBER;
    ID_PRODUCTO NUMBER;
    ID_USUARIO NUMBER;
    ID_PEDIDO NUMBER;
    CALIFICACION NUMBER;
    COMENTARIO CLOB;
    APROBADA NUMBER;
    FECHA_CREACION DATE;
    FECHA_MODIFICACION DATE;
    DATOS SYS_REFCURSOR;
BEGIN
    SP_RESENA_APROBADA_PRODUCTO(P1_ID_PRODUCTO,DATOS);
     LOOP
        FETCH DATOS INTO ID_RESENA,ID_PRODUCTO,ID_USUARIO,ID_PEDIDO,CALIFICACION,
        COMENTARIO,APROBADA,FECHA_CREACION,FECHA_MODIFICACION;
        EXIT WHEN DATOS%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(ID_RESENA || ' ' || ID_PRODUCTO || ' ' || ID_USUARIO || ' ' || ID_PEDIDO || ' ' || CALIFICACION || ' ' ||
            COMENTARIO || ' ' || APROBADA || ' ' || FECHA_CREACION || ' ' || FECHA_MODIFICACION );
        END LOOP;
    CLOSE DATOS;
END;

EXEC SP_RESENA_APROBADA_PRODUCTO_B(5);


------------------------   *******    --------------------------------

-- reemplaza List<Resena> findByUsuarioIdUsuario(Long idUsuario); de ResenaRepository
-- trae los datos de las resenas por usuario

CREATE OR REPLACE PROCEDURE SP_RESENA_USUARIO(P_ID_USUARIO IN  NUMBER,P_CURSOR OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN P_CURSOR FOR
        SELECT ID_RESENA,ID_PRODUCTO,ID_USUARIO,ID_PEDIDO,CALIFICACION,
        COMENTARIO,APROBADA,FECHA_CREACION,FECHA_MODIFICACION
        FROM RESENA
        WHERE ID_USUARIO = P_ID_USUARIO;
END;
  
--PRUEBA
CREATE OR REPLACE PROCEDURE SP_RESENA_USUARIO_B(P1_ID_USUARIO IN  NUMBER)
AS
    ID_RESENA NUMBER;
    ID_PRODUCTO NUMBER;
    ID_USUARIO NUMBER;
    ID_PEDIDO NUMBER;
    CALIFICACION NUMBER;
    COMENTARIO CLOB;
    APROBADA NUMBER;
    FECHA_CREACION DATE;
    FECHA_MODIFICACION DATE;
    DATOS SYS_REFCURSOR;
BEGIN
    SP_RESENA_USUARIO(P1_ID_USUARIO,DATOS);
     LOOP
        FETCH DATOS INTO ID_RESENA,ID_PRODUCTO,ID_USUARIO,ID_PEDIDO,CALIFICACION,
        COMENTARIO,APROBADA,FECHA_CREACION,FECHA_MODIFICACION;
        EXIT WHEN DATOS%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(ID_RESENA || ' ' || ID_PRODUCTO || ' ' || ID_USUARIO || ' ' || ID_PEDIDO || ' ' || CALIFICACION || ' ' ||
            COMENTARIO || ' ' || APROBADA || ' ' || FECHA_CREACION || ' ' || FECHA_MODIFICACION );
        END LOOP;
    CLOSE DATOS;
END;

EXEC SP_RESENA_USUARIO_B(5);  
  
------------------------   *******    --------------------------------

-- reemplaza <Resena> findTop10ByUsuarioIdUsuarioNotAndAprobadaTrueOrderByFechaCreacionDesc(Long idUsuarioExcluir); de ResenaRepository
-- trae las ultimas 10 resenas de la comunidad(excluye al usuario)

CREATE OR REPLACE PROCEDURE SP_RESENAS_COMUNIDAD(P_ID_USUARIO IN  NUMBER,P_CURSOR OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN P_CURSOR FOR
        SELECT ID_RESENA,ID_PRODUCTO,ID_USUARIO,ID_PEDIDO,CALIFICACION,
        COMENTARIO,APROBADA,FECHA_CREACION,FECHA_MODIFICACION
        FROM RESENA
        WHERE ID_USUARIO != P_ID_USUARIO
        AND APROBADA = 1
        ORDER BY FECHA_CREACION DESC
        FETCH FIRST 10 ROWS ONLY;
END;

--PRUEBA
CREATE OR REPLACE PROCEDURE SP_RESENAS_COMUNIDAD_B(P1_ID_USUARIO IN  NUMBER)
AS
    ID_RESENA NUMBER;
    ID_PRODUCTO NUMBER;
    ID_USUARIO NUMBER;
    ID_PEDIDO NUMBER;
    CALIFICACION NUMBER;
    COMENTARIO CLOB;
    APROBADA NUMBER;
    FECHA_CREACION DATE;
    FECHA_MODIFICACION DATE;
    DATOS SYS_REFCURSOR;
BEGIN
    SP_RESENAS_COMUNIDAD(P1_ID_USUARIO,DATOS);
     LOOP
        FETCH DATOS INTO ID_RESENA,ID_PRODUCTO,ID_USUARIO,ID_PEDIDO,CALIFICACION,
        COMENTARIO,APROBADA,FECHA_CREACION,FECHA_MODIFICACION;
        EXIT WHEN DATOS%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(ID_RESENA || ' ' || ID_PRODUCTO || ' ' || ID_USUARIO || ' ' || ID_PEDIDO || ' ' || CALIFICACION || ' ' ||
            COMENTARIO || ' ' || APROBADA || ' ' || FECHA_CREACION || ' ' || FECHA_MODIFICACION );
        END LOOP;
    CLOSE DATOS;
END;

EXEC SP_RESENAS_COMUNIDAD_B(5); 


------------------------   *******    --------------------------------

-- Reemplaza @Query("SELECT AVG(r.calificacion) FROM Resena r WHERE r.producto.idProducto = :productoId AND r.aprobada = true")
--    Double findPromedioCalificacionByProducto(@Param("productoId") Long productoId); de ResenaRepository

-- Trae el la calificacion promedio del producto q se envia

CREATE OR REPLACE PROCEDURE SP_RESENA_CALIFICACION(P_ID_PRODUCTO IN  NUMBER,P_PROMEDIO OUT NUMBER)
AS
BEGIN
    SELECT ROUND(AVG(CALIFICACION), 1)
    INTO P_PROMEDIO
    FROM RESENA
    WHERE ID_PRODUCTO = P_ID_PRODUCTO
    AND APROBADA = 1;

EXCEPTION
    WHEN OTHERS THEN
        P_PROMEDIO := NULL;
        RAISE;
END;
    
-- prueba

CREATE OR REPLACE PROCEDURE SP_RESENA_CALIFICACION_B(P_ID_PRODUCTO IN  NUMBER)
AS
    CAL NUMBER;
BEGIN
    SP_RESENA_CALIFICACION(P_ID_PRODUCTO,CAL);
        DBMS_OUTPUT.PUT_LINE(CAL);
END;

EXEC SP_RESENA_CALIFICACION_B(1);

------------------------   *******    --------------------------------


-- Reemplaza @Query("SELECT COUNT(r) FROM Resena r WHERE r.producto.idProducto = :productoId AND r.aprobada = true")
--    Integer countResenasAprobadasByProducto(@Param("productoId") Long productoId); de ResenaRepository
    
-- Trae la cantidad de resenas aprobadas por producto

CREATE OR REPLACE PROCEDURE SP_RESENA_COUNT_PRODUCTO(P_ID_PRODUCTO IN  NUMBER,P_TOTAL OUT NUMBER)
AS
BEGIN
    SELECT COUNT(*)
    INTO P_TOTAL
    FROM RESENA
    WHERE ID_PRODUCTO = P_ID_PRODUCTO
    AND APROBADA = 1;
EXCEPTION
    WHEN OTHERS THEN
        P_TOTAL := 0;
        RAISE;
END;

--prueba
CREATE OR REPLACE PROCEDURE SP_RESENA_COUNT_PRODUCTO_B(P_ID_PRODUCTO IN  NUMBER)
AS
    TOTAL NUMBER;
BEGIN
    SP_RESENA_COUNT_PRODUCTO(P_ID_PRODUCTO,TOTAL);
        DBMS_OUTPUT.PUT_LINE(TOTAL);
END;

EXEC SP_RESENA_COUNT_PRODUCTO_B(1);


------------------------   *******    --------------------------------
-- Reemplaza  boolean existsByUsuarioIdUsuarioAndProductoIdProducto(Long idUsuario, Long idProducto); de ResenaRepository
-- Indica con 1 si un usuario ya habia dejado una resena de un producto


CREATE OR REPLACE PROCEDURE SP_RESENA_BY_USUARIO(P_ID_USUARIO IN NUMBER,P_ID_PRODUCTO IN NUMBER,P_EXISTS OUT NUMBER)
AS
BEGIN
    SELECT COUNT(*)
    INTO P_EXISTS
    FROM RESENA
    WHERE ID_USUARIO = P_ID_USUARIO
    AND ID_PRODUCTO = P_ID_PRODUCTO;
EXCEPTION
    WHEN OTHERS THEN
        P_EXISTS := 0;
        RAISE;
END;

--prueba
CREATE OR REPLACE PROCEDURE SP_RESENA_BY_USUARIO_B(P_ID_USUARIO IN NUMBER,P_ID_PRODUCTO IN  NUMBER)
AS
    EXISTE NUMBER;
BEGIN
    SP_RESENA_BY_USUARIO(P_ID_PRODUCTO,P_ID_PRODUCTO,EXISTE);
        IF EXISTE = 1 THEN
            DBMS_OUTPUT.PUT_LINE('Ya hay una resena');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Aun no hay resena');
        END IF;    
END;

EXEC SP_RESENA_BY_USUARIO_B(1,1);

COMMIT;


CREATE OR REPLACE PROCEDURE SP_INSERTAR_PEDIDO_PERSONALIZADO(
    VPRODUCTO        IN VARCHAR2,
    VSABOR_BIZCOCHO  IN VARCHAR2,
    VSABOR_RELLENO   IN VARCHAR2,
    VTAMANO          IN VARCHAR2,
    VPERSONALIZACION IN CLOB,
    VPRECIO          IN NUMBER,
    VESTADO          IN VARCHAR2,
    VFECHA_ENTREGA   IN TIMESTAMP,
    VID_USUARIO      IN NUMBER,
    VNOMBRE_CLIENTE  IN VARCHAR2,
    VTELEFONO        IN VARCHAR2,
    VEMAIL           IN VARCHAR2,
    VID_PEDIDO       OUT NUMBER
)
AS
BEGIN
    INSERT INTO pedido_personalizado (
        producto, sabor_bizcocho, sabor_relleno, tamano,
        personalizacion, precio, estado, fecha_creacion,
        fecha_entrega, id_usuario, nombre_cliente, telefono, email
    )
    VALUES (
        VPRODUCTO, VSABOR_BIZCOCHO, VSABOR_RELLENO, VTAMANO,
        VPERSONALIZACION, VPRECIO, VESTADO, SYSTIMESTAMP,
        VFECHA_ENTREGA, VID_USUARIO, VNOMBRE_CLIENTE, VTELEFONO, VEMAIL
    )
    RETURNING id_pedido INTO VID_PEDIDO;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;

