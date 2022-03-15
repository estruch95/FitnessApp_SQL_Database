-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-03-2022 a las 13:44:04
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `FitnessApp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cheat_meal`
--

CREATE TABLE `cheat_meal` (
  `id` int(11) NOT NULL,
  `comida` varchar(50) NOT NULL,
  `lugar` varchar(100) NOT NULL,
  `entrantes` varchar(500) NOT NULL,
  `principal` varchar(500) NOT NULL,
  `postre` varchar(500) NOT NULL,
  `descripcion` text NOT NULL,
  `foto_entrantes` varchar(500) DEFAULT NULL,
  `foto_principal` varchar(500) DEFAULT NULL,
  `foto_postre` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comida`
--

CREATE TABLE `comida` (
  `id` int(11) NOT NULL,
  `comida` varchar(50) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `grp_muscular` varchar(50) NOT NULL,
  `num_series` int(11) NOT NULL,
  `reps_serie` varchar(100) NOT NULL,
  `tiempo_descanso` varchar(50) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamiento`
--

CREATE TABLE `entrenamiento` (
  `id` int(11) NOT NULL,
  `titular` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `gym` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `foto` varchar(500) DEFAULT NULL,
  `video` varchar(500) DEFAULT NULL,
  `duracion` varchar(50) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pent_ejer`
--

CREATE TABLE `pent_ejer` (
  `id_plan_entrenamiento` int(11) NOT NULL,
  `id_ejercicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_entrenamiento`
--

CREATE TABLE `plan_entrenamiento` (
  `id` int(11) NOT NULL,
  `titular` varchar(100) NOT NULL,
  `objetivo` varchar(100) NOT NULL,
  `fecha_comienzo` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `dias_descanso_sem` int(11) NOT NULL,
  `tiempo_cardio` varchar(50) DEFAULT NULL,
  `rma` varchar(50) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan_nutricional`
--

CREATE TABLE `plan_nutricional` (
  `id` int(11) NOT NULL,
  `titular` varchar(100) NOT NULL,
  `objetivo` varchar(100) NOT NULL,
  `fecha_comienzo` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `calorias` int(11) NOT NULL,
  `cdad_agua_diaria` float DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pnut_cmel`
--

CREATE TABLE `pnut_cmel` (
  `id_plan_nutricional` int(11) NOT NULL,
  `id_cheat_meal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pnut_comi`
--

CREATE TABLE `pnut_comi` (
  `id_plan_nutricional` int(11) NOT NULL,
  `id_comida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pnut_supl`
--

CREATE TABLE `pnut_supl` (
  `id_plan_nutricional` int(11) NOT NULL,
  `id_suplemento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suplemento`
--

CREATE TABLE `suplemento` (
  `id` int(11) NOT NULL,
  `suplemento` varchar(100) NOT NULL,
  `marca` varchar(100) NOT NULL,
  `cantidad` float NOT NULL,
  `sabor` varchar(50) NOT NULL,
  `dosis_diaria` float NOT NULL,
  `tabla_nutricional` varchar(500) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasena` varchar(50) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cheat_meal`
--
ALTER TABLE `cheat_meal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comida`
--
ALTER TABLE `comida`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_USUARIO` (`id_usuario`);

--
-- Indices de la tabla `pent_ejer`
--
ALTER TABLE `pent_ejer`
  ADD KEY `FK_PLAN` (`id_plan_entrenamiento`),
  ADD KEY `FK_EJER` (`id_ejercicio`);

--
-- Indices de la tabla `plan_entrenamiento`
--
ALTER TABLE `plan_entrenamiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_USUARIO_PLAN` (`id_usuario`);

--
-- Indices de la tabla `plan_nutricional`
--
ALTER TABLE `plan_nutricional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_PLAN_USUARIO` (`id_usuario`);

--
-- Indices de la tabla `pnut_cmel`
--
ALTER TABLE `pnut_cmel`
  ADD KEY `FK_PNUTR` (`id_plan_nutricional`),
  ADD KEY `FK_CMEL` (`id_cheat_meal`);

--
-- Indices de la tabla `pnut_comi`
--
ALTER TABLE `pnut_comi`
  ADD KEY `FK_PLAN_NUT` (`id_plan_nutricional`),
  ADD KEY `FK_COMIDA` (`id_comida`);

--
-- Indices de la tabla `pnut_supl`
--
ALTER TABLE `pnut_supl`
  ADD KEY `FK_PNUT` (`id_plan_nutricional`),
  ADD KEY `FK_SUPL` (`id_suplemento`);

--
-- Indices de la tabla `suplemento`
--
ALTER TABLE `suplemento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cheat_meal`
--
ALTER TABLE `cheat_meal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comida`
--
ALTER TABLE `comida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plan_entrenamiento`
--
ALTER TABLE `plan_entrenamiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `plan_nutricional`
--
ALTER TABLE `plan_nutricional`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `suplemento`
--
ALTER TABLE `suplemento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  ADD CONSTRAINT `FK_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `pent_ejer`
--
ALTER TABLE `pent_ejer`
  ADD CONSTRAINT `FK_EJER` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicio` (`id`),
  ADD CONSTRAINT `FK_PLAN` FOREIGN KEY (`id_plan_entrenamiento`) REFERENCES `plan_entrenamiento` (`id`);

--
-- Filtros para la tabla `plan_entrenamiento`
--
ALTER TABLE `plan_entrenamiento`
  ADD CONSTRAINT `FK_USUARIO_PLAN` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `plan_nutricional`
--
ALTER TABLE `plan_nutricional`
  ADD CONSTRAINT `FK_PLAN_USUARIO` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `pnut_cmel`
--
ALTER TABLE `pnut_cmel`
  ADD CONSTRAINT `FK_CMEL` FOREIGN KEY (`id_cheat_meal`) REFERENCES `cheat_meal` (`id`),
  ADD CONSTRAINT `FK_PNUTR` FOREIGN KEY (`id_plan_nutricional`) REFERENCES `plan_nutricional` (`id`);

--
-- Filtros para la tabla `pnut_comi`
--
ALTER TABLE `pnut_comi`
  ADD CONSTRAINT `FK_COMIDA` FOREIGN KEY (`id_comida`) REFERENCES `comida` (`id`),
  ADD CONSTRAINT `FK_PLAN_NUT` FOREIGN KEY (`id_plan_nutricional`) REFERENCES `plan_nutricional` (`id`);

--
-- Filtros para la tabla `pnut_supl`
--
ALTER TABLE `pnut_supl`
  ADD CONSTRAINT `FK_PNUT` FOREIGN KEY (`id_plan_nutricional`) REFERENCES `plan_nutricional` (`id`),
  ADD CONSTRAINT `FK_SUPL` FOREIGN KEY (`id_suplemento`) REFERENCES `suplemento` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
