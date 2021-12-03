-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2021 a las 10:14:12
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dragonesymazmorras`
--
CREATE DATABASE IF NOT EXISTS `dragonesymazmorras` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dragonesymazmorras`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armadurasyescudos`
--

CREATE TABLE `armadurasyescudos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 NOT NULL,
  `clase_de_armadura` int(11) NOT NULL,
  `clase_de_armadura_bonus` varchar(10) CHARACTER SET utf8 NOT NULL,
  `clase_de_armadura_bonus_max` int(11) NOT NULL,
  `peso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `armas`
--

CREATE TABLE `armas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 NOT NULL,
  `alcance` int(11) NOT NULL,
  `a_dos_manos` tinyint(1) NOT NULL,
  `arrojadiza` tinyint(1) NOT NULL,
  `cargar` tinyint(1) NOT NULL,
  `distancia` int(11) NOT NULL,
  `especial` tinyint(1) NOT NULL,
  `municion` varchar(50) CHARACTER SET utf8 NOT NULL,
  `pesado` tinyint(1) NOT NULL,
  `peso` int(11) NOT NULL,
  `sutil` tinyint(1) NOT NULL,
  `versatil` tinyint(1) NOT NULL,
  `daño` varchar(50) CHARACTER SET utf8 NOT NULL,
  `daño_tipo` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 NOT NULL,
  `dado_de_golpe` varchar(50) NOT NULL,
  `idiomas_elegir` int(11) NOT NULL,
  `riqueza_inicial` int(11) DEFAULT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` VALUES(4, 'Bárbaro', 'd12', 0, NULL, 'La Furia es lo que define al Bárbaro. Una ira desenfrenada, insaciable e irreflexiva. No se trata de una simple emoción, pues esta ira es similar a la ferocidad del depredador acorralado, el asalto implacable de la tormenta o la agitada confusión del mar.');
INSERT INTO `clases` VALUES(5, 'Bardo', 'd8', 0, NULL, 'Un Bardo, ya sea este un erudito, un escaldo o un bribón, es capaz de tejer magia a través de sus palabras y su música, inspirando a sus aliados, desmoralizando a sus enemigos, manipulando mentes, creando ilusiones e incluso sanando heridas.');
INSERT INTO `clases` VALUES(6, 'Paladín', 'd10', 0, NULL, 'Independientemente de su origen o misión, los paladines están unidos por su juramento, que les lleva a enfrentarse a las fuerzas del mal.\r\n\r\nYa lo hayan pronunciado ante el altar de un dios y con un sacerdote como testigo, en un claro sagrado frente a espíritus de la naturaleza y seres feéricos o en un momento de desesperación y pena con los difuntos como únicos testigos, el juramento de un paladín es un vínculo muy poderoso. Es la fuente del poder que transforma a un combatiente devoto en un campeón bendito.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasclase`
--

CREATE TABLE `competenciasclase` (
  `id_clase` int(11) NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciaselegirclase`
--

CREATE TABLE `competenciaselegirclase` (
  `id` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `opciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciaselegirraza`
--

CREATE TABLE `competenciaselegirraza` (
  `id` int(11) NOT NULL,
  `id_raza` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `opciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciaselegirtrasfondo`
--

CREATE TABLE `competenciaselegirtrasfondo` (
  `id` int(11) NOT NULL,
  `id_trasfondo` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `opciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasopciones`
--

CREATE TABLE `competenciasopciones` (
  `id` int(11) NOT NULL,
  `id_competencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciaspersonaje`
--

CREATE TABLE `competenciaspersonaje` (
  `id_personaje` int(11) NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciasraza`
--

CREATE TABLE `competenciasraza` (
  `id_raza` int(11) NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competenciastrasfondo`
--

CREATE TABLE `competenciastrasfondo` (
  `id_trasfondo` int(11) NOT NULL,
  `tipo` varchar(100) CHARACTER SET utf8 NOT NULL,
  `competencia` varchar(100) CHARACTER SET utf8 NOT NULL,
  `experto` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjuros`
--

CREATE TABLE `conjuros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 NOT NULL,
  `nivel` int(11) NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8 NOT NULL,
  `tiempo_de_lanzamiento` varchar(50) CHARACTER SET utf8 NOT NULL,
  `alcance` varchar(50) CHARACTER SET utf8 NOT NULL,
  `componentes` varchar(50) CHARACTER SET utf8 NOT NULL,
  `duracion` varchar(50) CHARACTER SET utf8 NOT NULL,
  `descripcion` varchar(2000) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosclase`
--

CREATE TABLE `conjurosclase` (
  `id_clase` int(11) NOT NULL,
  `id_conjuro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosespacios`
--

CREATE TABLE `conjurosespacios` (
  `id_clase` int(11) NOT NULL,
  `0` int(11) NOT NULL,
  `1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurosmaximos`
--

CREATE TABLE `conjurosmaximos` (
  `id_clase` int(11) NOT NULL,
  `0` int(11) NOT NULL,
  `1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conjurospersonaje`
--

CREATE TABLE `conjurospersonaje` (
  `id_personaje` int(11) NOT NULL,
  `id_conjuro` int(11) NOT NULL,
  `preparado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamientoclaseelegir`
--

CREATE TABLE `equipamientoclaseelegir` (
  `id` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `opciones` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamientoopciones`
--

CREATE TABLE `equipamientoopciones` (
  `id` int(11) NOT NULL,
  `id_arma` int(11) NOT NULL,
  `id_objeto` int(11) NOT NULL,
  `id_armaduraOEscudo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipamientopersonaje`
--

CREATE TABLE `equipamientopersonaje` (
  `id_personaje` int(11) NOT NULL,
  `id_arma` int(11) NOT NULL,
  `id_objeto` int(11) NOT NULL,
  `id_armaduraOEscudo` int(11) NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8 NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidadespersonaje`
--

CREATE TABLE `habilidadespersonaje` (
  `id_personaje` int(11) NOT NULL,
  `fuerza` int(11) NOT NULL,
  `destreza` int(11) NOT NULL,
  `constitucion` int(11) NOT NULL,
  `inteligencia` int(11) NOT NULL,
  `sabiduria` int(11) NOT NULL,
  `carisma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidadesraza`
--

CREATE TABLE `habilidadesraza` (
  `id_raza` int(11) NOT NULL,
  `fuerza` int(11) NOT NULL,
  `destreza` int(11) NOT NULL,
  `constitucion` int(11) NOT NULL,
  `inteligencia` int(11) NOT NULL,
  `sabiduria` int(11) NOT NULL,
  `carisma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `escritura` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` VALUES(1, 'Común', 'Comun');
INSERT INTO `idiomas` VALUES(2, 'Enano', 'Enano');
INSERT INTO `idiomas` VALUES(3, 'Elfico', 'Elfico');
INSERT INTO `idiomas` VALUES(4, 'Gigante', 'Enano');
INSERT INTO `idiomas` VALUES(5, 'Gnomico', 'Enano');
INSERT INTO `idiomas` VALUES(6, 'Goblin', 'Enano');
INSERT INTO `idiomas` VALUES(7, 'Mediano', 'Comun');
INSERT INTO `idiomas` VALUES(8, 'Orco', 'Enano');
INSERT INTO `idiomas` VALUES(9, 'Abisal', 'Infernal');
INSERT INTO `idiomas` VALUES(10, 'Celestial', 'Celestial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasclase`
--

CREATE TABLE `idiomasclase` (
  `id_idioma` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasclaseelegir`
--

CREATE TABLE `idiomasclaseelegir` (
  `id_idioma` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomaspersonaje`
--

CREATE TABLE `idiomaspersonaje` (
  `id_idioma` int(11) NOT NULL,
  `id_personaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasraza`
--

CREATE TABLE `idiomasraza` (
  `id_idioma` int(11) NOT NULL,
  `id_raza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `idiomasraza`
--

INSERT INTO `idiomasraza` VALUES(1, 2);
INSERT INTO `idiomasraza` VALUES(1, 3);
INSERT INTO `idiomasraza` VALUES(3, 3);
INSERT INTO `idiomasraza` VALUES(1, 3);
INSERT INTO `idiomasraza` VALUES(3, 3);
INSERT INTO `idiomasraza` VALUES(1, 4);
INSERT INTO `idiomasraza` VALUES(8, 4);
INSERT INTO `idiomasraza` VALUES(1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomasrazaelegir`
--

CREATE TABLE `idiomasrazaelegir` (
  `id_idioma` int(11) NOT NULL,
  `id_raza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomastrasfondoelegir`
--

CREATE TABLE `idiomastrasfondoelegir` (
  `id_idioma` int(11) NOT NULL,
  `id_trasfondo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedaspersonaje`
--

CREATE TABLE `monedaspersonaje` (
  `id_personaje` int(11) NOT NULL,
  `pc` int(11) NOT NULL,
  `pp` int(11) NOT NULL,
  `pe` int(11) NOT NULL,
  `po` int(11) NOT NULL,
  `ppt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetos`
--

CREATE TABLE `objetos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 NOT NULL,
  `descripcion` varchar(200) CHARACTER SET utf8 NOT NULL,
  `peso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE `personajes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `jugador` int(11) NOT NULL,
  `raza` int(11) NOT NULL,
  `clase` int(11) NOT NULL,
  `trasfondo` int(11) NOT NULL,
  `xp` int(11) DEFAULT NULL,
  `bonus_competencia` int(11) DEFAULT NULL,
  `modificador_de_tiradas_de_salvacion` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `tiradas_de_salvacion_cd` int(11) DEFAULT NULL,
  `iniciativa` int(11) DEFAULT NULL,
  `clase_de_armadura` int(11) DEFAULT NULL,
  `defensas` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `inspiracion` int(11) DEFAULT NULL,
  `velocidad` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `dado_de_golpe` int(11) DEFAULT NULL,
  `vida_maxima` int(11) DEFAULT NULL,
  `vida_currente` int(11) DEFAULT NULL,
  `sentidos` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `genero` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `altura` float DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `alineamiento` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `fe` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `piel` varchar(50) DEFAULT NULL,
  `ojos` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `pelo` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `apariencia` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `aliados_y_organizaciones` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `personalidad` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `ideales` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `vinculos` varchar(1000) DEFAULT NULL,
  `defectos` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `historia` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `notas_adicionales` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `habilidad_de_conjuros` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `salvacion_conjuro` int(11) DEFAULT NULL,
  `bonus_ataque_conjuro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajeusuario`
--

CREATE TABLE `personajeusuario` (
  `id_usuario` int(11) NOT NULL,
  `id_personaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgos`
--

CREATE TABLE `rasgos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rasgos`
--

INSERT INTO `rasgos` VALUES(1, 'Visión en la Oscuridad', 'Tienes una visión superior en la oscuridad y la luz tenue. Puedes ver en luz tenue hasta los 60 (18 m) pies como si fuera a plena luz, y en la oscuridad como si fuera en luz tenue. No puedes distinguir colores en la oscuridad, sólo tonos de gris');
INSERT INTO `rasgos` VALUES(2, 'Ascendencia Feérica', 'Tienes ventaja en las tiradas de salvación contra Encantamiento, y no puedes ser dormido mediante la magia');
INSERT INTO `rasgos` VALUES(3, 'Versatilidad con Habilidades', 'Ganas competencia en dos habilidades a tu elección');
INSERT INTO `rasgos` VALUES(4, 'Amenazante', 'Ganas competencia en la habilidad Intimidar');
INSERT INTO `rasgos` VALUES(5, 'Resistencia Incansable', 'Cuando te ves reducido a 0 Puntos de Golpe pero no estás totalmente muerto, puedes volver a tener 1 punto de golpe en su lugar. No puedes volver usar este rasgo hasta que no hayas completado un descanso prolongado');
INSERT INTO `rasgos` VALUES(6, 'Ataques Salvajes', 'Cuando saques un impacto crítico con un ataque con arma cuerpo a cuerpo, puedes tirar otra vez uno de los dados de daño del arma y añadirlo al daño extra por el impacto crítico');
INSERT INTO `rasgos` VALUES(13, 'Incremento de Puntuación Humano', 'Todas tus puntuaciones de característica mejoran en 1');
INSERT INTO `rasgos` VALUES(14, 'Incremento de Puntuación Semielfo', 'Tu puntuación de Carisma aumenta en 2 y otras dos puntuaciones a tu elección aumentan en 1');
INSERT INTO `rasgos` VALUES(16, 'Incremento de Puntuación Tiflin', 'Tu puntuación de Inteligencia se incrementa en 1, y tu puntuación de Carisma se incrementa en 2');
INSERT INTO `rasgos` VALUES(17, 'Incremento de Puntuación Elfo', 'Tu puntuación de Destreza aumenta en 2.');
INSERT INTO `rasgos` VALUES(18, 'Incremento de Puntuación Alto Elfo', 'Tu puntuación de Inteligencia aumenta en 1.');
INSERT INTO `rasgos` VALUES(19, 'Incremento de Puntuación Semiorco', 'Tu puntuación de Fuerza se incrementa en 2 y tu puntuación de Constitución se incrementa en 1');
INSERT INTO `rasgos` VALUES(20, 'Sentidos Agudos', 'Eres competente con la habilidad de Percepción');
INSERT INTO `rasgos` VALUES(21, 'Entrenamiento en Armas Élficas', 'Eres competente con la espada larga, espada corta, arco largo y arco corto');
INSERT INTO `rasgos` VALUES(22, 'Legado Infernal', 'Conoces el truco taumaturgia. Una vez alcances el nivel 3, puedes conjurar el truco reprensión infernal una vez al día como si fuese un conjuro de nivel 2. Una vez alcances el nivel 5, puedes lanzar también el conjuro oscuridad una vez al día. El Carisma es tu característica de lanzamiento para estos conjuros');
INSERT INTO `rasgos` VALUES(23, 'Furia', 'En combate, luchas con una ferocidad primitiva. En tu turno, \r\npuedes entrar en furia como acción adicional');
INSERT INTO `rasgos` VALUES(24, 'Inspiración de bardo', 'Puedes inspirar a otros a través de palabras estimulantes o de la música. Para hacerlo, usas una acción adicional en tu \r\nturno para elegir una criatura distinta de ti mismo dentro de un rango de 60 pies (18 metros) y que pueda escucharte. Esa criatura gana un dado de Inspiración de Bardo, un d6');
INSERT INTO `rasgos` VALUES(25, 'Sentido divino', 'Tus sentidos captan la presencia de un terrible mal como un nauseabundo olor, y un bien poderoso resuena en tus oídos como música celestial. Como acción, puedes expandir tus sentidos para detectar esas fuerzas. Hasta el final de tu siguiente turno, conoces la localización de cualquier ser celestial, demoníaco o muerto viviente en un rango de 60 pies (18 metros) o menos que no esté tras una cobertura total');
INSERT INTO `rasgos` VALUES(26, 'Competencia con Habilidades Artista', 'Acrobacias, Interpretación');
INSERT INTO `rasgos` VALUES(27, 'Competencia con Herramientas Artista', 'Kit de disfraz, un tipo de instrumento musical');
INSERT INTO `rasgos` VALUES(28, 'Competencia con Habilidad Criminal', 'Engañar, Sigilo');
INSERT INTO `rasgos` VALUES(29, 'Competencia con Herramientas Criminal', 'Set de juego (dados de hueso o cartas), herramientas de ladrón');
INSERT INTO `rasgos` VALUES(30, 'Competencia con habilidades Soldado', 'Atletismo, Intimidación');
INSERT INTO `rasgos` VALUES(31, 'Competencia con herramientas Soldado', 'Un tipo de set de juego, vehículos (terrestres).');
INSERT INTO `rasgos` VALUES(32, 'Rango militar', 'Tienes un rango militar de tu carrera como soldado. Aquellos leales a tu antigua organización militar aún reconocen tu autoridad e influencia, y se dirigirán a ti con respeto si son de un rango inferior. Puedes invocar tu rango para ejercer influencia sobre los demás soldados y requisar equipo simple o caballos para un uso temporal. Generalmente también puedes tener acceso a los campamentos y fortalezas amistosas en las que se reconozca tu rango militar.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosclase`
--

CREATE TABLE `rasgosclase` (
  `id_rasgo` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rasgosclase`
--

INSERT INTO `rasgosclase` VALUES(25, 6);
INSERT INTO `rasgosclase` VALUES(24, 5);
INSERT INTO `rasgosclase` VALUES(23, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgosraza`
--

CREATE TABLE `rasgosraza` (
  `id_rasgo` int(11) NOT NULL,
  `id_raza` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rasgosraza`
--

INSERT INTO `rasgosraza` VALUES(13, 2);
INSERT INTO `rasgosraza` VALUES(17, 6);
INSERT INTO `rasgosraza` VALUES(1, 6);
INSERT INTO `rasgosraza` VALUES(20, 6);
INSERT INTO `rasgosraza` VALUES(2, 6);
INSERT INTO `rasgosraza` VALUES(21, 7);
INSERT INTO `rasgosraza` VALUES(18, 7);
INSERT INTO `rasgosraza` VALUES(19, 4);
INSERT INTO `rasgosraza` VALUES(1, 4);
INSERT INTO `rasgosraza` VALUES(4, 4);
INSERT INTO `rasgosraza` VALUES(6, 4);
INSERT INTO `rasgosraza` VALUES(5, 4);
INSERT INTO `rasgosraza` VALUES(14, 3);
INSERT INTO `rasgosraza` VALUES(2, 3);
INSERT INTO `rasgosraza` VALUES(3, 3);
INSERT INTO `rasgosraza` VALUES(1, 3);
INSERT INTO `rasgosraza` VALUES(1, 5);
INSERT INTO `rasgosraza` VALUES(16, 5);
INSERT INTO `rasgosraza` VALUES(22, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rasgostrasfondo`
--

CREATE TABLE `rasgostrasfondo` (
  `id_rasgo` int(11) NOT NULL,
  `id_trasfondo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rasgostrasfondo`
--

INSERT INTO `rasgostrasfondo` VALUES(26, 1);
INSERT INTO `rasgostrasfondo` VALUES(27, 1);
INSERT INTO `rasgostrasfondo` VALUES(28, 2);
INSERT INTO `rasgostrasfondo` VALUES(29, 2);
INSERT INTO `rasgostrasfondo` VALUES(31, 3);
INSERT INTO `rasgostrasfondo` VALUES(30, 3);
INSERT INTO `rasgostrasfondo` VALUES(32, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

CREATE TABLE `razas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `edad` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `alineamiento` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `tamaño` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `velocidad` int(11) DEFAULT NULL,
  `idiomas_elegir` int(11) NOT NULL,
  `id_padre` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ascii;

--
-- Volcado de datos para la tabla `razas`
--

INSERT INTO `razas` VALUES(2, 'Humano', 'En el cómputo de la mayoría de los mundos, los humanos son la más joven de las razas comunes, con una llegada tardía al\r\nmundo y una vida corta en comparación con los enanos, elfos, y dragones. Quizás es por su corta vida que se esfuerzan en conseguir tanto como pueden en los años que se les han dado. O quizás sienten que tienen algo que demostrar a las razas más antiguas, y es por eso que construyen poderosos imperios basados en la conquista y el comercio. Sea lo que sea lo que les motiva, los humanos son los innovadores, los pioneros y los triunfadores de los mundos.', 'Los humanos alcanzan la madurez cerca de la veintena y rara vez llegan a vivir un siglo completo.', 'Los humanos tienen a no tener un alineamiento concreto. En ellos se puede encontrar tanto lo mejor como lo peor.', ' Mediano(1,5 m — 1,8 m)', 30, 1, NULL);
INSERT INTO `razas` VALUES(3, 'Semielfo', 'Caminando entre dos mundos pero sin pertenecer realmente a ninguno de los dos, los semielfos combinan lo que algunos dicen ser las mejores cualidades de sus progenitores humanos y elfos: la curiosidad, inventiva y ambición humana templada por los sentidos refinados, el amor por el arte y la naturaleza de los elfos. \r\nAlgunos semielfos viven entre los humanos, separados por sus diferencias emocionales y físicas, viendo a amigos y seres queridos envejecer mientras el tiempo no les toca a ellos. Otros viven entre los elfos, aumentando su inquietud conforme se acercan a la edad adulta en los intemporales reinos élficos, mientras sus compañeros continúan viviendo como niños. \r\nMuchos semielfos, incapaces de encajar en ninguna sociedad, eligen una vida errante en solitario o uniéndose a otros inadaptados y marginados en la vida aventurera.', 'Los semielfos maduran a la misma velocidad que\r\nlos humanos y alcanzan la adultez alrededor de los 20 años.\r\nViven, sin embargo, mucho más que los humanos, excediendo a menudo los 180 años.', 'Los semielfos comparten la inclinación caótica de su herencia élfica. Valoran tanto la libertad personal como la expresión creativa, no demostrando amor por los líderes ni deseo de seguidores. Les fastidian las reglas, molestándose con las demandas de los demás, y en ocasiones se muestran poco fiables o por lo menos impredecibles.', ' Mediano(1,5 m — 1,8 m)', 30, 1, NULL);
INSERT INTO `razas` VALUES(4, 'Semiorco', 'Ya sean unidos bajo el liderazgo de un poderoso brujo o luchando para resistir tras años de conflicto, las tribus humanas y orcas a veces forman alianzas, uniendo sus fuerzas en una horda mayor para el terror de las tierras civilizadas cercanas. Cuando esas alianzas se sellan con matrimonios, nacen los semiorcos. Algunos semiorcos crecen para convertirse en jefes orgullosos de tribus orcas, con su sangre humana proveyéndoles de ventaja sobre sus rivales orcos purasangres. Algunos se aventuran en el mundo para probar su valía ante los humanos y otras razas más civilizadas. Muchos de estos se convierten en aventureros, cosechando grandeza por sus grandes hazañas y notoriedad por sus costumbres bárbaras y su furia salvaje.', 'Los semiorcos maduran un poco más rápido que\r\nlos humanos, alcanzando la adultez alrededor de los 14. Envejecen notablemente más rápido y raramente viven más de 75 años', '. Los semiorcos heredan una tendencia hacia el caos de sus padres orcos y no están muy inclinados hacia el bien. Los semiorcos criados entre orcos y dispuestos a pasar sus vidas entre ellos son usualmente malvados', ' Mediano(1,6 m — 1,9 m)', 30, 0, NULL);
INSERT INTO `razas` VALUES(5, 'Tiflin', 'Ser recibido con miradas y susurros, sufrir violencia e insultos en la calle, ver la desconfianza y el miedo en todos los ojos: este es el destino de los tiflin. Y para retorcer el puñal, los tiflin saben que esto es a causa de un pacto sellado hace generaciones que infundió la esencia de Asmodeo —señor supremo de los Nueve Infiernos— en su linaje. Su apariencia y su naturaleza no tienen más culpa que el resultado de un antiguo pecado, por el que ellos y sus hijos, y los hijos de sus hijos, siempre se considerarán responsables.', 'Los tiflin maduran a la misma velocidad que los humanos pero viven unos pocos años más.', 'Los tiflin no tienen una tendencia innata hacia el mal, pero muchos de ellos acaban allí. Malvados o no, su naturaleza independiente inclina a muchos tiflin hacia un alineamiento caótico.', ' Mediano(1,5 m — 1,8 m)', 30, 0, NULL);
INSERT INTO `razas` VALUES(6, 'Elfo', 'os elfos son un pueblo mágico de gracia sobrenatural, viviendo en el mundo sin ser del todo parte de él. Viven en lugares de etérea belleza, en medio de antiguos bosques o en plateados minaretes que resplandecen con luz feérica, donde una suave música flota en el aire y delicadas fragancias son transportadas por la brisa. Los elfos aman la naturaleza y la magia, el arte y la maestría, la música y la poesía, y las cosas buenas del mundo', 'Aunque los elfos alcanzan la madurez física más o menos a la misma edad que los humanos, la comprensión élfica de la madurez va más allá del crecimiento físico y abarca la experiencia del mundo. Un elfo típicamente reclama la edad adulta y un nombre adulto alrededor de los 100 años y puede vivir hasta los 750', 'Los elfos aman la libertad, la variedad y la autoexpresión, así que se inclinan fuertemente hacia los aspectos más gentiles del caos. Valoran y protegen la libertad de los demás al igual que la suya propia, y son más a menudo de alineamiento bueno que de cualquier otro. Los drow son la excepción; su exilio en el inframundo los ha hecho viciosos y peligrosos. Los drow son regularmente más malvados que otra cosa', 'Mediano(1,5 m — 1,8 m)', 30, 0, NULL);
INSERT INTO `razas` VALUES(7, 'Alto Elfo', NULL, NULL, NULL, NULL, NULL, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiradassalvacion`
--

CREATE TABLE `tiradassalvacion` (
  `id_personaje` int(11) NOT NULL,
  `fuerza` int(11) NOT NULL,
  `destreza` int(11) NOT NULL,
  `constitucion` int(11) NOT NULL,
  `inteligencia` int(11) NOT NULL,
  `sabiduria` int(11) NOT NULL,
  `carisma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trasfondos`
--

CREATE TABLE `trasfondos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `idiomas_elegir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `trasfondos`
--

INSERT INTO `trasfondos` VALUES(1, 'Artista', 'Te creces frente a una audiencia. Sabes cómo deleitarlos, entretenerlos e incluso cómo inspirarlos. Tu poesía puede agitar los corazones de los que te escuchan, despertar el dolor o la alegría, la risa o la ira. Tu música eleva sus espíritus o captura su dolor. Tus pasos de danza cautivan, tu humor es hiriente. Sea cual sea la técnica que utilizas, tu arte es tu vida', 0);
INSERT INTO `trasfondos` VALUES(2, 'Criminal', 'Eres un criminal experimentado con un historial delictivo. Has pasado mucho tiempo entre criminales y todavía tienes contactos dentro del mundo criminal. Estas mucho más cerca que la mayoría de la gente del mundo del asesinato, el robo y la violencia que prevalece en los barrios bajos de la civilización y has sobrevivido hasta ahora gracias a burlarte de las reglas y reglamentos de la sociedad', 0);
INSERT INTO `trasfondos` VALUES(3, 'Soldado', 'La guerra ha sido tu vida desde que puedes recordar. Fuiste entrenado en tu juventud en el estudio del uso de las armas y armaduras y aprendido las técnicas básicas de supervivencia, incluida la forma de mantenerte con vida en el campo de batalla. Es posible que hayas sido parte de un ejército nacional permanente o de una compañía de mercenarios, o tal vez miembro de una milicia local que saltó a la fama durante una guerra reciente.', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `contrasena` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` VALUES(1, 'test', '9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `armadurasyescudos`
--
ALTER TABLE `armadurasyescudos`
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
-- Indices de la tabla `conjuros`
--
ALTER TABLE `conjuros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `equipamientoopciones`
--
ALTER TABLE `equipamientoopciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_equipamientoOpciones-arma` (`id_arma`),
  ADD KEY `fk_equipamientoOpciones-armaduraOEscudo` (`id_armaduraOEscudo`),
  ADD KEY `fk_equipamientoOpciones-objeto` (`id_objeto`);

--
-- Indices de la tabla `habilidadespersonaje`
--
ALTER TABLE `habilidadespersonaje`
  ADD KEY `fk_habilidadesPersonaje-personaje` (`id_personaje`);

--
-- Indices de la tabla `habilidadesraza`
--
ALTER TABLE `habilidadesraza`
  ADD KEY `fk_habilidadesRaza-raza` (`id_raza`);

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `idiomasclase`
--
ALTER TABLE `idiomasclase`
  ADD KEY `fk_idiomasClase-idioma` (`id_idioma`),
  ADD KEY `fk_idiomasClase-clase` (`id_clase`);

--
-- Indices de la tabla `idiomasclaseelegir`
--
ALTER TABLE `idiomasclaseelegir`
  ADD KEY `fk_idiomaClaseElegir-clase` (`id_clase`),
  ADD KEY `fk_idiomaClaseElegir-idioma` (`id_idioma`);

--
-- Indices de la tabla `idiomaspersonaje`
--
ALTER TABLE `idiomaspersonaje`
  ADD KEY `fk_idiomasPersonaje-idioma` (`id_idioma`),
  ADD KEY `fk_idiomasPersonaje-personaje` (`id_personaje`);

--
-- Indices de la tabla `idiomasraza`
--
ALTER TABLE `idiomasraza`
  ADD KEY `fk_idiomaRaza-idioma` (`id_idioma`),
  ADD KEY `fk_idiomaRaza-raza` (`id_raza`);

--
-- Indices de la tabla `idiomasrazaelegir`
--
ALTER TABLE `idiomasrazaelegir`
  ADD KEY `fk_idiomasRazaElegir-idioma` (`id_idioma`),
  ADD KEY `fk_idiomasRazaElegir-raza` (`id_raza`);

--
-- Indices de la tabla `idiomastrasfondoelegir`
--
ALTER TABLE `idiomastrasfondoelegir`
  ADD KEY `fk_idiomasTrasfondoElegir-idioma` (`id_idioma`),
  ADD KEY `fk_idiomasTrasfondoElegir-trasfondo` (`id_trasfondo`);

--
-- Indices de la tabla `monedaspersonaje`
--
ALTER TABLE `monedaspersonaje`
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
-- Indices de la tabla `personajeusuario`
--
ALTER TABLE `personajeusuario`
  ADD KEY `fk_personajeUsuario-personaje` (`id_personaje`),
  ADD KEY `fk_personajeUsuario-usuario` (`id_usuario`);

--
-- Indices de la tabla `rasgos`
--
ALTER TABLE `rasgos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `rasgosclase`
--
ALTER TABLE `rasgosclase`
  ADD KEY `fk_rasgosClase-clase` (`id_clase`),
  ADD KEY `fk_rasgosClase-rasgo` (`id_rasgo`);

--
-- Indices de la tabla `rasgosraza`
--
ALTER TABLE `rasgosraza`
  ADD KEY `fk_rasgoRaza-rasgo` (`id_rasgo`),
  ADD KEY `fk_rasgoRaza-raza` (`id_raza`);

--
-- Indices de la tabla `rasgostrasfondo`
--
ALTER TABLE `rasgostrasfondo`
  ADD KEY `fk_rasgosTrasfondo-rasgo` (`id_rasgo`),
  ADD KEY `fk_rasgosTrasfondo-trasfondo` (`id_trasfondo`);

--
-- Indices de la tabla `razas`
--
ALTER TABLE `razas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `fk_razas-padre` (`id_padre`);

--
-- Indices de la tabla `tiradassalvacion`
--
ALTER TABLE `tiradassalvacion`
  ADD KEY `fk_tiradasSalvacion-personaje` (`id_personaje`);

--
-- Indices de la tabla `trasfondos`
--
ALTER TABLE `trasfondos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

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
-- AUTO_INCREMENT de la tabla `armadurasyescudos`
--
ALTER TABLE `armadurasyescudos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `armas`
--
ALTER TABLE `armas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clases`
--
ALTER TABLE `clases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `conjuros`
--
ALTER TABLE `conjuros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipamientoopciones`
--
ALTER TABLE `equipamientoopciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `objetos`
--
ALTER TABLE `objetos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personajes`
--
ALTER TABLE `personajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rasgos`
--
ALTER TABLE `rasgos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `razas`
--
ALTER TABLE `razas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `trasfondos`
--
ALTER TABLE `trasfondos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `equipamientoopciones`
--
ALTER TABLE `equipamientoopciones`
  ADD CONSTRAINT `fk_equipamientoOpciones-arma` FOREIGN KEY (`id_arma`) REFERENCES `armas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipamientoOpciones-armaduraOEscudo` FOREIGN KEY (`id_armaduraOEscudo`) REFERENCES `armadurasyescudos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_equipamientoOpciones-objeto` FOREIGN KEY (`id_objeto`) REFERENCES `objetos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `habilidadespersonaje`
--
ALTER TABLE `habilidadespersonaje`
  ADD CONSTRAINT `fk_habilidadesPersonaje-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `habilidadesraza`
--
ALTER TABLE `habilidadesraza`
  ADD CONSTRAINT `fk_habilidadesRaza-raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasclase`
--
ALTER TABLE `idiomasclase`
  ADD CONSTRAINT `fk_idiomasClase-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasClase-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasclaseelegir`
--
ALTER TABLE `idiomasclaseelegir`
  ADD CONSTRAINT `fk_idiomaClaseElegir-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomaClaseElegir-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomaspersonaje`
--
ALTER TABLE `idiomaspersonaje`
  ADD CONSTRAINT `fk_idiomasPersonaje-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasPersonaje-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasraza`
--
ALTER TABLE `idiomasraza`
  ADD CONSTRAINT `fk_idiomaRaza-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomaRaza-raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomasrazaelegir`
--
ALTER TABLE `idiomasrazaelegir`
  ADD CONSTRAINT `fk_idiomasRazaElegir-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasRazaElegir-raza` FOREIGN KEY (`id_raza`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `idiomastrasfondoelegir`
--
ALTER TABLE `idiomastrasfondoelegir`
  ADD CONSTRAINT `fk_idiomasTrasfondoElegir-idioma` FOREIGN KEY (`id_idioma`) REFERENCES `idiomas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_idiomasTrasfondoElegir-trasfondo` FOREIGN KEY (`id_trasfondo`) REFERENCES `trasfondos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `monedaspersonaje`
--
ALTER TABLE `monedaspersonaje`
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
-- Filtros para la tabla `personajeusuario`
--
ALTER TABLE `personajeusuario`
  ADD CONSTRAINT `fk_personajeUsuario-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_personajeUsuario-usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rasgosclase`
--
ALTER TABLE `rasgosclase`
  ADD CONSTRAINT `fk_rasgosClase-clase` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rasgosClase-rasgo` FOREIGN KEY (`id_rasgo`) REFERENCES `rasgos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rasgosraza`
--
ALTER TABLE `rasgosraza`
  ADD CONSTRAINT `fk_rasgoRaza-rasgo` FOREIGN KEY (`id_rasgo`) REFERENCES `rasgos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rasgoRaza-raza` FOREIGN KEY (`id_raza`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rasgostrasfondo`
--
ALTER TABLE `rasgostrasfondo`
  ADD CONSTRAINT `fk_rasgosTrasfondo-rasgo` FOREIGN KEY (`id_rasgo`) REFERENCES `rasgos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rasgosTrasfondo-trasfondo` FOREIGN KEY (`id_trasfondo`) REFERENCES `trasfondos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `razas`
--
ALTER TABLE `razas`
  ADD CONSTRAINT `fk_razas-padre` FOREIGN KEY (`id_padre`) REFERENCES `razas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tiradassalvacion`
--
ALTER TABLE `tiradassalvacion`
  ADD CONSTRAINT `fk_tiradasSalvacion-personaje` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
