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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'f41d366d-91e5-11e9-8525-cecd028ee826:1-140768481';

--
-- Table structure for table `Tareas`
--

DROP TABLE IF EXISTS `Tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tareas` (
  `id_Tarea` int(11) NOT NULL AUTO_INCREMENT,
  `Tarea_Nombre` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tarea_Descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tarea_Tipo` varchar(50) NOT NULL,
  `Fecha_Vencimiento` date NOT NULL,
  `Fecha_Creacion` date NOT NULL,
  `id_Proyecto` int(11) DEFAULT NULL,
  `id_Persona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Tarea`),
  KEY `id_Proyecto` (`id_Proyecto`),
  KEY `id_Persona` (`id_Persona`),
  CONSTRAINT `Tareas_ibfk_1` FOREIGN KEY (`id_Proyecto`) REFERENCES `Proyectos` (`id_Proyecto`),
  CONSTRAINT `Tareas_ibfk_2` FOREIGN KEY (`id_Persona`) REFERENCES `Personas` (`id_Persona`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tareas`
--

LOCK TABLES `Tareas` WRITE;
/*!40000 ALTER TABLE `Tareas` DISABLE KEYS */;
INSERT INTO `Tareas` VALUES (1,'Diseño de interfaz de usuario','Diseñar la interfaz gráfica para el sistema de gestión de inventarios.','Desarrollo','2024-07-15','2024-07-01',1,1),(2,'Implementación de base de datos','Configurar y optimizar la base de datos del sistema de gestión de clientes.','Desarrollo','2024-07-20','2024-07-05',2,2),(3,'Desarrollo de backend de noticias','Programar la lógica de negocio del backend para la aplicación móvil de noticias.','Desarrollo','2024-07-25','2024-07-10',3,3),(4,'Integración de APIs de aerolíneas','Integrar APIs de diferentes aerolíneas para el sistema de reservas de vuelos.','Desarrollo','2024-07-18','2024-07-02',4,4),(5,'Creación de contenido educativo','Desarrollar contenido multimedia para la plataforma educativa online.','Desarrollo','2024-07-22','2024-07-07',5,5),(6,'Optimización de rendimiento','Optimizar el rendimiento y la eficiencia de la aplicación de gestión de proyectos.','Desarrollo','2024-07-28','2024-07-12',6,6),(7,'Implementación de módulo de facturación','Implementar el módulo de facturación electrónica en la plataforma de eCommerce.','Desarrollo','2024-07-16','2024-07-03',7,7),(8,'Diseño de interfaz de usuario','Diseñar la interfaz gráfica para la red social para viajeros.','Desarrollo','2024-07-21','2024-07-06',8,8),(9,'Configuración de políticas de RRHH','Configurar las políticas y procedimientos del sistema de gestión de RRHH.','Desarrollo','2024-07-26','2024-07-11',9,9),(10,'Análisis de datos empresariales','Realizar análisis y reportes de datos para la plataforma de análisis de datos.','Desarrollo','2024-07-17','2024-07-04',10,10),(11,'Desarrollo de algoritmo de recomendaciones','Desarrollar un algoritmo de recomendaciones para la aplicación de entrenamiento personal.','Desarrollo','2024-07-23','2024-07-08',11,11),(12,'Configuración de sistema de seguridad','Configurar el sistema de control de acceso para las instalaciones corporativas.','Desarrollo','2024-07-27','2024-07-13',12,12),(13,'Planificación de logística para eventos','Planificar la logística y recursos para eventos en la plataforma de gestión de eventos.','Desarrollo','2024-07-19','2024-07-01',13,13),(14,'Desarrollo de funcionalidades financieras','Desarrollar funcionalidades de gestión financiera para la app de finanzas personales.','Desarrollo','2024-07-24','2024-07-05',14,14),(15,'Integración de APIs de hoteles','Integrar APIs de diferentes hoteles para el sistema de reservas de hoteles.','Desarrollo','2024-07-29','2024-07-10',15,15),(16,'Implementación de sistema de gestión documental','Implementar el sistema de gestión documental para la plataforma de gestión de documentos.','Desarrollo','2024-07-18','2024-07-02',16,16),(18,'Optimización de procesos de soporte técnico','Optimizar los procesos de soporte técnico en el sistema de ticketing.','Desarrollo','2024-07-28','2024-07-12',18,18),(19,'Implementación de asistencia virtual','Implementar el sistema de asistencia virtual para la plataforma de atención al cliente.','Desarrollo','2024-07-16','2024-07-03',19,19),(20,'Pruebas de usabilidad y rendimiento','Realizar pruebas de usabilidad y rendimiento en la plataforma de gestión de inventarios.','Pruebas','2024-07-21','2024-07-06',1,1),(21,'Testing y depuración de código','Realizar testing y depuración de código en la plataforma de gestión de clientes.','Pruebas','2024-07-26','2024-07-11',2,2),(22,'Verificación de integración de APIs','Verificar la integración de APIs en la aplicación móvil de noticias.','Pruebas','2024-07-27','2024-07-13',3,3),(23,'Evaluación de funcionalidades educativas','Evaluar las funcionalidades educativas en la plataforma educativa online.','Pruebas','2024-07-18','2024-07-01',4,4),(24,'Testing de seguridad y protección de datos','Realizar testing de seguridad y protección de datos en la aplicación de gestión de proyectos.','Pruebas','2024-07-22','2024-07-05',5,5),(25,'Validación de facturación electrónica','Validar la facturación electrónica en la plataforma de eCommerce.','Pruebas','2024-07-29','2024-07-10',6,6),(26,'Pruebas de usabilidad en red social para viajeros','Realizar pruebas de usabilidad en la red social para viajeros.','Pruebas','2024-07-19','2024-07-02',7,7),(27,'Testing de procesos de RRHH','Realizar testing de los procesos de RRHH en el sistema de gestión de RRHH.','Pruebas','2024-07-23','2024-07-07',8,8),(28,'Evaluación de análisis de datos','Evaluar los análisis de datos realizados en la plataforma de análisis de datos.','Pruebas','2024-07-28','2024-07-12',9,9),(29,'Testing de funcionalidades de entrenamiento personal','Realizar testing de las funcionalidades de entrenamiento personal en la app correspondiente.','Pruebas','2024-07-17','2024-07-03',10,10),(30,'Validación de sistemas de seguridad','Validar los sistemas de seguridad implementados en el sistema de control de acceso.','Pruebas','2024-07-21','2024-07-06',11,11),(31,'Pruebas de logística para eventos','Realizar pruebas de logística para eventos en la plataforma de gestión de eventos.','Pruebas','2024-07-26','2024-07-11',12,12),(32,'Evaluación de funcionalidades financieras','Evaluar las funcionalidades financieras implementadas en la app de finanzas personales.','Pruebas','2024-07-27','2024-07-13',13,13),(33,'Testing de reservas de hoteles','Realizar testing de reservas de hoteles en la plataforma correspondiente.','Pruebas','2024-07-18','2024-07-01',14,14),(34,'Validación de gestión documental','Validar la gestión documental implementada en la plataforma de gestión de documentos.','Pruebas','2024-07-22','2024-07-05',15,15),(35,'Pruebas de networking','Realizar pruebas de networking en la red social profesional.','Pruebas','2024-07-29','2024-07-10',16,16),(37,'Evaluación de asistencia virtual','Evaluar la asistencia virtual proporcionada en la plataforma de atención al cliente.','Pruebas','2024-07-23','2024-07-07',18,18),(38,'Documentación de requisitos de usuario','Documentar los requisitos de usuario para el sistema de gestión de inventarios.','Documentación','2024-07-28','2024-07-12',19,19),(39,'Creación de manuales de usuario','Crear manuales de usuario para la plataforma de gestión de clientes.','Documentación','2024-07-16','2024-07-03',20,20);
/*!40000 ALTER TABLE `Tareas` ENABLE KEYS */;
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

-- Dump completed on 2024-07-03  8:32:36
