CREATE TABLESPACE tbEjemplo1
DATAFILE 'D:\Oracle\tbEjemplo1.dbf' SIZE 100M
AUTOEXTEND ON NEXT 10M MAXSIZE 1000M;

DROP TABLE CLiente;

CREATE TABLE Cliente (
    codigoCliente VARCHAR(10) PRIMARY KEY,
    DNICliente VARCHAR(8) UNIQUE NOT NULL,
    nombreCliente VARCHAR(50) NOT NULL,
    paternoCliente VARCHAR(50) NOT NULL,
    maternoCliente VARCHAR(50) NOT NULL,
    direccionCliente VARCHAR(100),
    celularCliente VARCHAR(9),
    tipoEmpleado VARCHAR(30)
)TABLESPACE tbEjemplo1;

DROP TABLE Empleado1;

CREATE TABLE Empleado (
    codigoEmpleado VARCHAR(10) PRIMARY KEY,
    nombresEmpleado VARCHAR(50) NOT NULL,
    paternoEmpleado VARCHAR(50) NOT NULL,
    maternoEmpleado VARCHAR(50) NOT NULL,
    tipoEmpleado VARCHAR(30),
    cargoEmpleado VARCHAR(50),
    telefonoEmpleado VARCHAR(9),
    DNIEmpleado VARCHAR(8) UNIQUE NOT NULL
)TABLESPACE tbEjemplo1;

DROP TABLE Comprobante;

CREATE TABLE Comprobante (
    idComprobante VARCHAR(10) PRIMARY KEY,
    fechaHoraComprobante DATETIME NOT NULL,
    nombreComprobante VARCHAR(50) NOT NULL,
    numeroComprobante INT NOT NULL,
    direccionComprobante VARCHAR(100),
    RUCComprobante VARCHAR(11),
    tipoComprobante VARCHAR(20),
    totalComprobante DECIMAL(10,2),
    idCliente VARCHAR(10),
    idEmpleado VARCHAR(10),
    FOREIGN KEY (idCliente) REFERENCES Cliente(codigoCliente),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(codigoEmpleado)
)TABLESPACE tbEjemplo1;

DROP TABLE DetalleComprobante;

CREATE TABLE DetalleComprobante (
    idDetalle INT PRIMARY KEY,
    cantidadDetalle INT NOT NULL,
    precioUnitarioDetalle DECIMAL(10,2) NOT NULL,
    subtotalDetalle DECIMAL(10,2) NOT NULL,
    igvDetalle DECIMAL(10,2),
    idComprobante VARCHAR(10),
    FOREIGN KEY (idComprobante) REFERENCES Comprobante(idComprobante)
)TABLESPACE tbEjemplo1;

DROP TABLE Produccion;

CREATE TABLE Produccion (
    idProduccion VARCHAR(10) PRIMARY KEY,
    fechaProduccion DATE NOT NULL,
    cantidadProduccion INT NOT NULL,
    idEmpleado VARCHAR(10),
    FOREIGN KEY (idEmpleado) REFERENCES Empleado(codigoEmpleado)
)TABLESPACE tbEjemplo1;

DROP TABLE Almacen;

CREATE TABLE Almacen (
    idAlmacen VARCHAR(10) PRIMARY KEY,
    nombreProductoAlmacen VARCHAR(50) NOT NULL,
    unidadMedidaAlmacen DECIMAL(10,2),
    stockProductosAlmacen INT NOT NULL,
    fechaEntradaAlmacen DATE,
    fechaSalidaAlmacen DATE
)TABLESPACE tbEjemplo1;

DROP TABLE Categoria;

CREATE TABLE Categoria (
    codigoCategoria VARCHAR(10) PRIMARY KEY,
    nombreCategoria VARCHAR(50) NOT NULL,
    descripcionCategoria VARCHAR(100)
)TABLESPACE tbEjemplo1;

DROP TABLE Proveedor;

CREATE TABLE Proveedor (
    codigoProveedor VARCHAR(10) PRIMARY KEY,
    nombreEmpresaProveedor VARCHAR(50) NOT NULL,
    contactoProveedor VARCHAR(50),
    telefonoProveedor VARCHAR(9),
    idAlmacen VARCHAR(10),
    FOREIGN KEY (idAlmacen) REFERENCES Almacen(idAlmacen)
)TABLESPACE tbEjemplo1;

DROP TABLE Producto;

CREATE TABLE Producto (
    idProducto VARCHAR(10) PRIMARY KEY,
    nombreProducto VARCHAR(50) NOT NULL,
    descripcionProducto VARCHAR(100),
    precioReferenciasProducto DECIMAL(10,2),
    fechaCaducidadProducto DATE,
    idProduccion VARCHAR(10),
    idCategoria VARCHAR(10),
    idAlmacen VARCHAR(10),
    FOREIGN KEY (idProduccion) REFERENCES Produccion(idProduccion),
    FOREIGN KEY (idCategoria) REFERENCES Categoria(codigoCategoria),
    FOREIGN KEY (idAlmacen) REFERENCES Almacen(idAlmacen),
    FOREIGN KEY (idDetalle) REFERENCES DetalleComprobante(idDetalle)
)TABLESPACE tbEjemplo1;

--Insertar datos
INSERT INTO Cliente VALUES ('C001', '12345678', 'Juan', 'Pérez', 'Gómez', 'Av. Lima 123', '987654321', 'Cliente');
INSERT INTO Cliente VALUES ('C002', '87654321', 'María', 'López', 'Ramírez', 'Jr. Cusco 456', '912345678', 'Cliente');
INSERT INTO Cliente VALUES ('C003', '45612378', 'Carlos', 'García', 'Fernández', 'Psj. Arequipa 789', '956789123', 'Cliente');
INSERT INTO Cliente VALUES ('C004', '78945612', 'Lucía', 'Torres', 'Mendoza', 'Calle Callao 321', '934567890', 'Cliente');
INSERT INTO Cliente VALUES ('C005', '32178945', 'Pedro', 'Castro', 'Quispe', 'Av. Tacna 654', '965432187', 'Cliente');

INSERT INTO Empleado VALUES ('E001', 'Luis', 'Sánchez', 'Martínez', 'Vendedor', 'Cajero', '999888777', '11223344');
INSERT INTO Empleado VALUES ('E002', 'Ana', 'Ramírez', 'Pérez', 'Repostera', 'Chef', '988776655', '22334455');
INSERT INTO Empleado VALUES ('E003', 'Mario', 'Gómez', 'Fernández', 'Vendedor', 'Atención', '977665544', '33445566');
INSERT INTO Empleado VALUES ('E004', 'Elena', 'Díaz', 'Torres', 'Administrador', 'Gerente', '966554433', '44556677');
INSERT INTO Empleado VALUES ('E005', 'Javier', 'Quispe', 'García', 'Repostero', 'Panadero', '955443322', '55667788');

SELECT*FROM Cliente;
SELECT*FROM Empleado;