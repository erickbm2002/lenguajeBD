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
INSERT ALL
INTO producto_sabor (id_producto, etiqueta) VALUES (1, 'Manzana canela')
INTO producto_sabor (id_producto, etiqueta) VALUES (1, 'Manzana caramelo')
INTO producto_sabor (id_producto, etiqueta) VALUES (2, 'Limón natural')
INTO producto_sabor (id_producto, etiqueta) VALUES (2, 'Limón merengue')
INTO producto_sabor (id_producto, etiqueta) VALUES (3, 'Vainilla')
INTO producto_sabor (id_producto, etiqueta) VALUES (3, 'Chocolate')
INTO producto_sabor (id_producto, etiqueta) VALUES (4, 'Frutas tropicales')
INTO producto_sabor (id_producto, etiqueta) VALUES (4, 'Frutas rojas')
INTO producto_sabor (id_producto, etiqueta) VALUES (5, 'Surtido')
INTO producto_sabor (id_producto, etiqueta) VALUES (5, 'Vainilla')
INTO producto_sabor (id_producto, etiqueta) VALUES (5, 'Chocolate')
INTO producto_sabor (id_producto, etiqueta) VALUES (6, 'Glaseado')
INTO producto_sabor (id_producto, etiqueta) VALUES (6, 'Chocolate')
INTO producto_sabor (id_producto, etiqueta) VALUES (6, 'Azúcar')
INTO producto_sabor (id_producto, etiqueta) VALUES (7, 'Chocolate')
INTO producto_sabor (id_producto, etiqueta) VALUES (7, 'Nuez')
INTO producto_sabor (id_producto, etiqueta) VALUES (7, 'Chips')
INTO producto_sabor (id_producto, etiqueta) VALUES (8, 'Vainilla')
INTO producto_sabor (id_producto, etiqueta) VALUES (8, 'Chocolate')
INTO producto_sabor (id_producto, etiqueta) VALUES (8, 'Limon')
INTO producto_sabor (id_producto, etiqueta) VALUES (9, 'Vainilla')
INTO producto_sabor (id_producto, etiqueta) VALUES (9, 'Chocolate')
INTO producto_sabor (id_producto, etiqueta) VALUES (10, 'Chocolate')
INTO producto_sabor (id_producto, etiqueta) VALUES (10, 'Vainilla')
INTO producto_sabor (id_producto, etiqueta) VALUES (11, 'Vainilla')
INTO producto_sabor (id_producto, etiqueta) VALUES (11, 'Chocolate')
INTO producto_sabor (id_producto, etiqueta) VALUES (11, 'Red Velvet')
INTO producto_sabor (id_producto, etiqueta) VALUES (12, 'Vainilla')
INTO producto_sabor (id_producto, etiqueta) VALUES (12, 'Chocolate')
INTO producto_sabor (id_producto, etiqueta) VALUES (12, 'Fresa')
INTO producto_sabor (id_producto, etiqueta) VALUES (13, 'Tres leches')
INTO producto_sabor (id_producto, etiqueta) VALUES (13, 'Chocolate')
INTO producto_sabor (id_producto, etiqueta) VALUES (13, 'Vainilla')
INTO producto_sabor (id_producto, etiqueta) VALUES (14, 'Vainilla')
INTO producto_sabor (id_producto, etiqueta) VALUES (14, 'Chocolate')
SELECT * FROM dual;


-- DATOS INGREDIENTES COMPLETOS
INSERT ALL
-- Pies y tortas
INTO producto_ingrediente (id_producto, nombre) VALUES (1, 'Manzana')
INTO producto_ingrediente (id_producto, nombre) VALUES (1, 'Canela')
INTO producto_ingrediente (id_producto, nombre) VALUES (1, 'Harina')
INTO producto_ingrediente (id_producto, nombre) VALUES (1, 'Mantequilla')

INTO producto_ingrediente (id_producto, nombre) VALUES (2, 'Limón')
INTO producto_ingrediente (id_producto, nombre) VALUES (2, 'Azúcar')
INTO producto_ingrediente (id_producto, nombre) VALUES (2, 'Harina')
INTO producto_ingrediente (id_producto, nombre) VALUES (2, 'Huevo')

INTO producto_ingrediente (id_producto, nombre) VALUES (3, 'Harina')
INTO producto_ingrediente (id_producto, nombre) VALUES (3, 'Manjar')
INTO producto_ingrediente (id_producto, nombre) VALUES (3, 'Merengue')
INTO producto_ingrediente (id_producto, nombre) VALUES (3, 'Azúcar')

INTO producto_ingrediente (id_producto, nombre) VALUES (4, 'Merengue')
INTO producto_ingrediente (id_producto, nombre) VALUES (4, 'Crema')
INTO producto_ingrediente (id_producto, nombre) VALUES (4, 'Frutas frescas')
INTO producto_ingrediente (id_producto, nombre) VALUES (4, 'Azúcar')

-- Macarons
INTO producto_ingrediente (id_producto, nombre) VALUES (5, 'Almendra molida')
INTO producto_ingrediente (id_producto, nombre) VALUES (5, 'Azúcar glass')
INTO producto_ingrediente (id_producto, nombre) VALUES (5, 'Clara de huevo')
INTO producto_ingrediente (id_producto, nombre) VALUES (5, 'Colorantes naturales')
INTO producto_ingrediente (id_producto, nombre) VALUES (5, 'Relleno de mantequilla')

-- Donas
INTO producto_ingrediente (id_producto, nombre) VALUES (6, 'Harina de trigo')
INTO producto_ingrediente (id_producto, nombre) VALUES (6, 'Levadura')
INTO producto_ingrediente (id_producto, nombre) VALUES (6, 'Azúcar')
INTO producto_ingrediente (id_producto, nombre) VALUES (6, 'Huevo')
INTO producto_ingrediente (id_producto, nombre) VALUES (6, 'Mantequilla')
INTO producto_ingrediente (id_producto, nombre) VALUES (6, 'Glaseado variado')

-- Brownies
INTO producto_ingrediente (id_producto, nombre) VALUES (7, 'Chocolate negro')
INTO producto_ingrediente (id_producto, nombre) VALUES (7, 'Mantequilla')
INTO producto_ingrediente (id_producto, nombre) VALUES (7, 'Azúcar')
INTO producto_ingrediente (id_producto, nombre) VALUES (7, 'Huevo')
INTO producto_ingrediente (id_producto, nombre) VALUES (7, 'Harina')
INTO producto_ingrediente (id_producto, nombre) VALUES (7, 'Nueces')

-- Galletas personalizadas
INTO producto_ingrediente (id_producto, nombre) VALUES (8, 'Harina de trigo')
INTO producto_ingrediente (id_producto, nombre) VALUES (8, 'Mantequilla')
INTO producto_ingrediente (id_producto, nombre) VALUES (8, 'Azúcar')
INTO producto_ingrediente (id_producto, nombre) VALUES (8, 'Huevo')
INTO producto_ingrediente (id_producto, nombre) VALUES (8, 'Esencia de vainilla')
INTO producto_ingrediente (id_producto, nombre) VALUES (8, 'Colorantes comestibles')

-- Galletas corazón
INTO producto_ingrediente (id_producto, nombre) VALUES (9, 'Harina de trigo')
INTO producto_ingrediente (id_producto, nombre) VALUES (9, 'Mantequilla')
INTO producto_ingrediente (id_producto, nombre) VALUES (9, 'Azúcar')
INTO producto_ingrediente (id_producto, nombre) VALUES (9, 'Huevo')
INTO producto_ingrediente (id_producto, nombre) VALUES (9, 'Esencia de vainilla')
INTO producto_ingrediente (id_producto, nombre) VALUES (9, 'Decoración en azúcar')

-- Brookies
INTO producto_ingrediente (id_producto, nombre) VALUES (10, 'Harina de trigo')
INTO producto_ingrediente (id_producto, nombre) VALUES (10, 'Chocolate')
INTO producto_ingrediente (id_producto, nombre) VALUES (10, 'Mantequilla')
INTO producto_ingrediente (id_producto, nombre) VALUES (10, 'Azúcar')
INTO producto_ingrediente (id_producto, nombre) VALUES (10, 'Huevo')
INTO producto_ingrediente (id_producto, nombre) VALUES (10, 'Chips de chocolate')

-- Pasteles clásicos
INTO producto_ingrediente (id_producto, nombre) VALUES (11, 'Harina de trigo')
INTO producto_ingrediente (id_producto, nombre) VALUES (11, 'Azúcar')
INTO producto_ingrediente (id_producto, nombre) VALUES (11, 'Huevo')
INTO producto_ingrediente (id_producto, nombre) VALUES (11, 'Mantequilla')
INTO producto_ingrediente (id_producto, nombre) VALUES (11, 'Leche')
INTO producto_ingrediente (id_producto, nombre) VALUES (11, 'Levadura')

-- Pasteles personalizados
INTO producto_ingrediente (id_producto, nombre) VALUES (12, 'Harina de trigo')
INTO producto_ingrediente (id_producto, nombre) VALUES (12, 'Azúcar')
INTO producto_ingrediente (id_producto, nombre) VALUES (12, 'Huevo')
INTO producto_ingrediente (id_producto, nombre) VALUES (12, 'Mantequilla')
INTO producto_ingrediente (id_producto, nombre) VALUES (12, 'Fondant')
INTO producto_ingrediente (id_producto, nombre) VALUES (12, 'Colorantes comestibles')

-- Pasteles fríos
INTO producto_ingrediente (id_producto, nombre) VALUES (13, 'Crema para batir')
INTO producto_ingrediente (id_producto, nombre) VALUES (13, 'Gelatina')
INTO producto_ingrediente (id_producto, nombre) VALUES (13, 'Fruta fresca')
INTO producto_ingrediente (id_producto, nombre) VALUES (13, 'Bizcocho')
INTO producto_ingrediente (id_producto, nombre) VALUES (13, 'Azúcar')
INTO producto_ingrediente (id_producto, nombre) VALUES (13, 'Leche condensada')

-- Lunch cake
INTO producto_ingrediente (id_producto, nombre) VALUES (14, 'Harina de trigo')
INTO producto_ingrediente (id_producto, nombre) VALUES (14, 'Azúcar')
INTO producto_ingrediente (id_producto, nombre) VALUES (14, 'Huevo')
INTO producto_ingrediente (id_producto, nombre) VALUES (14, 'Mantequilla')
INTO producto_ingrediente (id_producto, nombre) VALUES (14, 'Leche')
INTO producto_ingrediente (id_producto, nombre) VALUES (14, 'Esencia de vainilla')
SELECT * FROM dual;

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
COMMIT;

-- INSERT OPCIONES PEDIDO 
INSERT ALL
-- Productos
INTO opcion_pedido (categoria, valor, descripcion, precio_adicional, activo)
VALUES ('producto', 'Pastel', 'Pastel tradicional horneado', 0, 1)

INTO opcion_pedido VALUES ('producto', 'Galleta', 'Galletas personalizadas', 0, 1)
INTO opcion_pedido VALUES ('producto', 'Lunch Cake', 'Lunch Cake especial', 0, 1)
INTO opcion_pedido VALUES ('producto', 'Pastel Frio', 'Pastel refrigerado', 2500, 1)

-- Sabores bizcocho
INTO opcion_pedido VALUES ('sabor_bizcocho', 'Vainilla', 'Bizcocho clásico de vainilla', 0, 1)
INTO opcion_pedido VALUES ('sabor_bizcocho', 'Chocolate', 'Bizcocho intenso de chocolate', 1000, 1)
INTO opcion_pedido VALUES ('sabor_bizcocho', 'Red Velvet', 'Bizcocho rojo aterciopelado', 1500, 1)
INTO opcion_pedido VALUES ('sabor_bizcocho', 'Lemon Pound', 'Bizcocho denso de limón', 1200, 1)
INTO opcion_pedido VALUES ('sabor_bizcocho', 'Zanahoria', 'Bizcocho húmedo de zanahoria con nueces', 1500, 1)

-- Sabores relleno
INTO opcion_pedido VALUES ('sabor_relleno', 'Leche condensada', 'Relleno dulce', 0, 1)
INTO opcion_pedido VALUES ('sabor_relleno', 'Leche condensada cocinada', 'Manjar casero', 1000, 1)
INTO opcion_pedido VALUES ('sabor_relleno', 'Buttercream', 'Crema de mantequilla', 1500, 1)
INTO opcion_pedido VALUES ('sabor_relleno', 'Chocolate', 'Relleno cremoso', 1200, 1)
INTO opcion_pedido VALUES ('sabor_relleno', 'Mermelada Fresa', 'Mermelada natural', 1000, 1)
INTO opcion_pedido VALUES ('sabor_relleno', 'Frutas', 'Frutas frescas', 2000, 1)

-- Tamaños
INTO opcion_pedido VALUES ('tamano', 'Pequeño', '4-6 personas', 7500, 1)
INTO opcion_pedido VALUES ('tamano', 'Mediano', '8-10 personas', 12500, 1)
INTO opcion_pedido VALUES ('tamano', 'Grande', '12-15 personas', 17500, 1)
INTO opcion_pedido VALUES ('tamano', 'Familiar', '20+ personas', 25000, 1)
SELECT * FROM dual;

INSERT INTO usuario (nombre, correo, password_hash, activo)
VALUES ('Cliente de Prueba', 'prueba@gmail.com', 'password123', 1);

SELECT id_usuario, nombre, correo, activo, fecha_creacion
FROM usuario
ORDER BY id_usuario DESC
FETCH FIRST 5 ROWS ONLY;

-- INSERTAR USUARIOS DE PRUEBA PARA RESEÑAS
INSERT ALL
INTO usuario (nombre, correo, password_hash, activo) VALUES ('Adrián González', 'adrian@gmail.com', 'hash123', 1)
INTO usuario (nombre, correo, password_hash, activo) VALUES ('Vero Losiza', 'vero@gmail.com', 'hash123', 1)
INTO usuario (nombre, correo, password_hash, activo) VALUES ('Victoria Cruz', 'victoria@gmail.com', 'hash123', 1)
INTO usuario (nombre, correo, password_hash, activo) VALUES ('Jorge Campos', 'jorge@gmail.com', 'hash123', 1)
INTO usuario (nombre, correo, password_hash, activo) VALUES ('María Rodríguez', 'maria@gmail.com', 'hash123', 1)
INTO usuario (nombre, correo, password_hash, activo) VALUES ('Carlos Sánchez', 'carlos@gmail.com', 'hash123', 1)
INTO usuario (nombre, correo, password_hash, activo) VALUES ('Ana Martínez', 'ana@gmail.com', 'hash123', 1)
INTO usuario (nombre, correo, password_hash, activo) VALUES ('Luis Fernández', 'luis@gmail.com', 'hash123', 1)
INTO usuario (nombre, correo, password_hash, activo) VALUES ('Sofía García', 'sofia@gmail.com', 'hash123', 1)
INTO usuario (nombre, correo, password_hash, activo) VALUES ('David López', 'david@gmail.com', 'hash123', 1)
SELECT * FROM dual;

-- INSERT RESEÑAS
INSERT ALL

-- Pie de manzana (ID:1)
INTO resena (id_producto, id_usuario, calificacion, comentario, aprobada, fecha_creacion)
VALUES (1, 1, 5, 'Me encantó el pastel, muy original y el sabor muy bueno. La presentación era hermosa y llegó en perfecto estado.', 1, TIMESTAMP '2024-01-15 10:30:00')

INTO resena VALUES (1, 2, 4, 'Muy rico, aunque esperaba que fuera un poco más grande. El sabor de manzana con canela es delicioso.', 1, TIMESTAMP '2024-01-20 14:45:00')

INTO resena VALUES (1, 3, 5, 'Perfecto para el cumpleaños de mi hijo. A todos les encantó y quedaron felices con el sabor.', 1, TIMESTAMP '2024-02-05 16:20:00')

-- Pie de limón (ID:2)
INTO resena VALUES (2, 4, 5, 'El pie de limón estaba espectacular. Justo el punto de acidez que me gusta, ni muy dulce ni muy ácido.', 1, TIMESTAMP '2024-01-25 11:15:00')

INTO resena VALUES (2, 5, 4, 'Muy refrescante, ideal para el clima caliente. La masa estaba crujiente y el relleno cremoso.', 1, TIMESTAMP '2024-02-10 09:30:00')

-- Torta chilena (ID:3)
INTO resena VALUES (3, 6, 5, 'Auténtica torta chilena como la de mi abuela. Las capas de manjar son perfectas y el bizcocho muy esponjoso.', 1, TIMESTAMP '2024-01-30 13:40:00')

INTO resena VALUES (3, 7, 4, 'Muy buena, aunque un poco empalagosa para mi gusto. Recomiendo compartirla con varias personas.', 1, TIMESTAMP '2024-02-12 17:25:00')

-- Macarons (ID:5)
INTO resena VALUES (5, 2, 5, 'Super cool que se pueda personalizar, a mi amiga le encantaron los macarons. Los colores eran hermosos.', 1, TIMESTAMP '2024-02-01 15:10:00')

INTO resena VALUES (5, 8, 5, 'Los macarons más deliciosos que he probado. Textura perfecta y sabores auténticos. Volveré a pedir.', 1, TIMESTAMP '2024-02-08 12:05:00')

INTO resena VALUES (5, 9, 4, 'Muy bonitos y sabrosos, aunque algunos estaban un poco quebradizos. En general buena experiencia.', 1, TIMESTAMP '2024-02-15 10:50:00')

-- Galletas personalizadas (ID:8)
INTO resena VALUES (8, 3, 4, 'Personalizamos unas galletas y tenían muy buen sabor, pero la masa era algo quebradiza. El diseño quedó precioso igual.', 1, TIMESTAMP '2024-02-03 14:20:00')

INTO resena VALUES (8, 10, 5, 'Las galletas para el baby shower fueron un éxito. El diseño exacto que pedimos y el sabor increíble.', 1, TIMESTAMP '2024-02-18 11:30:00')

-- Pasteles personalizados (ID:12)
INTO resena VALUES (12, 1, 5, 'El pastel de bodas de oro de mis padres quedó espectacular. El diseño era exacto a la foto que enviamos.', 1, TIMESTAMP '2024-01-28 16:45:00')

INTO resena VALUES (12, 5, 5, 'Pastel para graduación perfecto. El sabor de chocolate con buttercream era divino y la decoración impecable.', 1, TIMESTAMP '2024-02-14 13:15:00')

-- Pasteles clásicos (ID:11)
INTO resena VALUES (11, 6, 5, 'El pastel de vainilla clásico nunca falla. Húmedo, esponjoso y con el punto justo de dulce.', 1, TIMESTAMP '2024-02-07 10:25:00')

INTO resena VALUES (11, 7, 4, 'Buen pastel tradicional. Lo único es que me hubiera gustado un poco más de relleno entre las capas.', 1, TIMESTAMP '2024-02-16 15:40:00')

-- Brookies (ID:10)
INTO resena VALUES (10, 8, 5, 'La combinación perfecta entre brownie y cookie. Chocolate intenso y textura increíble. Mis hijos los amaron.', 1, TIMESTAMP '2024-02-09 12:30:00')

INTO resena VALUES (10, 9, 5, 'Brookies adictivos. Pedí dos cajas y se acabaron en un día. Definitivamente los mejores que he probado.', 1, TIMESTAMP '2024-02-17 14:55:00')

-- Reseña con comentario de entrega
INTO resena VALUES (6, 4, 3, 'El producto estaba muy bueno, solo que me costó coordinar la entrega. Tuve que esperar más de lo acordado.', 1, TIMESTAMP '2024-02-11 09:15:00')

SELECT * FROM dual;