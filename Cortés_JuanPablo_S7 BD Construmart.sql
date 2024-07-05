--Crear base de datos ejercicio semana 6
CREATE DATABASE Construmart

--Usa la base de datos creada
USE Construmart

--Crear tabla Empleados
CREATE TABLE Empleados (
Id_empleado numeric unique not null,
Nombre VARCHAR(20),
Apellido VARCHAR(20),
Edad INT not null,
Sucursal numeric,
Cargo VARCHAR(20),
Fecha_ingreso DATE,
Jefatura INT,
Base_Ventas INT,
Monto_Ventas INT
)

--Crear tabla Oficinas
CREATE TABLE Oficinas(
Sucursal NUMERIC UNIQUE NOT NULL,
Direccion VARCHAR(20),
Ciudad VARCHAR(20) not null,
Region VARCHAR(30) not null,
Jefatura INT,
Meta INT,
Monto_ventasOF INT
)
drop table Oficinas

--Crear tabla Clientes
CREATE TABLE Clientes (
Id_cliente NUMERIC UNIQUE not null,
Nombre_Cli VARCHAR(30) not null,
Empleado_id numeric not null,
Credito_Cli INT not null
)

--Crear tabla Productos
CREATE TABLE Productos(
Id_fabrica VARCHAR(3) not null,
Id_producto VARCHAR(5) not null,
Nombre_prod VARCHAR(20) not null,
Precio_prod INT not null,
Stock INT not null
)

--Crear tabla Pedidos
CREATE TABLE Pedidos(
Id_pedido NUMERIC UNIQUE not null,
Num_pedido INT not null,
Fecha_pedido DATE not null,
Idcliente numeric not null,
Id_vendedor INT not null,
Id_fabrica VARCHAR(3) not null,
Cod_producto VARCHAR(5) not null,
Cantidad INT not null,
valor INT not null
)

--Creacion de claves primarias
ALTER TABLE Empleados
ADD CONSTRAINT PK_empleado PRIMARY KEY (Id_empleado)

ALTER TABLE Oficinas
ADD CONSTRAINT PK_sucursal PRIMARY KEY (Sucursal)

ALTER TABLE Clientes
ADD CONSTRAINT PK_cliente PRIMARY KEY (Id_cliente)

ALTER TABLE Productos
ADD CONSTRAINT PK_productos PRIMARY KEY (Id_fabrica, Id_producto)

ALTER TABLE Pedidos
ADD CONSTRAINT PK_pedidos PRIMARY KEY (Id_pedido)


--Creacion de llaves foraneas
ALTER TABLE Empleados
ADD FOREIGN KEY (Sucursal) REFERENCES Oficinas (Sucursal)

ALTER TABLE Clientes
ADD FOREIGN KEY (Empleado_id) REFERENCES Empleados (Id_empleado)

ALTER TABLE Pedidos
ADD FOREIGN KEY (Idcliente) REFERENCES Clientes (Id_cliente)

ALTER TABLE Pedidos
ADD CONSTRAINT FK_Pedidos_Productos FOREIGN KEY (Id_fabrica, Cod_producto) REFERENCES Productos(Id_fabrica, Id_producto)

--Insertar datos a la tabla Productos
INSERT INTO Productos (Id_fabrica, Id_producto, Nombre_prod, Precio_prod, Stock)
VALUES ('asd', '10014', 'Cenefa', 1500, 25),
('asd', '20014', 'Codos', 450, 100),
('asd', '30014', 'Martillo', 3800, 50),
('asd', '40014', 'Taladro', 12500, 35),
('asd', '1014d', 'Serrucho', 4250, 55),
('asd', '1014s', 'Cincel', 3990, 20),
('asd', '1014p', 'Brocha', 890, 65),
('bvc', '30014', 'Chapas', 8990, 20),
('bvc', '89410', 'Lija', 150, 60),
('bvc', '72416', 'Broca', 1900, 76),
('fsa', '211', 'Balde', 3500, 25),
('fsa', '411', 'balde', 6990, 30),
('iut', '377g', 'Termostato', 2550, 10),
('iut', '577g', 'Termostato 2', 3680, 8),
('iut', '977g', 'Termostato 3', 2650, 12),
('iut', '788m', 'Caja aislante', 1990, 5),
('iut', '788n', 'Ganchos', 690, 0),
('iut', '788l', 'Manija', 2500, 12),
('qws', '74tf', 'Perno', 990, 98),
('qws', '84tf', 'Regla', 1250, 24),
('qws', '84ctf', 'Esmeril', 450, 16),
('rtd', '44s2d', 'Silicona', 990, 36),
('rtd', '44s2n', 'Timbre', 2500, 21),
('rtd', '44a2p', 'Lampara', 16990, 5),
('rtd', '45h2u', 'Cemento', 4500, 60)

--Insertar datos a la tabla Oficinas
INSERT INTO Oficinas (Sucursal, Direccion, Ciudad, Region, Jefatura, Meta, Monto_ventasOF)
VALUES (22, 'Francisco Yussef 12', 'Vi a del mar', 'Valparaiso', 116, 1676000, 1345600),
(24, 'Av Marina 100', 'Arica', 'Arica y Parinacota', 114, 1600000, 1765000),
(26, 'Condell 1190', 'Concepcion', 'Biobio', 115, 2350000, 863000),
(42, 'Yungay', 'Buin', 'Metropolitana de Santiago', 118, 1780000, 2356000),
(44, 'Victoria 380', 'Antofagasta', 'Antofagasta', 118, 3000000, 1860000),
(46, 'Pedro Montt 94', 'Melipilla', 'Metropolitano de Santiago', 118, null, null),
(48, 'Canciani 368', 'Melipilla', 'Metropolitano de Santiago', 118, 1325000, 1150000),
(52, 'Av Peru 800', 'Parral', 'Maule', null, null, null),
(56, 'Los Lirios 1200', 'Vi a del mar', 'Valparaiso', null, 2900000, 0)

--Se agrega un nuevo dato para la tabla Oficinas
INSERT INTO Oficinas (Sucursal, Direccion, Ciudad, Region, Jefatura, Meta, Monto_ventasOF)
VALUES (130, null, 'Melipilla', 'Metropolitana de Santiago', null, 1000000, null)

--Insertar datos a la tabla Empleados
INSERT INTO Empleados (Id_empleado, Nombre, Apellido, Edad, Sucursal, Cargo, Fecha_ingreso, Jefatura, Base_Ventas, Monto_Ventas)
VALUES (111, 'Andres', 'Veliz', 38, 24, 'distribuidor', '2009-12-25', 114, 400000, 405000),
(112, 'Arturo', 'Jaramillo', 42, 42, 'distribuidor', '2015-03-16', 118, 450000, 574000),
(113, 'Jorge', 'Ramirez', 29, 24, 'distribuidor', '2015-03-30', 114, 375000, 243000),
(114, 'Javier', 'Gomez', 47, 24, 'supervisor', '2016-10-12', 116, 300000, 468000),
(115, 'Valentina', 'Perez', 33, 26, 'distribuidor', '2017-04-26', 114, 450000, 286000),
(116, 'Leonel', 'Alvarez', 41, 22, 'Jefatura general', '2018-02-24', null, 375000, 300000),
(117, 'Juan', 'Gallardo', 31, 44, 'distribuidor', '2019-09-12', 118, 400000, 386000),
(118, 'Antonia', 'Benites', 37, 42, 'supervisor', '2019-09-12', 116, 450000, 461000),
(119, 'Macia', 'Solis', 62, 22, 'distribuidor', '2019-10-30', 116, 400000, 492000),
(120, 'Joel', 'Veloso', 49, null, 'distribuidor', '2010-11-01', 114, null, 176000)

--Se agrega nuevo dato para la tabla Empleados
INSERT INTO Empleados (Id_empleado, Nombre, Apellido, Edad, Sucursal, Cargo, Fecha_ingreso, Jefatura, Base_Ventas, Monto_Ventas)
VALUES (130, 'Mariano', 'Robles', 28, 44, 'distribuidor', '2020-02-22', 118, 500000, 475000)

--Insertar datos a la tabla Clientes
INSERT INTO Clientes (Id_cliente, Nombre_Cli, Empleado_id, Credito_Cli)
VALUES (1012, 'Lucas Gomez', 116, 167000),
(2012, 'Andres Recabarren', 111, 167000),
(3012, 'Jose Lopez', 115, 170000),
(5012, 'Ambrosio Caroca', 111, 135000),
(6012, 'Jaime Solis', 112, 167000),
(7012, 'Jacinto Linares', 120, 123000),
(8012, 'Javier Arce', 119, 165000),
(9012, 'Angel Jofre', 113, 117000),
(1112, 'Carolina Gonzalez', 113, 170000),
(2112, 'Miriam Soto', 118, 170000),
(3112, 'Leonardo Morales', 114, 124000),
(4112, 'Camilo Benitez', 112, 124000),
(5112, 'Valeria Marquez', 111, 135000),
(7112, 'Carmen Toro', 116, 146000),
(1812, 'Jeremias Alvarez', 118, 156000),
(9112, 'Sandra Brito', 119, 117000),
(2021, 'Josue Mena', 112, 170000),
(2121, 'Victoria Ramos', 113, 135000),
(2221, 'Jaime Montt', 115, 117000),
(2321, 'Julian Linares', 112, 160000),
(2421, 'Jacinto Bustos', 117, 160000)

--Insertar datos a la tabla Pedidos
INSERT INTO Pedidos (Id_pedido, Num_pedido, Fecha_pedido, Idcliente, Id_vendedor, Id_fabrica, Cod_producto, Cantidad, valor)
VALUES (1, 220036, '2019-03-15', 7012, 120, 'asd', '1014p', 1, 1500),
(2, 220036, '2019-03-15', 7112, 116, 'rtd', '44s2n', 3, 7500),
(3, 222963, '2018-10-07', 3012, 115, 'asd', '40014', 6, 75000),
(4, 222968, '2018-11-05', 2012, 111, 'asd', '40014', 7, 87500),
(5, 222975, '2019-04-01', 1112, 113, 'rtd', '44s2d', 3, 2970),
(6, 222979, '2018-07-06', 4112, 118, 'asd', '1014p', 4, 3560),
(7, 222983, '2019-03-03', 3012, 115, 'asd', '40014', 2, 25000),
(8, 222987, '2018-11-12', 3012, 115, 'asd', '1014p', 1, 890),
(9, 222989, '2019-07-04', 1012, 116, 'fsa', '411', 10, 69900),
(10, 222992, '2018-06-03', 1812, 118, 'asd', '20014', 8, 3600),
(11, 222993, '2018-06-01', 6012, 112, 'rtd', '45h2u', 4, 18000),
(12, 222997, '2019-07-02', 2421, 117, 'bvc', '30014', 12, 107880),
(13, 223003, '2019-08-03', 8012, 119, 'iut', '977g', 5, 13250),
(14, 223007, '2018-10-05', 2121, 118, 'iut', '377g', 3, 7650),
(15, 223012, '2018-11-06', 2121, 115, 'asd', '30014', 3, 11400),
(16, 223013, '2019-10-01', 1812, 118, 'bvc', '30014', 1, 3800),
(17, 223024, '2019-06-02', 4112, 118, 'qws', '74tf', 2, 2500),
(18, 223027, '2017-11-11', 3012, 115, 'asd', '20014', 2, 900),
(19, 223034, '2017-09-01', 7012, 120, 'rtd', '45h2u', 6, 27000),
(20, 223042, '2017-12-06', 3112, 111, 'rtd', '44a2p', 4, 67960),
(21, 223045, '2018-07-03', 2221, 118, 'rtd', '44a2p', 1, 16900),
(22, 223048, '2018-06-15', 2021, 112, 'iut', '977g', 12, 31800),
(23, 223049, '2018-02-01', 1812, 118, 'qws', '74tf', 6, 5940),
(24, 223051, '2019-07-13', 1812, 118, 'qws', '74tf', 3, 2970),
(25, 223055, '2018-02-02', 8012, 111, 'asd', '1014d', 2, 8500),
(26, 223057, '2019-12-11', 1112, 113, 'asd', '1014d', 1, 4250),
(27, 223058, '2017-04-15', 8012, 119, 'fsa', '211', 4, 14000),
(28, 223062, '2017-08-01', 2421, 117, 'bvc', '30014', 5, 19000),
(29, 223065, '2018-07-03', 5012, 112, 'qws', '74tf', 8, 7920),
(30, 223069, '2018-10-01', 9112, 117, 'iut', '377g', 10, 25500)

