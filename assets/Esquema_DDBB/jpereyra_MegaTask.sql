-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jun 29, 2024 at 02:01 PM
-- Server version: 8.4.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jpereyra$MegaTask`
--

-- --------------------------------------------------------

--
-- Table structure for table `Personas`
--

CREATE TABLE `Personas` (
  `id_Persona` int NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Personas`
--

INSERT INTO `Personas` (`id_Persona`, `Nombre`) VALUES
(1, 'Juan Pérez'),
(2, 'María Gómez'),
(3, 'Carlos López'),
(4, 'Ana Ramírez'),
(5, 'Pedro Martínez'),
(6, 'Laura Fernández'),
(7, 'Sergio Rodríguez'),
(8, 'Elena García'),
(9, 'Luis Torres'),
(10, 'Carmen Ruiz'),
(11, 'Javier Sánchez'),
(12, 'Lucía Díaz'),
(13, 'Miguel Vázquez'),
(14, 'Silvia Moreno'),
(15, 'Roberto Castro'),
(16, 'Isabel Morales'),
(17, 'Diego Ortega'),
(18, 'Natalia Herrera'),
(19, 'Ricardo Jiménez'),
(20, 'Beatriz Navarro'),
(21, 'Gabriel Molina'),
(22, 'Patricia Nuñez'),
(23, 'Alejandro Castro'),
(24, 'Susana Aguilar'),
(25, 'José Mendoza'),
(26, 'Verónica Delgado'),
(27, 'Pablo Santos'),
(28, 'Adriana Paredes'),
(29, 'Fernando Cordero'),
(30, 'Marta Bravo');

-- --------------------------------------------------------

--
-- Table structure for table `Proyectos`
--

CREATE TABLE `Proyectos` (
  `id_Proyecto` int NOT NULL,
  `Nombre_Proyecto` varchar(50) NOT NULL,
  `Descripcion_Proyecto` text NOT NULL,
  `id_Persona` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Proyectos`
--

INSERT INTO `Proyectos` (`id_Proyecto`, `Nombre_Proyecto`, `Descripcion_Proyecto`, `id_Persona`) VALUES
(1, 'Sistema de Gestión de Inventarios', 'Desarrollo de un sistema para gestionar inventarios de productos.', 1),
(2, 'Plataforma de Gestión de Clientes', 'Diseño y desarrollo de una plataforma web para la gestión de clientes.', 2),
(3, 'Aplicación Móvil de Noticias', 'Creación de una app móvil para visualizar noticias en tiempo real.', 3),
(4, 'Sistema de Reservas de Vuelos', 'Implementación de un sistema para la reserva de vuelos en línea.', 4),
(5, 'Plataforma Educativa Online', 'Desarrollo de una plataforma para cursos y tutoriales en línea.', 5),
(6, 'Aplicación de Gestión de Proyectos', 'Diseño de una app para gestionar proyectos empresariales.', 6),
(7, 'Sistema de Facturación Electrónica', 'Implementación de un sistema para la facturación electrónica.', 7),
(8, 'Plataforma de eCommerce', 'Desarrollo de una plataforma de comercio electrónico.', 8),
(9, 'Red Social para Viajeros', 'Creación de una red social para compartir experiencias de viajes.', 9),
(10, 'Sistema de Gestión de Recursos Humanos', 'Desarrollo de un sistema integral para la gestión de RRHH.', 10),
(11, 'Plataforma de Análisis de Datos', 'Diseño y desarrollo de una plataforma para análisis de datos empresariales.', 11),
(12, 'Aplicación de Entrenamiento Personal', 'Creación de una app para planificar rutinas de entrenamiento personalizado.', 12),
(13, 'Sistema de Control de Acceso', 'Implementación de un sistema para controlar el acceso a instalaciones.', 13),
(14, 'Plataforma de Gestión de Eventos', 'Desarrollo de una plataforma para la gestión de eventos y conferencias.', 14),
(15, 'Aplicación de Gestión de Finanzas Personales', 'Diseño de una app para el control y gestión de finanzas personales.', 15),
(16, 'Sistema de Reservas de Hoteles', 'Implementación de un sistema para la reserva de hoteles en línea.', 16),
(17, 'Plataforma de Gestión de Documentos', 'Desarrollo de una plataforma para la gestión y almacenamiento de documentos.', 17),
(18, 'Red Social Profesional', 'Creación de una red social orientada a profesionales y networking.', 18),
(19, 'Sistema de Ticketing para Soporte Técnico', 'Implementación de un sistema para la gestión de tickets de soporte técnico.', 19),
(20, 'Plataforma de Asistencia Virtual', 'Desarrollo de una plataforma para asistencia virtual y atención al cliente.', 20);

-- --------------------------------------------------------

--
-- Table structure for table `Tareas`
--

CREATE TABLE `Tareas` (
  `id_Tarea` int NOT NULL,
  `Tarea_Nombre` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tarea_Descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Tarea_Tipo` varchar(50) NOT NULL,
  `Fecha_Vencimiento` date NOT NULL,
  `Fecha_Creacion` date NOT NULL,
  `id_Proyecto` int DEFAULT NULL,
  `id_Persona` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Tareas`
--

INSERT INTO `Tareas` (`id_Tarea`, `Tarea_Nombre`, `Tarea_Descripcion`, `Tarea_Tipo`, `Fecha_Vencimiento`, `Fecha_Creacion`, `id_Proyecto`, `id_Persona`) VALUES
(79, 'Diseño de interfaz de usuario', 'Diseñar la interfaz gráfica para el sistema de gestión de inventarios.', 'Desarrollo', '2024-07-15', '2024-07-01', 1, 1),
(80, 'Implementación de base de datos', 'Configurar y optimizar la base de datos del sistema de gestión de clientes.', 'Desarrollo', '2024-07-20', '2024-07-05', 2, 2),
(81, 'Desarrollo de backend de noticias', 'Programar la lógica de negocio del backend para la aplicación móvil de noticias.', 'Desarrollo', '2024-07-25', '2024-07-10', 3, 3),
(82, 'Integración de APIs de aerolíneas', 'Integrar APIs de diferentes aerolíneas para el sistema de reservas de vuelos.', 'Desarrollo', '2024-07-18', '2024-07-02', 4, 4),
(83, 'Creación de contenido educativo', 'Desarrollar contenido multimedia para la plataforma educativa online.', 'Desarrollo', '2024-07-22', '2024-07-07', 5, 5),
(84, 'Optimización de rendimiento', 'Optimizar el rendimiento y la eficiencia de la aplicación de gestión de proyectos.', 'Desarrollo', '2024-07-28', '2024-07-12', 6, 6),
(85, 'Implementación de módulo de facturación', 'Implementar el módulo de facturación electrónica en la plataforma de eCommerce.', 'Desarrollo', '2024-07-16', '2024-07-03', 7, 7),
(86, 'Diseño de interfaz de usuario', 'Diseñar la interfaz gráfica para la red social para viajeros.', 'Desarrollo', '2024-07-21', '2024-07-06', 8, 8),
(87, 'Configuración de políticas de RRHH', 'Configurar las políticas y procedimientos del sistema de gestión de RRHH.', 'Desarrollo', '2024-07-26', '2024-07-11', 9, 9),
(88, 'Análisis de datos empresariales', 'Realizar análisis y reportes de datos para la plataforma de análisis de datos.', 'Desarrollo', '2024-07-17', '2024-07-04', 10, 10),
(89, 'Desarrollo de algoritmo de recomendaciones', 'Desarrollar un algoritmo de recomendaciones para la aplicación de entrenamiento personal.', 'Desarrollo', '2024-07-23', '2024-07-08', 11, 11),
(90, 'Configuración de sistema de seguridad', 'Configurar el sistema de control de acceso para las instalaciones corporativas.', 'Desarrollo', '2024-07-27', '2024-07-13', 12, 12),
(91, 'Planificación de logística para eventos', 'Planificar la logística y recursos para eventos en la plataforma de gestión de eventos.', 'Desarrollo', '2024-07-19', '2024-07-01', 13, 13),
(92, 'Desarrollo de funcionalidades financieras', 'Desarrollar funcionalidades de gestión financiera para la app de finanzas personales.', 'Desarrollo', '2024-07-24', '2024-07-05', 14, 14),
(93, 'Integración de APIs de hoteles', 'Integrar APIs de diferentes hoteles para el sistema de reservas de hoteles.', 'Desarrollo', '2024-07-29', '2024-07-10', 15, 15),
(94, 'Implementación de sistema de gestión documental', 'Implementar el sistema de gestión documental para la plataforma de gestión de documentos.', 'Desarrollo', '2024-07-18', '2024-07-02', 16, 16),
(95, 'Desarrollo de herramientas de networking', 'Desarrollar herramientas de networking para la red social profesional.', 'Desarrollo', '2024-07-22', '2024-07-07', 17, 17),
(96, 'Optimización de procesos de soporte técnico', 'Optimizar los procesos de soporte técnico en el sistema de ticketing.', 'Desarrollo', '2024-07-28', '2024-07-12', 18, 18),
(97, 'Implementación de asistencia virtual', 'Implementar el sistema de asistencia virtual para la plataforma de atención al cliente.', 'Desarrollo', '2024-07-16', '2024-07-03', 19, 19),
(98, 'Pruebas de usabilidad y rendimiento', 'Realizar pruebas de usabilidad y rendimiento en la plataforma de gestión de inventarios.', 'Pruebas', '2024-07-21', '2024-07-06', 1, 1),
(99, 'Testing y depuración de código', 'Realizar testing y depuración de código en la plataforma de gestión de clientes.', 'Pruebas', '2024-07-26', '2024-07-11', 2, 2),
(100, 'Verificación de integración de APIs', 'Verificar la integración de APIs en la aplicación móvil de noticias.', 'Pruebas', '2024-07-27', '2024-07-13', 3, 3),
(101, 'Evaluación de funcionalidades educativas', 'Evaluar las funcionalidades educativas en la plataforma educativa online.', 'Pruebas', '2024-07-18', '2024-07-01', 4, 4),
(102, 'Testing de seguridad y protección de datos', 'Realizar testing de seguridad y protección de datos en la aplicación de gestión de proyectos.', 'Pruebas', '2024-07-22', '2024-07-05', 5, 5),
(103, 'Validación de facturación electrónica', 'Validar la facturación electrónica en la plataforma de eCommerce.', 'Pruebas', '2024-07-29', '2024-07-10', 6, 6),
(104, 'Pruebas de usabilidad en red social para viajeros', 'Realizar pruebas de usabilidad en la red social para viajeros.', 'Pruebas', '2024-07-19', '2024-07-02', 7, 7),
(105, 'Testing de procesos de RRHH', 'Realizar testing de los procesos de RRHH en el sistema de gestión de RRHH.', 'Pruebas', '2024-07-23', '2024-07-07', 8, 8),
(106, 'Evaluación de análisis de datos', 'Evaluar los análisis de datos realizados en la plataforma de análisis de datos.', 'Pruebas', '2024-07-28', '2024-07-12', 9, 9),
(107, 'Testing de funcionalidades de entrenamiento personal', 'Realizar testing de las funcionalidades de entrenamiento personal en la app correspondiente.', 'Pruebas', '2024-07-17', '2024-07-03', 10, 10),
(108, 'Validación de sistemas de seguridad', 'Validar los sistemas de seguridad implementados en el sistema de control de acceso.', 'Pruebas', '2024-07-21', '2024-07-06', 11, 11),
(109, 'Pruebas de logística para eventos', 'Realizar pruebas de logística para eventos en la plataforma de gestión de eventos.', 'Pruebas', '2024-07-26', '2024-07-11', 12, 12),
(110, 'Evaluación de funcionalidades financieras', 'Evaluar las funcionalidades financieras implementadas en la app de finanzas personales.', 'Pruebas', '2024-07-27', '2024-07-13', 13, 13),
(111, 'Testing de reservas de hoteles', 'Realizar testing de reservas de hoteles en la plataforma correspondiente.', 'Pruebas', '2024-07-18', '2024-07-01', 14, 14),
(112, 'Validación de gestión documental', 'Validar la gestión documental implementada en la plataforma de gestión de documentos.', 'Pruebas', '2024-07-22', '2024-07-05', 15, 15),
(113, 'Pruebas de networking', 'Realizar pruebas de networking en la red social profesional.', 'Pruebas', '2024-07-29', '2024-07-10', 16, 16),
(114, 'Testing de tickets de soporte técnico', 'Realizar testing de tickets de soporte técnico en el sistema de ticketing.', 'Pruebas', '2024-07-19', '2024-07-02', 17, 17),
(115, 'Evaluación de asistencia virtual', 'Evaluar la asistencia virtual proporcionada en la plataforma de atención al cliente.', 'Pruebas', '2024-07-23', '2024-07-07', 18, 18),
(116, 'Documentación de requisitos de usuario', 'Documentar los requisitos de usuario para el sistema de gestión de inventarios.', 'Documentación', '2024-07-28', '2024-07-12', 19, 19),
(117, 'Creación de manuales de usuario', 'Crear manuales de usuario para la plataforma de gestión de clientes.', 'Documentación', '2024-07-16', '2024-07-03', 20, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Personas`
--
ALTER TABLE `Personas`
  ADD PRIMARY KEY (`id_Persona`);

--
-- Indexes for table `Proyectos`
--
ALTER TABLE `Proyectos`
  ADD PRIMARY KEY (`id_Proyecto`),
  ADD KEY `id_Persona` (`id_Persona`);

--
-- Indexes for table `Tareas`
--
ALTER TABLE `Tareas`
  ADD PRIMARY KEY (`id_Tarea`),
  ADD KEY `id_Proyecto` (`id_Proyecto`),
  ADD KEY `id_Persona` (`id_Persona`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Personas`
--
ALTER TABLE `Personas`
  MODIFY `id_Persona` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `Proyectos`
--
ALTER TABLE `Proyectos`
  MODIFY `id_Proyecto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `Tareas`
--
ALTER TABLE `Tareas`
  MODIFY `id_Tarea` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Proyectos`
--
ALTER TABLE `Proyectos`
  ADD CONSTRAINT `Proyectos_ibfk_1` FOREIGN KEY (`id_Persona`) REFERENCES `Personas` (`id_Persona`);

--
-- Constraints for table `Tareas`
--
ALTER TABLE `Tareas`
  ADD CONSTRAINT `Tareas_ibfk_1` FOREIGN KEY (`id_Proyecto`) REFERENCES `Proyectos` (`id_Proyecto`),
  ADD CONSTRAINT `Tareas_ibfk_2` FOREIGN KEY (`id_Persona`) REFERENCES `Personas` (`id_Persona`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
