-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 14-07-2023 a las 19:41:01
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_donrenato`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `dni` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`dni`, `nombre`, `apellido`, `telefono`) VALUES
('60843750', 'Gian Carlos', 'Avalo Gallardo', '239839482'),
('76440321', 'Pablo Isaac', 'Lupu Garcia', '902363973'),
('77385160', 'Pepe', 'Gutierrez', '987678954'),
('77424596', 'Karin Hair ', 'Chozo Santamaria', '979986763');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentapago`
--

CREATE TABLE `cuentapago` (
  `id` int NOT NULL,
  `plataforma` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `numeroCuenta` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cuentapago`
--

INSERT INTO `cuentapago` (`id`, `plataforma`, `nombre`, `numeroCuenta`) VALUES
(16, 'INTERBANK', 'Dueño', '5464456644566645');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id` int NOT NULL,
  `idTipoComida` int NOT NULL,
  `idCliente` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id`, `idTipoComida`, `idCliente`, `dia`) VALUES
(34, 10, '76440321', '2023-07-13'),
(35, 11, '60843750', '2023-07-13'),
(36, 12, '60843750', '2023-07-13'),
(37, 10, '60843750', '2023-07-13'),
(38, 10, '77424596', '2023-07-13'),
(39, 11, '77424596', '2023-07-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagodigital`
--

CREATE TABLE `pagodigital` (
  `idPagoDigital` int NOT NULL,
  `idPension` int NOT NULL,
  `idCuentaPago` int NOT NULL,
  `fechaPago` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagodigital`
--

INSERT INTO `pagodigital` (`idPagoDigital`, `idPension`, `idCuentaPago`, `fechaPago`) VALUES
(11, 22, 16, '2023-07-13'),
(12, 24, 16, '2023-07-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pensiones`
--

CREATE TABLE `pensiones` (
  `id` int NOT NULL,
  `dni` int NOT NULL,
  `duracion` int NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `idTipoPago` int NOT NULL,
  `monto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pensiones`
--

INSERT INTO `pensiones` (`id`, `dni`, `duracion`, `fechaInicio`, `fechaFinal`, `idTipoPago`, `monto`) VALUES
(22, 76440321, 1, '2023-07-13', '2023-07-20', 4, 90),
(23, 60843750, 2, '2023-07-13', '2023-07-27', 6, 180),
(24, 77424596, 2, '2023-07-13', '2023-07-27', 4, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocomida`
--

CREATE TABLE `tipocomida` (
  `id` int NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipocomida`
--

INSERT INTO `tipocomida` (`id`, `nombre`) VALUES
(11, 'almuerzo'),
(12, 'cena'),
(10, 'desayuno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopago`
--

CREATE TABLE `tipopago` (
  `id` int NOT NULL,
  `nombre` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipopago`
--

INSERT INTO `tipopago` (`id`, `nombre`) VALUES
(4, 'Transferencia'),
(6, 'Efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usuario` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `usuario`, `password`, `email`) VALUES
(1, 'Pablo', 'admin', 'admin', 'pablolupux@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `cuentapago`
--
ALTER TABLE `cuentapago`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numeroCuenta` (`numeroCuenta`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTipoComida` (`idTipoComida`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `pagodigital`
--
ALTER TABLE `pagodigital`
  ADD PRIMARY KEY (`idPagoDigital`),
  ADD KEY `idPension` (`idPension`),
  ADD KEY `idCuentaPago` (`idCuentaPago`);

--
-- Indices de la tabla `pensiones`
--
ALTER TABLE `pensiones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTipoPago` (`idTipoPago`);

--
-- Indices de la tabla `tipocomida`
--
ALTER TABLE `tipocomida`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuentapago`
--
ALTER TABLE `cuentapago`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `pagodigital`
--
ALTER TABLE `pagodigital`
  MODIFY `idPagoDigital` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `pensiones`
--
ALTER TABLE `pensiones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `tipocomida`
--
ALTER TABLE `tipocomida`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tipopago`
--
ALTER TABLE `tipopago`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`idTipoComida`) REFERENCES `tipocomida` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagodigital`
--
ALTER TABLE `pagodigital`
  ADD CONSTRAINT `pagodigital_ibfk_1` FOREIGN KEY (`idPension`) REFERENCES `pensiones` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `pagodigital_ibfk_2` FOREIGN KEY (`idCuentaPago`) REFERENCES `cuentapago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `pensiones`
--
ALTER TABLE `pensiones`
  ADD CONSTRAINT `pensiones_ibfk_1` FOREIGN KEY (`idTipoPago`) REFERENCES `tipopago` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
