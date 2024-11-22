DELIMITER $$

CREATE TRIGGER AfterInsertProducto
AFTER INSERT ON Productos
FOR EACH ROW
BEGIN
    -- Insertar una entrada en el historial de inventario cuando se inserte un producto
    INSERT INTO HistorialInventario (ProductoID, Cantidad, TipoMovimiento)
    VALUES (NEW.Id, (SELECT Cantidad FROM Inventario WHERE ProductoID = NEW.Id), 'Entrada');
END $$


DELIMITER ;
