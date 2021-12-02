-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-12-2021 a las 13:13:55
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
CREATE TABLE `armadurasYEscudos` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clase_de_armadura` int NOT NULL,
  `clase_de_armadura_bonus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clase_de_armadura_bonus_max` int NOT NULL,
  `peso` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armas`
--

DROP TABLE IF EXISTS `armas`;
CREATE TABLE `armas` (
  `id` int NOT NULL,
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
  `daño_tipo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

DROP TABLE IF EXISTS `clases`;
CREATE TABLE `clases` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dado_de_golpe` int NOT NULL,
  `idiomas_elegir` int NOT NULL,
  `riqueza_inicial` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasClase`
--

DROP TABLE IF EXISTS `competenciasClase`;
CREATE TABLE `competenciasClase` (
  `id_clase` int NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasElegirClase`
--

DROP TABLE IF EXISTS `competenciasElegirClase`;
CREATE TABLE `competenciasElegirClase` (
  `id` int NOT NULL,
  `id_clase` int NOT NULL,
  `numero` int NOT NULL,
  `opciones` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasElegirRaza`
--

DROP TABLE IF EXISTS `competenciasElegirRaza`;
CREATE TABLE `competenciasElegirRaza` (
  `id` int NOT NULL,
  `id_raza` int NOT NULL,
  `numero` int NOT NULL,
  `opciones` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasElegirTrasfondo`
--

DROP TABLE IF EXISTS `competenciasElegirTrasfondo`;
CREATE TABLE `competenciasElegirTrasfondo` (
  `id` int NOT NULL,
  `id_trasfondo` int NOT NULL,
  `numero` int NOT NULL,
  `opciones` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasOpciones`
--

DROP TABLE IF EXISTS `competenciasOpciones`;
CREATE TABLE `competenciasOpciones` (
  `id` int NOT NULL,
  `id_competencia` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasPersonaje`
--

DROP TABLE IF EXISTS `competenciasPersonaje`;
CREATE TABLE `competenciasPersonaje` (
  `id_personaje` int NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasRaza`
--

DROP TABLE IF EXISTS `competenciasRaza`;
CREATE TABLE `competenciasRaza` (
  `id_raza` int NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasTrasfondo`
--

DROP TABLE IF EXISTS `competenciasTrasfondo`;
CREATE TABLE `competenciasTrasfondo` (
  `id_trasfondo` int NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjuros`
--

DROP TABLE IF EXISTS `conjuros`;
CREATE TABLE `conjuros` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nivel` int NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tiempo_de_lanzamiento` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alcance` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `componentes` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `duracion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosClase`
--

DROP TABLE IF EXISTS `conjurosClase`;
CREATE TABLE `conjurosClase` (
  `id_clase` int NOT NULL,
  `id_conjuro` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosEspacios`
--

DROP TABLE IF EXISTS `conjurosEspacios`;
CREATE TABLE `conjurosEspacios` (
  `id_clase` int NOT NULL,
  `0` int NOT NULL,
  `1` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosMaximos`
--

DROP TABLE IF EXISTS `conjurosMaximos`;
CREATE TABLE `conjurosMaximos` (
  `id_clase` int NOT NULL,
  `0` int NOT NULL,
  `1` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosPersonaje`
--

DROP TABLE IF EXISTS `conjurosPersonaje`;
CREATE TABLE `conjurosPersonaje` (
  `id_personaje` int NOT NULL,
  `id_conjuro` int NOT NULL,
  `preparado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamientoClaseElegir`
--

DROP TABLE IF EXISTS `equipamientoClaseElegir`;
CREATE TABLE `equipamientoClaseElegir` (
  `id` int NOT NULL,
  `id_clase` int NOT NULL,
  `numero` int NOT NULL,
  `opciones` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamientoOpciones`
--

DROP TABLE IF EXISTS `equipamientoOpciones`;
CREATE TABLE `equipamientoOpciones` (
  `id` int NOT NULL,
  `id_arma` int NOT NULL,
  `id_objeto` int NOT NULL,
  `id_armaduraOEscudo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamientoPersonaje`
--

DROP TABLE IF EXISTS `equipamientoPersonaje`;
CREATE TABLE `equipamientoPersonaje` (
  `id_personaje` int NOT NULL,
  `id_arma` int NOT NULL,
  `id_objeto` int NOT NULL,
  `id_armaduraOEscudo` int NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamientoTrasfondo`
--

DROP TABLE IF EXISTS `equipamientoTrasfondo`;
CREATE TABLE `equipamientoTrasfondo` (
  `id_trasfondo` int NOT NULL,
  `id_equipamiento` int NOT NULL,
  `tipo_equipamiento` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidadesPersonaje`
--

DROP TABLE IF EXISTS `habilidadesPersonaje`;
CREATE TABLE `habilidadesPersonaje` (
  `id_personaje` int NOT NULL,
  `fuerza` int NOT NULL,
  `destreza` int NOT NULL,
  `constitucion` int NOT NULL,
  `inteligencia` int NOT NULL,
  `sabiduria` int NOT NULL,
  `carisma` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidadesRaza`
--

DROP TABLE IF EXISTS `habilidadesRaza`;
CREATE TABLE `habilidadesRaza` (
  `id_raza` int NOT NULL,
  `fuerza` int NOT NULL,
  `destreza` int NOT NULL,
  `constitucion` int NOT NULL,
  `inteligencia` int NOT NULL,
  `sabiduria` int NOT NULL,
  `carisma` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidadesSubraza`
--

DROP TABLE IF EXISTS `habilidadesSubraza`;
CREATE TABLE `habilidadesSubraza` (
  `id_subraza` int NOT NULL,
  `fuerza` int NOT NULL,
  `destreza` int NOT NULL,
  `constitucion` int NOT NULL,
  `inteligencia` int NOT NULL,
  `sabiduria` int NOT NULL,
  `carisma` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

DROP TABLE IF EXISTS `idiomas`;
CREATE TABLE `idiomas` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `escritura` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
CREATE TABLE `idiomasClase` (
  `id_idioma` int NOT NULL,
  `id_clase` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasClaseElegir`
--

DROP TABLE IF EXISTS `idiomasClaseElegir`;
CREATE TABLE `idiomasClaseElegir` (
  `id_idioma` int NOT NULL,
  `id_clase` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasPersonaje`
--

DROP TABLE IF EXISTS `idiomasPersonaje`;
CREATE TABLE `idiomasPersonaje` (
  `id_idioma` int NOT NULL,
  `id_personaje` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasRaza`
--

DROP TABLE IF EXISTS `idiomasRaza`;
CREATE TABLE `idiomasRaza` (
  `id_idioma` int NOT NULL,
  `id_raza` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `idiomasRaza`
--

INSERT INTO `idiomasRaza` VALUES(1, 2);
INSERT INTO `idiomasRaza` VALUES(1, 3);
INSERT INTO `idiomasRaza` VALUES(3, 3);
INSERT INTO `idiomasRaza` VALUES(1, 3);
INSERT INTO `idiomasRaza` VALUES(3, 3);
INSERT INTO `idiomasRaza` VALUES(1, 4);
INSERT INTO `idiomasRaza` VALUES(8, 4);
INSERT INTO `idiomasRaza` VALUES(1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasRazaElegir`
--

DROP TABLE IF EXISTS `idiomasRazaElegir`;
CREATE TABLE `idiomasRazaElegir` (
  `id_idioma` int NOT NULL,
  `id_raza` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasTrasfondoElegir`
--

DROP TABLE IF EXISTS `idiomasTrasfondoElegir`;
CREATE TABLE `idiomasTrasfondoElegir` (
  `id_idioma` int NOT NULL,
  `id_trasfondo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedasPersonaje`
--

DROP TABLE IF EXISTS `monedasPersonaje`;
CREATE TABLE `monedasPersonaje` (
  `id_personaje` int NOT NULL,
  `pc` int NOT NULL,
  `pp` int NOT NULL,
  `pe` int NOT NULL,
  `po` int NOT NULL,
  `ppt` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos`
--

DROP TABLE IF EXISTS `objetos`;
CREATE TABLE `objetos` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `peso` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

DROP TABLE IF EXISTS `personajes`;
CREATE TABLE `personajes` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `jugador` int NOT NULL,
  `raza` int NOT NULL,
  `clase` int NOT NULL,
  `trasfondo` int NOT NULL,
  `xp` int NOT NULL,
  `bonus_competencia` int NOT NULL,
  `modificador_de_tiradas_de_salvacion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tiradas_de_salvacion_cd` int NOT NULL,
  `iniciativa` int NOT NULL,
  `clase_de_armadura` int NOT NULL,
  `defensas` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inspiracion` int NOT NULL,
  `velocidad` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dado_de_golpe` int NOT NULL,
  `vida_maxima` int NOT NULL,
  `vida_currente` int NOT NULL,
  `sentidos` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
  `bonus_ataque_conjuro` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeUsuario`
--

DROP TABLE IF EXISTS `personajeUsuario`;
CREATE TABLE `personajeUsuario` (
  `id_usuario` int NOT NULL,
  `id_personaje` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgos`
--

DROP TABLE IF EXISTS `rasgos`;
CREATE TABLE `rasgos` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosClase`
--

DROP TABLE IF EXISTS `rasgosClase`;
CREATE TABLE `rasgosClase` (
  `id_rasgo` int NOT NULL,
  `id_clase` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosRaza`
--

DROP TABLE IF EXISTS `rasgosRaza`;
CREATE TABLE `rasgosRaza` (
  `id_rasgo` int NOT NULL,
  `id_raza` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosSubraza`
--

DROP TABLE IF EXISTS `rasgosSubraza`;
CREATE TABLE `rasgosSubraza` (
  `id_rasgo` int NOT NULL,
  `id_subraza` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosTrasfondo`
--

DROP TABLE IF EXISTS `rasgosTrasfondo`;
CREATE TABLE `rasgosTrasfondo` (
  `id_rasgo` int NOT NULL,
  `id_trasfondo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

DROP TABLE IF EXISTS `razas`;
CREATE TABLE `razas` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `edad` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alineamiento` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tamaño` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `velocidad` int NOT NULL,
  `idiomas_elegir` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `razas`
--

INSERT INTO `razas` VALUES(2, 'Humano', 'En el cómputo de la mayoría de los mundos, los humanos son\r\nla más joven de las razas comunes, con una llegada tardía al\r\nmundo y una vida corta en comparación con los enanos, elfos,\r\ny dragones. Quizás es por su corta vida que se esfuerzan en\r\nconseguir tanto como pueden en los años que se les han dado.\r\nO quizás sienten que tienen algo que demostrar a las razas\r\nmás antiguas, y es por eso que construyen poderosos imperios basados en la conquista y el comercio. Sea lo que sea lo\r\nque les motiva, los humanos son los innovadores, los pioneros y los triunfadores de los mundos.', 'Los humanos alcanzan la madurez cerca de la veintena y rara vez llegan a vivir un siglo completo.', 'Los humanos tienen a no tener un alineamiento concreto. En ellos se puede encontrar tanto lo mejor como lo peor.', ' Mediano(1,5 m — 1,8 m)', 30, 1);
INSERT INTO `razas` VALUES(3, 'Semielfo', 'Caminando entre dos mundos pero sin pertenecer realmente\r\na ninguno de los dos, los semielfos combinan lo que algunos\r\ndicen ser las mejores cualidades de sus progenitores humanos y elfos: la curiosidad, inventiva y ambición humana templada por los sentidos refinados, el amor por el arte y la naturaleza de los elfos. Algunos semielfos viven entre los humanos, separados por sus diferencias emocionales y físicas,\r\nviendo a amigos y seres queridos envejecer mientras el\r\ntiempo no les toca a ellos. Otros viven entre los elfos, aumentando su inquietud conforme se acercan a la edad adulta en\r\nlos intemporales reinos élficos, mientras sus compañeros\r\ncontinúan viviendo como niños. Muchos semielfos, incapaces\r\nde encajar en ninguna sociedad, eligen una vida errante en\r\nsolitario o uniéndose a otros inadaptados y marginados en la\r\nvida aventurera.', 'Los semielfos maduran a la misma velocidad que\r\nlos humanos y alcanzan la adultez alrededor de los 20 años.\r\nViven, sin embargo, mucho más que los humanos, excediendo a menudo los 180 años.', 'Los semielfos comparten la inclinación\r\ncaótica de su herencia élfica. Valoran tanto la libertad personal como la expresión creativa, no demostrando amor por los\r\nlíderes ni deseo de seguidores. Les fastidian las reglas, molestándose con las demandas de los demás, y en ocasiones se\r\nmuestran poco fiables o por lo menos impredecibles.', ' Mediano(1,5 m — 1,8 m)', 30, 1);
INSERT INTO `razas` VALUES(4, 'Semiorco', 'Ya sean unidos bajo el liderazgo de un poderoso brujo o luchando para resistir tras años de conflicto, las tribus humanas y orcas a veces forman alianzas, uniendo sus fuerzas en\r\nuna horda mayor para el terror de las tierras civilizadas cercanas. Cuando esas alianzas se sellan con matrimonios, nacen los semiorcos. Algunos semiorcos crecen para convertirse en jefes orgullosos de tribus orcas, con su sangre humana proveyéndoles de ventaja sobre sus rivales orcos purasangres. Algunos se aventuran en el mundo para probar su\r\nvalía ante los humanos y otras razas más civilizadas. Muchos\r\nde estos se convierten en aventureros, cosechando grandeza\r\npor sus grandes hazañas y notoriedad por sus costumbres\r\nbárbaras y su furia salvaje.', 'Los semiorcos maduran un poco más rápido que\r\nlos humanos, alcanzando la adultez alrededor de los 14. Envejecen notablemente más rápido y raramente viven más de 75 años', '. Los semiorcos heredan una tendencia hacia el caos de sus padres orcos y no están muy inclinados hacia el bien. Los semiorcos criados entre orcos y dispuestos a\r\npasar sus vidas entre ellos son usualmente malvados', ' Mediano(1,6 m — 1,9 m)', 30, 0);
INSERT INTO `razas` VALUES(5, 'Tiflin', 'Ser recibido con miradas y susurros, sufrir violencia e insultos en la calle, ver la desconfianza y el miedo en todos los ojos:\r\neste es el destino de los tiflin. Y para retorcer el puñal, los\r\ntiflin saben que esto es a causa de un pacto sellado hace generaciones que infundió la esencia de Asmodeo —señor supremo de los Nueve Infiernos— en su linaje. Su apariencia y\r\nsu naturaleza no tienen más culpa que el resultado de un antiguo pecado, por el que ellos y sus hijos, y los hijos de sus\r\nhijos, siempre se considerarán responsables.', 'Los tiflin maduran a la misma velocidad que los humanos pero viven unos pocos años más.', 'Los tiflin no tienen una tendencia innata\r\nhacia el mal, pero muchos de ellos acaban allí. Malvados o no,\r\nsu naturaleza independiente inclina a muchos tiflin hacia un\r\nalineamiento caótico.', ' Mediano(1,5 m — 1,8 m)', 30, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subrazas`
--

DROP TABLE IF EXISTS `subrazas`;
CREATE TABLE `subrazas` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `raza_padre` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiradasSalvacion`
--

DROP TABLE IF EXISTS `tiradasSalvacion`;
CREATE TABLE `tiradasSalvacion` (
  `id_personaje` int NOT NULL,
  `fuerza` int NOT NULL,
  `destreza` int NOT NULL,
  `constitucion` int NOT NULL,
  `inteligencia` int NOT NULL,
  `sabiduria` int NOT NULL,
  `carisma` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trasfondos`
--

DROP TABLE IF EXISTS `trasfondos`;
CREATE TABLE `trasfondos` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idiomas_elegir` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `contrasena` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` VALUES(1, 'test', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `armadurasYEscudos`
--
ALTER TABLE `armadurasYEscudos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `armas`
--
ALTER TABLE `armas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `competenciasClase`
--
ALTER TABLE `competenciasClase`
  ADD KEY `fk_competenciasClase-clase` (`id_clase`);

--
-- Indices de la tabla `competenciasElegirClase`
--
ALTER TABLE `competenciasElegirClase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_competenciaElegirClase-clase` (`id_clase`),
  ADD KEY `fk_competenciaElegirClase-opciones` (`opciones`);

--
-- Indices de la tabla `competenciasElegirRaza`
--
ALTER TABLE `competenciasElegirRaza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_competenciasElegirRaza-raza` (`id_raza`),
  ADD KEY `fk_competenciasElegirRaza-opciones` (`opciones`);

--
-- Indices de la tabla `competenciasElegirTrasfondo`
--
ALTER TABLE `competenciasElegirTrasfondo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_competenciasElegirTrasfondo-trasfondo` (`id_trasfondo`),
  ADD KEY `fk_competenciasElegirTrasfondo-opciones` (`opciones`);

--
-- Indices de la tabla `competenciasOpciones`
--
ALTER TABLE `competenciasOpciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `competenciasPersonaje`
--
ALTER TABLE `competenciasPersonaje`
  ADD KEY `fk_competenciasPersonaje-personaje` (`id_personaje`);

--
-- Indices de la tabla `competenciasRaza`
--
ALTER TABLE `competenciasRaza`
  ADD KEY `fk_competenciasRaza-raza` (`id_raza`);

--
-- Indices de la tabla `competenciasTrasfondo`
--
ALTER TABLE `competenciasTrasfondo`
  ADD KEY `fk_competenciasTrasfondo-trasfondo` (`id_trasfondo`);

--
-- Indices de la tabla `conjuros`
--
ALTER TABLE `conjuros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `conjurosClase`
--
ALTER TABLE `conjurosClase`
  ADD KEY `fk_conjurosClase-clase` (`id_clase`),
  ADD KEY `fk_conjurosClase-conjuro` (`id_conjuro`);

--
-- Indices de la tabla `conjurosEspacios`
--
ALTER TABLE `conjurosEspacios`
  ADD KEY `fk_conjurosEspacios-clase` (`id_clase`);

--
-- Indices de la tabla `conjurosMaximos`
--
ALTER TABLE `conjurosMaximos`
  ADD KEY `fk_conjurosMaximos-clase` (`id_clase`);

--
-- Indices de la tabla `conjurosPersonaje`
--
ALTER TABLE `conjurosPersonaje`
  ADD KEY `fk_conjurosPersonaje-conjuro` (`id_conjuro`),
  ADD KEY `fk_conjurosPersonaje-personaje` (`id_personaje`);

--
-- Indices de la tabla `equipamientoClaseElegir`
--
ALTER TABLE `equipamientoClaseElegir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_equipamientoClaseElegir-clase` (`id_clase`),
  ADD KEY `fk_equipamientoClaseElegir-opciones` (`opciones`);

--
-- Indices de la tabla `equipamientoOpciones`
--
ALTER TABLE `equipamientoOpciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_equipamientoOpciones-arma` (`id_arma`),
  ADD KEY `fk_equipamientoOpciones-armaduraOEscudo` (`id_armaduraOEscudo`),
  ADD KEY `fk_equipamientoOpciones-objeto` (`id_objeto`);

--
-- Indices de la tabla `equipamientoPersonaje`
--
ALTER TABLE `equipamientoPersonaje`
  ADD KEY `fk_equipamientoPersonaje-personaje` (`id_personaje`),
  ADD KEY `fk_equipamientoPersonaje-arma` (`id_arma`),
  ADD KEY `fk_equipamientoPersonaje-armaduraOEscudo` (`id_armaduraOEscudo`),
  ADD KEY `fk_equipamientoPersonaje-objeto` (`id_objeto`);

--
-- Indices de la tabla `equipamientoTrasfondo`
--
ALTER TABLE `equipamientoTrasfondo`
  ADD PRIMARY KEY (`tipo_equipamiento`),
  ADD KEY `fk_equipamientoTrasfondo-trasfondo` (`id_trasfondo`),
  ADD KEY `fk_equipamientoTrasfondo-equipamiento` (`id_equipamiento`);

--
-- Indices de la tabla `habilidadesPersonaje`
--
ALTER TABLE `habilidadesPersonaje`
  ADD KEY `fk_habilidadesPersonaje-personaje` (`id_personaje`);

--
-- Indices de la tabla `habilidadesRaza`
--
ALTER TABLE `habilidadesRaza`
  ADD KEY `fk_habilidadesRaza-raza` (`id_raza`);

--
-- Indices de la tabla `habilidadesSubraza`
--
ALTER TABLE `habilidadesSubraza`
  ADD KEY `fk_habilidadesSubraza-subraza` (`id_subraza`);

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `idiomasClase`
--
ALTER TABLE `idiomasClase`
  ADD KEY `fk_idiomasClase-idioma` (`id_idioma`),
  ADD KEY `fk_idiomasClase-clase` (`id_clase`);

--
-- Indices de la tabla `idiomasClaseElegir`
--
ALTER TABLE `idiomasClaseElegir`
  ADD KEY `fk_idiomaClaseElegir-clase` (`id_clase`),
  ADD KEY `fk_idiomaClaseElegir-idioma` (`id_idioma`);

--
-- Indices de la tabla `idiomasPersonaje`
--
ALTER TABLE `idiomasPersonaje`
  ADD KEY `fk_idiomasPersonaje-idioma` (`id_idioma`),
  ADD KEY `fk_idiomasPersonaje-personaje` (`id_personaje`);

--
-- Indices de la tabla `idiomasRaza`
--
ALTER TABLE `idiomasRaza`
  ADD KEY `fk_idiomaRaza-idioma` (`id_idioma`),
  ADD KEY `fk_idiomaRaza-raza` (`id_raza`);

--
-- Indices de la tabla `idiomasRazaElegir`
--
ALTER TABLE `idiomasRazaElegir`
  ADD KEY `fk_idiomasRazaElegir-idioma` (`id_idioma`),
  ADD KEY `fk_idiomasRazaElegir-raza` (`id_raza`);

--
-- Indices de la tabla `idiomasTrasfondoElegir`
--
ALTER TABLE `idiomasTrasfondoElegir`
  ADD KEY `fk_idiomasTrasfondoElegir-idioma` (`id_idioma`),
  ADD KEY `fk_idiomasTrasfondoElegir-trasfondo` (`id_trasfondo`);

--
-- Indices de la tabla `monedasPersonaje`
--
ALTER TABLE `monedasPersonaje`
  ADD KEY `fk_monedasPersonaje-personaje` (`id_personaje`);

--
-- Indices de la tabla `objetos`
--
ALTER TABLE `objetos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_personajes-clase` (`clase`),
  ADD KEY `fk_personajes-jugador` (`jugador`),
  ADD KEY `fk_personajes-raza` (`raza`),
  ADD KEY `fk_personajes-trasfondo` (`trasfondo`);

--
-- Indices de la tabla `personajeUsuario`
--
ALTER TABLE `personajeUsuario`
  ADD KEY `fk_personajeUsuario-personaje` (`id_personaje`),
  ADD KEY `fk_personajeUsuario-usuario` (`id_usuario`);

--
-- Indices de la tabla `rasgos`
--
ALTER TABLE `rasgos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rasgosClase`
--
ALTER TABLE `rasgosClase`
  ADD KEY `fk_rasgosClase-clase` (`id_clase`),
  ADD KEY `fk_rasgosClase-rasgo` (`id_rasgo`);

--
-- Indices de la tabla `rasgosRaza`
--
ALTER TABLE `rasgosRaza`
  ADD KEY `fk_rasgoRaza-rasgo` (`id_rasgo`),
  ADD KEY `fk_rasgoRaza-raza` (`id_raza`);

--
-- Indices de la tabla `rasgosSubraza`
--
ALTER TABLE `rasgosSubraza`
  ADD KEY `fk_rasgo` (`id_rasgo`),
  ADD KEY `fk_subraza` (`id_subraza`);

--
-- Indices de la tabla `rasgosTrasfondo`
--
ALTER TABLE `rasgosTrasfondo`
  ADD KEY `fk_rasgosTrasfondo-rasgo` (`id_rasgo`),
  ADD KEY `fk_rasgosTrasfondo-trasfondo` (`id_trasfondo`);

--
-- Indices de la tabla `razas`
--
ALTER TABLE `razas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subrazas`
--
ALTER TABLE `subrazas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_padre` (`raza_padre`);

--
-- Indices de la tabla `tiradasSalvacion`
--
ALTER TABLE `tiradasSalvacion`
  ADD KEY `fk_tiradasSalvacion-personaje` (`id_personaje`);

--
-- Indices de la tabla `trasfondos`
--
ALTER TABLE `trasfondos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `armadurasYEscudos`
--
ALTER TABLE `armadurasYEscudos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `armas`
--
ALTER TABLE `armas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clases`
--
ALTER TABLE `clases`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `competenciasElegirClase`
--
ALTER TABLE `competenciasElegirClase`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `competenciasElegirRaza`
--
ALTER TABLE `competenciasElegirRaza`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `competenciasElegirTrasfondo`
--
ALTER TABLE `competenciasElegirTrasfondo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `competenciasOpciones`
--
ALTER TABLE `competenciasOpciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `conjuros`
--
ALTER TABLE `conjuros`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipamientoClaseElegir`
--
ALTER TABLE `equipamientoClaseElegir`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipamientoOpciones`
--
ALTER TABLE `equipamientoOpciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `objetos`
--
ALTER TABLE `objetos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personajes`
--
ALTER TABLE `personajes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rasgos`
--
ALTER TABLE `rasgos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `razas`
--
ALTER TABLE `razas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `subrazas`
--
ALTER TABLE `subrazas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `trasfondos`
--
ALTER TABLE `trasfondos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `competenciasClase`
--
ALTER TABLE `competenciasClase`
  ADD CONSTRAINT `fk_competenciasClase-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `competenciasElegirClase`
--
ALTER TABLE `competenciasElegirClase`
  ADD CONSTRAINT `fk_competenciaElegirClase-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_competenciaElegirClase-opciones` FOREIGN KEY (`opciones`) REFERENCES `competenciasOpciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `competenciasElegirRaza`
--
ALTER TABLE `competenciasElegirRaza`
  ADD CONSTRAINT `fk_competenciasElegirRaza-opciones` FOREIGN KEY (`opciones`) REFERENCES `competenciasOpciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_competenciasElegirRaza-raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `competenciasElegirTrasfondo`
--
ALTER TABLE `competenciasElegirTrasfondo`
  ADD CONSTRAINT `fk_competenciasElegirTrasfondo-opciones` FOREIGN KEY (`opciones`) REFERENCES `competenciasOpciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_competenciasElegirTrasfondo-trasfondo` FOREIGN KEY (`id_trasfondo`) REFERENCES `trasfondos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Filtros para la tabla `conjurosEspacios`
--
ALTER TABLE `conjurosEspacios`
  ADD CONSTRAINT `fk_conjurosEspacios-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `conjurosMaximos`
--
ALTER TABLE `conjurosMaximos`
  ADD CONSTRAINT `fk_conjurosMaximos-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `conjurosPersonaje`
--
ALTER TABLE `conjurosPersonaje`
  ADD CONSTRAINT `fk_conjurosPersonaje-conjuro` FOREIGN KEY (`id_conjuro`) REFERENCES `conjuros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conjurosPersonaje-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipamientoClaseElegir`
--
ALTER TABLE `equipamientoClaseElegir`
  ADD CONSTRAINT `fk_equipamientoClaseElegir-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipamientoClaseElegir-opciones` FOREIGN KEY (`opciones`) REFERENCES `equipamientoOpciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipamientoOpciones`
--
ALTER TABLE `equipamientoOpciones`
  ADD CONSTRAINT `fk_equipamientoOpciones-arma` FOREIGN KEY (`id_arma`) REFERENCES `armas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipamientoOpciones-armaduraOEscudo` FOREIGN KEY (`id_armaduraOEscudo`) REFERENCES `armadurasYEscudos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipamientoOpciones-objeto` FOREIGN KEY (`id_objeto`) REFERENCES `objetos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipamientoPersonaje`
--
ALTER TABLE `equipamientoPersonaje`
  ADD CONSTRAINT `fk_equipamientoPersonaje-arma` FOREIGN KEY (`id_arma`) REFERENCES `armas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipamientoPersonaje-armaduraOEscudo` FOREIGN KEY (`id_armaduraOEscudo`) REFERENCES `armadurasYEscudos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipamientoPersonaje-objeto` FOREIGN KEY (`id_objeto`) REFERENCES `objetos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipamientoPersonaje-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipamientoTrasfondo`
--
ALTER TABLE `equipamientoTrasfondo`
  ADD CONSTRAINT `fk_equipamientoTrasfondo-equipamiento` FOREIGN KEY (`id_equipamiento`) REFERENCES `equipamientoOpciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipamientoTrasfondo-trasfondo` FOREIGN KEY (`id_trasfondo`) REFERENCES `trasfondos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `habilidadesPersonaje`
--
ALTER TABLE `habilidadesPersonaje`
  ADD CONSTRAINT `fk_habilidadesPersonaje-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `habilidadesRaza`
--
ALTER TABLE `habilidadesRaza`
  ADD CONSTRAINT `fk_habilidadesRaza-raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `habilidadesSubraza`
--
ALTER TABLE `habilidadesSubraza`
  ADD CONSTRAINT `fk_habilidadesSubraza-subraza` FOREIGN KEY (`id_subraza`) REFERENCES `subrazas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasClase`
--
ALTER TABLE `idiomasClase`
  ADD CONSTRAINT `fk_idiomasClase-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasClase-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasClaseElegir`
--
ALTER TABLE `idiomasClaseElegir`
  ADD CONSTRAINT `fk_idiomaClaseElegir-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomaClaseElegir-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Filtros para la tabla `idiomasRazaElegir`
--
ALTER TABLE `idiomasRazaElegir`
  ADD CONSTRAINT `fk_idiomasRazaElegir-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasRazaElegir-raza` FOREIGN KEY (`id_raza`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasTrasfondoElegir`
--
ALTER TABLE `idiomasTrasfondoElegir`
  ADD CONSTRAINT `fk_idiomasTrasfondoElegir-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasTrasfondoElegir-trasfondo` FOREIGN KEY (`id_trasfondo`) REFERENCES `trasfondos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `monedasPersonaje`
--
ALTER TABLE `monedasPersonaje`
  ADD CONSTRAINT `fk_monedasPersonaje-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `fk_rasgoRaza-raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rasgosSubraza`
--
ALTER TABLE `rasgosSubraza`
  ADD CONSTRAINT `fk_rasgo` FOREIGN KEY (`id_rasgo`) REFERENCES `rasgos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subraza` FOREIGN KEY (`id_subraza`) REFERENCES `subrazas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rasgosTrasfondo`
--
ALTER TABLE `rasgosTrasfondo`
  ADD CONSTRAINT `fk_rasgosTrasfondo-rasgo` FOREIGN KEY (`id_rasgo`) REFERENCES `rasgos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rasgosTrasfondo-trasfondo` FOREIGN KEY (`id_trasfondo`) REFERENCES `trasfondos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `subrazas`
--
ALTER TABLE `subrazas`
  ADD CONSTRAINT `fk_padre` FOREIGN KEY (`raza_padre`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tiradasSalvacion`
--
ALTER TABLE `tiradasSalvacion`
  ADD CONSTRAINT `fk_tiradasSalvacion-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
