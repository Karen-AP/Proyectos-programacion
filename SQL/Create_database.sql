--Se crea un database llamado pruebav, que contiene los tables llamados meteria_prima, producto y venta creados con información aleatoria.
--Adémas, una tabla de asociación llamada detalle_venta
--Se revisa la información en la base con Querys asociados con group by, order by,


-- Creación de la base de datos 'pruebav'
create database pruebav;
go

-- Selección de la base de datos para su uso
USE pruebav;
GO

-- Creación de la tabla 'materia_prima'
-- Contiene información sobre las materias primas utilizadas en la producción
CREATE TABLE materia_prima (
    id_mp INT PRIMARY KEY  NOT NULL,
    nombre_mp NVARCHAR(500)  NOT NULL,
	precio_mp INT  NOT NULL,
	categoria_mp NVARCHAR(100),
	subcategoria_mp NVARCHAR(100),
    tamano_mp decimal(3,1),
	color_mp INT)
;
GO

-- Creación de la tabla 'producto'
-- Contiene información sobre los productos terminados
CREATE TABLE producto (
    id_p INT  NOT NULL PRIMARY KEY,
    nombre_p NVARCHAR(500)  NOT NULL,
	precio_p INT NOT NULL,
	produccion INT,
	categoria_p NVARCHAR(100),
	subcategoria_p NVARCHAR(100),
    tamano_p decimal(3,1) NOT NULL,
	color_p INT NOT NULL)
;
GO

-- Creación de la tabla 'venta'
-- Contiene información sobre las ventas realizadas
CREATE TABLE venta (
    id_cliente INT  NOT NULL,
    nombre_cliente NVARCHAR(500)  NOT NULL,
	email_cliente NVARCHAR(100)  NOT NULL,
	provincia_prov int  NOT NULL,
	canton_prov int,
	distrito_prov int,
	id_factura INT NOT NULL IDENTITY(1,1) CONSTRAINT ventas PRIMARY KEY, 
	unidades int NOT NULL,
	descuento int ,
	impuesto int NOT NULL,
	precio int NOT NULL)
;
go

-- Creación de la tabla 'detalle_venta'
-- Tabla de asociación entre ventas y productos, detallando las unidades vendidas
CREATE TABLE detalle_venta (
    id_detalle INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    id_factura INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario INT NOT NULL,
    CONSTRAINT fk_factura FOREIGN KEY (id_factura) REFERENCES venta(id_factura),
    CONSTRAINT fk_producto FOREIGN KEY (id_producto) REFERENCES producto(id_p)
);
GO

-- Inserción de datos de prueba en la tabla 'venta'
INSERT INTO venta (id_cliente, nombre_cliente, email_cliente, provincia_prov, canton_prov, distrito_prov, unidades, descuento, impuesto, precio)
VALUES
('0123456789', 'Juan Pérez', 'juan.perez@gmail.com', 1, 1, 1, 5, NULL, 13, 5000),
('0234567890', 'María López', 'maria.lopez@gmail.com', 2, 2, 2, 3, 10, 13, 3000),
('0345678901', 'Carlos Sánchez', 'carlos.sanchez@hotmail.com', 3, 3, 3, 2, NULL, 13, 1500),
('0456789012', 'Laura Ramírez', 'laura.ramirez@yahoo.com', 4, 4, 4, 1, NULL, 13, 1200),
('1567890123', 'Tech Solutions S.A.', 'ventas@techsolutions.com', 5, 5, 5, 10, 5, 13, 10000),
('2678901234', 'Industria Papelera S.A.', 'contacto@industriapapelera.com', 6, 6, 6, 8, 7, 13, 8500),
('3789012345', 'Asociación de Agricultores', 'info@asociacionagricultores.com', 7, 7, 7, 15, NULL, 13, 5000),
('4890123456', 'Comercializadora ABC', 'contacto@comercializadoraabc.com', 1, 1, 8, 12, 8, 13, 7800),
('5901234567', 'Distribuidora XYZ', 'ventas@distribuidoraxyz.com', 2, 2, 9, 20, NULL, 13, 6700),
('6012345678', 'Corporación Financiera', 'contacto@corporacionfinanciera.com', 3, 3, 1, 18, 5, 13, 9800),
('0789012345', 'Fernando Vargas', 'fernando.vargas@gmail.com', 4, 2, 2, 3, NULL, 13, 3400),
('0890123456', 'Ana Mora', 'ana.mora@hotmail.com', 5, 3, 3, 7, 10, 13, 4200),
('1245678901', 'Grupo Industrial', 'contacto@grupoindustrial.com', 6, 5, 4, 20, NULL, 13, 6500),
('2356789012', 'Servicios Logísticos S.A.', 'ventas@servicioslogisticos.com', 7, 6, 5, 15, NULL, 13, 7300),
('3467890123', 'Inversiones Globales', 'info@inversionesglobales.com', 1, 7, 6, 12, 5, 13, 5400),
('4578901234', 'Alimentos del Valle', 'ventas@alimentosvalle.com', 2, 8, 7, 9, 10, 13, 6200),
('5689012345', 'Tecno Importaciones S.A.', 'contacto@tecnoimportaciones.com', 3, 9, 8, 18, NULL, 13, 7900),
('6790123456', 'Distribuciones Costa Rica', 'ventas@distribucionescr.com', 4, 10, 9, 22, 7, 13, 8500),
('7890123456', 'Transportes del Sur', 'contacto@transportesdelsur.com', 5, 11, 10, 30, NULL, 13, 9200),
('8012345678', 'Automotriz Nacional', 'info@automotriznacional.com', 6, 12, 11, 25, 5, 13, 9800),
('0134567890', 'Esteban Jiménez', 'esteban.jimenez@gmail.com', 7, 13, 12, 4, NULL, 13, 3100),
('0245678901', 'Cristina Gómez', 'cristina.gomez@hotmail.com', 1, 1, 1, 6, NULL, 13, 2800),
('1356789012', 'Construc Soluciones S.A.', 'ventas@construcsoluciones.com', 2, 2, 2, 8, 10, 13, 5000),
('2467890123', 'Fabricaciones CR', 'contacto@fabricacionescr.com', 3, 3, 3, 14, 7, 13, 6200),
('3578901234', 'Servicios Profesionales S.A.', 'info@serviciosprofesionales.com', 4, 4, 4, 19, NULL, 13, 7300),
('4689012345', 'Tecnologías Avanzadas', 'ventas@tecnologiasavanzadas.com', 5, 5, 5, 17, 5, 13, 8000),
('5790123456', 'Comercial del Norte', 'contacto@comercialdelnorte.com', 6, 6, 6, 21, 5, 13, 8700),
('6801234567', 'Grupo Constructor', 'ventas@grupoconstructor.com', 7, 7, 7, 16, NULL, 13, 9400),
('7912345678', 'Empresas Unidas S.A.', 'info@empresasunidas.com', 1, 8, 8, 28, 10, 13, 10500),
('9023456789', 'Logística Internacional', 'ventas@logisticainternacional.com', 2, 9, 9, 32, 7, 13, 9900),
('0135678901', 'Luis Castro', 'luis.castro@gmail.com', 3, 10, 10, 3, NULL, 13, 3200),
('0246789012', 'Gloria Pacheco', 'gloria.pacheco@hotmail.com', 4, 11, 11, 4, 10, 13, 2700),
('1357890123', 'Distribuidora Eléctrica S.A.', 'contacto@distribuidoraelectrica.com', 5, 12, 12, 6, NULL, 13, 4300),
('2468901234', 'Servicios Médicos S.A.', 'info@serviciosmedicos.com', 6, 1, 1, 7, 5, 13, 5900),
('3579012345', 'Corporación Alimentaria', 'ventas@corporacionalimentaria.com', 7, 2, 2, 10, 7, 13, 8200),
('4680123456', 'Tecnologías Integradas', 'contacto@tecnologiasintegradas.com', 1, 3, 3, 20, 5, 13, 9800),
('5791234567', 'Transportes y Logística S.A.', 'info@transportesylogistica.com', 2, 4, 4, 22, NULL, 13, 9200),
('6802345678', 'Soluciones Empresariales S.A.', 'ventas@solucionesempresariales.com', 3, 5, 5, 24, 5, 13, 8500),
('7913456789', 'Importaciones del Caribe', 'info@importacionescaribe.com', 4, 6, 6, 25, NULL, 13, 9900),
('9024567890', 'Industrias del Pacífico', 'contacto@industriaspacifico.com', 5, 7, 7, 29, 7, 13, 10700),
('0136789012', 'Sofía Quesada', 'sofia.quesada@gmail.com', 6, 8, 8, 3, 10, 13, 3600),
('0247890123', 'Eduardo Torres', 'eduardo.torres@hotmail.com', 7, 9, 9, 4, NULL, 13, 2900),
('1358901234', 'Grupo Innovación S.A.', 'ventas@grupoinnovacion.com', 1, 10, 10, 12, 5, 13, 4500),
('2469012345', 'Red Logística S.A.', 'contacto@redlogistica.com', 2, 11, 11, 8, 7, 13, 5700),
('3570123456', 'Alimentos Naturales S.A.', 'info@alimentosnaturales.com', 3, 12, 12, 16, NULL, 13, 6300),
('4681234567', 'Servicios Empresariales S.A.', 'ventas@serviciosempresariales.com', 4, 1, 1, 18, 10, 13, 7100),
('5792345678', 'Distribuidora Central', 'contacto@distribuidoracentral.com', 5, 2, 2, 23, 5, 13, 8300);
GO

-- Inserción de datos de prueba en la tabla 'materia_prima'
INSERT INTO materia_prima (id_mp, nombre_mp, precio_mp, categoria_mp, subcategoria_mp, tamano_mp, color_mp)
VALUES
(1, 'Acero Inoxidable', 1500, 'Metales', 'Acero', 1.5, 2),
(2, 'Plástico Reciclado', 800, 'Polímeros', 'Plástico', 2.0, 4),
(3, 'Madera Pino', 1200, 'Madera', 'Pino', 3.0, 6),
(4, 'Tela de Algodón', 500, 'Textiles', 'Algodón', 1.2, 9),
(5, 'Aluminio', 1300, 'Metales', 'Aluminio', 2.0, 1),
(6, 'Cobre', 2200, 'Metales', 'Cobre', 1.0, 3),
(7, 'Hierro Forjado', 900, 'Metales', 'Hierro', 1.8, 5),
(8, 'Vidrio Templado', 1100, 'Vidrio', 'Templado', 2.5, 8),
(9, 'Poliéster', 700, 'Textiles', 'Poliéster', 1.0, 7),
(10, 'Cartón Reciclado', 400, 'Papel y Cartón', 'Cartón', 2.2, 12),
(11, 'Cuero Sintético', 600, 'Textiles', 'Cuero', 1.5, 10),
(12, 'Acero Galvanizado', 1800, 'Metales', 'Acero', 1.3, 2),
(13, 'Fibra de Vidrio', 2000, 'Polímeros', 'Vidrio', 2.5, 8),
(14, 'Hilo de Algodón', 300, 'Textiles', 'Algodón', 0.5, 9),
(15, 'Madera Roble', 1600, 'Madera', 'Roble', 3.5, 6),
(16, 'Caucho Natural', 900, 'Polímeros', 'Caucho', 1.7, 5),
(17, 'Arena Silícea', 1000, 'Minerales', 'Arena', 2.3, 15),
(18, 'Polietileno', 850, 'Polímeros', 'Plástico', 1.5, 4),
(19, 'Madera MDF', 1100, 'Madera', 'MDF', 2.0, 6),
(20, 'Lana Virgen', 1200, 'Textiles', 'Lana', 1.2, 11),
(21, 'Hilo de Nylon', 400, 'Textiles', 'Nylon', 0.7, 9),
(22, 'Papel Reciclado', 300, 'Papel y Cartón', 'Papel', 0.5, 12),
(23, 'Tela Seda', 1400, 'Textiles', 'Seda', 1.4, 2),
(24, 'Hilo de Poliéster', 600, 'Textiles', 'Poliéster', 0.8, 7),
(25, 'Cartón Corrugado', 450, 'Papel y Cartón', 'Cartón', 2.0, 12),
(26, 'Plástico Biodegradable', 900, 'Polímeros', 'Plástico', 1.5, 4),
(27, 'Lino Natural', 1300, 'Textiles', 'Lino', 1.4, 13),
(28, 'Poliuretano', 700, 'Polímeros', 'Plástico', 2.0, 14),
(29, 'Madera Cedro', 1800, 'Madera', 'Cedro', 3.0, 6),
(30, 'Látex Natural', 1000, 'Polímeros', 'Látex', 1.8, 16),
(31, 'Fibra de Carbón', 2500, 'Polímeros', 'Carbón', 1.2, 7),
(32, 'Silicona', 900, 'Polímeros', 'Silicona', 2.0, 17),
(33, 'Plástico ABS', 750, 'Polímeros', 'Plástico', 1.0, 4),
(34, 'Teflón', 2000, 'Polímeros', 'Fluorado', 2.2, 19),
(35, 'Hilo de Lino', 550, 'Textiles', 'Lino', 1.0, 13),
(36, 'Resina Epoxi', 1500, 'Polímeros', 'Resina', 2.0, 20),
(37, 'Madera Balsa', 950, 'Madera', 'Balsa', 1.5, 6),
(38, 'Papel Kraft', 300, 'Papel y Cartón', 'Papel', 1.0, 12),
(39, 'Alambre de Acero', 1600, 'Metales', 'Acero', 1.5, 2),
(40, 'Vinilo Sintético', 500, 'Textiles', 'Vinilo', 2.0, 9),
(41, 'Acetato de Etilo', 1200, 'Polímeros', 'Solvente', 2.5, 21),
(42, 'Hierro', 2300, 'Metales', 'Hierro', 1.7, 22),
(43, 'Cinta Adhesiva', 400, 'Polímeros', 'Adhesivos', 0.5, 4),
(44, 'Alambre de Cobre', 1800, 'Metales', 'Cobre', 2.5, 3),
(45, 'Grafito', 1500, 'Minerales', 'Grafito', 1.0, 23),
(46, 'Madera Caoba', 2000, 'Madera', 'Caoba', 3.0, 6),
(47, 'Resina Poliester', 1300, 'Polímeros', 'Resina', 2.0, 24),
(48, 'Madera Teca', 1700, 'Madera', 'Teca', 3.5, 6),
(49, 'Papel de Seda', 500, 'Papel y Cartón', 'Papel', 0.2, 12),
(50, 'Fibra de Bambú', 1100, 'Textiles', 'Bambú', 1.0, 25);
GO

-- Inserción de datos de prueba en la tabla 'producto'
INSERT INTO producto (id_p, nombre_p, precio_p, produccion, categoria_p, subcategoria_p, tamano_p, color_p)
VALUES
(1, 'Mesa de Madera Roble', 20000, 100, 'Muebles', 'Mesas', 1.8, 6),
(2, 'Silla de Madera Pino', 8000, 150, 'Muebles', 'Sillas', 1.0, 6),
(3, 'Estantería de Madera Pino', 22000, 80, 'Muebles', 'Estanterías', 2.5, 6),
(4, 'Cama de Madera Teca', 30000, 40, 'Muebles', 'Camas', 2.0, 6),
(5, 'Gabinete de Madera Pino', 18000, 60, 'Muebles', 'Gabinetes', 1.5, 6),
(6, 'Escritorio de Madera Roble', 25000, 70, 'Muebles', 'Escritorios', 1.6, 6),
(7, 'Puerta de Madera Caoba', 40000, 30, 'Construcción', 'Puertas', 2.0, 6),
(8, 'Mesa de Noche de Madera', 12000, 90, 'Muebles', 'Mesas de Noche', 1.0, 6),
(9, 'Banco de Madera', 7000, 110, 'Muebles', 'Bancos', 1.2, 6),
(10, 'Perchero de Madera', 5000, 200, 'Decoración', 'Percheros', 0.8, 6),
(11, 'Estante de Madera Teca', 15000, 60, 'Muebles', 'Estantes', 1.5, 6),
(12, 'Silla de Madera Caoba', 9000, 100, 'Muebles', 'Sillas', 1.0, 6),
(13, 'Mesa de Centro de Madera', 18000, 80, 'Muebles', 'Mesas de Centro', 1.2, 6),
(14, 'Repisa de Madera Pino', 7000, 150, 'Decoración', 'Repisas', 0.7, 6),
(15, 'Tocador de Madera MDF', 22000, 50, 'Muebles', 'Tocadores', 1.8, 6),
(16, 'Marco de Madera', 3000, 500, 'Decoración', 'Marcos', 0.5, 6),
(17, 'Cama Doble de Madera', 35000, 35, 'Muebles', 'Camas', 2.0, 6),
(18, 'Cajonera de Madera Cedro', 18000, 70, 'Muebles', 'Cajoneras', 1.5, 6),
(19, 'Silla Alta de Madera', 6000, 120, 'Muebles', 'Sillas', 1.0, 6),
(20, 'Mesa Plegable de Madera', 15000, 90, 'Muebles', 'Mesas', 1.2, 6),
(21, 'Taburete de Madera', 5000, 130, 'Muebles', 'Taburetes', 0.8, 6),
(22, 'Barra de Madera', 25000, 40, 'Muebles', 'Barras', 2.2, 6),
(23, 'Mesa de Jardín de Madera', 20000, 80, 'Muebles', 'Mesas de Jardín', 1.5, 6),
(24, 'Cabecero de Cama de Madera', 12000, 100, 'Muebles', 'Cabeceros', 1.8, 6),
(25, 'Espejo con Marco de Madera', 9000, 150, 'Decoración', 'Espejos', 0.6, 6),
(26, 'Panel de Madera Decorativo', 13000, 120, 'Decoración', 'Paneles', 1.0, 6),
(27, 'Escritorio de Madera Teca', 28000, 50, 'Muebles', 'Escritorios', 1.6, 6),
(28, 'Mesa Redonda de Madera', 22000, 70, 'Muebles', 'Mesas', 1.3, 6),
(29, 'Puerta de Madera Cedro', 18000, 40, 'Construcción', 'Puertas', 2.1, 6),
(30, 'Vitrina de Madera Roble', 26000, 60, 'Muebles', 'Vitrinas', 1.8, 6),
(31, 'Panel de Madera Acústico', 14000, 150, 'Decoración', 'Paneles', 1.0, 6),
(32, 'Banco de Madera Roble', 7500, 100, 'Muebles', 'Bancos', 1.2, 6),
(33, 'Estantería de Madera Teca', 24000, 80, 'Muebles', 'Estanterías', 1.8, 6),
(34, 'Armario de Madera Cedro', 35000, 50, 'Muebles', 'Armarios', 2.0, 6),
(35, 'Silla Reclinable de Madera', 12000, 90, 'Muebles', 'Sillas', 1.1, 6),
(36, 'Mesa Extensible de Madera', 27000, 60, 'Muebles', 'Mesas', 1.4, 6),
(37, 'Cajón de Madera Balsa', 8000, 120, 'Muebles', 'Cajones', 1.0, 6),
(38, 'Mesa Alta de Madera', 17000, 85, 'Muebles', 'Mesas', 1.3, 6),
(39, 'Cama Infantil de Madera', 22000, 50, 'Muebles', 'Camas', 1.5, 6),
(40, 'Taburete Alto de Madera', 6000, 150, 'Muebles', 'Taburetes', 1.0, 6),
(41, 'Panel de Madera de Pared', 15000, 200, 'Decoración', 'Paneles', 1.0, 6),
(42, 'Mesa de Picnic de Madera', 23000, 50, 'Muebles', 'Mesas de Picnic', 1.5, 6),
(43, 'Silla de Exterior de Madera', 12000, 90, 'Muebles', 'Sillas de Exterior', 1.0, 6),
(44, 'Perchero de Madera Teca', 7000, 140, 'Decoración', 'Percheros', 1.0, 6),
(45, 'Banco Largo de Madera', 15000, 70, 'Muebles', 'Bancos Largos', 2.0, 6),
(46, 'Cama Matrimonial de Madera', 30000, 40, 'Muebles', 'Camas Matrimoniales', 2.5, 6),
(47, 'Mesa Auxiliar de Madera', 9000, 100, 'Muebles', 'Mesas Auxiliares', 1.0, 6),
(48, 'Cajonera de Madera Teca', 16000, 60, 'Muebles', 'Cajoneras', 1.4, 6),
(49, 'Silla Plegable de Madera', 7000, 150, 'Muebles', 'Sillas Plegables', 1.0, 6),
(50, 'Librero de Madera Cedro', 22000, 50, 'Muebles', 'Libreros', 1.8, 6);
GO

-- Inserción de datos de prueba en la tabla 'detalle_venta'
INSERT INTO detalle_venta (id_factura, id_producto, cantidad, precio_unitario)
VALUES
(1, 1, 2, 20000),
(1, 2, 1, 8000),
(2, 3, 1, 22000),
(2, 5, 1, 18000),
(3, 4, 1, 30000),
(3, 6, 2, 25000),
(4, 7, 1, 40000),
(4, 8, 1, 12000),
(5, 9, 3, 7000),
(5, 10, 5, 5000),
(6, 11, 1, 15000),
(6, 12, 2, 9000),
(7, 13, 1, 18000),
(7, 14, 3, 7000),
(8, 15, 1, 22000),
(8, 16, 10, 3000),
(9, 17, 2, 1000),
(9, 18, 1, 18000),
(10, 19, 1, 1100),
(10, 20, 2, 15000),
(11, 21, 4, 6000),
(11, 22, 2, 25000),
(12, 23, 1, 1400),
(12, 24, 5, 5000),
(13, 25, 3, 9000),
(13, 26, 2, 13000),
(14, 27, 1, 28000),
(14, 28, 1, 22000),
(15, 29, 2, 18000),
(15, 30, 1, 26000),
(16, 31, 4, 14000),
(16, 32, 3, 9000),
(17, 33, 2, 24000),
(17, 34, 1, 35000),
(18, 35, 1, 12000),
(18, 36, 1, 27000),
(19, 37, 2, 8000),
(19, 38, 1, 17000),
(20, 39, 1, 22000),
(20, 40, 2, 6000),
(21, 41, 3, 15000),
(21, 42, 1, 2300),
(22, 43, 5, 400),
(22, 44, 2, 1800),
(23, 45, 6, 1500),
(23, 1, 2, 20000),
(24, 2, 1, 8000),
(24, 3, 1, 22000),
(25, 4, 1, 30000),
(25, 5, 1, 18000),
(26, 6, 1, 25000),
(26, 7, 2, 40000),
(27, 8, 1, 12000),
(27, 9, 3, 7000),
(28, 10, 2, 5000),
(28, 11, 1, 15000),
(29, 12, 4, 9000),
(29, 13, 1, 18000),
(30, 14, 3, 7000),
(30, 15, 1, 22000),
(31, 16, 2, 3000),
(31, 17, 1, 1000),
(32, 18, 1, 18000),
(32, 19, 2, 1100),
(33, 20, 1, 15000),
(33, 21, 3, 6000),
(34, 22, 2, 25000),
(34, 23, 1, 1400),
(35, 24, 4, 5000),
(35, 25, 3, 9000),
(36, 26, 1, 13000),
(36, 27, 2, 28000),
(37, 28, 1, 22000),
(37, 29, 2, 18000),
(38, 30, 1, 26000),
(38, 31, 3, 14000),
(39, 32, 2, 9000),
(39, 33, 1, 24000),
(40, 34, 1, 35000),
(40, 35, 1, 12000);
GO

--Consultas
--Total de Ventas por Cliente:
SELECT v.id_cliente, v.nombre_cliente, SUM(d.cantidad * d.precio_unitario) AS total_ventas
FROM venta v
JOIN detalle_venta d ON v.id_factura = d.id_factura
GROUP BY v.id_cliente, v.nombre_cliente
ORDER BY total_ventas DESC;

--Productos Más Vendidos:
SELECT p.nombre_p, SUM(d.cantidad) AS total_cantidad_vendida
FROM producto p
JOIN detalle_venta d ON p.id_p = d.id_producto
GROUP BY p.nombre_p
ORDER BY total_cantidad_vendida DESC;

--Detalle de Ventas por Factura:
SELECT v.id_factura, v.id_cliente, p.nombre_p, d.cantidad, d.precio_unitario
FROM detalle_venta d
JOIN venta v ON d.id_factura = v.id_factura
JOIN producto p ON d.id_producto = p.id_p
ORDER BY v.id_factura, p.nombre_p;

--Productos Ordenados por Nombre:
SELECT id_p, nombre_p, precio_p
FROM producto
ORDER BY nombre_p;

--Ventas por Provincia:
SELECT v.provincia_prov, SUM(d.cantidad * d.precio_unitario) AS total_ventas
FROM venta v
JOIN detalle_venta d ON v.id_factura = d.id_factura
GROUP BY v.provincia_prov
ORDER BY total_ventas DESC;


--revisar emparejamiento
--Emparejamiento de Productos con Materia Prima:
SELECT p.nombre_p, mp.nombre_mp,p.id_p , mp.id_mp
FROM producto p
JOIN materia_prima mp ON p.id_p = mp.id_mp
WHERE mp.categoria_mp = 'Metales';

--Listado de Materia Prima por Categoría y Subcategoría:
SELECT id_mp, nombre_mp, precio_mp, categoria_mp, subcategoria_mp, tamano_mp, color_mp
FROM materia_prima
ORDER BY categoria_mp, subcategoria_mp;

--Productos Ordenados por Producción:
SELECT nombre_p, produccion, categoria_p
FROM producto
ORDER BY produccion ASC;
-- Traerá todas las columnas de las tres tablas
SELECT*
FROM detalle_venta d
JOIN venta v ON d.id_factura = v.id_factura
JOIN producto p ON d.id_producto = p.id_p
