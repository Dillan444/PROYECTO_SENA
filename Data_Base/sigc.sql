-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-03-2022 a las 00:51:16
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
(213, 'Gestión Empresarial', 'Area tecnica'),
(214, 'Estadísticas', 'Matematicas'),
(215, 'Tecnología e Informa', 'Tecnologia'),
(216, 'Emprendimiento', 'Area tecnica'),
(217, 'Español', 'Lenguage'),
(218, 'Artes', 'Artistica'),
(219, 'Contaduria', 'Matematica'),
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
(100, 'jolu@gmail.com', '3003894871', 'M'),
(101, 'marialuz@misena.edu.co', '3216789034', 'F'),
(102, 'amartinez9837@misena.edu.co', '3128323234', 'M'),
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
(202, 'andresguerra@gmail.com', '3229837362', 'M'),
(204, 'nataortiz@outlook.com', '3158736098', 'F'),
(207, 'nataortiz15@hotmail.com', '3168736098', 'F'),
(209, 'salome13@hotmail.com', '3198736098', 'F'),
(210, 'arturito@hotmail.com', '3118736098', 'M'),
(211, 'gustaf@hotmail.com', '3008736098', 'M'),
(213, 'sancheza@outlook.com', '3018736098', 'M'),
(214, 'martiJhon@outlook.com', '3098736098', 'M'),
(215, 'milksosa@gmail.com', '30338948345', 'F'),
(216, 'cardenas@gmail.com', '31338948345', 'F'),
(217, 'carmen@hotmail.com', '3228973726', 'F'),
(218, 'robertoruiz@gmail.com', '3248736098', 'M'),
(219, 'ralf@hotmail.com', '3138736737', 'M'),
(220, 'spaulo@outlook.com', '3239832938', 'M'),
(222, 'hernesto@perez.com', '3001543334', 'M');

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
(44, 20, 43, 32, 217, 3),
(50, 45, 39, 46, 206, 4),
(43, 37, 39, 41, 214, 4),
(40, 34, 45, 40, 217, 4),
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
(42, 45, 26, 40, 217, 10),
(NULL, NULL, NULL, NULL, 200, 14),
(NULL, NULL, NULL, NULL, 201, 14),
(NULL, NULL, NULL, NULL, 202, 14),
(NULL, NULL, NULL, NULL, 203, 14),
(NULL, NULL, NULL, NULL, 204, 14),
(NULL, NULL, NULL, NULL, 206, 14),
(NULL, NULL, NULL, NULL, 207, 14),
(NULL, NULL, NULL, NULL, 208, 14),
(NULL, NULL, NULL, NULL, 210, 14),
(NULL, NULL, NULL, NULL, 211, 14),
(NULL, NULL, NULL, NULL, 213, 14),
(NULL, NULL, NULL, NULL, 214, 14),
(NULL, NULL, NULL, NULL, 215, 14),
(NULL, NULL, NULL, NULL, 217, 14),
(NULL, NULL, NULL, NULL, 218, 14),
(NULL, NULL, NULL, NULL, 221, 14),
(NULL, NULL, NULL, NULL, 200, 15),
(NULL, NULL, NULL, NULL, 201, 15),
(NULL, NULL, NULL, NULL, 203, 15),
(NULL, NULL, NULL, NULL, 204, 15),
(NULL, NULL, NULL, NULL, 206, 15),
(NULL, NULL, NULL, NULL, 207, 15),
(NULL, NULL, NULL, NULL, 208, 15),
(NULL, NULL, NULL, NULL, 211, 15),
(NULL, NULL, NULL, NULL, 213, 15),
(NULL, NULL, NULL, NULL, 214, 15),
(NULL, NULL, NULL, NULL, 215, 15),
(NULL, NULL, 42, NULL, 217, 15),
(NULL, NULL, NULL, NULL, 218, 15),
(NULL, NULL, NULL, NULL, 219, 15),
(NULL, NULL, NULL, NULL, 200, 16),
(NULL, NULL, NULL, NULL, 201, 16),
(NULL, NULL, NULL, NULL, 203, 16),
(NULL, NULL, NULL, NULL, 204, 16),
(NULL, NULL, NULL, NULL, 206, 16),
(NULL, NULL, NULL, NULL, 207, 16),
(NULL, NULL, NULL, NULL, 208, 16),
(NULL, NULL, NULL, NULL, 210, 16),
(NULL, NULL, NULL, NULL, 211, 16),
(NULL, NULL, NULL, NULL, 213, 16),
(NULL, NULL, NULL, NULL, 214, 16),
(NULL, NULL, NULL, NULL, 215, 16),
(NULL, NULL, NULL, NULL, 217, 16),
(NULL, NULL, NULL, NULL, 218, 16),
(NULL, NULL, NULL, NULL, 219, 16),
(NULL, NULL, NULL, NULL, 200, 17),
(NULL, NULL, NULL, NULL, 201, 17),
(NULL, NULL, NULL, NULL, 203, 17),
(NULL, NULL, NULL, NULL, 204, 17),
(NULL, NULL, 46, NULL, 206, 17),
(NULL, NULL, NULL, NULL, 207, 17),
(NULL, NULL, NULL, NULL, 208, 17),
(NULL, NULL, NULL, NULL, 210, 17),
(NULL, NULL, NULL, NULL, 211, 17),
(NULL, NULL, NULL, NULL, 213, 17),
(NULL, NULL, NULL, NULL, 214, 17),
(NULL, NULL, NULL, NULL, 215, 17),
(NULL, NULL, NULL, NULL, 217, 17),
(NULL, NULL, NULL, NULL, 218, 17),
(NULL, NULL, NULL, NULL, 219, 17),
(NULL, NULL, NULL, NULL, 200, 18),
(NULL, NULL, NULL, NULL, 201, 18),
(NULL, NULL, NULL, NULL, 202, 18),
(NULL, NULL, NULL, NULL, 203, 18),
(NULL, NULL, NULL, NULL, 204, 18),
(NULL, NULL, NULL, NULL, 206, 18),
(NULL, NULL, NULL, NULL, 207, 18),
(NULL, NULL, NULL, NULL, 208, 18),
(NULL, NULL, NULL, NULL, 210, 18),
(NULL, NULL, NULL, NULL, 211, 18),
(NULL, NULL, NULL, NULL, 213, 18),
(NULL, NULL, NULL, NULL, 214, 18),
(NULL, NULL, NULL, NULL, 215, 18),
(NULL, NULL, NULL, NULL, 217, 18),
(NULL, NULL, NULL, NULL, 218, 18),
(NULL, NULL, NULL, NULL, 219, 18),
(NULL, NULL, NULL, NULL, 221, 18),
(NULL, NULL, NULL, NULL, 200, 19),
(NULL, NULL, NULL, NULL, 202, 19),
(NULL, NULL, NULL, NULL, 203, 19),
(NULL, NULL, NULL, NULL, 204, 19),
(NULL, NULL, NULL, NULL, 205, 19),
(NULL, NULL, NULL, NULL, 206, 19),
(NULL, NULL, NULL, NULL, 207, 19),
(NULL, NULL, NULL, NULL, 208, 19),
(NULL, NULL, NULL, NULL, 209, 19),
(NULL, NULL, NULL, NULL, 210, 19),
(NULL, NULL, NULL, NULL, 212, 19),
(NULL, NULL, NULL, NULL, 213, 19),
(NULL, NULL, NULL, NULL, 214, 19),
(NULL, NULL, NULL, NULL, 215, 19),
(NULL, NULL, NULL, NULL, 217, 19),
(NULL, NULL, NULL, NULL, 218, 19),
(NULL, NULL, NULL, NULL, 221, 19);

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
(219, 95),
(220, 104);

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
(2, 94),
(11, 96),
(12, 97),
(13, 98),
(14, 99),
(15, 100),
(16, 101),
(17, 102),
(18, 103),
(19, 105),
(20, 106),
(21, 107),
(22, 108),
(23, 109);

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
(10, 10, 'n2', 2022),
(11, 14, 'd3', 2022),
(12, 15, 'd3', 2022),
(13, 16, 'n1', 2022),
(14, 17, 'n2', 2022),
(15, 18, 's1', 2022),
(16, 19, 't1', 2022),
(17, 20, 't2', 2022),
(18, 22, 'o1', 2022),
(19, 23, 'c1', 2022);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiasdelgrado`
--

CREATE TABLE `materiasdelgrado` (
  `grado` varchar(10) NOT NULL,
  `materia` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `materiasdelgrado`
--

INSERT INTO `materiasdelgrado` (`grado`, `materia`) VALUES
('decimo', 200),
('decimo', 202),
('decimo', 203),
('decimo', 204),
('decimo', 205),
('decimo', 206),
('decimo', 207),
('decimo', 208),
('decimo', 209),
('decimo', 210),
('decimo', 212),
('decimo', 213),
('decimo', 214),
('decimo', 215),
('decimo', 217),
('decimo', 218),
('decimo', 221),
('noveno', 200),
('noveno', 201),
('noveno', 202),
('noveno', 203),
('noveno', 204),
('noveno', 206),
('noveno', 207),
('noveno', 208),
('noveno', 210),
('noveno', 211),
('noveno', 213),
('noveno', 214),
('noveno', 215),
('noveno', 217),
('noveno', 218),
('noveno', 221),
('octavo', 200),
('octavo', 201),
('octavo', 202),
('octavo', 203),
('octavo', 204),
('octavo', 206),
('octavo', 207),
('octavo', 208),
('octavo', 210),
('octavo', 211),
('octavo', 213),
('octavo', 214),
('octavo', 215),
('octavo', 217),
('octavo', 218),
('octavo', 219),
('octavo', 221),
('once', 200),
('once', 202),
('once', 203),
('once', 204),
('once', 205),
('once', 206),
('once', 207),
('once', 208),
('once', 209),
('once', 210),
('once', 212),
('once', 213),
('once', 214),
('once', 215),
('once', 217),
('once', 218),
('once', 221),
('septimo', 200),
('septimo', 201),
('septimo', 203),
('septimo', 204),
('septimo', 206),
('septimo', 207),
('septimo', 208),
('septimo', 210),
('septimo', 211),
('septimo', 213),
('septimo', 214),
('septimo', 215),
('septimo', 217),
('septimo', 218),
('septimo', 219),
('sexto', 200),
('sexto', 201),
('sexto', 203),
('sexto', 204),
('sexto', 206),
('sexto', 207),
('sexto', 208),
('sexto', 211),
('sexto', 213),
('sexto', 214),
('sexto', 215),
('sexto', 217),
('sexto', 218),
('sexto', 219);

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
  `documento` int(12) DEFAULT NULL,
  `tipo_documento` char(3) DEFAULT NULL,
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

INSERT INTO `usuario` (`id_Usuario`, `nombre_perfil`, `perfil`, `id_rol`, `documento`, `tipo_documento`, `p_nombre`, `s_nombre`, `p_apellido`, `s_apellido`, `edad`, `contraseña`, `id_datos_adicionales`, `estado`) VALUES
(1, 'joseM', '', 'E', NULL, NULL, 'Jose', 'Luis', 'Mendéz', '', 13, 'jose54321', 100, 1),
(2, 'Marialu', '', 'D', NULL, NULL, 'Maria', 'Luz', 'Camacho', 'Parra', 51, 'Mlc2345872', 101, 1),
(3, 'Arist', '', 'D', NULL, NULL, 'Aristobulo', '', 'Martinéz', 'Cruz', 42, 'martinez45', 102, 1),
(4, 'Aledu', '', 'A', NULL, NULL, 'Alejandro', '', 'Duque', 'Escobar', 30, 'jasinto123', 103, 1),
(6, 'estefin', '', 'E', NULL, NULL, 'Estefania', '', 'Goméz', 'Rodriguéz', 15, 'eegomez678', 104, 1),
(7, 'Julic', '', 'E', NULL, NULL, 'Julian', 'Camilo', 'Castro', 'Cruz', 13, 'Juliccc345', 105, 1),
(8, 'Yulijc', '', 'E', NULL, NULL, 'Yulieth', 'Alexandra', 'Cubillos', 'Arias', 17, 'Alexa12321', 106, 1),
(9, 'Luish', '', 'E', NULL, NULL, 'Luis', 'Alfonso', 'Goméz', 'Ramos', 13, 'Jalo4567', 107, 1),
(10, 'Adreisg', '', 'E', NULL, NULL, 'Andres', 'Guillermo', 'Goméz', 'Ramos', 15, 'Andreig908', 108, 1),
(11, 'Andrefeli', '', 'E', NULL, NULL, 'Andres', 'Felipe', 'Villalobos', 'Galeano', 17, 'felipito45', 109, 1),
(12, 'Mariiii', '', 'E', NULL, NULL, 'Maria', 'Camila', 'Acosta', 'Benavidez', 14, 'bena145678', 110, 0),
(13, 'Albejalo', '', 'D', NULL, NULL, 'Albedy', 'Roman', 'Quiñones', 'Acosta', 33, 'Donalbedy3', 111, 1),
(14, 'Fernanfra', '', 'E', NULL, NULL, 'Fernanda', '', 'Lopéz', 'Castro', 15, 'soyfer76', 112, 1),
(15, 'elverda', '', 'E', NULL, NULL, 'Elver', 'David', 'Galarga', 'Forero', 17, 'elvergalar', 113, 1),
(16, 'Dillan444', '', 'A', NULL, NULL, 'Dillan', 'Smith', 'Portocarrero', 'Rojas', 19, 'Diliporto', 114, 1),
(17, 'Santifabi', '', 'A', NULL, NULL, 'Farith', 'Santiago', 'Rojas', 'Garzón', 19, 'Srrojas26', 115, 1),
(18, 'Cesarlll', '', 'D', NULL, NULL, 'Cesar', 'Luis', 'Velasquez', 'Parrado', 31, 'julioCesar', 116, 1),
(19, 'Clarasssh', '', 'D', NULL, NULL, 'Clara', 'Mayerli', 'Torres', 'Mendoza', 32, 'Clarita', 117, 1),
(20, 'Juanitoc', '', 'E', NULL, NULL, 'Juan    ', 'José', 'Cadena', 'Arevalo', 17, 'ujaudnai', 132, 1),
(21, 'Francym	', '', 'E', NULL, NULL, 'Francy	', 'Milena', 'Acosta', 'Cueca', 19, 'erfrab', 133, 1),
(22, 'turmasdequej', '', 'E', NULL, NULL, 'John	', 'Anderson', 'Acosta', 'Turmeque', 15, 'jonedMdd	', 134, 1),
(23, 'Bryanb	', '', 'E', NULL, NULL, 'Brayan	', 'Alfonso', 'Beltran', '', 15, 'jeireBry	', 135, 1),
(24, 'BernalFab	', '', 'E', NULL, NULL, 'Fabiana	', '', 'Bernal', 'Garcia', 16, 'jfieuif	', 136, 1),
(25, 'Didicha	', '', 'E', NULL, NULL, 'Diego	', 'Alejandro', 'Chambuenta', 'Cortes', 14, 'fvitref	', 137, 1),
(26, 'xixterflore', '', 'E', NULL, NULL, 'Yessica	', 'Lizeth	', 'Catañeda', 'Villalobos', 17, 'fkrroooote', 138, 1),
(27, 'Espeletin	', '', 'E', NULL, NULL, 'Jairo 	', 'David', 'Espeleta', '', 18, 'rrguajd	', 139, 1),
(28, 'Tovarm	', '', 'E', NULL, NULL, 'Maria	', 'Angelica', 'Tovar', 'Aguas', 19, 'mARIADF	', 140, 1),
(29, 'Pradadu	', '', 'E', NULL, NULL, 'Duvan	', 'Steven', 'Prada', 'Gutierrez', 17, 'duvaned	', 141, 1),
(30, 'Yeyemoli	', '', 'E', NULL, NULL, 'Yellin	', 'Stefany', 'Molina', 'Rocha', 14, 'yersldkdf	', 142, 1),
(31, 'KerenRiii	', '', 'E', NULL, NULL, 'Keren 	', 'Liliana', 'Rios', '', 13, 'karfeadfe	', 143, 1),
(32, 'Carisole	', '', 'E', NULL, NULL, 'Martha	', 'Carolina', 'Roa', 'Soler', 15, 'maridjfd	', 144, 1),
(33, 'Cobitosa	', '', 'E', NULL, NULL, 'Ricardo ', 'Andres', 'Rodriguez', 'Cobos', 15, 'ruvenwje	', 145, 1),
(34, 'DarioVasqq	', '', 'E', NULL, NULL, 'Ruben	', 'Dario', 'Diaz', 'Vasquéz', 17, 'jeifjes	', 146, 1),
(35, 'LeuritoJ	', '', 'E', NULL, NULL, 'Jeniffer', '', 'Leuro', '', 16, 'efeleurot	', 147, 1),
(36, 'BaronP	', '', 'E', NULL, NULL, 'Hanner	', 'Enrrique', 'Baron', '', 16, 'Hadnnewdf	', 148, 1),
(37, 'FloreroX	', '', 'E', NULL, NULL, 'Jessica	', 'Ximena', 'Arana', 'Forero', 17, 'Ximenitafr', 149, 1),
(38, 'CaritolM	', '', 'E', NULL, NULL, 'Carol	', 'Ximena', 'Macias', '', 19, 'Carollo	', 150, 1),
(39, 'rebusqueC	', '', 'E', NULL, NULL, 'Feiver	', 'Farith', 'Contreras', 'Duarte', 16, 'Rebusquemo', 151, 1),
(40, 'BigotesS	', '', 'E', NULL, NULL, 'David	', 'Santiago', 'Cueca', 'Goméz', 15, 'CortaBigot', 152, 1),
(41, 'gomezangg	', '', 'E', NULL, NULL, 'Anguie	', '', 'Goméz', 'Sandoval', 16, 'Gomezsando', 153, 1),
(42, 'Repeluz	', '', 'E', NULL, NULL, 'Hector	', 'Ivan', 'Leal', 'Rojas', 13, 'Repeluzin	', 154, 1),
(43, 'Garruña	', '', 'E', NULL, NULL, 'Santiago', '', 'Ortiz', 'Gonzales', 14, 'Grrrasgon	', 155, 1),
(44, 'Oterito	', '', 'E', NULL, NULL, 'Franklin', 'Samuel', 'Otero', 'Bedoya', 18, 'Franklinot', 156, 1),
(45, 'BerrugaY	', '', 'E', NULL, NULL, 'Oscar	', 'Yessid', 'Rojas', 'Bejarano', 16, 'Vergarano	', 157, 1),
(46, 'Caballo	', '', 'E', NULL, NULL, 'Yair	', 'Alfonso', 'Rojas', 'Bejarano', 14, 'CaballinJu', 158, 1),
(47, 'Muelas	', '', 'E', NULL, NULL, 'David	', 'Santiago', 'Sanchéz', 'Ortiz', 15, 'Calvasexy	', 159, 1),
(48, 'Guajiro	', '', 'E', NULL, NULL, 'Jhonatan', 'Leandro', 'Torres', 'Caballero', 13, 'Lenadrosss', 160, 1),
(49, 'Palmane	', '', 'E', NULL, NULL, 'Jhonny	', 'Stevan', 'Sandoval', 'Palma', 14, 'Sandomusi	', 161, 1),
(50, 'Ojotes	', '', 'E', NULL, NULL, 'Vairon	', 'Estevan', 'Sepulveda', 'Ruiz', 19, 'Vairoojito', 162, 1),
(51, 'Riosucio	', '', 'E', NULL, NULL, 'Juan	', 'Sebastian', 'Virguéz', 'Zacipa', 18, 'Virguezrio', 163, 1),
(52, 'Alejaani	', '', 'E', NULL, NULL, 'Annie	', 'Alejandra', 'Mora', 'Gonzalez', 18, 'Moritacant', 164, 1),
(65, 'lorec', '', 'D', NULL, NULL, 'Lorena', '', 'Carrillo', 'Guzman', 30, 'apdfnpuir', NULL, 1),
(66, 'alfreN', '', 'D', NULL, NULL, 'Alfredo', '', 'Nuñes', 'Castro', 35, 'cm8afhnfh', NULL, 0),
(67, 'ManuelAso', '', 'D', NULL, NULL, 'Manuel', 'Alfredo', 'Linares', 'Sosa', 40, 'cwec84cow3', NULL, 1),
(68, 'jjP', '', 'D', NULL, NULL, 'Jenrry', 'Jonas', 'Piñeros', '', 37, 'cumehnoie8', NULL, 1),
(69, 'karego', '', 'D', NULL, NULL, 'Karen', 'Julieth', 'Gomez', 'Parrado', 30, 'karenfeadc', NULL, 1),
(70, 'clauG', '', 'D', NULL, NULL, 'Claudia', 'Milena', 'Rodrigez', 'Gonsalez', 36, '320ucnw093', NULL, 1),
(71, 'TerePa', '', 'D', NULL, NULL, 'Tereza', '', 'Garcia', 'Cruz', 37, 'm48ruw9wp3', NULL, 1),
(72, 'NiñoP', '', 'D', NULL, NULL, 'Dario', 'Julian', 'Niño', '', 42, 'n44hrw9p4n', NULL, 1),
(73, 'Joly42', '', 'D', NULL, NULL, 'Blanca', 'Jolanda', 'Caballero', 'Rozo', 42, 'w48rumpq32', NULL, 1),
(74, 'DidiK', '', 'D', NULL, NULL, 'Diego', 'Alejandro', 'Castañeda', '', 38, 'ew98emfcpq', NULL, 1),
(75, 'TaniV', '', 'D', NULL, NULL, 'Tania', 'Maria', 'Torrez', 'Veloza', 27, 'mfjirg58d', NULL, 1),
(76, 'Ximemas', '', 'D', NULL, NULL, 'Sandra ', 'Ximena', 'Reyes', '', 29, 'fjmcwosdfc', NULL, 1),
(77, 'cilantroM', '', 'D', NULL, NULL, 'Lisandro ', '', 'Moreno', 'Orjuela', 36, 'mjcdei3bg', NULL, 1),
(78, 'Jorsh', '', 'D', NULL, NULL, 'Jorge ', 'Luis', 'Baron', 'Benavidez', 33, 'mcskfhnu49', NULL, 1),
(79, 'Natalia226', '', 'E', NULL, NULL, 'Natalia', '', 'Velasquez', '', 17, 'qhg8xeybeq', 181, 1),
(80, 'Alejandro2', '', 'D', NULL, NULL, 'Dario', 'Alejandro', 'Ramirez', '', 24, 'k5gqct5obw', 182, 1),
(81, 'Gómez1', '', 'E', NULL, NULL, 'Veronica', '', 'Gómez', 'Toro', 16, 'wy7j?rq0ws', 183, 1),
(82, 'Torres77', '', 'E', NULL, NULL, 'Lisa', '', 'Torres', 'Cespedes', 18, '3a983ohixo', 184, 1),
(83, 'Carrillo6074', '', 'E', NULL, NULL, 'Luisa', 'Lorena', 'Carrillo', 'Martines', 13, 'wqaltmfhbc', 185, 1),
(87, 'Carrillo1', '', 'E', NULL, NULL, 'Tom', 'Steven', 'Carrillo', 'Guerra', 17, 'h107xlpuhz', 190, 1),
(88, 'Gutierrez0840', '', 'E', NULL, NULL, 'Diego', 'Martin', 'Gutierrez', '', 18, 'kewy6bne2y', 191, 1),
(89, 'Luisa42', '', 'E', NULL, NULL, 'Luisa', 'Maria', 'Castro', '', 17, '4221ao0hd2', 193, 1),
(90, 'Sanchez1', '', 'E', NULL, NULL, 'Willy', '', 'Sanchez', '', 15, '3q7pc4vr?a', 195, 1),
(91, 'Rafael6', '', 'E', NULL, NULL, 'Rafael', '', 'Peréz', '', 13, '3kck??mtz?', 197, 1),
(92, 'Rafael59', '', 'E', NULL, NULL, 'Rafael', 'Santiago', 'Gonzales', '', 19, 'myus9hu1up', 198, 1),
(93, 'Jose62', '', 'E', NULL, NULL, 'Maria', 'Jose', 'Riveros', '', 15, '5sjs35n29d', 200, 1),
(94, 'Jeremias487', '', 'E', NULL, NULL, 'Jeremias', '', 'Gastanvide', '', 14, 'a9fvukm7dn', 201, 1),
(95, 'Carlos5', '', 'D', NULL, NULL, 'Carlos', 'Andres', 'Guerra', '', 28, 'wgfkwu492f', 202, 1),
(96, 'Natasha99', '', 'E', NULL, NULL, 'Natasha', '', 'Ortiz', 'Quiroga', 15, 'kjn9jp6?5e', 204, 0),
(97, 'Natasha0', '', 'E', NULL, NULL, 'Natasha', '', 'Ortiz', 'Quiroga', 15, 'q1ldlhlayy', 207, 0),
(98, 'Salome47', '', 'E', NULL, NULL, 'Salome', '', 'Parrado', 'Lopez', 13, 'mn26a9w?h9', 209, 0),
(99, 'Arturo2', '', 'E', NULL, NULL, 'Carlos', 'Arturo', 'Gomez', 'Lopez', 17, '8?4ekiñwlr', 210, 0),
(100, 'Gustavo08', '', 'E', NULL, NULL, 'Gustavo', '', 'Sanchez', 'Martines', 16, 'zdnicwuaap', 211, 0),
(101, 'Andres57', '', 'E', NULL, NULL, 'Andres', 'Santiago', 'Sanchez', 'Martines', 14, 'o4x3yq95lj', 213, 0),
(102, 'Jhon15', '', 'E', NULL, NULL, 'Jhon', 'Jairo', 'Martinez', '', 16, 'culbr1sr27', 214, 0),
(103, 'Milk16', '', 'E', NULL, NULL, 'Milk', '', 'Rodriguez', 'Sosa', 13, 'zhxñjej9m2', 215, 0),
(104, 'Carmen0', '', 'D', NULL, NULL, 'Carmen', 'Salome', 'Cardenas', '', 34, 'wbdj4rtxp?', 216, 0),
(105, 'Carmen425', '', 'E', NULL, NULL, 'Carmen', '', 'Villalobos', '', 15, 'k?24wtahdr', 217, 0),
(106, 'Roberto0845', '', 'E', NULL, NULL, 'Roberto', '', 'Posada', 'Ruiz', 12, '?9l0be4ps2', 218, 0),
(107, 'Ralf993', '', 'E', NULL, NULL, 'Ralf', '', 'Carvajal', '', 14, '?o4ygh00lh', 219, 1),
(108, 'Paulo26', '', 'E', NULL, NULL, 'Paulo', 'Stivent', 'Rodriguez', '', 16, 't31ga6othi', 220, 0),
(109, 'Hernesto932', '', 'E', 1000938280, 'TI', 'Hernesto', '', 'Perez', '', 17, 'fwm7ipgs10', 222, 1);

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
-- Indices de la tabla `materiasdelgrado`
--
ALTER TABLE `materiasdelgrado`
  ADD UNIQUE KEY `UC_materiasdelgrado` (`grado`,`materia`),
  ADD KEY `materia` (`materia`);

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
  ADD UNIQUE KEY `documento` (`documento`),
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
  MODIFY `id_datos_adicionales` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=221;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `integrantescurso`
--
ALTER TABLE `integrantescurso`
  MODIFY `id_integrantecurso` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_Usuario` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

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
-- Filtros para la tabla `materiasdelgrado`
--
ALTER TABLE `materiasdelgrado`
  ADD CONSTRAINT `materiasdelgrado_ibfk_1` FOREIGN KEY (`materia`) REFERENCES `asignatura` (`id_asignatura`);

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
