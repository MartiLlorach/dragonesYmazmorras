-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-12-2021 a las 17:56:23
-- Versión del servidor: 8.0.27-0ubuntu0.20.04.1
-- Versión de PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dragonesYmazmorras`
--
CREATE DATABASE IF NOT EXISTS `dragonesYmazmorras` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `dragonesYmazmorras`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armadurasYEscudos`
--

DROP TABLE IF EXISTS `armadurasYEscudos`;
CREATE TABLE IF NOT EXISTS `armadurasYEscudos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clase_de_armadura` int NOT NULL,
  `clase_de_armadura_bonus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clase_de_armadura_bonus_max` int NOT NULL,
  `peso` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armas`
--

DROP TABLE IF EXISTS `armas`;
CREATE TABLE IF NOT EXISTS `armas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alcance` int NOT NULL,
  `a_dos_manos` tinyint(1) NOT NULL,
  `arrojadiza` tinyint(1) NOT NULL,
  `cargar` tinyint(1) NOT NULL,
  `distancia` int NOT NULL,
  `especial` tinyint(1) NOT NULL,
  `municion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pesado` tinyint(1) NOT NULL,
  `peso` int NOT NULL,
  `sutil` tinyint(1) NOT NULL,
  `versatil` tinyint(1) NOT NULL,
  `daño` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `daño_tipo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

DROP TABLE IF EXISTS `clases`;
CREATE TABLE IF NOT EXISTS `clases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dado_de_golpe` int NOT NULL,
  `competencias_elegir` json NOT NULL,
  `idiomas_elegir` json NOT NULL,
  `conjuros_restricciones` json NOT NULL,
  `riqueza_inicial` int NOT NULL,
  `equipamiento_opciones` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasClase`
--

DROP TABLE IF EXISTS `competenciasClase`;
CREATE TABLE IF NOT EXISTS `competenciasClase` (
  `id_clase` int NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experto` tinyint(1) NOT NULL,
  KEY `fk_competenciasClase-clase` (`id_clase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasPersonaje`
--

DROP TABLE IF EXISTS `competenciasPersonaje`;
CREATE TABLE IF NOT EXISTS `competenciasPersonaje` (
  `id_personaje` int NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experto` tinyint(1) NOT NULL,
  KEY `fk_competenciasPersonaje-personaje` (`id_personaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasRaza`
--

DROP TABLE IF EXISTS `competenciasRaza`;
CREATE TABLE IF NOT EXISTS `competenciasRaza` (
  `id_raza` int NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experto` tinyint(1) NOT NULL,
  KEY `fk_competenciasRaza-raza` (`id_raza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasTrasfondo`
--

DROP TABLE IF EXISTS `competenciasTrasfondo`;
CREATE TABLE IF NOT EXISTS `competenciasTrasfondo` (
  `id_trasfondo` int NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experto` tinyint(1) NOT NULL,
  KEY `fk_competenciasTrasfondo-trasfondo` (`id_trasfondo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjuros`
--

DROP TABLE IF EXISTS `conjuros`;
CREATE TABLE IF NOT EXISTS `conjuros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` int NOT NULL,
  `nivel` int NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tiempo_de_lanzamiento` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alcance` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `componentes` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `duracion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosClase`
--

DROP TABLE IF EXISTS `conjurosClase`;
CREATE TABLE IF NOT EXISTS `conjurosClase` (
  `id_clase` int NOT NULL,
  `id_conjuro` int NOT NULL,
  KEY `fk_conjurosClase-clase` (`id_clase`),
  KEY `fk_conjurosClase-conjuro` (`id_conjuro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosPersonaje`
--

DROP TABLE IF EXISTS `conjurosPersonaje`;
CREATE TABLE IF NOT EXISTS `conjurosPersonaje` (
  `id_personaje` int NOT NULL,
  `id_conjuro` int NOT NULL,
  `preparado` tinyint(1) NOT NULL,
  KEY `fk_conjurosPersonaje-conjuro` (`id_conjuro`),
  KEY `fk_conjurosPersonaje-personaje` (`id_personaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

DROP TABLE IF EXISTS `idiomas`;
CREATE TABLE IF NOT EXISTS `idiomas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `escritura` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` VALUES(1, 'Común', 'Los humanos normalmente aprenden lenguas de otras personas con las que tienen trato, incluyendo dialectos ocultos. Son aficionados a enriquecer su lenguaje con palabras que toman prestadas de otras lenguas: maldiciones orcas, expresiones musicales elficas, frases militares enanas y ese tipo de cosas.', 'Comun');
INSERT INTO `idiomas` VALUES(2, 'Enano', 'El Enano esta lleno de consonantes duras y sonidos guturales, y esas características se vierten en cualquier otro idioma que el enano pueda hablar.', 'Enano');
INSERT INTO `idiomas` VALUES(3, 'Elfico', 'El elfico es fluido, de entonación sutil y gramatica intrincada.\r\nLa literatura elfica es rica y variada, y sus canciones y poemas son famosos entre las otras razas. Muchos bardos aprenden su idioma para poder añadir baladas elficas a sus repertorios.', 'Elfico');
INSERT INTO `idiomas` VALUES(4, 'Gigante', '', 'Enano');
INSERT INTO `idiomas` VALUES(5, 'Gnomico', 'El idioma gnómico, que usa el alfabeto enano, es conocido por sus tratados técnicos y sus catálogos de conocimiento sobre el mundo natural.', 'Enano');
INSERT INTO `idiomas` VALUES(6, 'Goblin', '', 'Enano');
INSERT INTO `idiomas` VALUES(7, 'Mediano', 'El idioma mediano no es secreto pero los medianos son reacios a compartirlos con otros. Escriben muy poco, así que no tienen una gran cantidad de literatura. Su tradición oral, sin embargo, es muy fuerte. Casi todos los medianos hablan común para conversar con la gente en las tierras donde viven o a través de las que están viajando.', 'Comun');
INSERT INTO `idiomas` VALUES(8, 'Orco', 'El Orco es un idioma estridente y áspero con fuertes consonantes. No tiene alfabeto propio pero se escribe con el alfabeto enano.', 'Enano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasClase`
--

DROP TABLE IF EXISTS `idiomasClase`;
CREATE TABLE IF NOT EXISTS `idiomasClase` (
  `id_idioma` int NOT NULL,
  `id_clase` int NOT NULL,
  KEY `fk_idiomasClase-idioma` (`id_idioma`),
  KEY `fk_idiomasClase-clase` (`id_clase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasPersonaje`
--

DROP TABLE IF EXISTS `idiomasPersonaje`;
CREATE TABLE IF NOT EXISTS `idiomasPersonaje` (
  `id_idioma` int NOT NULL,
  `id_personaje` int NOT NULL,
  KEY `fk_idiomasPersonaje-idioma` (`id_idioma`),
  KEY `fk_idiomasPersonaje-personaje` (`id_personaje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasRaza`
--

DROP TABLE IF EXISTS `idiomasRaza`;
CREATE TABLE IF NOT EXISTS `idiomasRaza` (
  `id_idioma` int NOT NULL,
  `id_raza` int NOT NULL,
  KEY `fk_idiomaRaza-idioma` (`id_idioma`),
  KEY `fk_idiomaRaza-raza` (`id_raza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos`
--

DROP TABLE IF EXISTS `objetos`;
CREATE TABLE IF NOT EXISTS `objetos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `peso` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

DROP TABLE IF EXISTS `personajes`;
CREATE TABLE IF NOT EXISTS `personajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jugador` int NOT NULL,
  `raza` int NOT NULL,
  `clase` int NOT NULL,
  `trasfondo` int NOT NULL,
  `xp` int NOT NULL,
  `habilidades_puntos` json NOT NULL,
  `bonus_competencia` int NOT NULL,
  `tiradas_de_salvacion` json NOT NULL,
  `modificador_de_tiradas_de_salvacion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tiradas_de_salvacion_cd` int NOT NULL,
  `iniciativa` int NOT NULL,
  `clase_de_armadura` int NOT NULL,
  `defensas` json NOT NULL,
  `inspiracion` int NOT NULL,
  `velocidad` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dado_de_golpe` int NOT NULL,
  `vida_maxima` int NOT NULL,
  `vida_currente` int NOT NULL,
  `acciones` json NOT NULL,
  `sentidos` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ataques_y_trucos` json NOT NULL,
  `equipamiento` json NOT NULL,
  `genero` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `edad` int NOT NULL,
  `altura` float NOT NULL,
  `peso` float NOT NULL,
  `alineamiento` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fe` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `piel` varchar(50) NOT NULL,
  `ojos` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pelo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apariencia` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aliados_y_organizaciones` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `personalidad` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ideales` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `vinculos` varchar(1000) NOT NULL,
  `defectos` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `historia` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notas_adicionales` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `habilidad_de_conjuros` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salvacion_conjuro` int NOT NULL,
  `bonus_ataque_conjuro` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personajes-clase` (`clase`),
  KEY `fk_personajes-jugador` (`jugador`),
  KEY `fk_personajes-raza` (`raza`),
  KEY `fk_personajes-trasfondo` (`trasfondo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeUsuario`
--

DROP TABLE IF EXISTS `personajeUsuario`;
CREATE TABLE IF NOT EXISTS `personajeUsuario` (
  `id_usuario` int NOT NULL,
  `id_personaje` int NOT NULL,
  KEY `fk_personajeUsuario-personaje` (`id_personaje`),
  KEY `fk_personajeUsuario-usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgos`
--

DROP TABLE IF EXISTS `rasgos`;
CREATE TABLE IF NOT EXISTS `rasgos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosClase`
--

DROP TABLE IF EXISTS `rasgosClase`;
CREATE TABLE IF NOT EXISTS `rasgosClase` (
  `id_rasgo` int NOT NULL,
  `id_clase` int NOT NULL,
  KEY `fk_rasgosClase-clase` (`id_clase`),
  KEY `fk_rasgosClase-rasgo` (`id_rasgo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosRaza`
--

DROP TABLE IF EXISTS `rasgosRaza`;
CREATE TABLE IF NOT EXISTS `rasgosRaza` (
  `id_rasgo` int NOT NULL,
  `id_raza` int NOT NULL,
  KEY `fk_rasgoRaza-rasgo` (`id_rasgo`),
  KEY `fk_rasgoRaza-raza` (`id_raza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosSubraza`
--

DROP TABLE IF EXISTS `rasgosSubraza`;
CREATE TABLE IF NOT EXISTS `rasgosSubraza` (
  `id_rasgo` int NOT NULL,
  `id_subraza` int NOT NULL,
  KEY `fk_rasgo` (`id_rasgo`),
  KEY `fk_subraza` (`id_subraza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosTrasfondo`
--

DROP TABLE IF EXISTS `rasgosTrasfondo`;
CREATE TABLE IF NOT EXISTS `rasgosTrasfondo` (
  `id_rasgo` int NOT NULL,
  `id_trasfondo` int NOT NULL,
  KEY `fk_rasgosTrasfondo-rasgo` (`id_rasgo`),
  KEY `fk_rasgosTrasfondo-trasfondo` (`id_trasfondo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

DROP TABLE IF EXISTS `razas`;
CREATE TABLE IF NOT EXISTS `razas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `habilidades_puntos` json NOT NULL,
  `edad` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alineamiento` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tamaño` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `velocidad` int NOT NULL,
  `idiomas_elegir` json NOT NULL,
  `competencias_elegir` json NOT NULL,
  `espacios_de_conjuros` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subrazas`
--

DROP TABLE IF EXISTS `subrazas`;
CREATE TABLE IF NOT EXISTS `subrazas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `habilidades_puntos` json NOT NULL,
  `raza_padre` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_padre` (`raza_padre`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trasfondos`
--

DROP TABLE IF EXISTS `trasfondos`;
CREATE TABLE IF NOT EXISTS `trasfondos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencias_elegir` json NOT NULL,
  `idiomas_elegir` json NOT NULL,
  `equipamiento` json NOT NULL,
  `daño` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `contrasena` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` VALUES(1, 'test', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `competenciasClase`
--
ALTER TABLE `competenciasClase`
  ADD CONSTRAINT `fk_competenciasClase-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `competenciasPersonaje`
--
ALTER TABLE `competenciasPersonaje`
  ADD CONSTRAINT `fk_competenciasPersonaje-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `competenciasRaza`
--
ALTER TABLE `competenciasRaza`
  ADD CONSTRAINT `fk_competenciasRaza-raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `competenciasTrasfondo`
--
ALTER TABLE `competenciasTrasfondo`
  ADD CONSTRAINT `fk_competenciasTrasfondo-trasfondo` FOREIGN KEY (`id_trasfondo`) REFERENCES `trasfondos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `conjurosClase`
--
ALTER TABLE `conjurosClase`
  ADD CONSTRAINT `fk_conjurosClase-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conjurosClase-conjuro` FOREIGN KEY (`id_conjuro`) REFERENCES `conjuros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `conjurosPersonaje`
--
ALTER TABLE `conjurosPersonaje`
  ADD CONSTRAINT `fk_conjurosPersonaje-conjuro` FOREIGN KEY (`id_conjuro`) REFERENCES `conjuros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conjurosPersonaje-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasClase`
--
ALTER TABLE `idiomasClase`
  ADD CONSTRAINT `fk_idiomasClase-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasClase-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasPersonaje`
--
ALTER TABLE `idiomasPersonaje`
  ADD CONSTRAINT `fk_idiomasPersonaje-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasPersonaje-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasRaza`
--
ALTER TABLE `idiomasRaza`
  ADD CONSTRAINT `fk_idiomaRaza-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomaRaza-raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD CONSTRAINT `fk_personajes-clase` FOREIGN KEY (`clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_personajes-jugador` FOREIGN KEY (`jugador`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_personajes-raza` FOREIGN KEY (`raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_personajes-trasfondo` FOREIGN KEY (`trasfondo`) REFERENCES `trasfondos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personajeUsuario`
--
ALTER TABLE `personajeUsuario`
  ADD CONSTRAINT `fk_personajeUsuario-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_personajeUsuario-usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rasgosClase`
--
ALTER TABLE `rasgosClase`
  ADD CONSTRAINT `fk_rasgosClase-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rasgosClase-rasgo` FOREIGN KEY (`id_rasgo`) REFERENCES `rasgos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rasgosRaza`
--
ALTER TABLE `rasgosRaza`
  ADD CONSTRAINT `fk_rasgoRaza-rasgo` FOREIGN KEY (`id_rasgo`) REFERENCES `rasgos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rasgoRaza-raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `rasgosSubraza`
--
ALTER TABLE `rasgosSubraza`
  ADD CONSTRAINT `fk_rasgo` FOREIGN KEY (`id_rasgo`) REFERENCES `rasgos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subraza` FOREIGN KEY (`id_subraza`) REFERENCES `subrazas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `rasgosTrasfondo`
--
ALTER TABLE `rasgosTrasfondo`
  ADD CONSTRAINT `fk_rasgosTrasfondo-rasgo` FOREIGN KEY (`id_rasgo`) REFERENCES `rasgos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rasgosTrasfondo-trasfondo` FOREIGN KEY (`id_trasfondo`) REFERENCES `trasfondos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `subrazas`
--
ALTER TABLE `subrazas`
  ADD CONSTRAINT `fk_padre` FOREIGN KEY (`raza_padre`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
