-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: bvscsukiuuob2dodepv4-mysql.services.clever-cloud.com    Database: bvscsukiuuob2dodepv4
-- ------------------------------------------------------
-- Server version	8.0.15-5

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'f41d366d-91e5-11e9-8525-cecd028ee826:1-140768478';

--
-- Table structure for table `Proyectos`
--

DROP TABLE IF EXISTS `Proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Proyectos` (
  `id_Proyecto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Proyecto` varchar(50) NOT NULL,
  `Descripcion_Proyecto` text NOT NULL,
  `id_Persona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Proyecto`),
  KEY `id_Persona` (`id_Persona`),
  CONSTRAINT `Proyectos_ibfk_1` FOREIGN KEY (`id_Persona`) REFERENCES `Personas` (`id_Persona`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proyectos`
--

LOCK TABLES `Proyectos` WRITE;
/*!40000 ALTER TABLE `Proyectos` DISABLE KEYS */;
INSERT INTO `Proyectos` VALUES (1,'Sistema de Gestión de Inventarios','Desarrollo de un sistema para gestionar inventarios de productos.',1),(2,'Plataforma de Gestión de Clientes','Diseño y desarrollo de una plataforma web para la gestión de clientes.',2),(3,'Aplicación Móvil de Noticias','Creación de una app móvil para visualizar noticias en tiempo real.',3),(4,'Sistema de Reservas de Vuelos','Implementación de un sistema para la reserva de vuelos en línea.',4),(5,'Plataforma Educativa Online','Desarrollo de una plataforma para cursos y tutoriales en línea.',5),(6,'Aplicación de Gestión de Proyectos','Diseño de una app para gestionar proyectos empresariales.',6),(7,'Sistema de Facturación local','Diseño',7),(8,'Plataforma de eCommerce','Desarrollo de una plataforma de comercio electrónico.',8),(9,'Red Social para Viajeros y turistas','Desarrollo',9),(10,'Sistema de Gestión de Recursos Humanos','Desarrollo de un sistema integral para la gestión de RRHH.',10),(11,'Plataforma de Análisis de Datos','Diseño y desarrollo de una plataforma para análisis de datos empresariales.',11),(12,'Aplicación de Entrenamiento Personal','Creación de una app para planificar rutinas de entrenamiento personalizado.',12),(13,'Sistema de Control de Acceso y monitoreo','Hardware',13),(14,'Plataforma de Gestión de Eventos','Desarrollo de una plataforma para la gestión de eventos y conferencias.',14),(15,'Aplicación de Gestión de Finanzas Personales','Diseño de una app para el control y gestión de finanzas personales.',15),(16,'Sistema de Reservas de Hoteles','Implementación de un sistema para la reserva de hoteles en línea.',16),(18,'Red Social Profesional','Creación de una red social orientada a profesionales y networking.',18),(19,'Sistema de Ticketing para Soporte Técnico','Implementación de un sistema para la gestión de tickets de soporte técnico.',19),(20,'Plataforma de Asistencia Virtual','Desarrollo de una plataforma para asistencia virtual y atención al cliente.',20),(22,'nuevo proyecto','Desarrollo',1),(23,'Proyecto Test','Proyecto de prueba test 1.0',12),(24,'Proyecto test 2.0','Desarrollo 123',34),(25,'ABC','123',19),(26,'Proyecto Prueba ','Diseño',17);
/*!40000 ALTER TABLE `Proyectos` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-03  8:32:32
