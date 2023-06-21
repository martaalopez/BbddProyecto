-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-06-2023 a las 18:26:37
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `database`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `phoneNumber` int(9) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `id_person` int(5) DEFAULT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `id_client` varchar(9) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`phoneNumber`, `mail`, `username`, `id_person`, `password`, `name`, `id_client`, `type`) VALUES
(1234, 'manue', 'manuel1', NULL, '123', 'manuel', '79482', 'admin'),
(4775, 'rotte', 'rosa1', NULL, '123', 'rosa', '46262', 'admin'),
(628362711, 'mar@gmail.com', 'marta1', NULL, '123', 'mar', '26836280Y', 'admin'),
(628362166, 'manu@gmail.com', 'manuel12', NULL, '123', 'Manuel', '26827689K', 'admin'),
(637215399, 'martagmail.com', 'marta12', NULL, '123', 'Marta', '2682794K', 'admin'),
(638216300, 'marta@gmail.com', 'marta14', NULL, '123', 'Marta', '26824735M', 'admin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` varchar(9) NOT NULL,
  `phoneNumber` int(9) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `id_person` int(5) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id_client`, `phoneNumber`, `mail`, `id_person`, `username`, `password`, `type`, `name`) VALUES
('26826957K', 637215388, '', NULL, 'mi18', '123', 'client', 'Miriam'),
('26827856K', 638215388, '', NULL, 'mi20', '123', 'client', 'Miriam'),
('26827960K', 638219277, '', NULL, 'mi12', '123', 'client', 'miriam'),
('26827967K', 628362711, '', NULL, 'jose15', '123', 'client', 'Jose');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
  `id_person` int(5) NOT NULL,
  `name` varchar(15) NOT NULL,
  `phoneNumber` int(9) NOT NULL,
  `mail` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id_product` int(5) NOT NULL,
  `description` varchar(30) NOT NULL,
  `unit` int(5) NOT NULL,
  `sale_price` double(3,1) NOT NULL,
  `supplier_price` double(3,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id_product`, `description`, `unit`, `sale_price`, `supplier_price`) VALUES
(12348, 'naranjas', 15, 1.9, 1.2),
(12378, 'manzana', 27, 1.7, 1.2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_order`
--

CREATE TABLE `product_order` (
  `id_client` varchar(9) NOT NULL,
  `unitProduct` int(11) NOT NULL,
  `id_product` int(5) NOT NULL,
  `id_order` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `product_order`
--

INSERT INTO `product_order` (`id_client`, `unitProduct`, `id_product`, `id_order`) VALUES
('26827856K', 7, 12348, 439479),
('26827856K', 3, 12378, 439479),
('26826957K', 5, 12348, 9606);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(5) UNSIGNED ZEROFILL NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `id_product` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `name`, `address`, `phoneNumber`, `id_product`) VALUES
(00004, 'mercadona', 'Málaga', '628361288', 12378),
(00006, 'mercadona', 'Sevilla', '639213722', 12348);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD KEY `id_person` (`id_person`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `id_person` (`id_person`);

--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id_person`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD KEY `id_product` (`id_product`);

--
-- Indices de la tabla `product_order`
--
ALTER TABLE `product_order`
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_product` (`id_product`);

--
-- Indices de la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD KEY `id_product` (`id_product`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `product_order_ibfk_6` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_order_ibfk_7` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
