-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2019 a las 21:30:44
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `atom`
--
CREATE DATABASE IF NOT EXISTS `atom` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `atom`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenamiento`
--

CREATE TABLE `almacenamiento` (
  `CodAlm` int(10) NOT NULL,
  `MarAlm` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `ModAlm` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `TipoAlm` enum('HDD','SSD SATA','SSD M.2','Intel Optane') COLLATE utf8_spanish_ci NOT NULL,
  `CapAlm` int(11) NOT NULL,
  `PreAlm` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `almacenamiento`
--

INSERT INTO `almacenamiento` (`CodAlm`, `MarAlm`, `ModAlm`, `TipoAlm`, `CapAlm`, `PreAlm`) VALUES
(1, 'Seagate', 'BarraCuda', 'HDD', 1000, 44.03),
(2, 'Kingston', 'A400', 'SSD SATA', 240, 33.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuente de alimentacion`
--

CREATE TABLE `fuente de alimentacion` (
  `CodFue` int(10) NOT NULL,
  `MarFue` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `ModFue` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `VatFue` int(10) NOT NULL,
  `CerFue` varchar(80) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TipoFue` enum('Modular','Semi-Modular','No Modular') COLLATE utf8_spanish_ci DEFAULT NULL,
  `PreFue` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `fuente de alimentacion`
--

INSERT INTO `fuente de alimentacion` (`CodFue`, `MarFue`, `ModFue`, `VatFue`, `CerFue`, `TipoFue`, `PreFue`) VALUES
(1, 'Tacens', 'Mars Gaming Vulcano', 750, '80 PLUS SILVER', 'Semi-Modular', 66),
(2, 'Corsair', 'VS650 White', 650, '80 PLUS', 'No Modular', 54),
(3, 'Thermaltake', 'Smart RGB', 700, '80 PLUS', 'No Modular', 61.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenadores`
--

CREATE TABLE `ordenadores` (
  `CodOrd` int(10) NOT NULL,
  `NomOrd` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `CodPro` int(10) DEFAULT NULL,
  `CodPla` int(10) DEFAULT NULL,
  `CodRam` int(10) DEFAULT NULL,
  `CodFue` int(10) DEFAULT NULL,
  `CodAlm` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ordenadores`
--

INSERT INTO `ordenadores` (`CodOrd`, `NomOrd`, `CodPro`, `CodPla`, `CodRam`, `CodFue`, `CodAlm`) VALUES
(3, 'Gaming PC', 2, 2, 2, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `placas base`
--

CREATE TABLE `placas base` (
  `CodPla` int(10) NOT NULL,
  `MarPla` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `FacFor` enum('ATX','Micro ATX','Mini ATX','E-ATX') COLLATE utf8_spanish_ci NOT NULL,
  `ModPla` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `ChiPla` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `SockPla` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `PrePla` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `placas base`
--

INSERT INTO `placas base` (`CodPla`, `MarPla`, `FacFor`, `ModPla`, `ChiPla`, `SockPla`, `PrePla`) VALUES
(1, 'Asus', 'ATX', 'ROG STRIX', 'Z270F', 'LGA 1151', 0),
(2, 'MSI', 'ATX', ' GAMING PLUS', 'X470', 'AM4', 0),
(3, 'MSI', 'Mini ATX', 'GAMING PRO AC', 'B360I', 'LGA 1151', 0),
(4, 'Gigabyte', 'ATX', 'AORUS Master', 'Z390', 'LGA1151', 299.99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesadores`
--

CREATE TABLE `procesadores` (
  `CodPro` int(11) NOT NULL,
  `TipoPro` enum('Intel','AMD') COLLATE utf8_spanish_ci NOT NULL,
  `NomPro` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `NumCor` int(10) NOT NULL,
  `PrePro` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `procesadores`
--

INSERT INTO `procesadores` (`CodPro`, `TipoPro`, `NomPro`, `NumCor`, `PrePro`) VALUES
(1, 'Intel', 'i7-7700k', 6, 321.98),
(2, 'AMD', 'Ryzen 7 7200', 12, 275.89);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ram`
--

CREATE TABLE `ram` (
  `CodRam` int(10) NOT NULL,
  `MarcRam` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `ModRam` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `TipoRam` enum('DDR2','DDR3','DDR4') COLLATE utf8_spanish_ci NOT NULL,
  `CapRam` int(10) NOT NULL,
  `HerzRam` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `PreRam` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ram`
--

INSERT INTO `ram` (`CodRam`, `MarcRam`, `ModRam`, `TipoRam`, `CapRam`, `HerzRam`, `PreRam`) VALUES
(1, 'G.Skill', 'Trident Z RGB', 'DDR4', 8, '3200', 125.3),
(2, 'Corsair', 'Vengeance LPX', 'DDR4', 8, '2400', 0),
(3, 'Kingston', 'HyperX Fury Blue', 'DDR3', 4, '1600', 26.75);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacenamiento`
--
ALTER TABLE `almacenamiento`
  ADD PRIMARY KEY (`CodAlm`),
  ADD UNIQUE KEY `CodAlm` (`CodAlm`);

--
-- Indices de la tabla `fuente de alimentacion`
--
ALTER TABLE `fuente de alimentacion`
  ADD PRIMARY KEY (`CodFue`),
  ADD UNIQUE KEY `CodFue` (`CodFue`);

--
-- Indices de la tabla `ordenadores`
--
ALTER TABLE `ordenadores`
  ADD PRIMARY KEY (`CodOrd`),
  ADD KEY `CodPro` (`CodPro`),
  ADD KEY `CodPla` (`CodPla`),
  ADD KEY `CodRam` (`CodRam`),
  ADD KEY `CodFue` (`CodFue`),
  ADD KEY `CodAlm` (`CodAlm`);

--
-- Indices de la tabla `placas base`
--
ALTER TABLE `placas base`
  ADD PRIMARY KEY (`CodPla`),
  ADD UNIQUE KEY `CodPla` (`CodPla`);

--
-- Indices de la tabla `procesadores`
--
ALTER TABLE `procesadores`
  ADD PRIMARY KEY (`CodPro`),
  ADD UNIQUE KEY `CodPro` (`CodPro`);

--
-- Indices de la tabla `ram`
--
ALTER TABLE `ram`
  ADD PRIMARY KEY (`CodRam`),
  ADD UNIQUE KEY `CodRam` (`CodRam`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacenamiento`
--
ALTER TABLE `almacenamiento`
  MODIFY `CodAlm` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `fuente de alimentacion`
--
ALTER TABLE `fuente de alimentacion`
  MODIFY `CodFue` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ordenadores`
--
ALTER TABLE `ordenadores`
  MODIFY `CodOrd` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `placas base`
--
ALTER TABLE `placas base`
  MODIFY `CodPla` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `procesadores`
--
ALTER TABLE `procesadores`
  MODIFY `CodPro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ram`
--
ALTER TABLE `ram`
  MODIFY `CodRam` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ordenadores`
--
ALTER TABLE `ordenadores`
  ADD CONSTRAINT `ordenadores_ibfk_1` FOREIGN KEY (`CodPro`) REFERENCES `procesadores` (`CodPro`),
  ADD CONSTRAINT `ordenadores_ibfk_2` FOREIGN KEY (`CodPla`) REFERENCES `placas base` (`CodPla`),
  ADD CONSTRAINT `ordenadores_ibfk_3` FOREIGN KEY (`CodRam`) REFERENCES `ram` (`CodRam`),
  ADD CONSTRAINT `ordenadores_ibfk_4` FOREIGN KEY (`CodRam`) REFERENCES `ram` (`CodRam`),
  ADD CONSTRAINT `ordenadores_ibfk_5` FOREIGN KEY (`CodFue`) REFERENCES `fuente de alimentacion` (`CodFue`),
  ADD CONSTRAINT `ordenadores_ibfk_6` FOREIGN KEY (`CodAlm`) REFERENCES `almacenamiento` (`CodAlm`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
