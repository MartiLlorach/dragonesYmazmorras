-- phpMyAdmin SQL Dump
-- version 5.0.4deb2ubuntu5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-12-2021 a las 14:17:10
-- Versión del servidor: 8.0.27-0ubuntu0.21.10.1
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dragonesYmazmorras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `escritura` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`id`, `nombre`, `descripcion`, `escritura`) VALUES
(1, 'Común', 'Los humanos normalmente aprenden lenguas de otras personas con las que tienen trato, incluyendo dialectos ocultos. Son aficionados a enriquecer su lenguaje con palabras que toman prestadas de otras lenguas: maldiciones orcas, expresiones musicales elficas, frases militares enanas y ese tipo de cosas.', 'Comun'),
(2, 'Enano', 'El Enano esta lleno de consonantes duras y sonidos guturales, y esas características se vierten en cualquier otro idioma que el enano pueda hablar.', 'Enano'),
(3, 'Elfico', 'El elfico es fluido, de entonación sutil y gramatica intrincada.\r\nLa literatura elfica es rica y variada, y sus canciones y poemas son famosos entre las otras razas. Muchos bardos aprenden su idioma para poder añadir baladas elficas a sus repertorios.', 'Elfico'),
(4, 'Gigante', '', 'Enano'),
(5, 'Gnomico', 'El idioma gnómico, que usa el alfabeto enano, es conocido por sus tratados técnicos y sus catálogos de conocimiento sobre el mundo natural.', 'Enano'),
(6, 'Goblin', '', 'Enano'),
(7, 'Mediano', 'El idioma mediano no es secreto pero los medianos son reacios a compartirlos con otros. Escriben muy poco, así que no tienen una gran cantidad de literatura. Su tradición oral, sin embargo, es muy fuerte. Casi todos los medianos hablan común para conversar con la gente en las tierras donde viven o a través de las que están viajando.', 'Comun'),
(8, 'Orco', 'El Orco es un idioma estridente y áspero con fuertes consonantes. No tiene alfabeto propio pero se escribe con el alfabeto enano.', 'Enano');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
