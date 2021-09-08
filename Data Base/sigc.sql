-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-09-2021 a las 04:23:15
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sigc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL,
  `id_Usuario` int(8) DEFAULT NULL,
  `codigo` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `id_Usuario`, `codigo`) VALUES
(20, 4, 10000101),
(21, 16, 10000102),
(22, 17, 10000103);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `id_asignatura` int(4) NOT NULL,
  `nombre_asignatura` varchar(20) NOT NULL,
  `Tipo_asignatura` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`id_asignatura`, `nombre_asignatura`, `Tipo_asignatura`) VALUES
(200, 'Sociales', 'Historia'),
(201, 'Biologia', 'Ciencia N'),
(202, 'Algebra', 'Matematicas'),
(203, 'E_Fisica', 'Deporte'),
(204, 'Quimica', 'Ciencia N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `año`
--

CREATE TABLE `año` (
  `id_año` int(4) NOT NULL,
  `año_curso` year(4) NOT NULL,
  `id_estudiante` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `numero_curso` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `año`
--

INSERT INTO `año` (`id_año`, `año_curso`, `id_estudiante`, `id_docente`, `numero_curso`) VALUES
(4001, 2020, 1000, 200, 702);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `id_clase` int(8) NOT NULL,
  `id_estudiante` int(11) DEFAULT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `id_asignatura` int(4) DEFAULT NULL,
  `id_notas` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`id_clase`, `id_estudiante`, `id_docente`, `id_asignatura`, `id_notas`) VALUES
(500, 1000, 200, 201, 2000),
(539, 1001, 201, 203, 2001),
(541, 1002, 203, 204, 2002),
(543, 1003, 201, 204, 2003),
(545, 1004, 201, 203, 2004),
(547, 1005, 204, 201, 2005),
(548, 1006, 204, 202, 2006),
(549, 1007, 205, 202, 2007),
(550, 1008, 205, 204, 2008),
(552, 1009, 203, 200, 2009);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `numero_curso` int(4) NOT NULL,
  `grado_curso` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`numero_curso`, `grado_curso`) VALUES
(601, 'Sexto'),
(602, 'Sexto'),
(603, 'Sexto'),
(701, 'Septimo'),
(702, 'Septimo'),
(801, 'octavo'),
(802, 'octavo'),
(803, 'octavo'),
(901, 'noveno'),
(902, 'noveno'),
(903, 'noveno'),
(1001, 'decimo'),
(1002, 'decimo'),
(1101, 'once'),
(1102, 'once'),
(1103, 'once');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_adicionales`
--

CREATE TABLE `datos_adicionales` (
  `id_datos_adicionales` int(8) NOT NULL,
  `correo` varchar(20) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `sexo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `datos_adicionales`
--

INSERT INTO `datos_adicionales` (`id_datos_adicionales`, `correo`, `Telefono`, `sexo`) VALUES
(100, 'jolu@gmail.com', '3124567890', 'M'),
(101, 'marialuz@misena.edu.', '3216789034', 'F'),
(102, 'amartinez9837@misena', '3128323234', 'M'),
(103, 'aleduque07@misena.ed', '3204012879', 'M'),
(104, 'estefa03@gmail.com', '3139908657', 'F'),
(105, 'juliancas12@gmail.co', '3124567890', 'M'),
(106, 'AlexaJ@gmail.com', '3116789043', 'F'),
(107, 'luisalg@hotmail.com', '3208976545', 'M'),
(108, 'Andresg@hotmail.com', '3004417896', 'M'),
(109, 'Andreisv@outlook.com', '3016666668', 'M'),
(110, 'Maricab@gmail.com', '3215678903', 'F'),
(111, 'Albedyrom@hotmail.co', '3057789065', 'M'),
(112, 'Soyfer@gmail.com', '3004496745', 'F'),
(113, 'Elverdagala@outlook.', '3128356745', 'M'),
(114, 'dsportocarreno@misen', '3105620541', 'M'),
(115, 'fsrojas26@misena.edu', '3118447218', 'M'),
(116, 'Cecillar@gmail.com', '3047895644', 'M'),
(117, 'Claritahu@hotmail.co', '32145678790', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `definitivas`
--

CREATE TABLE `definitivas` (
  `id_notas` int(15) NOT NULL,
  `definitiva_B1` int(3) DEFAULT NULL,
  `definitiva_B2` int(3) DEFAULT NULL,
  `definitiva_B3` int(3) DEFAULT NULL,
  `definitiva_B4` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `definitivas`
--

INSERT INTO `definitivas` (`id_notas`, `definitiva_B1`, `definitiva_B2`, `definitiva_B3`, `definitiva_B4`) VALUES
(2000, 67, 80, NULL, NULL),
(2001, 89, 88, NULL, NULL),
(2002, 90, 94, NULL, NULL),
(2003, 30, 93, NULL, NULL),
(2004, 78, 78, NULL, NULL),
(2005, 77, 32, NULL, NULL),
(2006, 87, 89, NULL, NULL),
(2007, 90, 78, NULL, NULL),
(2008, 95, 91, NULL, NULL),
(2009, 89, 78, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `id_docente` int(11) NOT NULL,
  `id_Usuario` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`id_docente`, `id_Usuario`) VALUES
(200, 2),
(201, 3),
(203, 13),
(204, 18),
(205, 19);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id_documento` int(15) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `id_Usuario` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id_documento`, `descripcion`, `id_Usuario`) VALUES
(3123709, 'Cedula de Ciudadania', 4),
(3123789, 'Cedula de Ciudadania', 13),
(3127875, 'Cedula de Ciudadania', 19),
(4568902, 'Cedula de ciudadania', 3),
(20567890, 'Cedula de Ciudadania', 2),
(20890786, 'Cedula de Ciudadania', 18),
(1000067543, 'Tarjeta de identidad', 14),
(1000345673, 'Tarjeta de identidad', 11),
(1000346789, 'Tarjeta de identidad', 9),
(1000349876, 'Tarjeta de identidad', 10),
(1000357899, 'Tarjeta de identidad', 8),
(1000678999, 'Cedula de Ciudadania', 17),
(1003456429, 'Tarjeta de identidad', 6),
(1003678456, 'Tarjeta de identidad', 1),
(1004567832, 'Tarjeta de identidad', 12),
(1005678932, 'Cedula de ciudadania', 16),
(1005789393, 'Tarjeta de identidad', 7),
(1007890321, 'Tarjeta de identidad', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id_estudiante` int(11) NOT NULL,
  `n_matricula` int(15) NOT NULL,
  `id_Usuario` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `n_matricula`, `id_Usuario`) VALUES
(1000, 3301111, 1),
(1001, 3301112, 6),
(1002, 3301113, 7),
(1003, 3301114, 8),
(1004, 3301115, 9),
(1005, 3301116, 10),
(1006, 3301117, 11),
(1007, 3301118, 12),
(1008, 3301119, 14),
(1009, 3301120, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` char(1) NOT NULL,
  `tipo_rol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `tipo_rol`) VALUES
('A', 'Administrador'),
('D', 'Docente'),
('E', 'Estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_Usuario` int(8) NOT NULL,
  `nombre_perfil` varchar(30) NOT NULL,
  `id_rol` char(1) NOT NULL,
  `p_nombre` varchar(30) NOT NULL,
  `s_nombre` varchar(30) DEFAULT NULL,
  `p_apellido` varchar(30) NOT NULL,
  `s_apellido` varchar(30) DEFAULT NULL,
  `edad` int(2) NOT NULL,
  `contraseña` varchar(10) NOT NULL,
  `id_datos_adicionales` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_Usuario`, `nombre_perfil`, `id_rol`, `p_nombre`, `s_nombre`, `p_apellido`, `s_apellido`, `edad`, `contraseña`, `id_datos_adicionales`) VALUES
(1, 'joseM', 'E', 'Jose', 'Luis', 'Mendéz', '', 13, '1345678890', 100),
(2, 'Marialu', 'D', 'Maria', 'Luz', 'Camacho', 'Parra', 51, 'Mlc2345872', 101),
(3, 'Arist', 'D', 'Aristobulo', '', 'Martinéz', 'Cruz', 42, 'martinez45', 102),
(4, 'Aledu', 'A', 'Alejandro', '', 'Duque', 'Escobar', 30, 'jasinto123', 103),
(6, 'estefin', 'E', 'Estefania', '', 'Goméz', 'Rodriguéz', 15, 'eegomez678', 104),
(7, 'Julic', 'E', 'Julian', 'Camilo', 'Castro', 'Cruz', 13, 'Juliccc345', 105),
(8, 'Yulijc', 'E', 'Yulieth', 'Alexandra', 'Cubillos', 'Arias', 17, 'Alexa12321', 106),
(9, 'Luish', 'E', 'Luis', 'Alfonso', 'Goméz', 'Ramos', 13, 'Jalo4567', 107),
(10, 'Adreisg', 'E', 'Andres', 'Guillermo', 'Goméz', 'Ramos', 15, 'Andreig908', 108),
(11, 'Andrefeli', 'E', 'Andres', 'Felipe', 'Villalobos', 'Galeano', 17, 'felipito45', 109),
(12, 'Mariiii', 'E', 'Maria', 'Camila', 'Acosta', 'Benavidez', 14, 'bena145678', 110),
(13, 'Albejalo', 'D', 'Albedy', 'Roman', 'Quiñones', 'Acosta', 33, 'Donalbedy3', 111),
(14, 'Fernanfra', 'E', 'Fernanda', '', 'Lopéz', 'Castro', 14, 'soyfer76', 112),
(15, 'elverda', 'E', 'Elver', 'David', 'Galarga', 'Forero', 17, 'elvergalar', 113),
(16, 'Diilli', 'A', 'Dillan', 'Smith', 'Portocarrero', 'Rojas', 19, 'Dilliporto', 114),
(17, 'Santifabi', 'A', 'Farith', 'Santiago', 'Rojas', 'Garzón', 19, 'Srrojas26', 115),
(18, 'Cesarlll', 'D', 'Cesar', 'Luis', 'Velasquez', 'Parrado', 31, 'Crluis78', 116),
(19, 'Clarasssh', 'D', 'Clara', 'Mayerli', 'Torres', 'Mendoza', 32, 'clarashu90', 117);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`),
  ADD KEY `id_Usuario` (`id_Usuario`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asignatura`);

--
-- Indices de la tabla `año`
--
ALTER TABLE `año`
  ADD PRIMARY KEY (`id_año`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_docente` (`id_docente`),
  ADD KEY `numero_curso` (`numero_curso`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`id_clase`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `id_docente` (`id_docente`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_notas` (`id_notas`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`numero_curso`);

--
-- Indices de la tabla `datos_adicionales`
--
ALTER TABLE `datos_adicionales`
  ADD PRIMARY KEY (`id_datos_adicionales`);

--
-- Indices de la tabla `definitivas`
--
ALTER TABLE `definitivas`
  ADD PRIMARY KEY (`id_notas`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id_docente`),
  ADD KEY `id_Usuario` (`id_Usuario`);

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id_documento`),
  ADD KEY `id_Usuario` (`id_Usuario`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD KEY `id_Usuario` (`id_Usuario`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_Usuario`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_datos_adicionales` (`id_datos_adicionales`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `id_asignatura` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `id_clase` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=553;

--
-- AUTO_INCREMENT de la tabla `datos_adicionales`
--
ALTER TABLE `datos_adicionales`
  MODIFY `id_datos_adicionales` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1012;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_Usuario` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`);

--
-- Filtros para la tabla `año`
--
ALTER TABLE `año`
  ADD CONSTRAINT `año_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  ADD CONSTRAINT `año_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  ADD CONSTRAINT `año_ibfk_3` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  ADD CONSTRAINT `año_ibfk_4` FOREIGN KEY (`numero_curso`) REFERENCES `curso` (`numero_curso`);

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  ADD CONSTRAINT `clase_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`),
  ADD CONSTRAINT `clase_ibfk_3` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `clase_ibfk_4` FOREIGN KEY (`id_notas`) REFERENCES `definitivas` (`id_notas`);

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`);

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `documento_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_datos_adicionales`) REFERENCES `datos_adicionales` (`id_datos_adicionales`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
