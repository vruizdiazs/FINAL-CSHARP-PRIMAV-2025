CREATE DATABASE EXAMEN_VANIARUISDIAZSOLIS;
GO
USE EXAMEN_VANIARUISDIAZSOLIS;

CREATE TABLE clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre      NVARCHAR(100) NOT NULL,
    apellido    NVARCHAR(100) NOT NULL,
    direccion   NVARCHAR(200),
    telefono    NVARCHAR(50)
);

CREATE TABLE productos (
    cod_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre       NVARCHAR(100) NOT NULL,
    precio       DECIMAL(10,2) NOT NULL,
    descripcion  NVARCHAR(200)
);

CREATE TABLE proveedores (
    id_proveedor INT IDENTITY(1,1) PRIMARY KEY,
    nombre       NVARCHAR(100) NOT NULL,
    apellido     NVARCHAR(100) NOT NULL,
    direccion    NVARCHAR(200),
    telefono     NVARCHAR(50)
);

INSERT INTO clientes (nombre, apellido, direccion, telefono) VALUES
('Ana', 'Lopez', 'Av. Siempre Viva 123', '555-111'),
('Bruno', 'Perez', 'Calle 9 #45', '555-222'),
('Caro', 'Mora', 'Ruta 7 km 2', '555-333');

INSERT INTO productos (nombre, precio, descripcion) VALUES
('Teclado', 25.50, 'Teclado mecánico'),
('Mouse', 15.00, 'Mouse óptico'),
('Monitor', 180.00, 'Monitor 24"');

INSERT INTO proveedores (nombre, apellido, direccion, telefono) VALUES
('Luis', 'Rios', 'Av. Central 10', '555-444'),
('Marta', 'Silva', 'Calle 3 #12', '555-555'),
('Nora', 'Diaz', 'Boulevard 8', '555-666');
