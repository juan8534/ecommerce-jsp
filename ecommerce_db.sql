-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2018 a las 18:36:17
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ecommerce_db`
--
CREATE DATABASE IF NOT EXISTS `ecommerce_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ecommerce_db`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_contarSubCategorias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_contarSubCategorias` (`codcat` INT)  BEGIN
    SELECT count(*) as cantidad FROM tbl_categoria
    WHERE categoria_superior=codcat and codigo<>codcat;
END$$

DROP PROCEDURE IF EXISTS `sp_listarCategoriaSuperior`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarCategoriaSuperior` ()  BEGIN
    SELECT codigo,nombre FROM tbl_categoria
    WHERE codigo= categoria_superior AND visible = true; 
END$$

DROP PROCEDURE IF EXISTS `sp_listarSubCategoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listarSubCategoria` (`p_csuperior` INT)  BEGIN
    SELECT codigo,nombre FROM tbl_categoria
    WHERE codigo<> categoria_superior AND visible = true AND categoria_superior=p_csuperior; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria`
--

DROP TABLE IF EXISTS `tbl_categoria`;
CREATE TABLE `tbl_categoria` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1',
  `categoria_superior` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`codigo`, `nombre`, `visible`, `categoria_superior`) VALUES
(1, 'ROPA DEPORTIVA', 1, 1),
(2, 'NIKE', 1, 1),
(3, 'ADIDAS', 1, 1),
(4, 'PUMA', 1, 1),
(5, 'HOMBRES', 1, 5),
(6, 'SACOS', 1, 5),
(7, 'PANTALONES', 1, 5),
(8, 'MUJERES', 1, 8),
(9, 'NIÑOS', 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_marca`
--

DROP TABLE IF EXISTS `tbl_marca`;
CREATE TABLE `tbl_marca` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_marca`
--

INSERT INTO `tbl_marca` (`codigo`, `nombre`, `visible`) VALUES
(1, 'NIKE', 1),
(2, 'ADIDAS', 1),
(3, 'PUMA', 1),
(4, 'LACOSTE', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_producto`
--

DROP TABLE IF EXISTS `tbl_producto`;
CREATE TABLE `tbl_producto` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `precionuevo` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT '1',
  `nuevo` tinyint(1) DEFAULT '1',
  `recomendado` tinyint(1) DEFAULT '1',
  `descripcion` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1',
  `codigo_marca` int(11) DEFAULT NULL,
  `codigo_categoria` int(11) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT 'demo.png'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_producto_moneda`
--

DROP TABLE IF EXISTS `tbl_producto_moneda`;
CREATE TABLE `tbl_producto_moneda` (
  `moneda` char(3) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `precionuevo` decimal(10,2) DEFAULT NULL,
  `codigo` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_revision`
--

DROP TABLE IF EXISTS `tbl_revision`;
CREATE TABLE `tbl_revision` (
  `codigo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  `estrellas` int(11) DEFAULT '3',
  `fecha` datetime DEFAULT NULL,
  `codigoproducto` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `categoria_superior` (`categoria_superior`);

--
-- Indices de la tabla `tbl_marca`
--
ALTER TABLE `tbl_marca`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `codigo_marca` (`codigo_marca`),
  ADD KEY `codigo_categoria` (`codigo_categoria`);

--
-- Indices de la tabla `tbl_producto_moneda`
--
ALTER TABLE `tbl_producto_moneda`
  ADD PRIMARY KEY (`moneda`,`codigo`),
  ADD KEY `codigo` (`codigo`);

--
-- Indices de la tabla `tbl_revision`
--
ALTER TABLE `tbl_revision`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigoproducto` (`codigoproducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `tbl_marca`
--
ALTER TABLE `tbl_marca`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tbl_producto`
--
ALTER TABLE `tbl_producto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_revision`
--
ALTER TABLE `tbl_revision`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
