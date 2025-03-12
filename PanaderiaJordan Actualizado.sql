-- Crear una Base de Datos Panaddería y PAstelería Jordan
-- La Secta del Profe Hugo
-- 10/03/2025

-- Eliminar la base de datos si existe
USE master;
GO
ALTER DATABASE BDJordan SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE IF EXISTS BDJordan;
GO

-- 2. Crear la base de datos
CREATE DATABASE BDJordan;
GO

USE BDJordan;
GO

-- Eliminar las tablas si existen
DROP TABLE IF EXISTS DetalleComprobante, Comprobante, Cliente, Empleado, Produccion, Proveedor, Producto, Almacen, Categoria;
GO

-- 3. Crear las tablas
CREATE TABLE Cliente (
    codigoCliente VARCHAR(10) PRIMARY KEY,
    DNICliente VARCHAR(8) UNIQUE NOT NULL,
    nombreCliente VARCHAR(50) NOT NULL,
    paternoCliente VARCHAR(50) NOT NULL,
    maternoCliente VARCHAR(50) NOT NULL,
    direccionCliente VARCHAR(100),
    celularCliente VARCHAR(9),
    tipoEmpleado VARCHAR(30)
);

CREATE TABLE Empleado (
    codigoEmpleado VARCHAR(10) PRIMARY KEY,
    nombresEmpleado VARCHAR(50) NOT NULL,
    paternoEmpleado VARCHAR(50) NOT NULL,
    maternoEmpleado VARCHAR(50) NOT NULL,
    tipoEmpleado VARCHAR(30),
    cargoEmpleado VARCHAR(50),
    telefonoEmpleado VARCHAR(9),
    DNIEmpleado VARCHAR(8) UNIQUE NOT NULL
);

CREATE TABLE Comprobante (
    idComprobante VARCHAR(10) PRIMARY KEY,
    fechaHoraComprobante DATETIME NOT NULL,
    nombreComprobante VARCHAR(50) NOT NULL,
    numeroComprobante INT NOT NULL,
    direccionComprobante VARCHAR(100),
    RUCComprobante VARCHAR(11),
    tipoComprobante VARCHAR(20),
    totalComprobante DECIMAL(10,2),
    idCliente VARCHAR(10) FOREIGN KEY REFERENCES Cliente(codigoCliente),
    idEmpleado VARCHAR(10) FOREIGN KEY REFERENCES Empleado(codigoEmpleado)
);

CREATE TABLE DetalleComprobante (
    idDetalle INT PRIMARY KEY,
    cantidadDetalle INT NOT NULL,
    precioUnitarioDetalle DECIMAL(10,2) NOT NULL,
    subtotalDetalle DECIMAL(10,2) NOT NULL,
    igvDetalle DECIMAL(10,2),
    idComprobante VARCHAR(10) FOREIGN KEY REFERENCES Comprobante(idComprobante)
);

CREATE TABLE Produccion (
    idProduccion VARCHAR(10) PRIMARY KEY,
    fechaProduccion DATE NOT NULL,
    cantidadProduccion INT NOT NULL,
    idEmpleado VARCHAR(10) FOREIGN KEY REFERENCES Empleado(codigoEmpleado)
);

CREATE TABLE Almacen (
    idAlmacen VARCHAR(10) PRIMARY KEY,
    nombreProductoAlmacen VARCHAR(50) NOT NULL,
    unidadMedidaAlmacen DECIMAL(10,2),
    stockProductosAlmacen INT NOT NULL,
    fechaEntradaAlmacen DATE,
    fechaSalidaAlmacen DATE
);

CREATE TABLE Categoria (
    codigoCategoria VARCHAR(10) PRIMARY KEY,
    nombreCategoria VARCHAR(50) NOT NULL,
    descripcionCategoria VARCHAR(100)
);

CREATE TABLE Proveedor (
    codigoProveedor VARCHAR(10) PRIMARY KEY,
    nombreEmpresaProveedor VARCHAR(50) NOT NULL,
    contactoProveedor VARCHAR(50),
    telefonoProveedor VARCHAR(9),
    idAlmacen VARCHAR(10) FOREIGN KEY REFERENCES Almacen(idAlmacen)
);

CREATE TABLE Producto (
    idProducto VARCHAR(10) PRIMARY KEY,
    nombreProducto VARCHAR(50) NOT NULL,
    descripcionProducto VARCHAR(100),
    precioReferenciasProducto DECIMAL(10,2),
    fechaCaducidadProducto DATE,
    idProduccion VARCHAR(10) FOREIGN KEY REFERENCES Produccion(idProduccion),
    idCategoria VARCHAR(10) FOREIGN KEY REFERENCES Categoria(codigoCategoria),
    idAlmacen VARCHAR(10) FOREIGN KEY REFERENCES Almacen(idAlmacen),
	idDetalle int FOREIGN KEY REFERENCES DetalleComprobante(idDetalle)
);

-- 4. Insertar datos de prueba
INSERT INTO Cliente VALUES 
('C001', '12345678', 'Juan', 'Pérez', 'Gómez', 'Av. Lima 123', '987654321', 'Cliente'),
('C002', '87654321', 'María', 'López', 'Ramírez', 'Jr. Cusco 456', '912345678', 'Cliente'),
('C003', '45612378', 'Carlos', 'García', 'Fernández', 'Psj. Arequipa 789', '956789123', 'Cliente'),
('C004', '78945612', 'Lucía', 'Torres', 'Mendoza', 'Calle Callao 321', '934567890', 'Cliente'),
('C005', '32178945', 'Pedro', 'Castro', 'Quispe', 'Av. Tacna 654', '965432187', 'Cliente');

INSERT INTO Empleado VALUES 
('E001', 'Luis', 'Sánchez', 'Martínez', 'Vendedor', 'Cajero', '999888777', '11223344'),
('E002', 'Ana', 'Ramírez', 'Pérez', 'Repostera', 'Chef', '988776655', '22334455'),
('E003', 'Mario', 'Gómez', 'Fernández', 'Vendedor', 'Atención', '977665544', '33445566'),
('E004', 'Elena', 'Díaz', 'Torres', 'Administrador', 'Gerente', '966554433', '44556677'),
('E005', 'Javier', 'Quispe', 'García', 'Repostero', 'Panadero', '955443322', '55667788');

INSERT INTO Comprobante VALUES 
('CMP001', '2025-03-10 08:30:00', 'Factura', 1001, 'Av. Principal 123', '20567890123', 'Boleta', 150.75, 'C001', 'E001'),
('CMP002', '2025-03-09 14:15:00', 'Boleta', 1002, 'Calle Secundaria 456', '20512345678', 'Factura', 89.50, 'C002', 'E002'),
('CMP003', '2025-03-08 10:45:00', 'Factura', 1003, 'Jr. Comercial 789', '20456789012', 'Boleta', 220.00, 'C003', 'E003'),
('CMP004', '2025-03-07 17:20:00', 'Boleta', 1004, 'Pasaje Central 321', '20345678901', 'Factura', 75.30, 'C004', 'E004'),
('CMP005', '2025-03-06 12:10:00', 'Factura', 1005, 'Calle Comercio 654', '20234567890', 'Boleta', 130.00, 'C005', 'E005');

-- Mostrar datos de cada tabla
SELECT * FROM Cliente;
SELECT * FROM Empleado;
SELECT * FROM Comprobante;
SELECT * FROM DetalleComprobante;
SELECT * FROM Produccion;
SELECT * FROM Proveedor;
SELECT * FROM Categoria;
SELECT * FROM Almacen;
SELECT * FROM Producto;
