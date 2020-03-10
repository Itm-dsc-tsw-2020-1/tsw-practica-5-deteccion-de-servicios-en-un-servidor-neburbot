-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2020 a las 19:25:47
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nmap`
--
CREATE DATABASE IF NOT EXISTS `nmap` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `nmap`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ip`
--

CREATE TABLE `ip` (
  `id` int(11) NOT NULL,
  `direccion` varchar(24) COLLATE utf8mb4_spanish_ci NOT NULL,
  `status` varchar(24) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `ip`
--

INSERT INTO `ip` (`id`, `direccion`, `status`) VALUES
(1, '200.33.171.11', 'ANALIZADO'),
(2, '200.33.171.13', 'NO ANALIZADO'),
(3, '200.33.171.20', 'ANALIZADO'),
(4, '200.33.171.54', 'NO ANALIZADO'),
(5, '200.33.171.77', 'ANALIZADO'),
(6, '200.33.171.80', 'NO ANALIZADO'),
(7, '200.33.171.97', 'NO ANALIZADO'),
(8, '200.33.171.99', 'ANALIZADO'),
(9, '200.33.171.115', 'NO ANALIZADO'),
(10, '200.33.171.118', 'NO ANALIZADO'),
(11, '200.33.171.124', 'NO ANALIZADO'),
(12, '200.33.171.125', 'NO ANALIZADO'),
(13, '200.33.171.127', 'NO ANALIZADO'),
(14, '200.33.171.128', 'NO ANALIZADO'),
(15, '200.33.171.129', 'NO ANALIZADO'),
(16, '200.33.171.160', 'NO ANALIZADO'),
(17, '200.33.171.254', 'NO ANALIZADO'),
(39, '200.33.171.50', 'NO ANALIZADO'),
(41, '200.33.171.60', 'NO ANALIZADO'),
(61, '200.33.171.98', 'NO ANALIZADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puerto`
--

CREATE TABLE `puerto` (
  `id` int(11) NOT NULL,
  `numero` varchar(24) COLLATE utf8mb4_spanish_ci NOT NULL,
  `servicio` varchar(24) COLLATE utf8mb4_spanish_ci NOT NULL,
  `status` varchar(24) COLLATE utf8mb4_spanish_ci NOT NULL,
  `direccion` varchar(24) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `puerto`
--

INSERT INTO `puerto` (`id`, `numero`, `servicio`, `status`, `direccion`) VALUES
(1, '22/tcp', 'ssh', 'open', '200.33.171.11'),
(2, '80/tcp', 'http', 'open', '200.33.171.11'),
(3, '8008/tcp', 'http', 'open', '200.33.171.11'),
(4, '22/tcp', 'ssh', 'open', '200.33.171.20'),
(5, '80/tcp', 'http', 'open', '200.33.171.20'),
(6, '21/tcp', 'ftp', 'open', '200.33.171.77'),
(7, '22/tcp', 'ssh', 'open', '200.33.171.77'),
(8, '80/tcp', 'http', 'open', '200.33.171.77'),
(9, '110/tcp', 'pop3', 'open', '200.33.171.77'),
(10, '119/tcp', 'nntp', 'open', '200.33.171.77'),
(11, '143/tcp', 'imap', 'open', '200.33.171.77'),
(12, '443/tcp', 'https', 'open', '200.33.171.77'),
(13, '8008/tcp', 'http', 'open', '200.33.171.77'),
(14, '80/tcp', 'http', 'open', '200.33.171.99'),
(15, '554/tcp', 'rtsp', 'open', '200.33.171.99'),
(16, '49152/tcp', 'unknown', 'open', '200.33.171.99');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ip`
--
ALTER TABLE `ip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `direccion` (`direccion`);

--
-- Indices de la tabla `puerto`
--
ALTER TABLE `puerto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_direccion` (`direccion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ip`
--
ALTER TABLE `ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `puerto`
--
ALTER TABLE `puerto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `puerto`
--
ALTER TABLE `puerto`
  ADD CONSTRAINT `fk_direccion` FOREIGN KEY (`direccion`) REFERENCES `ip` (`direccion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
