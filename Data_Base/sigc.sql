-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-03-2022 a las 04:30:20
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
(201, 'Biologia', 'Ciencias'),
(202, 'Algebra', 'Matematicas'),
(203, 'E_Fisica', 'Deporte'),
(204, 'Quimica', 'Ciencia N'),
(205, 'Filosofia', 'Social'),
(206, 'Ingles', 'Lenguaje'),
(207, 'Religión', 'Etica y valores'),
(208, 'Ética', 'Etica y valores'),
(209, 'Dibujo Tecnico', 'Artistica'),
(210, 'Física', 'Ciencias'),
(211, 'Geometria', 'Matematicas'),
(212, 'Ciencias Politícas', 'Social'),
(213, 'Gestión', 'Area tecnica'),
(214, 'Estadísticas', 'Matematicas'),
(215, 'Tecnología e Informa', 'Tecnologia'),
(216, 'Emprendimiento', 'Area tecnica'),
(217, 'Español', 'Lenguage'),
(218, 'Música', 'Artistica'),
(219, 'Contaduria', 'Matematica'),
(220, 'Frances', 'Lenguage'),
(221, 'Cultura', 'Social');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id_asignatura` int(4) NOT NULL,
  `id_curso` char(2) NOT NULL,
  `id_docente` int(11) NOT NULL,
  `año` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` (`id_asignatura`, `id_curso`, `id_docente`, `año`) VALUES
(206, 'n2', 204, 2022),
(206, 'o1', 201, 2022),
(206, 's1', 204, 2022),
(206, 's3', 204, 2022),
(206, 't2', 201, 2022),
(214, 'n2', 205, 2022),
(214, 'o1', 200, 2022),
(214, 's1', 200, 2022),
(214, 's3', 205, 2022),
(214, 't2', 200, 2022),
(217, 'n2', 201, 2022),
(217, 'o1', 201, 2022),
(217, 's1', 201, 2022),
(217, 's3', 201, 2022),
(217, 't2', 203, 2022);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id_curso` char(2) NOT NULL,
  `curso` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curso`, `curso`) VALUES
('s1', 601),
('s2', 602),
('s3', 603),
('s4', 604),
('t1', 701),
('t2', 702),
('t3', 703),
('o1', 801),
('o2', 802),
('o3', 803),
('n1', 901),
('n2', 902),
('n3', 903),
('d1', 1001),
('d2', 1002),
('d3', 1003),
('c1', 1101),
('c2', 1102),
('c3', 1103);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_adicionales`
--

CREATE TABLE `datos_adicionales` (
  `id_datos_adicionales` int(8) NOT NULL,
  `correo` varchar(60) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `sexo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `datos_adicionales`
--

INSERT INTO `datos_adicionales` (`id_datos_adicionales`, `correo`, `Telefono`, `sexo`) VALUES
(100, 'jolu@gmail.com', '3124567891', 'M'),
(101, 'marialuz@misena.edu.co', '3216789034', 'F'),
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
(114, 'dsportocarreno@misena.edu.co', '3105620541', 'M'),
(115, 'fsrojas26@misena.edu', '3118447218', 'M'),
(116, 'Cecillar@gmail.com', '3047895644', 'M'),
(117, 'Claritahu@hotmail.co', '32145678790', 'F'),
(118, 'lorecul@outlook.com', '3206786453', 'F'),
(119, 'alfredeme@gmail.com', '3108949876', 'M'),
(120, 'jonas34@hotmail.com', '3046480086', 'M'),
(121, 'kakaren@gmail.com', '3027740505', 'M'),
(122, 'clauuuu@gmail.com', '3146205632', 'F'),
(123, 'terrece@outlook.com', '3007682536', 'F'),
(124, 'drios@gmail.com', '3208974637', 'F'),
(125, 'tasablanca@gmail.com', '3156730087', 'M'),
(126, 'dieeguitoroto@outloo', '3115678844', 'F'),
(127, 'tatama@gmail.com', '3124428945', 'M'),
(128, 'ximemasdu@hotmail.co', '3227895466', 'F'),
(129, 'cilantomore@gmail.co', '3208763646', 'F'),
(130, 'yhorggs@hotmail.com', '3148746758', 'M'),
(131, 'linares@gmail.com', '3098328600', 'M'),
(132, 'Janca@gmail.com	', '3106539847', 'M'),
(133, 'Milecue@otloukt.com	', '3429378473', 'F'),
(134, 'Turmeque@gmail.com	', '3179873647', 'M'),
(135, 'beltran@hotmail.com	', '3004448900', 'M'),
(136, 'Bernal10@hotmail.com', '3133360950', 'M'),
(137, 'Chambu03@gmail.com	', '3118938768', 'M'),
(138, 'Catayessi@gmail.com	', '3128349839', 'F'),
(139, 'Espeledav@outlookt.c', '3308379344', 'M'),
(140, 'Angelis@gmail.com	', '3028108767', 'F'),
(141, 'Pradadada@hotmail.co', '3138659324', 'M'),
(142, 'Moliyelo@outlookt.co', '3112081542', 'F'),
(143, 'Lilikeren@gmail.com	', '3154834454', 'F'),
(144, 'solerm@outlookt.com	', '3107355638', 'F'),
(145, 'cobosrodri@gmail.com', '3124567863', 'M'),
(146, 'rubendari45@gmail.co', '3215647635', 'M'),
(147, 'leuro@hotmail.com	', '3155439736', 'F'),
(148, 'hennerbar@gmail.com	', '3137539272', 'M'),
(149, 'ximemasflore@gmail.c', '3206385373', 'F'),
(150, 'ximenamacias@hotmail', '3116537273', 'F'),
(151, 'fivercontre@gmail.co', '3135364567', 'M'),
(152, 'Cueca@outlookt.com	', '3126231234', 'M'),
(153, 'Sandoval@gmail.com	', '3216279735', 'F'),
(154, 'hectorlel@gmail.com	', '3101725372', 'M'),
(155, 'garrassanti@gmail.co', '3125276735', 'M'),
(156, 'samuelito@hotmail.co', '3136730836', 'M'),
(157, 'Berrugin34@hotmail.c', '3216377838', 'M'),
(158, 'Caballin@gmail.com	', '3125375362', 'M'),
(159, 'sanchez30@outlookt.c', '3102416728', 'M'),
(160, 'leandritoguaji@hotma', '3202255273', 'M'),
(161, 'palma56@htolmail.com', '3124254252', 'M'),
(162, 'ojoteslarga@gmail.co', '3159735363', 'M'),
(163, 'riorio@outlookt.com	', '3215375383', 'M'),
(164, 'elejamora@outlook.co', '3208395732', 'F'),
(166, 'alejandrodg@gmail.co', '3201540334', 'M'),
(167, 'henrriquelopez@gmail', '3148579385', 'M'),
(168, 'lopezhenrri@gmail.co', '3148753459', 'M'),
(169, 'E', '3181283823', 'F'),
(181, 'natavelazquez@gmail.com', '3198762837', 'F'),
(182, 'darioramires@outlook.com', '3129837837', 'M'),
(183, 'verotoro16@gmail.com', '3129834992', 'F'),
(184, 'lisacespeces@hotmail.com', '3238736733', 'F'),
(185, 'lorecarrillo@gmail.com', '3123894837', 'F'),
(190, 'guerratom@gmail.com', '31238948347', 'M'),
(191, 'dmgutierrez@hotmail.com', '3158973723', 'M'),
(193, 'castromari@gmail.com', '3238736766', 'F'),
(195, 'sanwilly@gmail.com', '3238792837', 'M'),
(197, 'rafa@gmail.com', '3238704985', 'M'),
(198, 'gsantifael@gmail.com', '3484733748', 'M'),
(200, 'maririveros@gmail.com', '31238948337', 'F'),
(201, 'jeremias@gmail.com', '31238948826', 'M'),
(202, 'andresguerra@gmail.com', '3229837362', 'M');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `definitivas`
--

CREATE TABLE `definitivas` (
  `definitiva_B1` int(3) DEFAULT NULL,
  `definitiva_B2` int(3) DEFAULT NULL,
  `definitiva_B3` int(3) DEFAULT NULL,
  `definitiva_B4` int(3) DEFAULT NULL,
  `id_asignatura` int(4) DEFAULT NULL,
  `estudiante` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `definitivas`
--

INSERT INTO `definitivas` (`definitiva_B1`, `definitiva_B2`, `definitiva_B3`, `definitiva_B4`, `id_asignatura`, `estudiante`) VALUES
(40, 43, 46, 44, 206, 1),
(45, 39, 40, 48, 214, 1),
(44, 37, 50, 41, 217, 1),
(39, 42, 40, 41, 206, 2),
(45, 48, 47, 50, 214, 2),
(43, 44, 46, 41, 217, 2),
(40, 34, 36, 36, 206, 3),
(38, 40, 43, 37, 214, 3),
(44, 20, 44, 32, 217, 3),
(50, 45, 39, 46, 206, 4),
(43, 37, 39, 41, 214, 4),
(40, 34, 46, 40, 217, 4),
(44, 41, 44, 40, 206, 5),
(35, 32, 39, 44, 214, 5),
(40, 43, 24, 39, 217, 5),
(35, 30, 32, 40, 206, 6),
(38, 34, 43, 20, 214, 6),
(32, 17, 36, 40, 217, 6),
(40, 43, 21, 46, 206, 7),
(44, 43, 41, 38, 214, 7),
(40, 44, 40, 45, 217, 7),
(41, 41, 41, 41, 206, 8),
(32, 43, 38, 44, 214, 8),
(38, 40, 43, 37, 217, 8),
(43, 40, 48, 47, 206, 9),
(48, 48, 30, 49, 214, 9),
(40, 48, 44, 47, 217, 9),
(48, 40, 37, 40, 206, 10),
(43, 44, 47, 43, 214, 10),
(42, 45, 26, 40, 217, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_docente` int(11) NOT NULL,
  `id_curso` char(2) NOT NULL,
  `año` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id_docente`, `id_curso`, `año`) VALUES
(200, 's1', 2022),
(201, 's3', 2022),
(203, 'o1', 2022),
(204, 'n2', 2022),
(205, 't2', 2022);

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
(205, 19),
(202, 65),
(206, 66),
(207, 67),
(208, 68),
(209, 69),
(210, 70),
(211, 71),
(212, 72),
(213, 73),
(214, 74),
(215, 75),
(216, 76),
(217, 77),
(218, 78),
(219, 95);

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
  `id_estudiante` int(15) NOT NULL,
  `id_Usuario` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id_estudiante`, `id_Usuario`) VALUES
(3, 1),
(4, 6),
(5, 7),
(6, 8),
(7, 9),
(8, 10),
(9, 11),
(10, 12),
(1, 93),
(2, 94);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrantescurso`
--

CREATE TABLE `integrantescurso` (
  `id_integrantecurso` int(10) NOT NULL,
  `id_estudiante` int(15) NOT NULL,
  `id_curso` char(2) NOT NULL,
  `año` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `integrantescurso`
--

INSERT INTO `integrantescurso` (`id_integrantecurso`, `id_estudiante`, `id_curso`, `año`) VALUES
(1, 1, 's1', 2022),
(2, 2, 's1', 2022),
(3, 3, 's3', 2022),
(4, 4, 's3', 2022),
(5, 5, 't2', 2022),
(6, 6, 't2', 2022),
(7, 7, 'o1', 2022),
(8, 8, 'o1', 2022),
(9, 9, 'n2', 2022),
(10, 10, 'n2', 2022);

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
  `perfil` longblob NOT NULL,
  `id_rol` char(1) NOT NULL,
  `p_nombre` varchar(30) NOT NULL,
  `s_nombre` varchar(30) DEFAULT NULL,
  `p_apellido` varchar(30) NOT NULL,
  `s_apellido` varchar(30) DEFAULT NULL,
  `edad` int(2) NOT NULL,
  `contraseña` varchar(10) NOT NULL,
  `id_datos_adicionales` int(8) DEFAULT NULL,
  `estado` smallint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_Usuario`, `nombre_perfil`, `perfil`, `id_rol`, `p_nombre`, `s_nombre`, `p_apellido`, `s_apellido`, `edad`, `contraseña`, `id_datos_adicionales`, `estado`) VALUES
(1, 'joseM', '', 'E', 'Jose', 'Luis', 'Mendéz', '', 13, 'jose12345', 100, 0),
(2, 'Marialu', '', 'D', 'Maria', 'Luz', 'Camacho', 'Parra', 51, 'Mlc2345872', 101, 1),
(3, 'Arist', '', 'D', 'Aristobulo', '', 'Martinéz', 'Cruz', 42, 'martinez45', 102, 1),
(4, 'Aledu', '', 'A', 'Alejandro', '', 'Duque', 'Escobar', 30, 'jasinto123', 103, 1),
(6, 'estefin', '', 'E', 'Estefania', '', 'Goméz', 'Rodriguéz', 15, 'eegomez678', 104, 0),
(7, 'Julic', '', 'E', 'Julian', 'Camilo', 'Castro', 'Cruz', 13, 'Juliccc345', 105, 1),
(8, 'Yulijc', '', 'E', 'Yulieth', 'Alexandra', 'Cubillos', 'Arias', 17, 'Alexa12321', 106, 1),
(9, 'Luish', '', 'E', 'Luis', 'Alfonso', 'Goméz', 'Ramos', 13, 'Jalo4567', 107, 1),
(10, 'Adreisg', '', 'E', 'Andres', 'Guillermo', 'Goméz', 'Ramos', 15, 'Andreig908', 108, 1),
(11, 'Andrefeli', '', 'E', 'Andres', 'Felipe', 'Villalobos', 'Galeano', 17, 'felipito45', 109, 1),
(12, 'Mariiii', '', 'E', 'Maria', 'Camila', 'Acosta', 'Benavidez', 14, 'bena145678', 110, 0),
(13, 'Albejalo', '', 'D', 'Albedy', 'Roman', 'Quiñones', 'Acosta', 33, 'Donalbedy3', 111, 1),
(14, 'Fernanfra', '', 'E', 'Fernanda', '', 'Lopéz', 'Castro', 15, 'soyfer76', 112, 1),
(15, 'elverda', '', 'E', 'Elver', 'David', 'Galarga', 'Forero', 17, 'elvergalar', 113, 1),
(16, 'Diilli', '', 'A', 'Dillan', 'Smith', 'Portocarrero', 'Rojas', 19, 'Diliporto', 114, 1),
(17, 'Santifabi', '', 'A', 'Farith', 'Santiago', 'Rojas', 'Garzón', 19, 'Srrojas26', 115, 1),
(18, 'Cesarlll', '', 'D', 'Cesar', 'Luis', 'Velasquez', 'Parrado', 31, 'julioCesar', 116, 1),
(19, 'Clarasssh', '', 'D', 'Clara', 'Mayerli', 'Torres', 'Mendoza', 32, 'Clarita', 117, 1),
(20, 'Juanitoc', '', 'E', 'Juan    ', 'José', 'Cadena', 'Arevalo', 17, 'ujaudnai', 132, 1),
(21, 'Francym	', '', 'E', 'Francy	', 'Milena', 'Acosta', 'Cueca', 19, 'erfrab', 133, 1),
(22, 'turmasdequej', '', 'E', 'John	', 'Anderson', 'Acosta', 'Turmeque', 15, 'jonedMdd	', 134, 1),
(23, 'Bryanb	', '', 'E', 'Brayan	', 'Alfonso', 'Beltran', '', 15, 'jeireBry	', 135, 1),
(24, 'BernalFab	', '', 'E', 'Fabiana	', '', 'Bernal', 'Garcia', 16, 'jfieuif	', 136, 1),
(25, 'Didicha	', '', 'E', 'Diego	', 'Alejandro', 'Chambuenta', 'Cortes', 14, 'fvitref	', 137, 1),
(26, 'xixterflore', '', 'E', 'Yessica	', 'Lizeth	', 'Catañeda', 'Villalobos', 17, 'fkrroooote', 138, 1),
(27, 'Espeletin	', '', 'E', 'Jairo 	', 'David', 'Espeleta', '', 18, 'rrguajd	', 139, 1),
(28, 'Tovarm	', '', 'E', 'Maria	', 'Angelica', 'Tovar', 'Aguas', 19, 'mARIADF	', 140, 1),
(29, 'Pradadu	', '', 'E', 'Duvan	', 'Steven', 'Prada', 'Gutierrez', 17, 'duvaned	', 141, 1),
(30, 'Yeyemoli	', '', 'E', 'Yellin	', 'Stefany', 'Molina', 'Rocha', 14, 'yersldkdf	', 142, 1),
(31, 'KerenRiii	', '', 'E', 'Keren 	', 'Liliana', 'Rios', '', 13, 'karfeadfe	', 143, 1),
(32, 'Carisole	', '', 'E', 'Martha	', 'Carolina', 'Roa', 'Soler', 15, 'maridjfd	', 144, 1),
(33, 'Cobitosa	', '', 'E', 'Ricardo ', 'Andres', 'Rodriguez', 'Cobos', 15, 'ruvenwje	', 145, 1),
(34, 'DarioVasqq	', '', 'E', 'Ruben	', 'Dario', 'Diaz', 'Vasquéz', 17, 'jeifjes	', 146, 1),
(35, 'LeuritoJ	', '', 'E', 'Jeniffer', '', 'Leuro', '', 16, 'efeleurot	', 147, 1),
(36, 'BaronP	', '', 'E', 'Hanner	', 'Enrrique', 'Baron', '', 16, 'Hadnnewdf	', 148, 1),
(37, 'FloreroX	', '', 'E', 'Jessica	', 'Ximena', 'Arana', 'Forero', 17, 'Ximenitafr', 149, 1),
(38, 'CaritolM	', '', 'E', 'Carol	', 'Ximena', 'Macias', '', 19, 'Carollo	', 150, 1),
(39, 'rebusqueC	', '', 'E', 'Feiver	', 'Farith', 'Contreras', 'Duarte', 16, 'Rebusquemo', 151, 1),
(40, 'BigotesS	', '', 'E', 'David	', 'Santiago', 'Cueca', 'Goméz', 15, 'CortaBigot', 152, 1),
(41, 'gomezangg	', '', 'E', 'Anguie	', '', 'Goméz', 'Sandoval', 16, 'Gomezsando', 153, 1),
(42, 'Repeluz	', '', 'E', 'Hector	', 'Ivan', 'Leal', 'Rojas', 13, 'Repeluzin	', 154, 1),
(43, 'Garruña	', '', 'E', 'Santiago', '', 'Ortiz', 'Gonzales', 14, 'Grrrasgon	', 155, 1),
(44, 'Oterito	', '', 'E', 'Franklin', 'Samuel', 'Otero', 'Bedoya', 18, 'Franklinot', 156, 1),
(45, 'BerrugaY	', '', 'E', 'Oscar	', 'Yessid', 'Rojas', 'Bejarano', 16, 'Vergarano	', 157, 1),
(46, 'Caballo	', '', 'E', 'Yair	', 'Alfonso', 'Rojas', 'Bejarano', 14, 'CaballinJu', 158, 1),
(47, 'Muelas	', '', 'E', 'David	', 'Santiago', 'Sanchéz', 'Ortiz', 15, 'Calvasexy	', 159, 1),
(48, 'Guajiro	', '', 'E', 'Jhonatan', 'Leandro', 'Torres', 'Caballero', 13, 'Lenadrosss', 160, 1),
(49, 'Palmane	', '', 'E', 'Jhonny	', 'Stevan', 'Sandoval', 'Palma', 14, 'Sandomusi	', 161, 1),
(50, 'Ojotes	', '', 'E', 'Vairon	', 'Estevan', 'Sepulveda', 'Ruiz', 19, 'Vairoojito', 162, 1),
(51, 'Riosucio	', '', 'E', 'Juan	', 'Sebastian', 'Virguéz', 'Zacipa', 18, 'Virguezrio', 163, 1),
(52, 'Alejaani	', '', 'E', 'Annie	', 'Alejandra', 'Mora', 'Gonzalez', 18, 'Moritacant', 164, 1),
(65, 'lorec', '', 'D', 'Lorena', '', 'Carrillo', 'Guzman', 30, 'apdfnpuir', NULL, 1),
(66, 'alfreN', '', 'D', 'Alfredo', '', 'Nuñes', 'Castro', 35, 'cm8afhnfh', NULL, 1),
(67, 'ManuelAso', '', 'D', 'Manuel', 'Alfredo', 'Linares', 'Sosa', 40, 'cwec84cow3', NULL, 1),
(68, 'jjP', '', 'D', 'Jenrry', 'Jonas', 'Piñeros', '', 37, 'cumehnoie8', NULL, 1),
(69, 'karego', '', 'D', 'Karen', 'Julieth', 'Gomez', 'Parrado', 30, 'karenfeadc', NULL, 1),
(70, 'clauG', '', 'D', 'Claudia', 'Milena', 'Rodrigez', 'Gonsalez', 36, '320ucnw093', NULL, 1),
(71, 'TerePa', '', 'D', 'Tereza', '', 'Garcia', 'Cruz', 37, 'm48ruw9wp3', NULL, 1),
(72, 'NiñoP', '', 'D', 'Dario', 'Julian', 'Niño', '', 42, 'n44hrw9p4n', NULL, 1),
(73, 'Joly42', '', 'D', 'Blanca', 'Jolanda', 'Caballero', 'Rozo', 42, 'w48rumpq32', NULL, 1),
(74, 'DidiK', '', 'D', 'Diego', 'Alejandro', 'Castañeda', '', 38, 'ew98emfcpq', NULL, 1),
(75, 'TaniV', '', 'D', 'Tania', 'Maria', 'Torrez', 'Veloza', 27, 'mfjirg58d', NULL, 1),
(76, 'Ximemas', '', 'D', 'Sandra ', 'Ximena', 'Reyes', '', 29, 'fjmcwosdfc', NULL, 1),
(77, 'cilantroM', '', 'D', 'Lisandro ', '', 'Moreno', 'Orjuela', 36, 'mjcdei3bg', NULL, 1),
(78, 'Jorsh', '', 'D', 'Jorge ', 'Luis', 'Baron', 'Benavidez', 33, 'mcskfhnu49', NULL, 1),
(79, 'Natalia226', '', 'E', 'Natalia', '', 'Velasquez', '', 17, 'qhg8xeybeq', 181, 1),
(80, 'Alejandro2', '', 'D', 'Dario', 'Alejandro', 'Ramirez', '', 24, 'k5gqct5obw', 182, 1),
(81, 'Gómez1', '', 'E', 'Veronica', '', 'Gómez', 'Toro', 16, 'wy7j?rq0ws', 183, 1),
(82, 'Torres77', '', 'E', 'Lisa', '', 'Torres', 'Cespedes', 18, '3a983ohixo', 184, 1),
(83, 'Carrillo6074', '', 'E', 'Luisa', 'Lorena', 'Carrillo', 'Martines', 13, 'wqaltmfhbc', 185, 1),
(87, 'Carrillo1', '', 'E', 'Tom', 'Steven', 'Carrillo', 'Guerra', 17, 'h107xlpuhz', 190, 1),
(88, 'Gutierrez0840', '', 'E', 'Diego', 'Martin', 'Gutierrez', '', 18, 'kewy6bne2y', 191, 1),
(89, 'Luisa42', '', 'E', 'Luisa', 'Maria', 'Castro', '', 17, '4221ao0hd2', 193, 1),
(90, 'Sanchez1', '', 'E', 'Willy', '', 'Sanchez', '', 15, '3q7pc4vr?a', 195, 1),
(91, 'Rafael6', '', 'E', 'Rafael', '', 'Peréz', '', 13, '3kck??mtz?', 197, 1),
(92, 'Rafael59', '', 'E', 'Rafael', 'Santiago', 'Gonzales', '', 19, 'myus9hu1up', 198, 1),
(93, 'Jose62', '', 'E', 'Maria', 'Jose', 'Riveros', '', 15, '5sjs35n29d', 200, 1),
(94, 'Jeremias487', '', 'E', 'Jeremias', '', 'Gastanvide', '', 14, 'a9fvukm7dn', 201, 1),
(95, 'Carlos5', '', 'D', 'Carlos', 'Andres', 'Guerra', '', 28, 'wgfkwu492f', 202, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD UNIQUE KEY `id_Usuario_2` (`id_Usuario`),
  ADD KEY `id_Usuario` (`id_Usuario`);

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`id_asignatura`),
  ADD UNIQUE KEY `nombre_asignatura` (`nombre_asignatura`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD UNIQUE KEY `UC_clases` (`id_asignatura`,`id_curso`,`id_docente`,`año`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`),
  ADD UNIQUE KEY `curso` (`curso`);

--
-- Indices de la tabla `datos_adicionales`
--
ALTER TABLE `datos_adicionales`
  ADD PRIMARY KEY (`id_datos_adicionales`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `correo_2` (`correo`),
  ADD UNIQUE KEY `Telefono` (`Telefono`);

--
-- Indices de la tabla `definitivas`
--
ALTER TABLE `definitivas`
  ADD UNIQUE KEY `UC_def_estudiante` (`id_asignatura`,`estudiante`),
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `estudiante` (`estudiante`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD UNIQUE KEY `UC_direccion` (`id_docente`,`id_curso`,`año`),
  ADD KEY `id_docente` (`id_docente`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id_docente`),
  ADD UNIQUE KEY `id_Usuario_2` (`id_Usuario`),
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
  ADD UNIQUE KEY `UC_estudiante` (`id_estudiante`,`id_Usuario`),
  ADD KEY `id_Usuario` (`id_Usuario`);

--
-- Indices de la tabla `integrantescurso`
--
ALTER TABLE `integrantescurso`
  ADD PRIMARY KEY (`id_integrantecurso`),
  ADD UNIQUE KEY `UC_integrantescurso` (`id_estudiante`,`id_curso`,`año`),
  ADD KEY `id_curso` (`id_curso`);

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
  ADD UNIQUE KEY `id_datos_adicionales_2` (`id_datos_adicionales`),
  ADD UNIQUE KEY `UC_usuario` (`nombre_perfil`,`p_nombre`,`s_nombre`,`p_apellido`,`s_apellido`),
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
  MODIFY `id_asignatura` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT de la tabla `datos_adicionales`
--
ALTER TABLE `datos_adicionales`
  MODIFY `id_datos_adicionales` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `integrantescurso`
--
ALTER TABLE `integrantescurso`
  MODIFY `id_integrantecurso` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_Usuario` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`);

--
-- Filtros para la tabla `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `clases_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  ADD CONSTRAINT `clases_ibfk_3` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`);

--
-- Filtros para la tabla `definitivas`
--
ALTER TABLE `definitivas`
  ADD CONSTRAINT `definitivas_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `definitivas_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `definitivas_ibfk_5` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `definitivas_ibfk_6` FOREIGN KEY (`estudiante`) REFERENCES `integrantescurso` (`id_integrantecurso`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  ADD CONSTRAINT `direccion_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`);

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
-- Filtros para la tabla `integrantescurso`
--
ALTER TABLE `integrantescurso`
  ADD CONSTRAINT `integrantescurso_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  ADD CONSTRAINT `integrantescurso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);

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
