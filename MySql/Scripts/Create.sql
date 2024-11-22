use Dunteva;



-- Crear la base de datos
CREATE DATABASE InventarioArticulosLimpieza;
USE InventarioArticulosLimpieza;

-- Tabla de Categorías
CREATE TABLE Categorias (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT
);

-- Tabla de Marcas
CREATE TABLE Marcas (
    MarcaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- Tabla de Unidades de Medida
CREATE TABLE Unidades (
    UnidadID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Abreviatura VARCHAR(10) NOT NULL,
    TipoUnidad ENUM('Volumen', 'Peso', 'Unidad', 'Otro') NOT NULL
);

-- Tabla de Tipos de Producto
CREATE TABLE TiposProducto (
    TipoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- Tabla de Usos
CREATE TABLE Usos (
    UsoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- Tabla de Proveedores
CREATE TABLE Proveedores (
    ProveedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Contacto VARCHAR(100),
    Telefono VARCHAR(20),
    Correo VARCHAR(100),
    Direccion TEXT
);

-- Tabla de Productos
CREATE TABLE Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    CategoriaID INT NOT NULL,
    MarcaID INT NOT NULL,
    TipoID INT NOT NULL,
    UnidadID INT NOT NULL,
    Capacidad FLOAT NOT NULL, -- Capacidad en unidades definidas por UnidadID
    Densidad FLOAT DEFAULT NULL, -- Opcional para líquidos
    Concentracion VARCHAR(50) DEFAULT NULL, -- Ejemplo: "70%", "Concentrado"
    UsoID INT DEFAULT NULL,
    ProveedorID INT NOT NULL,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID),
    FOREIGN KEY (MarcaID) REFERENCES Marcas(MarcaID),
    FOREIGN KEY (UnidadID) REFERENCES Unidades(UnidadID),
    FOREIGN KEY (UsoID) REFERENCES Usos(UsoID),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID),
    FOREIGN KEY (TipoID) REFERENCES TiposProducto(TipoID)
);

-- Tabla de Inventario
CREATE TABLE Inventario (
    InventarioID INT AUTO_INCREMENT PRIMARY KEY,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    FechaUltimaActualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de Ventas
CREATE TABLE Ventas (
    VentaID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UsuarioID INT NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    FechaVenta TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Detalle de Ventas
CREATE TABLE DetalleVentas (
    VentaID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (VentaID, ProductoID),
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de Órdenes de Compra
CREATE TABLE Ordenes (
    OrdenID INT AUTO_INCREMENT PRIMARY KEY,
    ProveedorID INT NOT NULL,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

-- Tabla de Detalle de Órdenes
CREATE TABLE DetalleOrdenes (
    OrdenID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (OrdenID, ProductoID),
    FOREIGN KEY (OrdenID) REFERENCES Ordenes(OrdenID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) UNIQUE NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,
    Rol ENUM('Admin', 'Empleado') DEFAULT 'Empleado'
);

-- Tabla de Clientes (Opcional)
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20),
    Correo VARCHAR(100)
);

-- Tabla de Historial de Inventario (Opcional)
CREATE TABLE HistorialInventario (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    TipoMovimiento ENUM('Entrada', 'Salida') NOT NULL,
    FechaMovimiento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ProductoID) REFERENCES Productos(Id)
);

-- Índices para mejorar el rendimiento de consultas frecuentes
CREATE INDEX idx_nombre_producto ON Productos (Nombre);
CREATE INDEX idx_fecha_venta ON Ventas (Fecha);
