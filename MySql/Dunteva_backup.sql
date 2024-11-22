-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Dunteva
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Dunteva`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dunteva` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `Dunteva`;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Desinfectantes','Productos utilizados para eliminar bacterias y virus en superficies.'),(2,'Detergentes','Productos líquidos o en polvo para lavar superficies, platos y utensilios.'),(3,'Limpiadores','Productos para limpiar diferentes superficies como vidrios, suelos, etc.'),(4,'Aditivos','Productos que complementan el proceso de limpieza, como suavizantes o blanqueadores.'),(5,'Desengrasantes','Productos utilizados para eliminar grasa y aceites en superficies.'),(6,'Ambientadores','Productos que se utilizan para eliminar malos olores y dar frescura al ambiente.'),(7,'Productos para pisos','Limpiadores específicos para suelos, cerámicos, madera, etc.'),(8,'Productos de baño','Limpiadores especializados para el mantenimiento de baños y sanitarios.');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleordenes`
--

DROP TABLE IF EXISTS `detalleordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleordenes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrdenID` int(11) NOT NULL,
  `ProductoID` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `OrdenID` (`OrdenID`),
  KEY `ProductoID` (`ProductoID`),
  CONSTRAINT `detalleordenes_ibfk_1` FOREIGN KEY (`OrdenID`) REFERENCES `ordenes` (`Id`),
  CONSTRAINT `detalleordenes_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleordenes`
--

LOCK TABLES `detalleordenes` WRITE;
/*!40000 ALTER TABLE `detalleordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventas`
--

DROP TABLE IF EXISTS `detalleventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleventas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `VentaID` int(11) NOT NULL,
  `ProductoID` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `VentaID` (`VentaID`),
  KEY `ProductoID` (`ProductoID`),
  CONSTRAINT `detalleventas_ibfk_1` FOREIGN KEY (`VentaID`) REFERENCES `ventas` (`Id`),
  CONSTRAINT `detalleventas_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventas`
--

LOCK TABLES `detalleventas` WRITE;
/*!40000 ALTER TABLE `detalleventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalleventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialinventario`
--

DROP TABLE IF EXISTS `historialinventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historialinventario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductoID` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `TipoMovimiento` enum('Entrada','Salida') NOT NULL,
  `FechaMovimiento` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Id`),
  KEY `ProductoID` (`ProductoID`),
  CONSTRAINT `historialinventario_ibfk_1` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialinventario`
--

LOCK TABLES `historialinventario` WRITE;
/*!40000 ALTER TABLE `historialinventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `historialinventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductoID` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `FechaUltimaActualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`Id`),
  KEY `ProductoID` (`ProductoID`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,100,'2024-11-19 18:43:58'),(2,2,50,'2024-11-19 18:43:58'),(3,3,80,'2024-11-19 18:43:58'),(4,4,200,'2024-11-19 18:43:58'),(5,5,150,'2024-11-19 18:43:58');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marcas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'Cif'),(2,'Clorox'),(3,'Mr. Clean'),(4,'Fabuloso'),(5,'Vanish'),(6,'Sanytol'),(7,'Lysol'),(8,'Axion'),(9,'Vikingo'),(10,'Conga'),(11,'OxiClean'),(12,'Dettol'),(13,'Amor'),(14,'Rindex'),(15,'Limpio Todo');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordenes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProveedorID` int(11) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `Total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ProveedorID` (`ProveedorID`),
  CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `CategoriaID` int(11) NOT NULL,
  `MarcaID` int(11) NOT NULL,
  `TipoID` int(11) NOT NULL,
  `UnidadID` int(11) NOT NULL,
  `Capacidad` float NOT NULL,
  `Densidad` float DEFAULT NULL,
  `Concentracion` varchar(50) DEFAULT NULL,
  `UsoID` int(11) DEFAULT NULL,
  `ProveedorID` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `CategoriaID` (`CategoriaID`),
  KEY `MarcaID` (`MarcaID`),
  KEY `UnidadID` (`UnidadID`),
  KEY `UsoID` (`UsoID`),
  KEY `ProveedorID` (`ProveedorID`),
  KEY `TipoID` (`TipoID`),
  KEY `idx_nombre_producto` (`Nombre`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`CategoriaID`) REFERENCES `categorias` (`Id`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`MarcaID`) REFERENCES `marcas` (`ID`),
  CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`UnidadID`) REFERENCES `unidades` (`Id`),
  CONSTRAINT `productos_ibfk_4` FOREIGN KEY (`UsoID`) REFERENCES `usos` (`Id`),
  CONSTRAINT `productos_ibfk_5` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`Id`),
  CONSTRAINT `productos_ibfk_6` FOREIGN KEY (`TipoID`) REFERENCES `tiposproducto` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Desinfectante Multiuso',1,2,1,1,500,NULL,'Concentrado',1,3),(2,'Detergente Líquido',2,1,1,1,1000,NULL,'10%',2,1),(3,'Limpiador de Pisos',3,3,1,2,1000,NULL,'Listo para usar',4,5),(4,'Desengrasante',5,4,1,1,500,NULL,NULL,2,7),(5,'Ambientador de Lavanda',6,5,1,1,300,NULL,NULL,3,6);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER AfterInsertProducto
AFTER INSERT ON Productos
FOR EACH ROW
BEGIN
    -- Insertar una entrada en el historial de inventario cuando se inserte un producto
    INSERT INTO HistorialInventario (ProductoID, Cantidad, TipoMovimiento)
    VALUES (NEW.Id, (SELECT Cantidad FROM Inventario WHERE ProductoID = NEW.Id), 'Entrada');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Contacto` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Direccion` text DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Proclean S.A.','Juan Pérez','011-4321-5678','contacto@proclean.com.ar','Av. Rivadavia 1234, CABA'),(2,'Limpiolandia SRL','Ana Rodríguez','011-8765-4321','ventas@limpiolandia.com.ar','Calle Ficticia 567, Buenos Aires'),(3,'Higiene Total','Carlos Gómez','0231-555-7890','info@higienetotal.com.ar','Ruta 3, Km 250, Morón'),(4,'Clean Solutions','Mariana López','0221-123-4567','contacto@cleansolutions.com.ar','Calle Limpieza 456, La Plata'),(5,'EcoLimpiar','Pedro Martínez','011-3322-5566','eco@ecolimpiar.com.ar','Av. Santa Fe 4321, CABA'),(6,'Vidal Productos de Limpieza','Lucía Fernández','011-4455-6677','info@vidalproductos.com.ar','Av. Pueyrredón 789, Lanús'),(7,'Cleansol','Ricardo Díaz','0223-998-1122','ventas@cleansol.com.ar','Calle Sol 123, Mar del Plata'),(8,'Sanitarios y Más','Gabriel Ruiz','011-3321-4578','contacto@sanitariosymas.com.ar','Calle 25 de Mayo 1250, Rosario'),(9,'Prohigiene','Silvina Torres','011-4433-8899','prohigiene@prohigiene.com.ar','Calle Lima 450, CABA'),(10,'CleanCenter','Felipe Sánchez','011-5678-9876','ventas@cleancenter.com.ar','Av. Belgrano 890, CABA');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposproducto`
--

DROP TABLE IF EXISTS `tiposproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposproducto` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposproducto`
--

LOCK TABLES `tiposproducto` WRITE;
/*!40000 ALTER TABLE `tiposproducto` DISABLE KEYS */;
INSERT INTO `tiposproducto` VALUES (1,'Líquido'),(2,'Sólido'),(3,'Polvo'),(4,'Pastilla'),(5,'Gel'),(6,'Spray');
/*!40000 ALTER TABLE `tiposproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Abreviatura` varchar(10) NOT NULL,
  `TipoUnidad` enum('Volumen','Peso','Unidad','Otro') NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,'Litros','L','Volumen'),(2,'Mililitros','mL','Volumen'),(3,'Kilogramos','kg','Peso'),(4,'Gramos','g','Peso'),(5,'Unidades','Unid','Unidad'),(6,'Botellas','Bot','Unidad'),(7,'Pack','Pack','Unidad');
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usos`
--

DROP TABLE IF EXISTS `usos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usos`
--

LOCK TABLES `usos` WRITE;
/*!40000 ALTER TABLE `usos` DISABLE KEYS */;
INSERT INTO `usos` VALUES (1,'Limpieza de superficies'),(2,'Lavado de platos'),(3,'Desinfección de baños'),(4,'Limpieza de pisos'),(5,'Desengrasado de cocina'),(6,'Ambientación de espacios'),(7,'Eliminación de manchas'),(8,'Blanqueo de ropa');
/*!40000 ALTER TABLE `usos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Contraseña` varchar(255) NOT NULL,
  `Rol` enum('Admin','Empleado') DEFAULT 'Empleado',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Correo` (`Correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `UsuarioID` int(11) NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `FechaVenta` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Id`),
  KEY `idx_fecha_venta` (`Fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-22 17:27:29
