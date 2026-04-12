-- DATOS PRODUCTO
INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Pie de manzana', 'Delicioso pie de manzana con canela', 'Consumir en 24 horas, puede refrigerarse', 3000, 10);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Pie de limón', 'Pie refrescante con relleno de limón', 'Refrigerado, consumir en 48 horas', 3000, 0);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Torta chilena', 'Torta tradicional con capas de bizcocho y manjar', 'Ambiente fresco, consumir en 3 días', 3000, 5);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Pavlova', 'Merengue crujiente con crema y frutas frescas', 'Consumir inmediatamente', 3000, 0);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Caja de macarons', 'Selección de macarons surtidos', 'Ambiente fresco, consumir en 5 días', 8000, 15);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Caja de donas', 'Donas glaseadas y con toppings variados', 'Consumir en 24 horas', 6000, 0);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Caja de brownies', 'Brownies de chocolate intenso', 'Ambiente fresco, consumir en 4 días', 7000, 8);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Galletas personalizadas', 'Galletas decoradas según tu diseño', 'Consumir en 7 días', 5000, 20);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Galletas corazón', 'Galletas en forma de corazón con decoración', 'Consumir en 10 días', 3000, 0);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Brookies', 'Combinación de brownie y cookie', 'Consumir en 5 días', 5000, 12);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Pasteles clásicos', 'Selección de pasteles tradicionales', 'Refrigerado, consumir en 3 días', 13000, 6);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Pasteles personalizados', 'Pasteles decorados para ocasiones especiales', 'Refrigerado, consumir en 3 días', 15000, 0);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Pasteles fríos', 'Pasteles refrigerados con cremas frescas', 'Mantener refrigerado, consumir en 2 días', 12500, 10);

INSERT INTO producto (nombre, descripcion, conservacion, precio, stock) VALUES
('Lunch cake', 'Porción individual para lunch', 'Consumir en 24 horas', 10000, 0);


-- DATOS TAMAÑOS
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (1, 'Individual');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (1, 'Familiar');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (2, 'Individual');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (2, 'Familiar');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (3, 'Mediano');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (3, 'Grande');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (4, 'Individual');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (4, 'Mediano');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (5, 'Pequeña (6u)');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (5, 'Grande (12u)');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (6, 'Pequeña (6u)');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (6, 'Grande (12u)');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (7, 'Pequeña (9u)');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (7, 'Grande (16u)');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (8, 'Docena');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (8, 'Media docena');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (9, 'Docena');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (9, 'Media docena'); 
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (10, 'Individual');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (10, 'Caja (4u)'); 
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (11, 'Pequeño');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (11, 'Mediano');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (11, 'Grande');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (12, 'Pequeño');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (12, 'Mediano');  
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (11, 'Grande');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (13, 'Individual');
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (13, 'Mediano');  
INSERT INTO producto_tamano (id_producto, etiqueta) VALUES (14, 'Individual');      


-- DATOS SABORES
-- Sabores para Producto 1
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (1, 'Manzana canela');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (1, 'Manzana caramelo');

-- Sabores para Producto 2
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (2, 'Limón natural');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (2, 'Limón merengue');

-- Sabores para Producto 3
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (3, 'Vainilla');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (3, 'Chocolate');

-- Sabores para Producto 4
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (4, 'Frutas tropicales');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (4, 'Frutas rojas');

-- Sabores para Producto 5
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (5, 'Surtido');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (5, 'Vainilla');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (5, 'Chocolate');

-- Sabores para Producto 6
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (6, 'Glaseado');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (6, 'Chocolate');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (6, 'Azúcar');

-- Sabores para Producto 7
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (7, 'Chocolate');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (7, 'Nuez');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (7, 'Chips');

-- Sabores para Producto 8
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (8, 'Vainilla');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (8, 'Chocolate');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (8, 'Limon');

-- Sabores para Producto 9
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (9, 'Vainilla');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (9, 'Chocolate');

-- Sabores para Producto 10
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (10, 'Chocolate');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (10, 'Vainilla');

-- Sabores para Producto 11
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (11, 'Vainilla');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (11, 'Chocolate');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (11, 'Red Velvet');

-- Sabores para Producto 12
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (12, 'Vainilla');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (12, 'Chocolate');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (12, 'Fresa');

-- Sabores para Producto 13
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (13, 'Tres leches');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (13, 'Chocolate');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (13, 'Vainilla');

-- Sabores para Producto 14
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (14, 'Vainilla');
INSERT INTO producto_sabor (id_producto, etiqueta) VALUES (14, 'Chocolate');


-- DATOS INGREDIENTES COMPLETOS
-- Producto 1: Pie de Manzana
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (1, 'Manzana');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (1, 'Canela');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (1, 'Harina');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (1, 'Mantequilla');

-- Producto 2: Pie de Limón
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (2, 'Limón');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (2, 'Azúcar');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (2, 'Harina');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (2, 'Huevo');

-- Producto 3: Torta Chilena
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (3, 'Harina');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (3, 'Manjar');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (3, 'Merengue');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (3, 'Azúcar');

-- Producto 5: Macarons
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (5, 'Almendra molida');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (5, 'Azúcar glass');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (5, 'Clara de huevo');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (5, 'Colorantes naturales');

-- Producto 10: Brookies
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (10, 'Harina de trigo');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (10, 'Chocolate');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (10, 'Mantequilla');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (10, 'Chips de chocolate');

-- Producto 12: Pasteles Personalizados
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (12, 'Harina de trigo');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (12, 'Huevo');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (12, 'Fondant');
INSERT INTO producto_ingrediente (id_producto, nombre) VALUES (12, 'Colorantes comestibles');



-- ACTUALIZAR STOCK
UPDATE producto SET stock = 10 WHERE id_producto = 1;
UPDATE producto SET stock = 0 WHERE id_producto = 2;
UPDATE producto SET stock = 5 WHERE id_producto = 3;
UPDATE producto SET stock = 0 WHERE id_producto = 4;
UPDATE producto SET stock = 15 WHERE id_producto = 5;
UPDATE producto SET stock = 0 WHERE id_producto = 6;
UPDATE producto SET stock = 8 WHERE id_producto = 7;
UPDATE producto SET stock = 20 WHERE id_producto = 8;
UPDATE producto SET stock = 0 WHERE id_producto = 9;
UPDATE producto SET stock = 12 WHERE id_producto = 10;
UPDATE producto SET stock = 6 WHERE id_producto = 11;
UPDATE producto SET stock = 0 WHERE id_producto = 12;
UPDATE producto SET stock = 10 WHERE id_producto = 13;
UPDATE producto SET stock = 0 WHERE id_producto = 14;


-- INSERT OPCIONES PEDIDO 
-- PRODUCTOS
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('producto', 'Pastel', 'Pastel tradicional horneado', 0, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('producto', 'Galleta', 'Galletas personalizadas', 0, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('producto', 'Lunch Cake', 'Lunch Cake especial', 0, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('producto', 'Pastel Frio', 'Pastel refrigerado', 2500, 1);

-- SABORES BIZCOCHO
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('sabor_bizcocho', 'Vainilla', 'Bizcocho clásico de vainilla', 0, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('sabor_bizcocho', 'Chocolate', 'Bizcocho intenso de chocolate', 1000, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('sabor_bizcocho', 'Red Velvet', 'Bizcocho rojo aterciopelado', 1500, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('sabor_bizcocho', 'Lemon Pound', 'Bizcocho denso de limón', 1200, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('sabor_bizcocho', 'Zanahoria', 'Bizcocho húmedo de zanahoria con nueces', 1500, 1);

-- SABORES RELLENO
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('sabor_relleno', 'Leche condensada', 'Relleno dulce', 0, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('sabor_relleno', 'Leche condensada cocinada', 'Manjar casero', 1000, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('sabor_relleno', 'Buttercream', 'Crema de mantequilla', 1500, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('sabor_relleno', 'Chocolate', 'Relleno cremoso', 1200, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('sabor_relleno', 'Mermelada Fresa', 'Mermelada natural', 1000, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('sabor_relleno', 'Frutas', 'Frutas frescas', 2000, 1);

-- TAMAÑOS
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('tamano', 'Pequeño', '4-6 personas', 7500, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('tamano', 'Mediano', '8-10 personas', 12500, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('tamano', 'Grande', '12-15 personas', 17500, 1);
INSERT INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo) VALUES ('tamano', 'Familiar', '20+ personas', 25000, 1);


INSERT INTO usuario (nombre, correo, password_hash, activo)
VALUES ('Cliente de Prueba', 'prueba@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 1);

/* SELECT id_usuario, nombre, correo, activo, fecha_creacion
FROM usuario
ORDER BY id_usuario DESC
FETCH FIRST 5 ROWS ONLY; */



-- INSERTAR USUARIOS DE PRUEBA PARA RESEÑAS
INSERT INTO usuario (nombre, correo, password_hash, activo) 
VALUES ('Adrián González', 'adrian@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 1);

INSERT INTO usuario (nombre, correo, password_hash, activo) 
VALUES ('Vero Losiza', 'vero@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 1);

INSERT INTO usuario (nombre, correo, password_hash, activo) 
VALUES ('Victoria Cruz', 'victoria@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 1);

INSERT INTO usuario (nombre, correo, password_hash, activo) 
VALUES ('Jorge Campos', 'jorge@gmail.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 1);



-- Insertos para la tabla pedido
INSERT INTO pedido (id_usuario, total, metodo_pago, estado) 
VALUES (13, 150.50, 'Tarjeta de Crédito', 'Completado');

INSERT INTO pedido (id_usuario, total, metodo_pago, estado) 
VALUES (12, 85.00, 'PayPal', 'Pendiente');

INSERT INTO pedido (id_usuario, total, metodo_pago, estado) 
VALUES (11, 210.99, 'Transferencia', 'En Proceso');

INSERT INTO pedido (id_usuario, total, metodo_pago, estado) 
VALUES (10, 45.25, 'Efectivo', 'Completado');

INSERT INTO pedido (id_usuario, total, metodo_pago, estado) 
VALUES (9, 320.00, 'Tarjeta de Débito', 'Cancelado');

SELECT * FROM dual;

-- INSERT RESEÑAS+
INSERT INTO resena (id_producto, id_usuario, calificacion, comentario, aprobada, fecha_creacion)
VALUES (1, 13, 5, 'Me encantó el pastel, muy original y el sabor muy bueno. La presentación era hermosa.', 1, TIMESTAMP '2024-01-15 10:30:00');

-- Reseña de Victoria Cruz (ID: 12)
INSERT INTO resena (id_producto, id_usuario, calificacion, comentario, aprobada, fecha_creacion)
VALUES (2, 12, 5, 'El pie de limón estaba espectacular. Justo el punto de acidez que me gusta.', 1, TIMESTAMP '2024-01-25 11:15:00');

-- Reseña de Vero Losiza (ID: 11)
INSERT INTO resena (id_producto, id_usuario, calificacion, comentario, aprobada, fecha_creacion)
VALUES (3, 11, 5, 'Auténtica torta chilena como la de mi abuela. Las capas de manjar son perfectas.', 1, TIMESTAMP '2024-01-30 13:40:00');

-- Reseña de Adrián González (ID: 10)
INSERT INTO resena (id_producto, id_usuario, calificacion, comentario, aprobada, fecha_creacion)
VALUES (5, 10, 5, 'Los macarons más deliciosos que he probado. Textura perfecta y sabores auténticos.', 1, TIMESTAMP '2024-02-08 12:05:00');

-- Reseña de Cliente de Prueba (ID: 9)
INSERT INTO resena (id_producto, id_usuario, calificacion, comentario, aprobada, fecha_creacion)
VALUES (10, 9, 5, 'Brookies adictivos. Pedí dos cajas y se acabaron en un día. Los mejores.', 1, TIMESTAMP '2024-02-17 14:55:00');

-- Token para Adrián González (ID: 10) - Expira en 1 hora
INSERT INTO expiracion_token_contraseña (id_usuario, codigo, expira_en) 
VALUES (10, '123456', SYSTIMESTAMP + INTERVAL '1' HOUR);

-- Token para Vero Losiza (ID: 11) - Ya expirado (para pruebas de error)
INSERT INTO expiracion_token_contraseña (id_usuario, codigo, expira_en) 
VALUES (11, '987654', SYSTIMESTAMP - INTERVAL '10' MINUTE);

-- Token para Victoria Cruz (ID: 12) - Activo
INSERT INTO expiracion_token_contraseña (id_usuario, codigo, expira_en) 
VALUES (12, '456123', SYSTIMESTAMP + INTERVAL '30' MINUTE);

-- Token para Jorge Campos (ID: 13) - Activo
INSERT INTO expiracion_token_contraseña (id_usuario, codigo, expira_en) 
VALUES (13, '000999', SYSTIMESTAMP + INTERVAL '1' DAY);






