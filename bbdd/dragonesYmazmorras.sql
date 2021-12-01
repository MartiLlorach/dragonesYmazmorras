-- phpMyAdmin SQL Dump
-- version 5.0.4deb2ubuntu5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-12-2021 a las 13:49:05
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
-- Estructura de tabla para la tabla `armadurasYEscudos`
--

CREATE TABLE IF NOT EXISTS `armadurasYEscudos` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `clase_de_armadura` int NOT NULL,
  `clase_de_armadura_bonus` varchar(10) NOT NULL,
  `clase_de_armadura_bonus_max` int NOT NULL,
  `peso` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armas`
--

CREATE TABLE IF NOT EXISTS `armas` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `alcance` int NOT NULL,
  `a_dos_manos` tinyint(1) NOT NULL,
  `arrojadiza` tinyint(1) NOT NULL,
  `cargar` tinyint(1) NOT NULL,
  `distancia` text NOT NULL,
  `especial` tinyint(1) NOT NULL,
  `municion` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `pesado` tinyint(1) NOT NULL,
  `peso` int NOT NULL,
  `sutil` tinyint(1) NOT NULL,
  `versatil` tinyint(1) NOT NULL,
  `daño` varchar(50) NOT NULL,
  `daño_tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE IF NOT EXISTS `clases` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
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

CREATE TABLE IF NOT EXISTS `competenciasClase` (
  `id_clase` int NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `competencia` varchar(100) NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasPersonaje`
--

CREATE TABLE IF NOT EXISTS `competenciasPersonaje` (
  `id_personaje` int NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `competencia` varchar(100) NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasRaza`
--

CREATE TABLE IF NOT EXISTS `competenciasRaza` (
  `id_raza` int NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `competencia` varchar(100) NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasTrasfondo`
--

CREATE TABLE IF NOT EXISTS `competenciasTrasfondo` (
  `id_trasfondo` int NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `competencia` varchar(100) NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjuros`
--

CREATE TABLE IF NOT EXISTS `conjuros` (
  `id` int NOT NULL,
  `nombre` int NOT NULL,
  `nivel` int NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `tiempo_de_lanzamiento` varchar(50) NOT NULL,
  `alcance` varchar(50) NOT NULL,
  `componentes` varchar(100) NOT NULL,
  `duracion` varchar(50) NOT NULL,
  `descripcion` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosClase`
--

CREATE TABLE IF NOT EXISTS `conjurosClase` (
  `id_clase` int NOT NULL,
  `id_conjuro` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosPersonaje`
--

CREATE TABLE IF NOT EXISTS `conjurosPersonaje` (
  `id_personaje` int NOT NULL,
  `id_conjuro` int NOT NULL,
  `preparado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE IF NOT EXISTS `idiomas` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `escritura` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`id`, `nombre`, `descripcion`, `escritura`) VALUES
(1, 'Comun', 'Los humanos normalmente aprenden lenguas de otras personas con las que tienen trato, incluyendo dialectos ocultos. Son aficionados a enriquecer su lenguaje con palabras que toman prestadas de otras lenguas: maldiciones orcas, expresiones musicales elficas, frases militares enanas y ese tipo de cosas.', 'Comun'),
(2, 'Enano', 'El Enano esta lleno de consonantes duras y sonidos guturales, y esas características se vierten en cualquier otro idioma que el enano pueda hablar.', 'Enano'),
(3, 'Elfico', 'El elfico es fluido, de entonación sutil y gramatica intrincada.\r\nLa literatura elfica es rica y variada, y sus canciones y poemas son famosos entre las otras razas. Muchos bardos aprenden su idioma para poder añadir baladas elficas a sus repertorios.', 'Elfico'),
(4, 'Gigante', '', 'Enano'),
(5, 'Gnomico', 'El idioma gnómico, que usa el alfabeto enano, es conocido por sus tratados técnicos y sus catálogos de conocimiento sobre el mundo natural.', 'Enano'),
(6, 'Goblin', '', 'Enano'),
(7, 'Mediano', 'El idioma mediano no es secreto pero los medianos son reacios a compartirlos con otros. Escriben muy poco, así que no tienen una gran cantidad de literatura. Su tradición oral, sin embargo, es muy fuerte. Casi todos los medianos hablan común para conversar con la gente en las tierras donde viven o a través de las que están viajando.', 'Comun'),
(8, 'Orco', 'El Orco es un idioma estridente y áspero con fuertes consonantes. No tiene alfabeto propio pero se escribe con el alfabeto enano.', 'Enano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasClase`
--

CREATE TABLE IF NOT EXISTS `idiomasClase` (
  `id_idioma` int NOT NULL,
  `id_clase` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasPersonaje`
--

CREATE TABLE IF NOT EXISTS `idiomasPersonaje` (
  `id_idioma` int NOT NULL,
  `id_personaje` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasRaza`
--

CREATE TABLE IF NOT EXISTS `idiomasRaza` (
  `id_idioma` int NOT NULL,
  `id_raza` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos`
--

CREATE TABLE IF NOT EXISTS `objetos` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `peso` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE IF NOT EXISTS `personajes` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `jugador` int NOT NULL,
  `raza` int NOT NULL,
  `clase` int NOT NULL,
  `trasfondo` int NOT NULL,
  `xp` int NOT NULL,
  `habilidades_puntos` json NOT NULL,
  `bonus_competencia` int NOT NULL,
  `tiradas_de_salvacion` json NOT NULL,
  `modificador_de_tiradas_de_salvacion` varchar(1000) NOT NULL,
  `tiradas_de_salvacion_cd` int NOT NULL,
  `iniciativa` int NOT NULL,
  `clase_de_armadura` int NOT NULL,
  `defensas` json NOT NULL,
  `inspiracion` int NOT NULL,
  `velocidad` varchar(500) NOT NULL,
  `dado_de_golpe` int NOT NULL,
  `vida_maxima` int NOT NULL,
  `vida_currente` int NOT NULL,
  `acciones` json NOT NULL,
  `sentidos` varchar(500) NOT NULL,
  `ataques_y_trucos` json NOT NULL,
  `equipamiento` json NOT NULL,
  `genero` varchar(50) NOT NULL,
  `edad` int NOT NULL,
  `altura` float NOT NULL,
  `peso` float NOT NULL,
  `alineamiento` varchar(50) NOT NULL,
  `fe` varchar(50) NOT NULL,
  `piel` varchar(50) NOT NULL,
  `ojos` varchar(50) NOT NULL,
  `pelo` varchar(50) NOT NULL,
  `apariencia` varchar(1000) NOT NULL,
  `aliados_y_organizaciones` varchar(1000) NOT NULL,
  `personalidad` varchar(1000) NOT NULL,
  `ideales` varchar(1000) NOT NULL,
  `vinculos` varchar(1000) NOT NULL,
  `defectos` varchar(1000) NOT NULL,
  `historia` varchar(1000) NOT NULL,
  `notas_adicionales` varchar(1000) NOT NULL,
  `habilidad_de_conjuros` varchar(50) NOT NULL,
  `salvacion_conjuro` int NOT NULL,
  `bonus_ataque_conjuro` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeUsuario`
--

CREATE TABLE IF NOT EXISTS `personajeUsuario` (
  `id_usuario` int NOT NULL,
  `id_personaje` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgos`
--

CREATE TABLE IF NOT EXISTS `rasgos` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosClase`
--

CREATE TABLE IF NOT EXISTS `rasgosClase` (
  `id_rasgo` int NOT NULL,
  `id_clase` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosRaza`
--

CREATE TABLE IF NOT EXISTS `rasgosRaza` (
  `id_rasgo` int NOT NULL,
  `id_raza` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosSubraza`
--

CREATE TABLE IF NOT EXISTS `rasgosSubraza` (
  `id_rasgo` int NOT NULL,
  `id_subraza` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosTrasfondo`
--

CREATE TABLE IF NOT EXISTS `rasgosTrasfondo` (
  `id_rasgo` int NOT NULL,
  `id_trasfondo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

CREATE TABLE IF NOT EXISTS `razas` (
  `id` int NOT NULL,
  `id_padre` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `habilidades_puntos` json NOT NULL,
  `edad` varchar(500) NOT NULL,
  `alineamiento` varchar(500) NOT NULL,
  `tamaño` varchar(50) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `velocidad` int NOT NULL,
  `idiomas_elegir` json NOT NULL,
  `competencias_elegir` json NOT NULL,
  `espacios_de_conjuros` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `subraza` (`id_padre`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subrazas`
--

CREATE TABLE IF NOT EXISTS `subrazas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `habilidades_puntos` json NOT NULL,
  `raza_padre` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trasfondos`
--

CREATE TABLE IF NOT EXISTS `trasfondos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `competencias_elegir` json NOT NULL,
  `idiomas_elegir` json NOT NULL,
  `equipamiento` json NOT NULL,
  `daño` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

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

INSERT INTO `usuarios` (`id`, `nombre`, `contrasena`) VALUES
(1, 'test', 'test');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `razas`
--
ALTER TABLE `razas`
  ADD CONSTRAINT `subraza` FOREIGN KEY (`id_padre`) REFERENCES `razas` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
