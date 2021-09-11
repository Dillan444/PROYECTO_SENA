/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ sigc /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE sigc;

DROP TABLE IF EXISTS administrador;
CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL AUTO_INCREMENT,
  `id_Usuario` int(8) DEFAULT NULL,
  `codigo` int(8) NOT NULL,
  PRIMARY KEY (`id_administrador`),
  KEY `id_Usuario` (`id_Usuario`),
  CONSTRAINT `administrador_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS año;
CREATE TABLE `año` (
  `id_año` int(2) NOT NULL AUTO_INCREMENT,
  `año` year(4) NOT NULL,
  PRIMARY KEY (`id_año`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS asignatura;
CREATE TABLE `asignatura` (
  `id_asignatura` int(4) NOT NULL AUTO_INCREMENT,
  `nombre_asignatura` varchar(20) NOT NULL,
  `Tipo_asignatura` varchar(20) NOT NULL,
  PRIMARY KEY (`id_asignatura`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS clases;
CREATE TABLE `clases` (
  `numero_curso` int(4) DEFAULT NULL,
  `id_asignatura` int(4) DEFAULT NULL,
  KEY `numero_curso` (`numero_curso`),
  KEY `id_asignatura` (`id_asignatura`),
  CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`numero_curso`) REFERENCES `curso` (`numero_curso`),
  CONSTRAINT `clases_ibfk_2` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS curso;
CREATE TABLE `curso` (
  `numero_curso` int(4) NOT NULL,
  `grado_curso` varchar(20) NOT NULL,
  PRIMARY KEY (`numero_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS datos_adicionales;
CREATE TABLE `datos_adicionales` (
  `id_datos_adicionales` int(8) NOT NULL AUTO_INCREMENT,
  `correo` varchar(20) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `sexo` char(1) NOT NULL,
  PRIMARY KEY (`id_datos_adicionales`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS definitivas;
CREATE TABLE `definitivas` (
  `id_notas` int(15) NOT NULL,
  `definitiva_B1` int(3) DEFAULT NULL,
  `definitiva_B2` int(3) DEFAULT NULL,
  `definitiva_B3` int(3) DEFAULT NULL,
  `definitiva_B4` int(3) DEFAULT NULL,
  `id_asignatura` int(4) DEFAULT NULL,
  `id_integrantes` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_notas`),
  KEY `id_asignatura` (`id_asignatura`),
  KEY `id_integrantes` (`id_integrantes`),
  CONSTRAINT `definitivas_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  CONSTRAINT `definitivas_ibfk_2` FOREIGN KEY (`id_integrantes`) REFERENCES `integrantescurso` (`id_integrantes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS dicta;
CREATE TABLE `dicta` (
  `id_docente` int(11) DEFAULT NULL,
  `id_asignatura` int(4) DEFAULT NULL,
  KEY `id_asignatura` (`id_asignatura`),
  KEY `id_docente` (`id_docente`),
  CONSTRAINT `dicta_ibfk_1` FOREIGN KEY (`id_asignatura`) REFERENCES `asignatura` (`id_asignatura`),
  CONSTRAINT `dicta_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`id_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS docente;
CREATE TABLE `docente` (
  `id_docente` int(11) NOT NULL AUTO_INCREMENT,
  `id_Usuario` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_docente`),
  KEY `id_Usuario` (`id_Usuario`),
  CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS documento;
CREATE TABLE `documento` (
  `id_documento` int(15) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `id_Usuario` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_documento`),
  KEY `id_Usuario` (`id_Usuario`),
  CONSTRAINT `documento_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS estudiante;
CREATE TABLE `estudiante` (
  `id_estudiante` int(11) NOT NULL AUTO_INCREMENT,
  `n_matricula` int(15) NOT NULL,
  `id_Usuario` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_estudiante`),
  KEY `id_Usuario` (`id_Usuario`),
  CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS integrantescurso;
CREATE TABLE `integrantescurso` (
  `id_estudiante` int(11) DEFAULT NULL,
  `numero_curso` int(4) DEFAULT NULL,
  `id_año` int(2) DEFAULT NULL,
  `id_integrantes` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_integrantes`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_año` (`id_año`),
  KEY `numero_curso` (`numero_curso`),
  CONSTRAINT `integrantescurso_ibfk_1` FOREIGN KEY (`numero_curso`) REFERENCES `curso` (`numero_curso`),
  CONSTRAINT `integrantescurso_ibfk_2` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`),
  CONSTRAINT `integrantescurso_ibfk_3` FOREIGN KEY (`id_año`) REFERENCES `año` (`id_año`),
  CONSTRAINT `integrantescurso_ibfk_4` FOREIGN KEY (`numero_curso`) REFERENCES `curso` (`numero_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS rol;
CREATE TABLE `rol` (
  `id_rol` char(1) NOT NULL,
  `tipo_rol` varchar(15) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS usuario;
CREATE TABLE `usuario` (
  `id_Usuario` int(8) NOT NULL AUTO_INCREMENT,
  `nombre_perfil` varchar(30) NOT NULL,
  `id_rol` char(1) NOT NULL,
  `p_nombre` varchar(30) NOT NULL,
  `s_nombre` varchar(30) DEFAULT NULL,
  `p_apellido` varchar(30) NOT NULL,
  `s_apellido` varchar(30) DEFAULT NULL,
  `edad` int(2) NOT NULL,
  `contraseña` varchar(10) NOT NULL,
  `id_datos_adicionales` int(8) DEFAULT NULL,
  PRIMARY KEY (`id_Usuario`),
  KEY `id_rol` (`id_rol`),
  KEY `id_datos_adicionales` (`id_datos_adicionales`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`),
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_datos_adicionales`) REFERENCES `datos_adicionales` (`id_datos_adicionales`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

INSERT INTO administrador(id_administrador,id_Usuario,codigo) VALUES(20,4,10000101),(21,16,10000102),(22,17,10000103);

INSERT INTO año(id_año,año) VALUES(1,'2020'),(2,'2021'),(3,'2022'),(4,'2023');

INSERT INTO asignatura(id_asignatura,nombre_asignatura,Tipo_asignatura) VALUES(200,'Sociales','Historia'),(201,'Biologia','Ciencia N'),(202,'Algebra','Matematicas'),(203,'E_Fisica','Deporte'),(204,'Quimica','Ciencia N');

INSERT INTO clases(numero_curso,id_asignatura) VALUES(603,200),(603,201),(603,203),(603,204),(801,200),(801,201),(801,202),(801,203),(801,204),(802,200),(802,201),(802,202),(802,203),(802,204),(1002,200),(1002,202),(1002,203),(1002,204);

INSERT INTO curso(numero_curso,grado_curso) VALUES(601,'Sexto'),(602,'Sexto'),(603,'Sexto'),(701,'Septimo'),(702,'Septimo'),(801,'octavo'),(802,'octavo'),(803,'octavo'),(901,'noveno'),(902,'noveno'),(903,'noveno'),(1001,'decimo'),(1002,'decimo'),(1101,'once'),(1102,'once'),(1103,'once');

INSERT INTO datos_adicionales(id_datos_adicionales,correo,Telefono,sexo) VALUES(100,'jolu@gmail.com','3124567890','M'),(101,'marialuz@misena.edu.','3216789034','F'),(102,'amartinez9837@misena','3128323234','M'),(103,'aleduque07@misena.ed','3204012879','M'),(104,'estefa03@gmail.com','3139908657','F'),(105,'juliancas12@gmail.co','3124567890','M'),(106,'AlexaJ@gmail.com','3116789043','F'),(107,'luisalg@hotmail.com','3208976545','M'),(108,'Andresg@hotmail.com','3004417896','M'),(109,'Andreisv@outlook.com','3016666668','M'),(110,'Maricab@gmail.com','3215678903','F'),(111,'Albedyrom@hotmail.co','3057789065','M'),(112,'Soyfer@gmail.com','3004496745','F'),(113,'Elverdagala@outlook.','3128356745','M'),(114,'dsportocarreno@misen','3105620541','M'),(115,'fsrojas26@misena.edu','3118447218','M'),(116,'Cecillar@gmail.com','3047895644','M'),(117,'Claritahu@hotmail.co','32145678790','F');

INSERT INTO definitivas(id_notas,definitiva_B1,definitiva_B2,definitiva_B3,definitiva_B4,id_asignatura,id_integrantes) VALUES(2000,67,80,NULL,NULL,NULL,NULL),(2001,89,88,NULL,NULL,NULL,NULL),(2002,90,94,NULL,NULL,NULL,NULL),(2003,30,93,NULL,NULL,NULL,NULL),(2004,78,78,NULL,NULL,NULL,NULL),(2005,77,32,NULL,NULL,NULL,NULL),(2006,87,89,NULL,NULL,NULL,NULL),(2007,90,78,NULL,NULL,NULL,NULL),(2008,95,91,NULL,NULL,NULL,NULL),(2009,89,78,NULL,NULL,NULL,NULL);

INSERT INTO dicta(id_docente,id_asignatura) VALUES(200,202),(200,203),(201,200),(203,201),(203,204),(204,202),(205,204);

INSERT INTO docente(id_docente,id_Usuario) VALUES(200,2),(201,3),(203,13),(204,18),(205,19);

INSERT INTO documento(id_documento,descripcion,id_Usuario) VALUES(3123709,'Cedula de Ciudadania',4),(3123789,'Cedula de Ciudadania',13),(3127875,'Cedula de Ciudadania',19),(4568902,'Cedula de ciudadania',3),(20567890,'Cedula de Ciudadania',2),(20890786,'Cedula de Ciudadania',18),(1000067543,'Tarjeta de identidad',14),(1000345673,'Tarjeta de identidad',11),(1000346789,'Tarjeta de identidad',9),(1000349876,'Tarjeta de identidad',10),(1000357899,'Tarjeta de identidad',8),(1000678999,'Cedula de Ciudadania',17),(1003456429,'Tarjeta de identidad',6),(1003678456,'Tarjeta de identidad',1),(1004567832,'Tarjeta de identidad',12),(1005678932,'Cedula de ciudadania',16),(1005789393,'Tarjeta de identidad',7),(1007890321,'Tarjeta de identidad',15);

INSERT INTO estudiante(id_estudiante,n_matricula,id_Usuario) VALUES(1000,3301111,1),(1001,3301112,6),(1002,3301113,7),(1003,3301114,8),(1004,3301115,9),(1005,3301116,10),(1006,3301117,11),(1007,3301118,12),(1008,3301119,14),(1009,3301120,15);

INSERT INTO integrantescurso(id_estudiante,numero_curso,id_año,id_integrantes) VALUES(1000,603,1,1),(1001,801,1,2),(1002,603,1,3),(1003,1002,1,4),(1004,603,1,5),(1005,802,1,6),(1006,1002,1,7),(1007,802,1,8),(1008,801,1,9),(1009,1002,1,10);

INSERT INTO rol(id_rol,tipo_rol) VALUES('A','Administrador'),('D','Docente'),('E','Estudiante');
INSERT INTO usuario(id_Usuario,nombre_perfil,id_rol,p_nombre,s_nombre,p_apellido,s_apellido,edad,contraseña,id_datos_adicionales) VALUES(1,'joseM','E','Jose','Luis','Mendéz','',13,'1345678890',100),(2,'Marialu','D','Maria','Luz','Camacho','Parra',51,'Mlc2345872',101),(3,'Arist','D','Aristobulo','','Martinéz','Cruz',42,'martinez45',102),(4,'Aledu','A','Alejandro','','Duque','Escobar',30,'jasinto123',103),(6,'estefin','E','Estefania','','Goméz','Rodriguéz',15,'eegomez678',104),(7,'Julic','E','Julian','Camilo','Castro','Cruz',13,'Juliccc345',105),(8,'Yulijc','E','Yulieth','Alexandra','Cubillos','Arias',17,'Alexa12321',106),(9,'Luish','E','Luis','Alfonso','Goméz','Ramos',13,'Jalo4567',107),(10,'Adreisg','E','Andres','Guillermo','Goméz','Ramos',15,'Andreig908',108),(11,'Andrefeli','E','Andres','Felipe','Villalobos','Galeano',17,'felipito45',109),(12,'Mariiii','E','Maria','Camila','Acosta','Benavidez',14,'bena145678',110),(13,'Albejalo','D','Albedy','Roman','Quiñones','Acosta',33,'Donalbedy3',111),(14,'Fernanfra','E','Fernanda','','Lopéz','Castro',14,'soyfer76',112),(15,'elverda','E','Elver','David','Galarga','Forero',17,'elvergalar',113),(16,'Diilli','A','Dillan','Smith','Portocarrero','Rojas',19,'Dilliporto',114),(17,'Santifabi','A','Farith','Santiago','Rojas','Garzón',19,'Srrojas26',115),(18,'Cesarlll','D','Cesar','Luis','Velasquez','Parrado',31,'Crluis78',116),(19,'Clarasssh','D','Clara','Mayerli','Torres','Mendoza',32,'clarashu90',117);