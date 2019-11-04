-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: java1
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alcohol`
--

DROP TABLE IF EXISTS `alcohol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcohol` (
  `id_alcohol` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Es la clave Primaria',
  `si_consume` bit(1) NOT NULL COMMENT 'La condicion si consume o no',
  `cantidad` int(10) NOT NULL COMMENT 'La Cantidad que consume',
  `id_frecuencia` int(11) NOT NULL COMMENT 'Clave forania de la frecuencia',
  `tiempo_consumo` int(10) DEFAULT NULL COMMENT 'El tipo de consumo',
  `id_tamano_bebida` int(11) DEFAULT NULL COMMENT 'Clave forania del tamaño bebida',
  `detalles` varchar(200) DEFAULT NULL COMMENT 'Los detalles',
  PRIMARY KEY (`id_alcohol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcohol`
--

LOCK TABLES `alcohol` WRITE;
/*!40000 ALTER TABLE `alcohol` DISABLE KEYS */;
/*!40000 ALTER TABLE `alcohol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alergias`
--

DROP TABLE IF EXISTS `alergias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alergias` (
  `id_alergias` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_alergia` varchar(50) NOT NULL,
  PRIMARY KEY (`id_alergias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alergias`
--

LOCK TABLES `alergias` WRITE;
/*!40000 ALTER TABLE `alergias` DISABLE KEYS */;
/*!40000 ALTER TABLE `alergias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id_autor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria del Autor',
  `nombre_autor` varchar(30) DEFAULT NULL COMMENT 'Nombre del autor',
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Paublo Cohelo'),(2,'Juan Bosch');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bebida_cafeinosa`
--

DROP TABLE IF EXISTS `bebida_cafeinosa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bebida_cafeinosa` (
  `id_bebida_cafeinosa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de la bebida cafeina',
  `bebida` varchar(20) NOT NULL COMMENT 'Nombre de la bebida',
  PRIMARY KEY (`id_bebida_cafeinosa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebida_cafeinosa`
--

LOCK TABLES `bebida_cafeinosa` WRITE;
/*!40000 ALTER TABLE `bebida_cafeinosa` DISABLE KEYS */;
/*!40000 ALTER TABLE `bebida_cafeinosa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cafeina`
--

DROP TABLE IF EXISTS `cafeina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cafeina` (
  `id_cafeina` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de la cafeina',
  `si_cafeina` bit(1) NOT NULL COMMENT 'Condicion si consume',
  `id_bebida_cafeinosa` int(11) DEFAULT NULL COMMENT 'Clave Forania de la bebida cafeina',
  `id_frecuencia` int(11) DEFAULT NULL COMMENT 'Clave forania de la frecuencia',
  PRIMARY KEY (`id_cafeina`),
  KEY `id_bebida_cafeinosa` (`id_bebida_cafeinosa`),
  CONSTRAINT `cafeina_ibfk_1` FOREIGN KEY (`id_bebida_cafeinosa`) REFERENCES `bebida_cafeinosa` (`id_bebida_cafeinosa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cafeina`
--

LOCK TABLES `cafeina` WRITE;
/*!40000 ALTER TABLE `cafeina` DISABLE KEYS */;
/*!40000 ALTER TABLE `cafeina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calle`
--

DROP TABLE IF EXISTS `calle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calle` (
  `id_calle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de la Calle',
  `calle` varchar(20) NOT NULL COMMENT 'Nombre de la calle',
  `id_municipio` int(11) NOT NULL COMMENT 'Clave Forania del municipio',
  PRIMARY KEY (`id_calle`),
  KEY `id_municipio` (`id_municipio`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calle`
--

LOCK TABLES `calle` WRITE;
/*!40000 ALTER TABLE `calle` DISABLE KEYS */;
INSERT INTO `calle` VALUES (1,'#334',1);
/*!40000 ALTER TABLE `calle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cambio_usuario`
--

DROP TABLE IF EXISTS `cambio_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cambio_usuario` (
  `id_usuario` int(11) NOT NULL COMMENT 'Clave Forania de usuario',
  `usuario` varchar(20) DEFAULT NULL COMMENT 'Nombre de usuario',
  `clave` varchar(100) DEFAULT NULL COMMENT 'Clave o contraseña',
  `email` varchar(100) DEFAULT NULL COMMENT 'Gmail',
  `fecha` datetime DEFAULT NULL COMMENT 'fecha cambio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cambio_usuario`
--

LOCK TABLES `cambio_usuario` WRITE;
/*!40000 ALTER TABLE `cambio_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `cambio_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cambios_med_tom`
--

DROP TABLE IF EXISTS `cambios_med_tom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cambios_med_tom` (
  `id_persona` int(11) DEFAULT NULL COMMENT 'Clave Forania de persona',
  `id_medicamentos` int(11) DEFAULT NULL COMMENT 'Clave forania de medicamentos',
  `otros` varchar(20) DEFAULT NULL COMMENT 'Otros'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cambios_med_tom`
--

LOCK TABLES `cambios_med_tom` WRITE;
/*!40000 ALTER TABLE `cambios_med_tom` DISABLE KEYS */;
/*!40000 ALTER TABLE `cambios_med_tom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cambios_persona`
--

DROP TABLE IF EXISTS `cambios_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cambios_persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Forania de persona',
  `id_cargo` int(11) DEFAULT NULL COMMENT 'Clave forania del cargo',
  `id_direccion` int(11) DEFAULT NULL COMMENT 'Clave Forania de la bebida direccion',
  `id_telefono` int(11) DEFAULT NULL COMMENT 'Clave forania de telefono',
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cambios_persona`
--

LOCK TABLES `cambios_persona` WRITE;
/*!40000 ALTER TABLE `cambios_persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `cambios_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria del cargo',
  `cargo` varchar(20) NOT NULL COMMENT 'Nombre del cargo',
  PRIMARY KEY (`id_cargo`),
  UNIQUE KEY `cargo_UNIQUE` (`cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Estudiante');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_salud`
--

DROP TABLE IF EXISTS `centro_salud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centro_salud` (
  `id_centro_salud` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria del centro de salud',
  `centro_salud` varchar(100) NOT NULL COMMENT 'Nombre del centro de salud',
  PRIMARY KEY (`id_centro_salud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_salud`
--

LOCK TABLES `centro_salud` WRITE;
/*!40000 ALTER TABLE `centro_salud` DISABLE KEYS */;
/*!40000 ALTER TABLE `centro_salud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de la ciudad',
  `ciudad` varchar(40) NOT NULL COMMENT 'Nombre de la ciudad',
  `id_provincia` int(11) NOT NULL COMMENT 'Clave Forania de la provincia',
  PRIMARY KEY (`id_ciudad`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Santiago de los Caballero',1);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto_emergencia`
--

DROP TABLE IF EXISTS `contacto_emergencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto_emergencia` (
  `id_contacto_emergencia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria del contatco de emergencia',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre del contacto',
  `apellido` varchar(50) NOT NULL COMMENT 'Apellido del contacto',
  `id_parentesco` int(11) NOT NULL COMMENT 'Clave forania del parentesco',
  `id_telefono` int(11) NOT NULL COMMENT 'Clave forania del telefono',
  `correo` varchar(100) NOT NULL COMMENT 'Gmail',
  `trabajo` varchar(50) NOT NULL COMMENT 'Nombre trabajo',
  `empresa` varchar(100) NOT NULL COMMENT 'Nombre empresa',
  PRIMARY KEY (`id_contacto_emergencia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto_emergencia`
--

LOCK TABLES `contacto_emergencia` WRITE;
/*!40000 ALTER TABLE `contacto_emergencia` DISABLE KEYS */;
INSERT INTO `contacto_emergencia` VALUES (1,'Adelina','Paulino',1,1,'adelina@gmail.com','Profesora','Minerd');
/*!40000 ALTER TABLE `contacto_emergencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuidado_medico`
--

DROP TABLE IF EXISTS `cuidado_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuidado_medico` (
  `id_cuidado_medico` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria del cuidado medico',
  `causa` varchar(100) DEFAULT 'Ninguno' COMMENT 'Causa del cuidado',
  `id_centro_salud` int(11) NOT NULL DEFAULT '0' COMMENT 'Clave Forania del centro salud',
  PRIMARY KEY (`id_cuidado_medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuidado_medico`
--

LOCK TABLES `cuidado_medico` WRITE;
/*!40000 ALTER TABLE `cuidado_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuidado_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `curso` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dano_libro`
--

DROP TABLE IF EXISTS `dano_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dano_libro` (
  `id_dano_libro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria del daño libro',
  `id_libro` int(11) NOT NULL COMMENT 'Clave forania del libro',
  `detalle` varchar(45) NOT NULL COMMENT 'Detalle de los daños',
  `fecha` date NOT NULL COMMENT 'Fecha',
  `id_estudiante` int(11) NOT NULL COMMENT 'Clave forania del estudiante',
  PRIMARY KEY (`id_dano_libro`),
  KEY `Libro_idx` (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dano_libro`
--

LOCK TABLES `dano_libro` WRITE;
/*!40000 ALTER TABLE `dano_libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `dano_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_prestamos`
--

DROP TABLE IF EXISTS `detalle_prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_prestamos` (
  `id_detalle_prestamo` int(11) NOT NULL COMMENT 'Clave Primaria de Detalle Prestamos',
  `id_prestamo` int(11) NOT NULL COMMENT 'Clave forania de Prestamo',
  `id_usuario` int(11) NOT NULL COMMENT 'Clave Forania de Usuario',
  `Fecha_hora` datetime NOT NULL COMMENT 'Fecha Y Hora',
  `id_libro` int(11) NOT NULL,
  `detalle_prestamoscol` varchar(45) NOT NULL,
  PRIMARY KEY (`id_detalle_prestamo`),
  KEY `Prestamo_fk_idx` (`id_prestamo`),
  KEY `Prestamo_fk_idx1` (`id_usuario`),
  CONSTRAINT `Prestamo_fk` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo_estudiante` (`id_Libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_prestamos`
--

LOCK TABLES `detalle_prestamos` WRITE;
/*!40000 ALTER TABLE `detalle_prestamos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dieta`
--

DROP TABLE IF EXISTS `dieta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieta` (
  `id_dieta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de la dieta',
  `descripcion` varchar(200) DEFAULT NULL COMMENT 'Descripcion',
  PRIMARY KEY (`id_dieta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dieta`
--

LOCK TABLES `dieta` WRITE;
/*!40000 ALTER TABLE `dieta` DISABLE KEYS */;
/*!40000 ALTER TABLE `dieta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de la direccion',
  `id_casa` int(11) NOT NULL COMMENT 'Clave forania de la casa',
  `id_calle` int(11) NOT NULL COMMENT 'Clave Forania de la calle',
  `id_municipio` int(11) NOT NULL COMMENT 'Clave forania del municipio',
  `id_ciudad` int(11) NOT NULL COMMENT 'Clave forania de la ciudad',
  `id_provincia` int(11) NOT NULL COMMENT 'Clave forania de la provincia',
  `id_pais` int(11) NOT NULL COMMENT 'Clave forania del pais',
  PRIMARY KEY (`id_direccion`),
  KEY `id_casa` (`id_casa`),
  KEY `id_calle` (`id_calle`),
  KEY `id_municipio` (`id_municipio`),
  KEY `id_ciudad` (`id_ciudad`),
  KEY `id_provincia` (`id_provincia`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`id_casa`) REFERENCES `residencia` (`id_casa`),
  CONSTRAINT `direccion_ibfk_2` FOREIGN KEY (`id_calle`) REFERENCES `calle` (`id_calle`),
  CONSTRAINT `direccion_ibfk_3` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id_municipio`),
  CONSTRAINT `direccion_ibfk_4` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`),
  CONSTRAINT `direccion_ibfk_5` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`),
  CONSTRAINT `direccion_ibfk_6` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `id_editorial` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria del editorial',
  `nombre_editorial` varchar(30) DEFAULT NULL COMMENT 'Nombre del editorial',
  PRIMARY KEY (`id_editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (1,'Luz'),(2,'Imperial');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ejercicios`
--

DROP TABLE IF EXISTS `ejercicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejercicios` (
  `id_ejercicios` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de ejercicios',
  `si_ejercicio` bit(1) NOT NULL COMMENT 'Condicion si consume',
  `id_tipo` int(11) NOT NULL COMMENT 'claa',
  PRIMARY KEY (`id_ejercicios`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `ejercicios_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_ejercicio` (`id_tipo_ejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ejercicios`
--

LOCK TABLES `ejercicios` WRITE;
/*!40000 ALTER TABLE `ejercicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `ejercicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de empleado',
  `id_persona` int(11) NOT NULL COMMENT 'Clave forania de la persona',
  `sueldo` float NOT NULL COMMENT 'Sueldo de empleado',
  `id_departamento` int(11) NOT NULL COMMENT 'Clave forania del departamento',
  PRIMARY KEY (`id_empleado`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedades`
--

DROP TABLE IF EXISTS `enfermedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermedades` (
  `id_enfermedades` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de enfermedades',
  `enfermedad` varchar(20) NOT NULL COMMENT 'Nombre enfermeda',
  `tipo_nivel` varchar(20) NOT NULL COMMENT 'Tipo de nivel',
  PRIMARY KEY (`id_enfermedades`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedades`
--

LOCK TABLES `enfermedades` WRITE;
/*!40000 ALTER TABLE `enfermedades` DISABLE KEYS */;
INSERT INTO `enfermedades` VALUES (1,'Gripe','Alto');
/*!40000 ALTER TABLE `enfermedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `id_estudiante` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de estudiante',
  `id_persona` int(11) NOT NULL COMMENT 'Clave forania de la persona',
  `id_grado` int(11) DEFAULT NULL COMMENT 'Clave forania de la grado',
  `id_seccion` int(11) DEFAULT NULL COMMENT 'Clave forania de la seccion',
  `id_taller` int(11) DEFAULT NULL COMMENT 'Clave forania del taller',
  PRIMARY KEY (`id_estudiante`),
  UNIQUE KEY `id_persona` (`id_persona`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES (1,1,1,1,1);
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `frecuencia`
--

DROP TABLE IF EXISTS `frecuencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frecuencia` (
  `id_frecuencia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de frecuencia',
  `frecuencia` varchar(50) NOT NULL COMMENT 'Descripcion de frecuencia',
  PRIMARY KEY (`id_frecuencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frecuencia`
--

LOCK TABLES `frecuencia` WRITE;
/*!40000 ALTER TABLE `frecuencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `frecuencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuma`
--

DROP TABLE IF EXISTS `fuma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fuma` (
  `id_fuma` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de fumador',
  `si_fuma` bit(1) NOT NULL COMMENT 'Condicion si consume',
  `cant_cigarros` int(10) DEFAULT NULL COMMENT 'Cantiadad de cigarros',
  `id_frecuencia` int(11) NOT NULL COMMENT 'Clave forania de la frecuencia',
  `si_hooka` bit(1) NOT NULL COMMENT 'Condision si hooka',
  `detalles` varchar(200) DEFAULT NULL COMMENT 'Detalles ',
  `si_fumo` bit(1) DEFAULT NULL COMMENT 'Condision',
  `anos_fumando` int(10) DEFAULT NULL COMMENT 'Años fumando',
  PRIMARY KEY (`id_fuma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuma`
--

LOCK TABLES `fuma` WRITE;
/*!40000 ALTER TABLE `fuma` DISABLE KEYS */;
/*!40000 ALTER TABLE `fuma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de genero',
  `nombre_genero` varchar(30) DEFAULT NULL COMMENT 'Nombre de genero',
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Literario'),(2,'Romantico');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grado`
--

DROP TABLE IF EXISTS `grado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grado` (
  `id_grado` int(11) NOT NULL,
  `grado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_grado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grado`
--

LOCK TABLES `grado` WRITE;
/*!40000 ALTER TABLE `grado` DISABLE KEYS */;
INSERT INTO `grado` VALUES (1,'3ro'),(2,'4to'),(3,'5to'),(4,'6to');
/*!40000 ALTER TABLE `grado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_medico`
--

DROP TABLE IF EXISTS `historial_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_medico` (
  `id_historial_medico` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de hsitorial medico',
  `id_historial_medico_familiar` int(11) NOT NULL COMMENT 'Clave forania del historial medido pariente',
  `id_historial_quirurgico` int(11) NOT NULL COMMENT 'Historial quirurgico',
  `id_salud_reproductiva` int(11) NOT NULL COMMENT 'Clave forania productividad',
  PRIMARY KEY (`id_historial_medico`),
  KEY `id_salud_reproductiva` (`id_salud_reproductiva`),
  KEY `id_historial_quirurgico` (`id_historial_quirurgico`),
  KEY `id_historial_medico_familiar` (`id_historial_medico_familiar`),
  CONSTRAINT `historial_medico_ibfk_2` FOREIGN KEY (`id_historial_quirurgico`) REFERENCES `historial_quirurgico` (`id_historial_quirurgico`),
  CONSTRAINT `historial_medico_ibfk_3` FOREIGN KEY (`id_historial_medico_familiar`) REFERENCES `historial_medico_familiar` (`id_historial_medico_familiar`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_medico`
--

LOCK TABLES `historial_medico` WRITE;
/*!40000 ALTER TABLE `historial_medico` DISABLE KEYS */;
INSERT INTO `historial_medico` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `historial_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_medico_familiar`
--

DROP TABLE IF EXISTS `historial_medico_familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_medico_familiar` (
  `id_historial_medico_familiar` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de historial medido pariente',
  `id_parentesco` int(11) NOT NULL COMMENT 'Clave forania del parentesco',
  `id_enfermedades` int(11) NOT NULL COMMENT 'Clave Forania de las enfermerdades',
  PRIMARY KEY (`id_historial_medico_familiar`),
  KEY `id_parentesco` (`id_parentesco`),
  KEY `id_enfermedades` (`id_enfermedades`),
  CONSTRAINT `historial_medico_familiar_ibfk_1` FOREIGN KEY (`id_parentesco`) REFERENCES `parentesco` (`id_parentesco`),
  CONSTRAINT `historial_medico_familiar_ibfk_2` FOREIGN KEY (`id_enfermedades`) REFERENCES `enfermedades` (`id_enfermedades`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_medico_familiar`
--

LOCK TABLES `historial_medico_familiar` WRITE;
/*!40000 ALTER TABLE `historial_medico_familiar` DISABLE KEYS */;
INSERT INTO `historial_medico_familiar` VALUES (1,1,1);
/*!40000 ALTER TABLE `historial_medico_familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_quirurgico`
--

DROP TABLE IF EXISTS `historial_quirurgico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_quirurgico` (
  `id_historial_quirurgico` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de historial quirurgico',
  `id_operaciones` int(11) NOT NULL COMMENT 'Clave forania de la operacion',
  `id_hospitalizaciones_graves` int(11) NOT NULL COMMENT 'Clave Forania de la hospitalizaciones',
  PRIMARY KEY (`id_historial_quirurgico`),
  KEY `id_operaciones` (`id_operaciones`),
  KEY `id_hospitalizaciones_graves` (`id_hospitalizaciones_graves`),
  CONSTRAINT `historial_quirurgico_ibfk_1` FOREIGN KEY (`id_operaciones`) REFERENCES `operaciones` (`id_operaciones`),
  CONSTRAINT `historial_quirurgico_ibfk_2` FOREIGN KEY (`id_hospitalizaciones_graves`) REFERENCES `hospitalizaciones_graves` (`id_hospitalizaciones_graves`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_quirurgico`
--

LOCK TABLES `historial_quirurgico` WRITE;
/*!40000 ALTER TABLE `historial_quirurgico` DISABLE KEYS */;
INSERT INTO `historial_quirurgico` VALUES (1,1,1);
/*!40000 ALTER TABLE `historial_quirurgico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitalizaciones_graves`
--

DROP TABLE IF EXISTS `hospitalizaciones_graves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitalizaciones_graves` (
  `id_hospitalizaciones_graves` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de hospitalizaciones',
  `detalles` varchar(200) NOT NULL COMMENT 'Descripcion',
  PRIMARY KEY (`id_hospitalizaciones_graves`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitalizaciones_graves`
--

LOCK TABLES `hospitalizaciones_graves` WRITE;
/*!40000 ALTER TABLE `hospitalizaciones_graves` DISABLE KEYS */;
INSERT INTO `hospitalizaciones_graves` VALUES (1,'Nada');
/*!40000 ALTER TABLE `hospitalizaciones_graves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identificacion`
--

DROP TABLE IF EXISTS `identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identificacion` (
  `id_identificacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de identifiacacion',
  `id_identificacion_tipo` int(11) NOT NULL COMMENT 'Clave forania de la identifacion tipo',
  `identidicacion` varchar(20) NOT NULL COMMENT 'Nombre detalles',
  PRIMARY KEY (`id_identificacion`),
  KEY `id_identificacion_tipo` (`id_identificacion_tipo`),
  CONSTRAINT `identificacion_ibfk_1` FOREIGN KEY (`id_identificacion_tipo`) REFERENCES `identificacion_tipo` (`id_identificacion_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identificacion`
--

LOCK TABLES `identificacion` WRITE;
/*!40000 ALTER TABLE `identificacion` DISABLE KEYS */;
INSERT INTO `identificacion` VALUES (1,1,'031-245813-7');
/*!40000 ALTER TABLE `identificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identificacion_tipo`
--

DROP TABLE IF EXISTS `identificacion_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identificacion_tipo` (
  `id_identificacion_tipo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de identifiacacion tipo',
  `tipo` varchar(20) NOT NULL COMMENT 'Detalles',
  PRIMARY KEY (`id_identificacion_tipo`),
  UNIQUE KEY `tipo` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identificacion_tipo`
--

LOCK TABLES `identificacion_tipo` WRITE;
/*!40000 ALTER TABLE `identificacion_tipo` DISABLE KEYS */;
INSERT INTO `identificacion_tipo` VALUES (1,'Cedula');
/*!40000 ALTER TABLE `identificacion_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indiscapacidad`
--

DROP TABLE IF EXISTS `indiscapacidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indiscapacidad` (
  `id_indiscapacidad` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de indiscapacidad',
  `si_indiscapacitado` bit(1) NOT NULL COMMENT 'Condicion si esta afectado',
  `id_indiscapacitaciones` int(11) DEFAULT NULL COMMENT 'Clave Forania de la indiscapacion',
  PRIMARY KEY (`id_indiscapacidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indiscapacidad`
--

LOCK TABLES `indiscapacidad` WRITE;
/*!40000 ALTER TABLE `indiscapacidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `indiscapacidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indiscapacitacion`
--

DROP TABLE IF EXISTS `indiscapacitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indiscapacitacion` (
  `id_indiscapacitacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de indiscapacidad',
  `indiscapacitacion` varchar(100) NOT NULL COMMENT 'Descripcion',
  PRIMARY KEY (`id_indiscapacitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indiscapacitacion`
--

LOCK TABLES `indiscapacitacion` WRITE;
/*!40000 ALTER TABLE `indiscapacitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `indiscapacitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `id_libro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de libro',
  `titulo` varchar(30) NOT NULL COMMENT 'Titulo del libro',
  `id_autor` int(11) NOT NULL COMMENT 'Clave Forania del autor',
  `id_genero` int(11) NOT NULL COMMENT 'Clave forania del genero',
  `id_tipo` int(11) NOT NULL COMMENT 'Clave forania del tipo',
  `id_editorial` int(11) NOT NULL COMMENT 'Clave forania de la pronvincia',
  `idioma` varchar(15) NOT NULL COMMENT 'Idioma del libro',
  PRIMARY KEY (`id_libro`),
  KEY `libro_ibfk_4` (`id_tipo`),
  KEY `libro_ibfk_1` (`id_autor`),
  KEY `libro_ibfk_2` (`id_editorial`),
  KEY `libro_ibfk_3` (`id_genero`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`),
  CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`id_editorial`) REFERENCES `editorial` (`id_editorial`),
  CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`),
  CONSTRAINT `libro_ibfk_4` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_libro` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'El Alquimista',1,1,1,1,'Español'),(3,'Hola',1,1,1,1,'Español'),(4,'Fre',1,1,1,1,'Español'),(5,'h',1,1,1,1,'Español'),(6,'Yar',1,1,1,1,'Español'),(7,'Hola',1,1,1,1,'Español'),(8,'Fre',1,1,1,1,'Español');
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `libro_con_sus_caracteristicas`
--

DROP TABLE IF EXISTS `libro_con_sus_caracteristicas`;
/*!50001 DROP VIEW IF EXISTS `libro_con_sus_caracteristicas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `libro_con_sus_caracteristicas` AS SELECT 
 1 AS `id_libro`,
 1 AS `titulo`,
 1 AS `nombre_autor`,
 1 AS `nombre_genero`,
 1 AS `nombre_editorial`,
 1 AS `nombre_tipo`,
 1 AS `idioma`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `medicamento_tomando`
--

DROP TABLE IF EXISTS `medicamento_tomando`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamento_tomando` (
  `id_medicamento_tomando` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de medicamento',
  `id_medicamentos` int(11) NOT NULL COMMENT 'Clave forania de los medicamentos',
  `otro` varchar(20) DEFAULT NULL COMMENT 'Otros',
  PRIMARY KEY (`id_medicamento_tomando`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamento_tomando`
--

LOCK TABLES `medicamento_tomando` WRITE;
/*!40000 ALTER TABLE `medicamento_tomando` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamento_tomando` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicina`
--

DROP TABLE IF EXISTS `medicina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicina` (
  `id_medicina` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_medicina` varchar(100) NOT NULL,
  `nombre_comun` varchar(50) DEFAULT NULL,
  `id_via` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_medida_medicina` int(11) NOT NULL,
  PRIMARY KEY (`id_medicina`),
  KEY `id_via` (`id_via`),
  KEY `id_tipo` (`id_tipo`),
  KEY `id_medida_medicina` (`id_medida_medicina`),
  CONSTRAINT `medicina_ibfk_1` FOREIGN KEY (`id_via`) REFERENCES `via_medicina` (`id_via_medicina`),
  CONSTRAINT `medicina_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_medicina` (`id_tipo_medicina`),
  CONSTRAINT `medicina_ibfk_3` FOREIGN KEY (`id_medida_medicina`) REFERENCES `medida_medicina` (`id_medida_medicina`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicina`
--

LOCK TABLES `medicina` WRITE;
/*!40000 ALTER TABLE `medicina` DISABLE KEYS */;
INSERT INTO `medicina` VALUES (1,'Acetaminofen','Acetaminofen',1,1,1);
/*!40000 ALTER TABLE `medicina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medida_medicina`
--

DROP TABLE IF EXISTS `medida_medicina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medida_medicina` (
  `id_medida_medicina` int(11) NOT NULL AUTO_INCREMENT,
  `unidad_medida` varchar(20) NOT NULL,
  `abreviacion` varchar(4) NOT NULL,
  PRIMARY KEY (`id_medida_medicina`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medida_medicina`
--

LOCK TABLES `medida_medicina` WRITE;
/*!40000 ALTER TABLE `medida_medicina` DISABLE KEYS */;
INSERT INTO `medida_medicina` VALUES (1,'Miligramo','Mg');
/*!40000 ALTER TABLE `medida_medicina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitoreo_de_usario`
--

DROP TABLE IF EXISTS `monitoreo_de_usario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitoreo_de_usario` (
  `id_monitoreo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `Inicio_de_Sesion` datetime DEFAULT NULL,
  `Ultimo_Inicio_Sesion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_monitoreo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoreo_de_usario`
--

LOCK TABLES `monitoreo_de_usario` WRITE;
/*!40000 ALTER TABLE `monitoreo_de_usario` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitoreo_de_usario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `id_municipio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria Municipio',
  `municipio` varchar(20) DEFAULT NULL COMMENT 'Nombre del municipio',
  `id_ciudad` int(11) NOT NULL COMMENT 'Clave Forania de la ciudad',
  PRIMARY KEY (`id_municipio`),
  KEY `id_ciudad` (`id_ciudad`),
  CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,'Puñal',1);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objeto`
--

DROP TABLE IF EXISTS `objeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objeto` (
  `id_objeto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de Objeto',
  `id_tipo_obejto` int(11) DEFAULT NULL COMMENT 'Clave forania de tipo_objeto',
  `descripcion` varchar(40) DEFAULT NULL COMMENT 'Descripcion de Objeto',
  PRIMARY KEY (`id_objeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objeto`
--

LOCK TABLES `objeto` WRITE;
/*!40000 ALTER TABLE `objeto` DISABLE KEYS */;
/*!40000 ALTER TABLE `objeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operaciones`
--

DROP TABLE IF EXISTS `operaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operaciones` (
  `id_operaciones` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de operaciones',
  `detalles` varchar(200) NOT NULL COMMENT 'detalles',
  `tipo` varchar(20) DEFAULT NULL COMMENT 'Tipo de nivel',
  PRIMARY KEY (`id_operaciones`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operaciones`
--

LOCK TABLES `operaciones` WRITE;
/*!40000 ALTER TABLE `operaciones` DISABLE KEYS */;
INSERT INTO `operaciones` VALUES (1,'Pierna','Produnda');
/*!40000 ALTER TABLE `operaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de pais',
  `pais` varchar(20) NOT NULL COMMENT 'Nombre del pais',
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Republica Dominicana');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parentesco`
--

DROP TABLE IF EXISTS `parentesco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parentesco` (
  `id_parentesco` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de parentesco',
  `parentesco` varchar(20) DEFAULT NULL COMMENT 'Nombre',
  PRIMARY KEY (`id_parentesco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parentesco`
--

LOCK TABLES `parentesco` WRITE;
/*!40000 ALTER TABLE `parentesco` DISABLE KEYS */;
INSERT INTO `parentesco` VALUES (1,'Primo');
/*!40000 ALTER TABLE `parentesco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de Persona',
  `nombre` varchar(50) NOT NULL COMMENT 'Primer Nombre',
  `apellidos` varchar(50) NOT NULL COMMENT 'Primer Apellido',
  `fecha_nac` date NOT NULL COMMENT 'Fecha de nacimiento',
  `id_identificacion` int(11) DEFAULT NULL COMMENT 'Clave forania de identificacion',
  `id_historial_medico` int(11) DEFAULT NULL COMMENT 'Clave forania de historial medico',
  `id_historial_libreria` int(11) NOT NULL COMMENT 'Clave forania de historial biblioteca',
  `id_telefono` int(11) NOT NULL COMMENT 'Clave forania de telefono',
  `id_cargo` int(11) NOT NULL COMMENT 'Clave forania de cargo',
  `id_direccion` int(11) NOT NULL COMMENT 'Clave forania de dirrecion',
  `id_sexo` int(11) NOT NULL COMMENT 'Clave forania de sexo',
  `id_contacto_emergencia` int(11) NOT NULL COMMENT 'Clave forania de contacto de emergencia',
  `edad` int(3) NOT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `id_historial_libreria` (`id_historial_libreria`),
  UNIQUE KEY `id_telefono` (`id_telefono`),
  UNIQUE KEY `id_direccion` (`id_direccion`),
  UNIQUE KEY `id_contacto_emergencia` (`id_contacto_emergencia`),
  UNIQUE KEY `id_identificacion` (`id_identificacion`),
  UNIQUE KEY `id_historial_medico` (`id_historial_medico`),
  KEY `id_cargo` (`id_cargo`),
  KEY `id_sexo` (`id_sexo`),
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_identificacion`) REFERENCES `identificacion` (`id_identificacion`),
  CONSTRAINT `persona_ibfk_3` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`),
  CONSTRAINT `persona_ibfk_4` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `persona_ibfk_5` FOREIGN KEY (`id_sexo`) REFERENCES `sexo` (`id_sexo`),
  CONSTRAINT `persona_ibfk_7` FOREIGN KEY (`id_historial_medico`) REFERENCES `historial_medico` (`id_historial_medico`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Freilyn','Bernabe Paulino','2002-03-29',1,1,1,1,1,1,1,1,0);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo_estudiante`
--

DROP TABLE IF EXISTS `prestamo_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo_estudiante` (
  `Recibo_alumno` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria del presamo',
  `Id_estudiante` int(11) NOT NULL COMMENT 'Clave forania del estudiante',
  `id_Libro` int(11) NOT NULL COMMENT 'Clave Forania de libro',
  `Cantidad` int(11) NOT NULL COMMENT 'Cantidad de libros',
  `Fecha_Prestamo` date NOT NULL COMMENT 'Fecha del prestamo',
  `Fecha_Devolucion` date NOT NULL COMMENT 'Fecha de devolucion',
  PRIMARY KEY (`Recibo_alumno`),
  KEY `id_libro_idx` (`id_Libro`),
  KEY `id_estudiante_idx` (`Id_estudiante`),
  CONSTRAINT `id_estudiante` FOREIGN KEY (`Id_estudiante`) REFERENCES `estudiante` (`id_estudiante`) ON UPDATE CASCADE,
  CONSTRAINT `id_libro` FOREIGN KEY (`id_Libro`) REFERENCES `libro` (`id_libro`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo_estudiante`
--

LOCK TABLES `prestamo_estudiante` WRITE;
/*!40000 ALTER TABLE `prestamo_estudiante` DISABLE KEYS */;
INSERT INTO `prestamo_estudiante` VALUES (1,1,1,1,'2019-05-28','2019-05-29'),(2,1,1,1,'2019-05-28','2019-05-29'),(3,1,1,1,'2019-05-29','2019-05-28'),(4,1,7,1,'2019-05-28','2019-05-30'),(5,1,6,1,'2019-05-28','2019-05-29');
/*!40000 ALTER TABLE `prestamo_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo_profesor`
--

DROP TABLE IF EXISTS `prestamo_profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo_profesor` (
  `Recibo_profe` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de prestamo',
  `id_Profe` int(11) NOT NULL COMMENT 'Clave forania de profesor',
  `id_Libro` int(11) NOT NULL COMMENT 'Clave Forania de libro',
  `Cantidad` int(11) NOT NULL COMMENT 'Cantidad de libros',
  `Fecha_Prestamo` date NOT NULL COMMENT 'Fecha del prestamo',
  `Fecha_Devolucion` date NOT NULL COMMENT 'Fecha de devolucion',
  PRIMARY KEY (`Recibo_profe`),
  KEY `profesor_idx` (`id_Profe`),
  KEY `libro_idx` (`id_Libro`),
  CONSTRAINT `libro` FOREIGN KEY (`id_Libro`) REFERENCES `libro` (`id_libro`) ON UPDATE CASCADE,
  CONSTRAINT `profe` FOREIGN KEY (`id_Profe`) REFERENCES `profe` (`id_profe`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo_profesor`
--

LOCK TABLES `prestamo_profesor` WRITE;
/*!40000 ALTER TABLE `prestamo_profesor` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamo_profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `prestamos_libro_estudiante`
--

DROP TABLE IF EXISTS `prestamos_libro_estudiante`;
/*!50001 DROP VIEW IF EXISTS `prestamos_libro_estudiante`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `prestamos_libro_estudiante` AS SELECT 
 1 AS `Recibo_alumno`,
 1 AS `Id_estudiante`,
 1 AS `id_Libro`,
 1 AS `Cantidad`,
 1 AS `Fecha_Prestamo`,
 1 AS `Fecha_Devolucion`,
 1 AS `titulo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `profe`
--

DROP TABLE IF EXISTS `profe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profe` (
  `id_profe` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de profesor',
  `id_empleado` int(11) NOT NULL COMMENT 'Clave forania de empleado',
  `id_grado` int(11) NOT NULL COMMENT 'Clave forania del grado',
  `id_seccion` int(11) NOT NULL COMMENT 'Clave forania de la seccion',
  `id_taller` int(11) NOT NULL COMMENT 'Clave forania del taller',
  PRIMARY KEY (`id_profe`),
  UNIQUE KEY `id_empleado` (`id_empleado`),
  UNIQUE KEY `id_grado` (`id_grado`),
  UNIQUE KEY `id_seccion` (`id_seccion`),
  UNIQUE KEY `id_taller` (`id_taller`),
  CONSTRAINT `profe_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profe`
--

LOCK TABLES `profe` WRITE;
/*!40000 ALTER TABLE `profe` DISABLE KEYS */;
/*!40000 ALTER TABLE `profe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de provincia',
  `provincia` varchar(20) NOT NULL COMMENT 'Nombre de provincia',
  `id_pais` int(11) NOT NULL COMMENT 'Clave Forania del pais',
  PRIMARY KEY (`id_provincia`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Santiago',1);
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `recibo_alumno`
--

DROP TABLE IF EXISTS `recibo_alumno`;
/*!50001 DROP VIEW IF EXISTS `recibo_alumno`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recibo_alumno` AS SELECT 
 1 AS `nombre`,
 1 AS `apellidos`,
 1 AS `Recibo_alumno`,
 1 AS `Id_estudiante`,
 1 AS `id_Libro`,
 1 AS `Cantidad`,
 1 AS `Fecha_Prestamo`,
 1 AS `Fecha_Devolucion`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `residencia`
--

DROP TABLE IF EXISTS `residencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `residencia` (
  `id_casa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de la casa',
  `residencia` varchar(20) NOT NULL COMMENT 'Nombre de la casa',
  `id_calle` int(11) NOT NULL COMMENT 'Clave Forania de la calle',
  `apartamento` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_casa`),
  KEY `id_calle` (`id_calle`),
  CONSTRAINT `residencia_ibfk_1` FOREIGN KEY (`id_calle`) REFERENCES `calle` (`id_calle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residencia`
--

LOCK TABLES `residencia` WRITE;
/*!40000 ALTER TABLE `residencia` DISABLE KEYS */;
INSERT INTO `residencia` VALUES (1,'#334',1,NULL);
/*!40000 ALTER TABLE `residencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salud_general`
--

DROP TABLE IF EXISTS `salud_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salud_general` (
  `id_salud_general` int(11) NOT NULL AUTO_INCREMENT,
  `id_indiscapacidad` int(11) DEFAULT NULL,
  `id_fuma` int(11) NOT NULL,
  `id_alcohol` int(11) NOT NULL,
  `id_dieta` int(11) NOT NULL,
  `id_cafeina` int(11) NOT NULL,
  `id_ejercicios` int(11) NOT NULL,
  PRIMARY KEY (`id_salud_general`),
  KEY `id_indiscapacidad` (`id_indiscapacidad`),
  KEY `id_fuma` (`id_fuma`),
  KEY `id_alcohol` (`id_alcohol`),
  KEY `id_dieta` (`id_dieta`),
  KEY `id_cafeina` (`id_cafeina`),
  KEY `id_ejercicios` (`id_ejercicios`),
  CONSTRAINT `salud_general_ibfk_1` FOREIGN KEY (`id_indiscapacidad`) REFERENCES `indiscapacidad` (`id_indiscapacidad`),
  CONSTRAINT `salud_general_ibfk_2` FOREIGN KEY (`id_fuma`) REFERENCES `fuma` (`id_fuma`),
  CONSTRAINT `salud_general_ibfk_3` FOREIGN KEY (`id_alcohol`) REFERENCES `alcohol` (`id_alcohol`),
  CONSTRAINT `salud_general_ibfk_4` FOREIGN KEY (`id_dieta`) REFERENCES `dieta` (`id_dieta`),
  CONSTRAINT `salud_general_ibfk_6` FOREIGN KEY (`id_cafeina`) REFERENCES `cafeina` (`id_cafeina`),
  CONSTRAINT `salud_general_ibfk_8` FOREIGN KEY (`id_ejercicios`) REFERENCES `ejercicios` (`id_ejercicios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salud_general`
--

LOCK TABLES `salud_general` WRITE;
/*!40000 ALTER TABLE `salud_general` DISABLE KEYS */;
/*!40000 ALTER TABLE `salud_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salud_general_alergias`
--

DROP TABLE IF EXISTS `salud_general_alergias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salud_general_alergias` (
  `id_salud_general` int(11) NOT NULL,
  `id_alergias` int(11) NOT NULL,
  KEY `id_salud_general` (`id_salud_general`),
  KEY `id_alergias` (`id_alergias`),
  CONSTRAINT `salud_general_alergias_ibfk_1` FOREIGN KEY (`id_salud_general`) REFERENCES `salud_general` (`id_salud_general`),
  CONSTRAINT `salud_general_alergias_ibfk_2` FOREIGN KEY (`id_alergias`) REFERENCES `alergias` (`id_alergias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salud_general_alergias`
--

LOCK TABLES `salud_general_alergias` WRITE;
/*!40000 ALTER TABLE `salud_general_alergias` DISABLE KEYS */;
/*!40000 ALTER TABLE `salud_general_alergias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salud_medicamento`
--

DROP TABLE IF EXISTS `salud_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salud_medicamento` (
  `id_salud_general` int(11) NOT NULL,
  `id_medicamento_tomando` int(11) NOT NULL,
  KEY `id_salud_general` (`id_salud_general`),
  KEY `id_medicamento_tomando` (`id_medicamento_tomando`),
  CONSTRAINT `salud_medicamento_ibfk_1` FOREIGN KEY (`id_salud_general`) REFERENCES `salud_general` (`id_salud_general`),
  CONSTRAINT `salud_medicamento_ibfk_2` FOREIGN KEY (`id_medicamento_tomando`) REFERENCES `medicamento_tomando` (`id_medicamento_tomando`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salud_medicamento`
--

LOCK TABLES `salud_medicamento` WRITE;
/*!40000 ALTER TABLE `salud_medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `salud_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seccion`
--

DROP TABLE IF EXISTS `seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seccion` (
  `id_seccion` int(11) NOT NULL,
  `seccion` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seccion`
--

LOCK TABLES `seccion` WRITE;
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
INSERT INTO `seccion` VALUES (1,'A');
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `id_sexo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de sexo',
  `sexo` varchar(10) NOT NULL COMMENT 'Nombre del sexo',
  PRIMARY KEY (`id_sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taller`
--

DROP TABLE IF EXISTS `taller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taller` (
  `id_taller` int(11) NOT NULL,
  `taller` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_taller`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taller`
--

LOCK TABLES `taller` WRITE;
/*!40000 ALTER TABLE `taller` DISABLE KEYS */;
INSERT INTO `taller` VALUES (1,'Informatica'),(2,'Modas'),(3,'Ebanisteria');
/*!40000 ALTER TABLE `taller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `id_telefono` int(11) NOT NULL AUTO_INCREMENT,
  `telefono` varchar(20) NOT NULL,
  `id_tipo_telefono` int(11) NOT NULL,
  PRIMARY KEY (`id_telefono`),
  KEY `id_tipo_telefono` (`id_tipo_telefono`),
  CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`id_tipo_telefono`) REFERENCES `tipo_telefono` (`id_tipo_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES (1,'8094042683',1);
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ejercicio`
--

DROP TABLE IF EXISTS `tipo_ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_ejercicio` (
  `id_tipo_ejercicio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de tipo ejercicios',
  `tipo` varchar(20) NOT NULL COMMENT 'Tipos',
  PRIMARY KEY (`id_tipo_ejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ejercicio`
--

LOCK TABLES `tipo_ejercicio` WRITE;
/*!40000 ALTER TABLE `tipo_ejercicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_ejercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_libro`
--

DROP TABLE IF EXISTS `tipo_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_libro` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_libro`
--

LOCK TABLES `tipo_libro` WRITE;
/*!40000 ALTER TABLE `tipo_libro` DISABLE KEYS */;
INSERT INTO `tipo_libro` VALUES (1,'Tecnico');
/*!40000 ALTER TABLE `tipo_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_medicina`
--

DROP TABLE IF EXISTS `tipo_medicina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_medicina` (
  `id_tipo_medicina` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_medicina` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_medicina`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_medicina`
--

LOCK TABLES `tipo_medicina` WRITE;
/*!40000 ALTER TABLE `tipo_medicina` DISABLE KEYS */;
INSERT INTO `tipo_medicina` VALUES (1,'Pildora');
/*!40000 ALTER TABLE `tipo_medicina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_objeto`
--

DROP TABLE IF EXISTS `tipo_objeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_objeto` (
  `id_tipo_objeto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Calve Primeria de Tipo Objeto',
  `Nombre_Obejto` varchar(45) DEFAULT NULL COMMENT 'Nombre del Objeto',
  PRIMARY KEY (`id_tipo_objeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_objeto`
--

LOCK TABLES `tipo_objeto` WRITE;
/*!40000 ALTER TABLE `tipo_objeto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_objeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_telefono`
--

DROP TABLE IF EXISTS `tipo_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_telefono` (
  `id_tipo_telefono` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL DEFAULT 'No Especificado',
  PRIMARY KEY (`id_tipo_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_telefono`
--

LOCK TABLES `tipo_telefono` WRITE;
/*!40000 ALTER TABLE `tipo_telefono` DISABLE KEYS */;
INSERT INTO `tipo_telefono` VALUES (1,'Celular');
/*!40000 ALTER TABLE `tipo_telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria de usuario',
  `id_persona` int(11) NOT NULL COMMENT 'Clave forania de la persona',
  `usuario` varchar(20) NOT NULL COMMENT 'Nombre del usuario',
  `clave` varchar(100) NOT NULL COMMENT 'Clave o contraseña',
  `email` varchar(100) NOT NULL COMMENT 'Gmail',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'Freilyn03','clave','Freilyn@gmail.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `via_medicina`
--

DROP TABLE IF EXISTS `via_medicina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `via_medicina` (
  `id_via_medicina` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_via` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_via_medicina`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `via_medicina`
--

LOCK TABLES `via_medicina` WRITE;
/*!40000 ALTER TABLE `via_medicina` DISABLE KEYS */;
INSERT INTO `via_medicina` VALUES (1,'Oral');
/*!40000 ALTER TABLE `via_medicina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'java1'
--

--
-- Final view structure for view `libro_con_sus_caracteristicas`
--

/*!50001 DROP VIEW IF EXISTS `libro_con_sus_caracteristicas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `libro_con_sus_caracteristicas` AS select `libro`.`id_libro` AS `id_libro`,`libro`.`titulo` AS `titulo`,`autor`.`nombre_autor` AS `nombre_autor`,`genero`.`nombre_genero` AS `nombre_genero`,`editorial`.`nombre_editorial` AS `nombre_editorial`,`tipo_libro`.`nombre_tipo` AS `nombre_tipo`,`libro`.`idioma` AS `idioma` from ((((`libro` join `autor`) join `genero`) join `editorial`) join `tipo_libro`) where ((`libro`.`id_tipo` = `tipo_libro`.`id_tipo`) and (`libro`.`id_autor` = `autor`.`id_autor`) and (`libro`.`id_editorial` = `editorial`.`id_editorial`) and (`libro`.`id_genero` = `genero`.`id_genero`)) order by `libro`.`id_libro` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prestamos_libro_estudiante`
--

/*!50001 DROP VIEW IF EXISTS `prestamos_libro_estudiante`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prestamos_libro_estudiante` AS select `prestamo_estudiante`.`Recibo_alumno` AS `Recibo_alumno`,`prestamo_estudiante`.`Id_estudiante` AS `Id_estudiante`,`prestamo_estudiante`.`id_Libro` AS `id_Libro`,`prestamo_estudiante`.`Cantidad` AS `Cantidad`,`prestamo_estudiante`.`Fecha_Prestamo` AS `Fecha_Prestamo`,`prestamo_estudiante`.`Fecha_Devolucion` AS `Fecha_Devolucion`,`libro`.`titulo` AS `titulo` from (`prestamo_estudiante` join `libro`) where (`libro`.`id_libro` = `prestamo_estudiante`.`id_Libro`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recibo_alumno`
--

/*!50001 DROP VIEW IF EXISTS `recibo_alumno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recibo_alumno` AS select `persona`.`nombre` AS `nombre`,`persona`.`apellidos` AS `apellidos`,`prestamo_estudiante`.`Recibo_alumno` AS `Recibo_alumno`,`prestamo_estudiante`.`Id_estudiante` AS `Id_estudiante`,`prestamo_estudiante`.`id_Libro` AS `id_Libro`,`prestamo_estudiante`.`Cantidad` AS `Cantidad`,`prestamo_estudiante`.`Fecha_Prestamo` AS `Fecha_Prestamo`,`prestamo_estudiante`.`Fecha_Devolucion` AS `Fecha_Devolucion` from (((`prestamo_estudiante` join `estudiante`) join `persona`) join `libro`) where ((`persona`.`id_persona` = `estudiante`.`id_persona`) and (`prestamo_estudiante`.`Id_estudiante` = `estudiante`.`id_estudiante`) and (`libro`.`id_libro` = `prestamo_estudiante`.`id_Libro`)) order by `prestamo_estudiante`.`Recibo_alumno` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-03 21:43:23
