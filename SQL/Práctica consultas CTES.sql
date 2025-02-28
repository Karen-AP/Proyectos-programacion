CREATE TABLE Clientes (
cliente_id INT PRIMARY KEY,
nombre VARCHAR(100),
edad INT,
genero VARCHAR(10),
ciudad VARCHAR(50)
);
CREATE TABLE Encuestas (
encuesta_id INT PRIMARY KEY,
cliente_id INT,
fecha DATE,
satisfaccion INT,
FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);
CREATE TABLE Productos (
producto_id INT PRIMARY KEY,
nombre_producto VARCHAR(100),
categoria VARCHAR(50),
precio DECIMAL(10, 2)
);
CREATE TABLE Compras (
compra_id INT PRIMARY KEY,
cliente_id INT,
producto_id INT,
fecha_compra DATE,
cantidad INT,
total DECIMAL(10, 2),
FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);
-- Inserción de datos
INSERT INTO Clientes (cliente_id, nombre, edad, genero, ciudad)
VALUES (1, 'Juan Pérez', 28, 'M', 'Madrid'),
(2, 'Ana García', 34, 'F', 'Barcelona'),
(3, 'Luis Fernández', 22, 'M', 'Sevilla');
INSERT INTO Encuestas (encuesta_id, cliente_id, fecha, satisfaccion)
VALUES (1, 1, '2024-01-15', 8),
(2, 2, '2024-01-18', 7),
(3, 3, '2024-01-20', 9);
INSERT INTO Productos (producto_id, nombre_producto, categoria, precio)
VALUES (1, 'Laptop', 'Tecnología', 799.99),
(2, 'Teléfono', 'Tecnología', 499.99),
(3, 'Televisor', 'Electrónica', 299.99);
INSERT INTO Compras (compra_id, cliente_id, producto_id, fecha_compra, cantidad,
total)
VALUES (1, 1, 1, '2024-01-10', 1, 799.99),
(2, 2, 2, '2024-01-12', 2, 999.98),
(3, 3, 3, '2024-01-15', 1, 299.99);
/*INNER JOIN
muestre los nombres de los clientes, la fecha de la encuesta y el nivel
de satisfacción, combinando las tablas Clientes y Encuestas*/
SELECT c.nombre,e.fecha,e.satisfaccion
FROM Clientes c
INNER JOIN Encuestas e ON c.cliente_id=e.cliente_id;
/* CASE
lista de todos los clientes y si realizaron una encuesta o no, 
utilizando un LEFT JOIN entre Clientes y Encuestas.*/
SELECT c.nombre,c.cliente_id,
	CASE
		WHEN e.cliente_id IS NOT NULL THEN 'Encuestado'
		ELSE 'No encuestado'
	END AS Encuestado
FROM Clientes c
LEFT JOIN Encuestas e ON c.cliente_id=e.cliente_id;
/*combine Clientes, Compras y Productos para obtener el nombre  el cliente,
el producto que compró, la cantidad y el  precio total de la compra. */
SELECT c.nombre,p.nombre_producto,co.cantidad,co.total
FROM Clientes c
JOIN Compras co ON co.cliente_id=c.cliente_id
JOIN Productos p ON p.producto_id=co.producto_id;
/* Having
calcular la cantidad total de dinero gastada por cada cliente y luego
seleccione solo a los que han gastado más de 500 en total */
SELECT c.nombre, sum(co.total) AS Total
FROM Compras co
JOIN Clientes c on c.cliente_id=co.cliente_id
GROUP BY c.nombre
HAVING sum(co.total) > 500;
/*AVG()
calcular la edad promedio de los clientes que han comprado cada
tipo de producto, y muestra los resultados */
SELECT AVG(c.edad) AS Edad_promedio, p.categoria
FROM Compras co
JOIN Clientes c ON c.cliente_id=co.cliente_id
JOIN Productos p ON co.producto_id=p.producto_id
GROUP BY p.categoria;
/*AVG()
calcular el nivel promedio de satisfacción de todos los clientes. */
SELECT AVG(e.satisfaccion) AS Promedio_satisfaccion
FROM Encuestas e
/*COUNT()
determinar cuántos clientes han realizado compras */
SELECT COUNT(c.cliente_id) As Cantidad_clientes
FROM Compras c
/*ROUND()
redondear los valores de satisfacción promedio a 2
decimales y agrúpelos por ciudad */
SELECT c.ciudad,
		ROUND(AVG(e.satisfaccion),2) AS Promedio_satisfaccion
FROM Encuestas e
JOIN Clientes c ON c.cliente_id=e.cliente_id
GROUP BY c.ciudad
/*calcular el gasto total de cada cliente y luego combine esta información con la 
tabla de encuestas para mostrar el nombre del cliente, su nivel de satisfacción promedio
y su gasto total, pero solo para aquellos que han gastado más de 300 y cuya satisfacción es mayor a 7*/
SELECT c.nombre, sum(e.satisfaccion) AS Satisfaccion, sum(co.total) AS Total
FROM Clientes c
JOIN Compras co ON co.cliente_id=c.cliente_id
JOIN Encuestas e ON e.cliente_id=c.cliente_id
JOIN Productos p ON p.producto_id=co.producto_id
GROUP BY c.nombre
HAVING sum(co.total) > 300 AND sum(e.satisfaccion) > 7;