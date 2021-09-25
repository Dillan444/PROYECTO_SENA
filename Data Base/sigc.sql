-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2021 a las 02:35:57
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
  `id_asignatura` int(4) DEFAULT NULL,
  `numero_curso` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` (`id_asignatura`, `numero_curso`) VALUES
(202, 801),
(202, 802),
(202, 803),
(202, 901),
(202, 902),
(202, 903),
(202, 1001),
(202, 1002),
(202, 1101),
(202, 1102),
(202, 1103),
(201, 601),
(201, 602),
(201, 603),
(201, 604),
(201, 701),
(201, 702),
(201, 801),
(201, 802),
(201, 803),
(201, 901),
(201, 902),
(201, 903),
(200, 601),
(200, 602),
(200, 603),
(200, 604),
(200, 701),
(200, 702),
(200, 801),
(200, 802),
(200, 803),
(200, 901),
(200, 902),
(200, 903),
(200, 1001),
(200, 1002),
(200, 1101),
(200, 1102),
(200, 1103),
(203, 601),
(203, 602),
(203, 603),
(203, 604),
(203, 701),
(203, 702),
(203, 801),
(203, 802),
(203, 803),
(203, 901),
(203, 902),
(203, 903),
(203, 1001),
(203, 1002),
(203, 1101),
(203, 1102),
(203, 1103),
(204, 1001),
(204, 1002),
(204, 1101),
(204, 1102),
(204, 1103),
(205, 1001),
(205, 1002),
(205, 1101),
(205, 1102),
(205, 1103),
(206, 601),
(206, 602),
(206, 603),
(206, 604),
(206, 701),
(206, 702),
(206, 801),
(206, 802),
(206, 803),
(206, 901),
(206, 902),
(206, 903),
(206, 1001),
(206, 1002),
(206, 1101),
(206, 1102),
(206, 1103),
(207, 601),
(207, 602),
(207, 603),
(207, 604),
(207, 701),
(207, 702),
(207, 801),
(207, 802),
(207, 803),
(207, 901),
(207, 902),
(207, 903),
(207, 1001),
(207, 1002),
(207, 1101),
(207, 1102),
(207, 1103),
(208, 601),
(208, 602),
(208, 603),
(208, 604),
(208, 701),
(208, 702),
(208, 801),
(208, 802),
(208, 803),
(208, 901),
(208, 902),
(208, 903),
(208, 1001),
(208, 1002),
(208, 1101),
(208, 1102),
(208, 1103),
(209, 601),
(209, 602),
(209, 603),
(209, 604),
(209, 701),
(209, 702),
(209, 801),
(209, 802),
(209, 803),
(209, 901),
(209, 902),
(209, 903),
(209, 1001),
(209, 1002),
(209, 1101),
(209, 1102),
(209, 1103),
(210, 901),
(210, 902),
(210, 903),
(210, 1001),
(210, 1002),
(210, 1101),
(210, 1102),
(210, 1103),
(211, 601),
(211, 602),
(211, 603),
(211, 604),
(211, 701),
(211, 702),
(211, 801),
(211, 802),
(211, 803),
(211, 901),
(211, 902),
(211, 903),
(211, 1001),
(211, 1002),
(211, 1101),
(211, 1102),
(211, 1103),
(212, 1001),
(212, 1002),
(212, 1101),
(212, 1102),
(212, 1103),
(213, 601),
(213, 602),
(213, 603),
(213, 604),
(213, 701),
(213, 702),
(213, 801),
(213, 802),
(213, 803),
(213, 901),
(213, 902),
(213, 903),
(213, 1001),
(213, 1002),
(213, 1101),
(213, 1102),
(213, 1103),
(214, 601),
(214, 602),
(214, 603),
(214, 604),
(214, 701),
(214, 702),
(214, 801),
(214, 802),
(214, 803),
(214, 901),
(214, 902),
(214, 903),
(214, 1001),
(214, 1002),
(214, 1101),
(214, 1102),
(214, 1103),
(215, 601),
(215, 602),
(215, 603),
(215, 604),
(215, 701),
(215, 702),
(215, 801),
(215, 802),
(215, 803),
(215, 901),
(215, 902),
(215, 903),
(215, 1001),
(215, 1002),
(215, 1101),
(215, 1102),
(215, 1103),
(216, 601),
(216, 602),
(216, 603),
(216, 604),
(216, 701),
(216, 702),
(216, 801),
(216, 802),
(216, 803),
(216, 901),
(216, 902),
(216, 903),
(216, 1001),
(216, 1002),
(216, 1101),
(216, 1102),
(216, 1103),
(202, 801),
(202, 802),
(202, 803),
(202, 901),
(202, 902),
(202, 903),
(202, 1001),
(202, 1002),
(202, 1101),
(202, 1102),
(202, 1103),
(201, 601),
(201, 602),
(201, 603),
(201, 604),
(201, 701),
(201, 702),
(201, 801),
(201, 802),
(201, 803),
(201, 901),
(201, 902),
(201, 903),
(200, 601),
(200, 602),
(200, 603),
(200, 604),
(200, 701),
(200, 702),
(200, 801),
(200, 802),
(200, 803),
(200, 901),
(200, 902),
(200, 903),
(200, 1001),
(200, 1002),
(200, 1101),
(200, 1102),
(200, 1103),
(203, 601),
(203, 602),
(203, 603),
(203, 604),
(203, 701),
(203, 702),
(203, 801),
(203, 802),
(203, 803),
(203, 901),
(203, 902),
(203, 903),
(203, 1001),
(203, 1002),
(203, 1101),
(203, 1102),
(203, 1103),
(204, 1001),
(204, 1002),
(204, 1101),
(204, 1102),
(204, 1103),
(205, 1001),
(205, 1002),
(205, 1101),
(205, 1102),
(205, 1103),
(206, 601),
(206, 602),
(206, 603),
(206, 604),
(206, 701),
(206, 702),
(206, 801),
(206, 802),
(206, 803),
(206, 901),
(206, 902),
(206, 903),
(206, 1001),
(206, 1002),
(206, 1101),
(206, 1102),
(206, 1103),
(207, 601),
(207, 602),
(207, 603),
(207, 604),
(207, 701),
(207, 702),
(207, 801),
(207, 802),
(207, 803),
(207, 901),
(207, 902),
(207, 903),
(207, 1001),
(207, 1002),
(207, 1101),
(207, 1102),
(207, 1103),
(208, 601),
(208, 602),
(208, 603),
(208, 604),
(208, 701),
(208, 702),
(208, 801),
(208, 802),
(208, 803),
(208, 901),
(208, 902),
(208, 903),
(208, 1001),
(208, 1002),
(208, 1101),
(208, 1102),
(208, 1103),
(209, 601),
(209, 602),
(209, 603),
(209, 604),
(209, 701),
(209, 702),
(209, 801),
(209, 802),
(209, 803),
(209, 901),
(209, 902),
(209, 903),
(209, 1001),
(209, 1002),
(209, 1101),
(209, 1102),
(209, 1103),
(210, 901),
(210, 902),
(210, 903),
(210, 1001),
(210, 1002),
(210, 1101),
(210, 1102),
(210, 1103),
(211, 601),
(211, 602),
(211, 603),
(211, 604),
(211, 701),
(211, 702),
(211, 801),
(211, 802),
(211, 803),
(211, 901),
(211, 902),
(211, 903),
(211, 1001),
(211, 1002),
(211, 1101),
(211, 1102),
(211, 1103),
(212, 1001),
(212, 1002),
(212, 1101),
(212, 1102),
(212, 1103),
(213, 601),
(213, 602),
(213, 603),
(213, 604),
(213, 701),
(213, 702),
(213, 801),
(213, 802),
(213, 803),
(213, 901),
(213, 902),
(213, 903),
(213, 1001),
(213, 1002),
(213, 1101),
(213, 1102),
(213, 1103),
(214, 601),
(214, 602),
(214, 603),
(214, 604),
(214, 701),
(214, 702),
(214, 801),
(214, 802),
(214, 803),
(214, 901),
(214, 902),
(214, 903),
(214, 1001),
(214, 1002),
(214, 1101),
(214, 1102),
(214, 1103),
(215, 601),
(215, 602),
(215, 603),
(215, 604),
(215, 701),
(215, 702),
(215, 801),
(215, 802),
(215, 803),
(215, 901),
(215, 902),
(215, 903),
(215, 1001),
(215, 1002),
(215, 1101),
(215, 1102),
(215, 1103),
(216, 601),
(216, 602),
(216, 603),
(216, 604),
(216, 701),
(216, 702),
(216, 801),
(216, 802),
(216, 803),
(216, 901),
(216, 902),
(216, 903),
(216, 1001),
(216, 1002),
(216, 1101),
(216, 1102),
(216, 1103);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `numero_curso` int(4) NOT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `año` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`numero_curso`, `id_docente`, `año`) VALUES
(601, 200, 2020),
(602, 201, 2020),
(603, 202, 2020),
(604, 203, 2020),
(701, 204, 2020),
(702, 205, 2020),
(801, 206, 2020),
(802, 207, 2020),
(803, 208, 2020),
(901, 209, 2020),
(902, 210, 2020),
(903, 211, 2020),
(1001, 212, 2020),
(1002, 213, 2020),
(1101, 214, 2020),
(1102, 215, 2020),
(1103, 216, 2020);

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
(132, 'Janca@gmail.com	    ', '3106539847', 'M'),
(133, 'Milecue@otloukt.com	', '3429378473', 'F'),
(134, 'Turmeque@gmail.com	 ', '3179873647', 'M'),
(135, 'beltran@hotmail.com	', '3004448900', 'M'),
(136, 'Bernal10@hotmail.com', '3133360950', 'M'),
(137, 'Chambu03@gmail.com	 ', '3118938768', 'M'),
(138, 'Catayessi@gmail.com	', '3128349839', 'F'),
(139, 'Espeledav@outlookt.c', '3308379344', 'M'),
(140, 'Angelis@gmail.com	  ', '3028108767', 'F'),
(141, 'Pradadada@hotmail.co', '3138659324', 'M'),
(142, 'Moliyelo@outlookt.co', '3112081542', 'F'),
(143, 'Lilikeren@gmail.com	', '3154834454', 'F'),
(144, 'solerm@outlookt.com	', '3107355638', 'F'),
(145, 'cobosrodri@gmail.com', '3124567863', 'M'),
(146, 'rubendari45@gmail.co', '3215647635', 'M'),
(147, 'leuro@hotmail.com	  ', '3155439736', 'F'),
(148, 'hennerbar@gmail.com	', '3137539272', 'M'),
(149, 'ximemasflore@gmail.c', '3206385373', 'F'),
(150, 'ximenamacias@hotmail', '3116537273', 'F'),
(151, 'fivercontre@gmail.co', '3135364567', 'M'),
(152, 'Cueca@outlookt.com	 ', '3126231234', 'M'),
(153, 'Sandoval@gmail.com	 ', '3216279735', 'F'),
(154, 'hectorlel@gmail.com	', '3101725372', 'M'),
(155, 'garrassanti@gmail.co', '3125276735', 'M'),
(156, 'samuelito@hotmail.co', '3136730836', 'M'),
(157, 'Berrugin34@hotmail.c', '3216377838', 'M'),
(158, 'Caballin@gmail.com	 ', '3125375362', 'M'),
(159, 'sanchez30@outlookt.c', '3102416728', 'M'),
(160, 'leandritoguaji@hotma', '3202255273', 'M'),
(161, 'palma56@htolmail.com', '3124254252', 'M'),
(162, 'ojoteslarga@gmail.co', '3159735363', 'M'),
(163, 'riorio@outlookt.com	', '3215375383', 'M'),
(164, 'elejamora@outlook.co', '3208395732', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `definitivas`
--

CREATE TABLE `definitivas` (
  `id_notas` int(15) NOT NULL,
  `definitiva_B1` int(3) DEFAULT NULL,
  `definitiva_B2` int(3) DEFAULT NULL,
  `definitiva_B3` int(3) DEFAULT NULL,
  `definitiva_B4` int(3) DEFAULT NULL,
  `id_asignatura` int(4) DEFAULT NULL,
  `n_matricula` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `definitivas`
--

INSERT INTO `definitivas` (`id_notas`, `definitiva_B1`, `definitiva_B2`, `definitiva_B3`, `definitiva_B4`, `id_asignatura`, `n_matricula`) VALUES
(2010, 72, 85, NULL, NULL, 200, 1000),
(2011, 78, 80, NULL, NULL, 201, 1000),
(2012, 80, 84, NULL, NULL, 203, 1000),
(2013, 77, 77, NULL, NULL, 206, 1000),
(2014, 75, 67, NULL, NULL, 200, 1001),
(2015, 66, 87, NULL, NULL, 201, 1001),
(2016, 90, 92, NULL, NULL, 202, 1001),
(2017, 93, 93, NULL, NULL, 203, 1001),
(2018, 81, 75, NULL, NULL, 206, 1001),
(2019, 30, 100, NULL, NULL, 200, 1002),
(2020, 79, 80, NULL, NULL, 201, 1002),
(2021, 83, 82, NULL, NULL, 203, 1002),
(2022, 84, 85, NULL, NULL, 206, 1002),
(2023, 86, 87, NULL, NULL, 200, 1002),
(2024, 78, 78, NULL, NULL, 200, 1003),
(2025, 92, 93, NULL, NULL, 202, 1003),
(2026, 100, 40, NULL, NULL, 203, 1003),
(2027, 100, 63, NULL, NULL, 204, 1003),
(2028, 98, 64, NULL, NULL, 205, 1003),
(2029, 98, 65, NULL, NULL, 206, 1003),
(2030, 57, 87, NULL, NULL, 200, 1004),
(2031, 67, 87, NULL, NULL, 201, 1004),
(2032, 90, 90, NULL, NULL, 203, 1004),
(2033, 91, 90, NULL, NULL, 206, 1004),
(2034, 92, 93, NULL, NULL, 200, 1004),
(2035, 95, 94, NULL, NULL, 201, 1005),
(2036, 96, 97, NULL, NULL, 202, 1005),
(2037, 99, 98, NULL, NULL, 203, 1005),
(2038, 100, 40, NULL, NULL, 206, 1005),
(2039, 56, 78, NULL, NULL, 200, 1006),
(2040, 88, 87, NULL, NULL, 202, 1006),
(2041, 86, 86, NULL, NULL, 203, 1006),
(2042, 95, 30, NULL, NULL, 204, 1006),
(2043, 100, 33, NULL, NULL, 205, 1006),
(2044, 98, 76, NULL, NULL, 206, 1006),
(2045, 78, 92, NULL, NULL, 201, 1007),
(2046, 78, 78, NULL, NULL, 202, 1007),
(2047, 90, 93, NULL, NULL, 203, 1007),
(2048, 87, 94, NULL, NULL, 206, 1007),
(2049, 82, 83, NULL, NULL, 201, 1008),
(2050, 99, 88, NULL, NULL, 202, 1008),
(2051, 100, 20, NULL, NULL, 203, 1008),
(2052, 87, 98, NULL, NULL, 206, 1008),
(2053, 67, 78, NULL, NULL, 200, 1009),
(2054, 76, 76, NULL, NULL, 202, 1009),
(2055, 86, 85, NULL, NULL, 203, 1009),
(2056, 76, 59, NULL, NULL, 204, 1009),
(2057, 87, 90, NULL, NULL, 205, 1009),
(2058, 76, 100, NULL, NULL, 206, 1009);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dicta`
--

CREATE TABLE `dicta` (
  `id_docente` int(11) DEFAULT NULL,
  `id_asignatura` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `dicta`
--

INSERT INTO `dicta` (`id_docente`, `id_asignatura`) VALUES
(200, 203),
(201, 200),
(201, 212),
(203, 201),
(203, 204),
(204, 202),
(204, 211),
(205, 205),
(202, 206),
(206, 207),
(206, 208),
(207, 209),
(208, 210),
(209, 213),
(210, 214),
(210, 216),
(211, 215),
(212, 217),
(213, 218),
(214, 219),
(215, 221),
(216, 220),
(200, 203),
(201, 200),
(201, 212),
(203, 201),
(203, 204),
(204, 202),
(204, 211),
(205, 205),
(202, 206),
(206, 207),
(206, 208),
(207, 209),
(208, 210),
(209, 213),
(210, 214),
(210, 216),
(211, 215),
(212, 217),
(213, 218),
(214, 219),
(215, 221),
(216, 220);

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
(218, 78);

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
  `n_matricula` int(15) NOT NULL,
  `id_Usuario` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`n_matricula`, `id_Usuario`) VALUES
(1000, 1),
(1001, 6),
(1002, 7),
(1003, 8),
(1004, 9),
(1005, 10),
(1006, 11),
(1007, 12),
(1008, 14),
(1009, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrantescurso`
--

CREATE TABLE `integrantescurso` (
  `n_matricula` int(15) DEFAULT NULL,
  `numero_curso` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `integrantescurso`
--

INSERT INTO `integrantescurso` (`n_matricula`, `numero_curso`) VALUES
(1000, 603),
(1001, 801),
(1002, 603),
(1003, 1002),
(1004, 603),
(1005, 802),
(1006, 1002),
(1007, 802),
(1008, 801),
(1009, 1002),
(1000, 603),
(1001, 801),
(1002, 603),
(1003, 1002),
(1004, 603),
(1005, 802),
(1006, 1002),
(1007, 802),
(1008, 801),
(1009, 1002);

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
(19, 'Clarasssh', 'D', 'Clara', 'Mayerli', 'Torres', 'Mendoza', 32, 'clarashu90', 117),
(20, 'Juanitoc    ', 'E', 'Juan    ', 'José', 'Cadena', 'Arevalo', 17, 'ujaudnai  ', 132),
(21, 'Francym	 ', 'E', 'Francy	', 'Milena', 'Acosta', 'Cueca', 19, 'erfrab    ', 133),
(22, 'turmasdequej', 'E', 'John	', 'Anderson', 'Acosta', 'Turmeque', 15, 'jonedMdd	 ', 134),
(23, 'Bryanb	     ', 'E', 'Brayan	', 'Alfonso', 'Beltran', '', 15, 'jeireBry	 ', 135),
(24, 'BernalFab	 ', 'E', 'Fabiana	', '', 'Bernal', 'Garcia', 16, 'jfieuif	  ', 136),
(25, 'Didicha	 ', 'E', 'Diego	', 'Alejandro', 'Chambuenta', 'Cortes', 14, 'fvitref	  ', 137),
(26, 'xixterflore ', 'E', 'Yessica	', 'Lizeth	', 'Catañeda', 'Villalobos', 17, 'fkrroooote', 138),
(27, 'Espeletin	 ', 'E', 'Jairo 	', 'David', 'Espeleta', '', 18, 'rrguajd	  ', 139),
(28, 'Tovarm	     ', 'E', 'Maria	', 'Angelica', 'Tovar', 'Aguas', 19, 'mARIADF	  ', 140),
(29, 'Pradadu	 ', 'E', 'Duvan	', 'Steven', 'Prada', 'Gutierrez', 17, 'duvaned	  ', 141),
(30, 'Yeyemoli	 ', 'E', 'Yellin	', 'Stefany', 'Molina', 'Rocha', 14, 'yersldkdf	', 142),
(31, 'KerenRiii	 ', 'E', 'Keren 	', 'Liliana', 'Rios', '', 13, 'karfeadfe	', 143),
(32, 'Carisole	 ', 'E', 'Martha	', 'Carolina', 'Roa', 'Soler', 15, 'maridjfd	 ', 144),
(33, 'Cobitosa	 ', 'E', 'Ricardo ', 'Andres', 'Rodriguez', 'Cobos', 15, 'ruvenwje	 ', 145),
(34, 'DarioVasqq	 ', 'E', 'Ruben	', 'Dario', 'Diaz', 'Vasquéz', 17, 'jeifjes	  ', 146),
(35, 'LeuritoJ	 ', 'E', 'Jeniffer', '', 'Leuro', '', 16, 'efeleurot	', 147),
(36, 'BaronP	     ', 'E', 'Hanner	', 'Enrrique', 'Baron', '', 16, 'Hadnnewdf	', 148),
(37, 'FloreroX	 ', 'E', 'Jessica	', 'Ximena', 'Arana', 'Forero', 17, 'Ximenitafr', 149),
(38, 'CaritolM	 ', 'E', 'Carol	', 'Ximena', 'Macias', '', 19, 'Carollo	  ', 150),
(39, 'rebusqueC	 ', 'E', 'Feiver	', 'Farith', 'Contreras', 'Duarte', 16, 'Rebusquemo', 151),
(40, 'BigotesS	 ', 'E', 'David	', 'Santiago', 'Cueca', 'Goméz', 15, 'CortaBigot', 152),
(41, 'gomezangg	 ', 'E', 'Anguie	', '', 'Goméz', 'Sandoval', 16, 'Gomezsando', 153),
(42, 'Repeluz	 ', 'E', 'Hector	', 'Ivan', 'Leal', 'Rojas', 13, 'Repeluzin	', 154),
(43, 'Garruña	 ', 'E', 'Santiago', '', 'Ortiz', 'Gonzales', 14, 'Grrrasgon	', 155),
(44, 'Oterito	 ', 'E', 'Franklin', 'Samuel', 'Otero', 'Bedoya', 18, 'Franklinot', 156),
(45, 'BerrugaY	 ', 'E', 'Oscar	', 'Yessid', 'Rojas', 'Bejarano', 16, 'Vergarano	', 157),
(46, 'Caballo	 ', 'E', 'Yair	', 'Alfonso', 'Rojas', 'Bejarano', 14, 'CaballinJu', 158),
(47, 'Muelas	     ', 'E', 'David	', 'Santiago', 'Sanchéz', 'Ortiz', 15, 'Calvasexy	', 159),
(48, 'Guajiro	 ', 'E', 'Jhonatan', 'Leandro', 'Torres', 'Caballero', 13, 'Lenadrosss', 160),
(49, 'Palmane	 ', 'E', 'Jhonny	', 'Stevan', 'Sandoval', 'Palma', 14, 'Sandomusi	', 161),
(50, 'Ojotes	     ', 'E', 'Vairon	', 'Estevan', 'Sepulveda', 'Ruiz', 19, 'Vairoojito', 162),
(51, 'Riosucio	 ', 'E', 'Juan	', 'Sebastian', 'Virguéz', 'Zacipa', 18, 'Virguezrio', 163),
(52, 'Alejaani	 ', 'E', 'Annie	', 'Alejandra', 'Mora', 'Gonzalez', 18, 'Moritacant', 164),
(65, 'lorec', 'D', 'Lorena', '', 'Carrillo', 'Guzman', 30, 'apdfnpuir', NULL),
(66, 'alfreN', 'D', 'Alfredo', '', 'Nuñes', 'Castro', 35, ' cm8afhnfh', NULL),
(67, 'ManuelAso', 'D', 'Manuel', 'Alfredo', 'Linares', 'Sosa', 40, 'cwec84cow3', NULL),
(68, 'jjP', 'D', 'Jenrry', 'Jonas', 'Piñeros', '', 37, 'cumehnoie8', NULL),
(69, 'karego', 'D', 'Karen', 'Julieth', 'Gomez', 'Parrado', 30, 'karenfeadc', NULL),
(70, 'clauG', 'D', 'Claudia', 'Milena', 'Rodrigez', 'Gonsalez', 36, '320ucnw093', NULL),
(71, 'TerePa', 'D', 'Tereza', '', 'Garcia', 'Cruz', 37, 'm48ruw9wp3', NULL),
(72, 'NiñoP', 'D', 'Dario', 'Julian', 'Niño', '', 42, 'n44hrw9p4n', NULL),
(73, 'Joly42', 'D', 'Blanca', 'Jolanda', 'Caballero', 'Rozo', 42, 'w48rumpq32', NULL),
(74, 'DidiK', 'D', 'Diego', 'Alejandro', 'Castañeda', '', 38, 'ew98emfcpq', NULL),
(75, 'TaniV', 'D', 'Tania', 'Maria', 'Torrez', 'Veloza', 27, 'mfjirg58d', NULL),
(76, 'Ximemas', 'D', 'Sandra ', 'Ximena', 'Reyes', '', 29, 'fjmcwosdfc', NULL),
(77, 'cilantroM', 'D', 'Lisandro ', '', 'Moreno', 'Orjuela', 36, 'mjcdei3bg', NULL),
(78, 'Jorsh', 'D', 'Jorge ', 'Luis', 'Baron', 'Benavidez', 33, 'mcskfhnu49', NULL);

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
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD KEY `numero_curso` (`numero_curso`),
  ADD KEY `id_asignatura` (`id_asignatura`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`numero_curso`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indices de la tabla `datos_adicionales`
--
ALTER TABLE `datos_adicionales`
  ADD PRIMARY KEY (`id_datos_adicionales`);

--
-- Indices de la tabla `definitivas`
--
ALTER TABLE `definitivas`
  ADD PRIMARY KEY (`id_notas`),
  ADD KEY `n_matricula` (`n_matricula`),
  ADD KEY `id_asignatura` (`id_asignatura`);

--
-- Indices de la tabla `dicta`
--
ALTER TABLE `dicta`
  ADD KEY `id_asignatura` (`id_asignatura`),
  ADD KEY `id_docente` (`id_docente`);

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
  ADD PRIMARY KEY (`n_matricula`),
  ADD KEY `id_Usuario` (`id_Usuario`);

--
-- Indices de la tabla `integrantescurso`
--
ALTER TABLE `integrantescurso`
  ADD KEY `n_matricula` (`n_matricula`),
  ADD KEY `numero_curso` (`numero_curso`);

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
  MODIFY `id_asignatura` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=222;

--
-- AUTO_INCREMENT de la tabla `datos_adicionales`
--
ALTER TABLE `datos_adicionales`
  MODIFY `id_datos_adicionales` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT de la tabla `definitivas`
--
ALTER TABLE `definitivas`
  MODIFY `id_notas` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2059;

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_Usuario` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

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
  ADD CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`numero_curso`) REFERENCES `curso` (`numero_curso`),
  ADD CONSTRAINT `clases_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`);

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`);

--
-- Filtros para la tabla `definitivas`
--
ALTER TABLE `definitivas`
  ADD CONSTRAINT `definitivas_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `definitivas_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `definitivas_ibfk_3` FOREIGN KEY (`n_matricula`) REFERENCES `estudiante` (`n_matricula`),
  ADD CONSTRAINT `definitivas_ibfk_4` FOREIGN KEY (`n_matricula`) REFERENCES `estudiante` (`n_matricula`),
  ADD CONSTRAINT `definitivas_ibfk_5` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`);

--
-- Filtros para la tabla `dicta`
--
ALTER TABLE `dicta`
  ADD CONSTRAINT `dicta_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  ADD CONSTRAINT `dicta_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`);

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
  ADD CONSTRAINT `integrantescurso_ibfk_5` FOREIGN KEY (`n_matricula`) REFERENCES `estudiante` (`n_matricula`),
  ADD CONSTRAINT `integrantescurso_ibfk_6` FOREIGN KEY (`numero_curso`) REFERENCES `curso` (`numero_curso`);

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
