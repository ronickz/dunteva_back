DELIMITER $$

CREATE PROCEDURE InsertarProductoConValidaciones(
    IN p_Nombre VARCHAR(150),
    IN p_CategoriaID INT,
    IN p_MarcaID INT,
    IN p_TipoID INT,
    IN p_UnidadID INT,
    IN p_Capacidad FLOAT,
    IN p_Densidad FLOAT,
    IN p_Concentracion VARCHAR(50),
    IN p_UsoID INT,
    IN p_ProveedorID INT
)
BEGIN
    -- Validar que todos los parámetros requeridos no sean NULL
    IF p_Nombre IS NULL OR p_CategoriaID IS NULL OR p_MarcaID IS NULL OR p_TipoID IS NULL OR p_UnidadID IS NULL OR p_Capacidad IS NULL OR p_ProveedorID IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Uno o más campos requeridos son NULL';
    END IF;

    -- Validar que la capacidad sea mayor a 0
    IF p_Capacidad <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La capacidad debe ser mayor que 0';
    END IF;

    -- Validar que la densidad sea válida (si es NULL o mayor o igual a 0, está bien)
    IF p_Densidad IS NOT NULL AND p_Densidad < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La densidad no puede ser negativa';
    END IF;

    -- Verificar que el producto no exista ya en la misma categoría
    IF EXISTS (SELECT 1 FROM Productos WHERE Nombre = p_Nombre AND CategoriaID = p_CategoriaID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto ya existe en esta categoría';
    END IF;

    -- Validar que las claves foráneas existan en las tablas relacionadas
    -- Comprobando la existencia de la categoría
    IF NOT EXISTS (SELECT 1 FROM Categorias WHERE CategoriaID = p_CategoriaID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La categoría no existe';
    END IF;

    -- Comprobando la existencia de la marca
    IF NOT EXISTS (SELECT 1 FROM Marcas WHERE MarcaID = p_MarcaID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La marca no existe';
    END IF;

    -- Comprobando la existencia del tipo de producto
    IF NOT EXISTS (SELECT 1 FROM TiposProducto WHERE TipoID = p_TipoID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tipo de producto no existe';
    END IF;

    -- Comprobando la existencia de la unidad de medida
    IF NOT EXISTS (SELECT 1 FROM Unidades WHERE UnidadID = p_UnidadID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La unidad de medida no existe';
    END IF;

    -- Comprobando la existencia del proveedor
    IF NOT EXISTS (SELECT 1 FROM Proveedores WHERE ProveedorID = p_ProveedorID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El proveedor no existe';
    END IF;

    -- Si todas las validaciones pasaron, insertamos el nuevo producto
    INSERT INTO Productos (Nombre, CategoriaID, MarcaID, TipoID, UnidadID, Capacidad, Densidad, Concentracion, UsoID, ProveedorID)
    VALUES (p_Nombre, p_CategoriaID, p_MarcaID, p_TipoID, p_UnidadID, p_Capacidad, p_Densidad, p_Concentracion, p_UsoID, p_ProveedorID);

END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE ObtenerTodosLosProductos()
BEGIN
SELECT 
    p.Id,
    p.Nombre AS ProductoNombre,
    c.Nombre AS Categoria,
    m.Nombre AS MarcaNombre,
    t.Nombre AS TipoProductoNombre,
    u.Nombre AS UnidadNombre,
    p.Capacidad,
    p.Densidad,
    p.Concentracion
FROM 
    Productos p
INNER JOIN 
    Categorias c ON p.CategoriaID = c.Id
INNER JOIN 
    Marcas m ON p.MarcaID = m.Id
INNER JOIN 
    TiposProducto t ON p.TipoID = t.Id
INNER JOIN 
    Unidades u ON p.UnidadID = u.Id;
END $$

DELIMITER ;


