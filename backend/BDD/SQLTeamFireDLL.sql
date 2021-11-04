-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-11-2021 a las 17:22:59
-- Versión del servidor: 10.3.28-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dggzlwff_bdteamfire`
--

-- --------------------------------------------------------

--
-- Estructura tabla `CAPACITACIONES`, Desarrollada para que
-- Representantes de Empresas o Instituciones, posteen Cursos,
-- Palestras o Charlas, y sus Caracteristicas.
--

CREATE TABLE `CAPACITACIONES` (
  `id_capacitacion` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombrecapacitacion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `duracion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `descripcion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `tituloobtenido` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `provincia` varchar(45) CHARACTER SET latin1 NOT NULL,
  `ciudad` varchar(45) CHARACTER SET latin1 NOT NULL,
  `direccion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `gratis_pago` varchar(45) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura tabla `DATOSCV`, Para que Estudiantes/Programadores
-- Posteen, datos de CV, y suban el modelo de CV.
--

CREATE TABLE `DATOSCV` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(25) CHARACTER SET latin1 NOT NULL,
  `apellido` varchar(25) CHARACTER SET latin1 NOT NULL,
  `edad` int(11) NOT NULL,
  `direccion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `telefono` int(11) NOT NULL,
  `educacion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `experiencialaboral` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `cursos` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `capacitaciones` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `linkcv` varchar(200) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura tabla `ENTIDADES`, Referencia de tipos de Entidades
-- para Tabla REGISTROAVANZADO, "lista desplegable"
--

CREATE TABLE `ENTIDADES` (
  `entidad` varchar(45) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura tabla `GRATIS_PAGO`, para dar opcion de 
-- Gratis o Pago referido a tabla CAPACITACIONES "lista desplegable"
--

CREATE TABLE `GRATIS_PAGO` (
  `gratis_pago` varchar(45) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura tabla `OFERTASLABORALES` para que Empresas 
-- Coloquen Oferta Laboral
--

CREATE TABLE `OFERTASLABORALES` (
  `id_oferta` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `descripciondelpuesto` varchar(45) CHARACTER SET latin1 NOT NULL,
  `requisitos` varchar(45) CHARACTER SET latin1 NOT NULL,
  `sueldo` decimal(10,0) DEFAULT NULL,
  `mododecontratacion` varchar(45) CHARACTER SET latin1 NOT NULL,
  `ciudad` varchar(45) CHARACTER SET latin1 NOT NULL,
  `provincia` varchar(45) CHARACTER SET latin1 NOT NULL,
  `OFERTASLABORALEScol` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura tabla `PROYECTOS`, para que cualquier Usuario
-- tenga la posibilidad de Postear Proyecto/s, en la cual
-- Estudiantes/Programadores soliciten participar en la elaboracion
--

CREATE TABLE `PROYECTOS` (
  `id_proyecto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `nombre_proyecto` varchar(45) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(300) COLLATE utf8_bin NOT NULL,
  `observaciones` varchar(300) COLLATE utf8_bin NOT NULL,
  `tiempo` int(11) NOT NULL,
  `colaboracion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura tabla `RAEMPRESA`, Registro Avanzado para Empresa
-- por usuario Representante
--

CREATE TABLE `RAEMPRESA` (
  `id_empresa` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(45) CHARACTER SET latin1 NOT NULL,
  `razonsocial` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `calle` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `barrio` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `ciudad` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `provincia` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `rubro` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `actividades` varchar(200) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `RAEMPRESA`
--

INSERT INTO `RAEMPRESA` (`id_empresa`, `id_usuario`, `nombre`, `razonsocial`, `calle`, `barrio`, `ciudad`, `provincia`, `rubro`, `actividades`) VALUES
(1, 1, 'XLAlarmas', '1234456', 'San Pedro 34', 'San Juan', 'Cordoba', 'cordoba', 'Central de Alarmas', 'Monitoreo de Alarmas de casa'),
(2, 2, 'Panaderia Jose', '13234456', 'San juan 84', 'San Justo', 'Rio Cuarto', 'Cordoba', 'Panaderia', 'Elaboracion de Panificaciones'),
(3, 4, 'InformaticaMc', '12344356', 'Pedro Elias 4324', 'MarcosJ', 'Tancacha', 'Cordoba', 'Informatica', 'Venta de Articulos informaticos, Reparacion de Pc');

-- --------------------------------------------------------

--
-- Estructura tabla `RAESTUDIANTE`, Registro Avanzado para 
-- usuario calificado como Estudiante
--

CREATE TABLE `RAESTUDIANTE` (
  `id_usuario` int(11) NOT NULL,
  `areadeestudio` varchar(45) CHARACTER SET latin1 NOT NULL,
  `niveldedesarrollo` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `institucion` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura tabla `RAINSTITUCION`, Registro Avanzado para
-- usuario calificado como Representante de Institucion
--

CREATE TABLE `RAINSTITUCION` (
  `id_usuario` int(11) NOT NULL,
  `cargoempresa` varchar(45) CHARACTER SET latin1 NOT NULL,
  `ambito` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `ciudad` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `provincia` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura tabla `RAPROGRAMADOR`, Registro Avanzado para 
-- usuario declarados como Programadores
--

CREATE TABLE `RAPROGRAMADOR` (
  `id_usuario` int(11) NOT NULL,
  `tipo_programador` varchar(45) CHARACTER SET latin1 NOT NULL,
  `niveldedesarrollo` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `institucion` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `nombredecarrera` varchar(45) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura tabla `REGISTRADOS`, Registro principal, el cual se usara 
-- parcialmente para Login
--

CREATE TABLE `REGISTRADOS` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(45) CHARACTER SET latin1 NOT NULL DEFAULT 'unique',
  `contrasena` varchar(45) CHARACTER SET latin1 NOT NULL,
  `email` varchar(45) CHARACTER SET latin1 NOT NULL,
  `fechadenacimiento` date NOT NULL,
  `pais` varchar(45) COLLATE utf8_bin NOT NULL,
  `provincia` varchar(45) COLLATE utf8_bin NOT NULL,
  `telefono` varchar(50) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(45) COLLATE utf8_bin NOT NULL,
  `apellido` varchar(45) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `REGISTRADOS`
--

INSERT INTO `REGISTRADOS` (`id_usuario`, `usuario`, `contrasena`, `email`, `fechadenacimiento`, `pais`, `provincia`, `telefono`, `nombre`, `apellido`) VALUES
(1, 'Pedro35', 'dsa.432', 'nuevoEmail@gmail.com', '1900-06-07', 'Argentina', 'Cordoba', '2342342443', 'Carlos Alberto', 'alfonso'),
(2, 'juan', '123456', 'p1@gmail.com', '1904-06-07', 'Argentina', 'jujuy', '32423', 'juan', 'guzman'),
(4, 'carlos', '1234456', 'p2@gmail.com', '1944-06-07', 'Argentina', 'San Juan', '3242333', 'Carlos Martin', 'Alberto'),
(5, 'carlos342', '1234456', 'p2@gmail.com', '1944-06-07', 'Argentina', 'San Juan', '3242333', 'Carlos Martin', 'Alberto'),
(6, 'jorge32', '12234456', 'p3@gmail.com', '1954-06-07', 'Chile', 'San Juan', '32424333', 'Jorge Carlos', 'Juarez'),
(7, 'carlos43255', '1234456', 'p2@gmail.com', '1945-06-07', 'Argentina', 'San Juan', '32423533', 'Carlos Martin', 'Alberto');

-- --------------------------------------------------------

--
-- Estructura tabla `REGISTROAVANZADO`, tabla de relacion llevando
-- al Registro Avanzado Correpondiente
--

CREATE TABLE `REGISTROAVANZADO` (
  `entidad` varchar(45) CHARACTER SET latin1 NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura tabla `TIPOPROGRAMADOR`, numera los tipos de programadores
diferentes "seleccion de opciones"
--

CREATE TABLE `TIPOPROGRAMADOR` (
  `tipo_programador` varchar(45) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CAPACITACIONES`
--
ALTER TABLE `CAPACITACIONES`
  ADD PRIMARY KEY (`id_capacitacion`),
  ADD KEY `id_empresa_idx` (`id_empresa`),
  ADD KEY `gratis_pago_idx` (`gratis_pago`),
  ADD KEY `CAPACITACIONES_ibfk_2` (`id_usuario`);

--
-- Indices de la tabla `DATOSCV`
--
ALTER TABLE `DATOSCV`
  ADD KEY `id_usuario_idx` (`id_usuario`);

--
-- Indices de la tabla `ENTIDADES`
--
ALTER TABLE `ENTIDADES`
  ADD PRIMARY KEY (`entidad`);

--
-- Indices de la tabla `GRATIS_PAGO`
--
ALTER TABLE `GRATIS_PAGO`
  ADD PRIMARY KEY (`gratis_pago`);

--
-- Indices de la tabla `OFERTASLABORALES`
--
ALTER TABLE `OFERTASLABORALES`
  ADD PRIMARY KEY (`id_oferta`),
  ADD KEY `id_empresa_idx` (`id_empresa`),
  ADD KEY `id_usuario_idx` (`id_usuario`);

--
-- Indices de la tabla `PROYECTOS`
--
ALTER TABLE `PROYECTOS`
  ADD PRIMARY KEY (`id_proyecto`),
  ADD KEY `id_usuario_idx` (`id_usuario`),
  ADD KEY `id_empresa_idx` (`id_empresa`);

--
-- Indices de la tabla `RAEMPRESA`
--
ALTER TABLE `RAEMPRESA`
  ADD PRIMARY KEY (`id_empresa`),
  ADD KEY `id_usuario_idx` (`id_usuario`) USING BTREE,
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `RAESTUDIANTE`
--
ALTER TABLE `RAESTUDIANTE`
  ADD KEY `id_usuario_idx` (`id_usuario`);

--
-- Indices de la tabla `RAINSTITUCION`
--
ALTER TABLE `RAINSTITUCION`
  ADD KEY `id_usuario_idx` (`id_usuario`);

--
-- Indices de la tabla `RAPROGRAMADOR`
--
ALTER TABLE `RAPROGRAMADOR`
  ADD KEY `id_usuario_idx` (`id_usuario`),
  ADD KEY `tipo_programador_idx` (`tipo_programador`);

--
-- Indices de la tabla `REGISTRADOS`
--
ALTER TABLE `REGISTRADOS`
  ADD PRIMARY KEY (`id_usuario`,`usuario`,`contrasena`,`email`) USING BTREE;

--
-- Indices de la tabla `REGISTROAVANZADO`
--
ALTER TABLE `REGISTROAVANZADO`
  ADD KEY `entidad_idx` (`entidad`),
  ADD KEY `id_usuario6_idx` (`id_usuario`);

--
-- Indices de la tabla `TIPOPROGRAMADOR`
--
ALTER TABLE `TIPOPROGRAMADOR`
  ADD PRIMARY KEY (`tipo_programador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `CAPACITACIONES`
--
ALTER TABLE `CAPACITACIONES`
  MODIFY `id_capacitacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `OFERTASLABORALES`
--
ALTER TABLE `OFERTASLABORALES`
  MODIFY `id_oferta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `PROYECTOS`
--
ALTER TABLE `PROYECTOS`
  MODIFY `id_proyecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `RAEMPRESA`
--
ALTER TABLE `RAEMPRESA`
  MODIFY `id_empresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `REGISTRADOS`
--
ALTER TABLE `REGISTRADOS`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `CAPACITACIONES`
--
ALTER TABLE `CAPACITACIONES`
  ADD CONSTRAINT `CAPACITACIONES_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `RAEMPRESA` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CAPACITACIONES_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `REGISTRADOS` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CAPACITACIONES_ibfk_3` FOREIGN KEY (`gratis_pago`) REFERENCES `GRATIS_PAGO` (`gratis_pago`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `DATOSCV`
--
ALTER TABLE `DATOSCV`
  ADD CONSTRAINT `DATOSCV_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `REGISTRADOS` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `OFERTASLABORALES`
--
ALTER TABLE `OFERTASLABORALES`
  ADD CONSTRAINT `OFERTASLABORALES_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `CAPACITACIONES` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `OFERTASLABORALES_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `REGISTRADOS` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `PROYECTOS`
--
ALTER TABLE `PROYECTOS`
  ADD CONSTRAINT `PROYECTOS_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `REGISTRADOS` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PROYECTOS_ibfk_2` FOREIGN KEY (`id_empresa`) REFERENCES `RAEMPRESA` (`id_empresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `RAEMPRESA`
--
ALTER TABLE `RAEMPRESA`
  ADD CONSTRAINT `RAEMPRESA_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `REGISTRADOS` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `RAESTUDIANTE`
--
ALTER TABLE `RAESTUDIANTE`
  ADD CONSTRAINT `RAESTUDIANTE_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `REGISTRADOS` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `RAINSTITUCION`
--
ALTER TABLE `RAINSTITUCION`
  ADD CONSTRAINT `RAINSTITUCION_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `REGISTRADOS` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `RAPROGRAMADOR`
--
ALTER TABLE `RAPROGRAMADOR`
  ADD CONSTRAINT `RAPROGRAMADOR_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `REGISTRADOS` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `RAPROGRAMADOR_ibfk_2` FOREIGN KEY (`tipo_programador`) REFERENCES `TIPOPROGRAMADOR` (`tipo_programador`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `REGISTROAVANZADO`
--
ALTER TABLE `REGISTROAVANZADO`
  ADD CONSTRAINT `REGISTROAVANZADO_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `REGISTRADOS` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `REGISTROAVANZADO_ibfk_2` FOREIGN KEY (`entidad`) REFERENCES `ENTIDADES` (`entidad`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
