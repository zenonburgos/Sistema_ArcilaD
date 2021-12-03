-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.2.7-MariaDB-log - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura para tabla dbsistema.articulo
CREATE TABLE IF NOT EXISTS `articulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fk_articulo_categoria_idx` (`categoria_id`),
  CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbsistema.articulo: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` (`id`, `categoria_id`, `codigo`, `nombre`, `precio_venta`, `stock`, `descripcion`, `imagen`, `activo`) VALUES
	(1, 7, '1005496085', 'COMEDOR DE 4', 150.00, 10, 'MDEXX', 'Copia de 24.png', b'1'),
	(2, 5, '232323', 'BICICLETA 16', 90.00, 6, 'HHG', '19.jpeg', b'1'),
	(3, 4, 'CH2-NBM', 'CHINERO 2C', 190.00, 20, '', '', b'1'),
	(4, 4, 'C2C-NBM', 'Closet 3c', 250.00, 15, '', '', b'1'),
	(5, 4, 'C3M/JMG', 'CLOSET 3C CON MALETERO', 260.00, 10, '', '', b'1'),
	(6, 3, 'ESQ-3P', 'JUEGO DE SALA ESQUINERO', 450.00, 6, '', '', b'1'),
	(7, 6, '62507', 'LICUADORA OSTER', 60.00, 15, '', '', b'1'),
	(8, 6, '17201', 'PLANCHA PARA ROPA OSTER', 35.00, 25, '', '', b'1'),
	(9, 6, 'AND-BST', 'ANDADERA DE BASTON', 35.00, 20, '', '', b'1'),
	(10, 5, 'BELLE-16', 'BICICLETA PARA NIÑA', 90.00, 8, '', '', b'1'),
	(11, 1, 'SC-AKX950', 'EQUIPO DE SONIDO PANASONIC', 390.00, 4, '', '', b'1'),
	(12, 2, 'TC-40DS600', 'TELEVISOR LED PANASONIC', 500.00, 1, '', '', b'1'),
	(13, 6, 'TRACKER', 'BICICLETA MONATÑEZA 18V', 160.00, 10, '', '', b'1');
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;

-- Volcando estructura para tabla dbsistema.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbsistema.categoria: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nombre`, `descripcion`, `activo`) VALUES
	(1, 'Audio', 'Todo lo relacionado a sonido.', b'1'),
	(2, 'Video', 'sasa', b'1'),
	(3, 'Muebles', '', b'1'),
	(4, 'Madera', '', b'1'),
	(5, 'Línea comercial', 'Bicicletas, planchas para pupusas, etc.', b'1'),
	(6, 'Mercadería varia', '', b'1'),
	(7, 'Comedores', '', b'1'),
	(8, 'Muebles de Sala', '', b'1'),
	(9, 'Miscelaneos', '', b'1'),
	(10, 'otro', '', b'0'),
	(14, 'otros', '', b'0'),
	(16, 'otross', '', b'1'),
	(17, 'cate', '', b'1');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla dbsistema.detalle_ingreso
CREATE TABLE IF NOT EXISTS `detalle_ingreso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingreso_id` int(11) NOT NULL,
  `articulo_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_ingreso_ingreso_idx` (`ingreso_id`),
  KEY `fk_detalle_ingreso_articulo_idx` (`articulo_id`),
  CONSTRAINT `fk_detalle_ingreso_articulo` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_ingreso_ingreso` FOREIGN KEY (`ingreso_id`) REFERENCES `ingreso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbsistema.detalle_ingreso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_ingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ingreso` ENABLE KEYS */;

-- Volcando estructura para tabla dbsistema.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id` int(11) NOT NULL,
  `articulo_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_venta_venta_idx` (`venta_id`),
  KEY `fk_detalle_venta_articulo_idx` (`articulo_id`),
  CONSTRAINT `fk_detalle_venta_articulo` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_venta` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbsistema.detalle_venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;

-- Volcando estructura para tabla dbsistema.ingreso
CREATE TABLE IF NOT EXISTS `ingreso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Aceptado',
  PRIMARY KEY (`id`),
  KEY `fk_ingreso_persona_idx` (`persona_id`),
  KEY `fk_ingreso_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingreso_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbsistema.ingreso: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ingreso` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingreso` ENABLE KEYS */;

-- Volcando estructura para tabla dbsistema.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbsistema.persona: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;

-- Volcando estructura para tabla dbsistema.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbsistema.rol: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`id`, `nombre`, `descripcion`) VALUES
	(1, 'Administrador', 'Administrador del sistema'),
	(2, 'Vendedor', 'Vendedor del sistema'),
	(3, 'Almacenero', 'Almacenero del sistema');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

-- Volcando estructura para tabla dbsistema.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(20) DEFAULT NULL,
  `direccion` varchar(70) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `clave` varchar(128) NOT NULL,
  `activo` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_usuario_rol_idx` (`rol_id`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbsistema.usuario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `rol_id`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `clave`, `activo`) VALUES
	(1, 1, 'Zenón Burgos', 'DNI', '00549608-6', 'Atiquizaya', '7742-9495', 'znburgos@gmail.com', '80daa23dc7fda0247ed914a967196336ddcffda90df0133a6795c643b1b793b1', b'1');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla dbsistema.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Aceptado',
  PRIMARY KEY (`id`),
  KEY `fk_ingreso_persona_idx` (`persona_id`),
  KEY `fk_venta_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_venta_persona` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla dbsistema.venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
